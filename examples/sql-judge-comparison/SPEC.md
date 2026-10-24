# SPEC: So sánh giám khảo rubric vs công thức trên Text-to-SQL

> Trạng thái: **chờ duyệt**. Chưa có code. Các mục cần bạn quyết định nằm ở §9.

## 1. Mục tiêu

Trả lời câu hỏi: khi **không được chạy SQL**, giám khảo LLM nào phán đoán đúng hơn một
câu SQL do agent viết ra là đúng hay sai?

- **A – Rubric**: đọc `rubric.md` (tiêu chí bằng lời) → điểm tổng thể + kết luận đúng/sai.
- **B – Công thức**: đọc `formula.md` → tự liệt kê yêu cầu của câu hỏi, đánh dấu từng
  yêu cầu, phát hiện lỗi cấu trúc, tính điểm theo công thức → kết luận đúng/sai.

Khác thí nghiệm trước ở 3 điểm:

| | Thí nghiệm 1 (tóm tắt) | Thí nghiệm 2 (SQL) |
|---|---|---|
| Điểm chuẩn | tính bằng chính công thức của B | **chạy SQL thật**, độc lập với cả A và B |
| Bài được chấm | câu ghép sẵn | **SQL thật do agent viết** + SQL bị gây lỗi có chủ đích |
| Biến cần đo | đếm được dễ | khó: phải hiểu ngữ nghĩa câu hỏi và SQL |

## 2. Database

Chinook (SQLite, ~1 MB, 11 bảng: Artist, Album, Track, Genre, MediaType, Playlist,
PlaylistTrack, Customer, Employee, Invoice, InvoiceLine; hóa đơn 2021-01-01 → 2025-12-22).
Tải bằng script `download_db.sh`, không commit file `.db`. Mọi truy vấn chạy ở chế độ
read-only, timeout 5 s.

## 3. Bộ câu hỏi (`questions.yaml`)

30 câu hỏi tiếng Việt, mỗi câu có:

```yaml
- id: Q17
  level: hard            # easy | medium | hard
  question: "5 nghệ sĩ có doanh thu cao nhất ở Đức năm 2024, kèm doanh thu"
  gold_sql: |
    SELECT ar.Name, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS revenue
    FROM InvoiceLine il JOIN Invoice i ON ...
  order_matters: true
  requirements:          # chỉ dùng để phân tích, KHÔNG đưa cho giám khảo (xem §9-Q1)
    - {type: filter,    text: "BillingCountry = Germany"}
    - {type: filter,    text: "năm 2024"}
    - {type: aggregate, text: "doanh thu = SUM(UnitPrice*Quantity)"}
    - {type: group,     text: "theo nghệ sĩ"}
    - {type: order,     text: "giảm dần theo doanh thu"}
    - {type: limit,     text: "5"}
    - {type: output,    text: "tên nghệ sĩ, doanh thu"}
  traps: [fan_out_join]  # các bẫy câu hỏi này cố ý chứa
```

Phân bổ:

| Mức | Số câu | Đặc điểm |
|---|---|---|
| easy | 10 | 1–2 bảng, lọc + đếm/sắp xếp |
| medium | 10 | 3–4 bảng JOIN, GROUP BY, HAVING, khoảng ngày |
| hard | 10 | subquery/CTE, window function, "không có…" (LEFT JOIN/NOT EXISTS), bẫy nhân dòng khi JOIN, hoà điểm ở LIMIT, phân biệt BillingCountry vs Customer.Country |

Gold SQL được mình viết và **chạy kiểm tra** từng câu; câu nào mơ hồ (nhiều cách hiểu
hợp lý) thì sửa đề cho rõ hoặc bỏ.

## 4. Bài được chấm (candidates)

Mục tiêu ~150 câu SQL, tỉ lệ đúng/sai khoảng 50/50.

| Nguồn | Cách tạo | Số lượng ước tính |
|---|---|---|
| G1 – agent mạnh | Sonnet, có schema + được chạy thử query | 30 |
| G2 – agent yếu | Haiku, chỉ có schema, không được chạy | 30 |
| G3 – agent sơ sài | Haiku, prompt ngắn, schema không có dòng mẫu | 30 |
| M – gây lỗi có chủ đích | áp 1 phép biến đổi lên gold SQL (bảng dưới) | ~50 |
| T – bẫy giám khảo | SQL sai nhưng kèm comment dài, tự tin giải thích "vì sao đúng" | ~10 |

Phép gây lỗi (M), mỗi câu hỏi chọn 1–2 phép áp dụng được:

| Mã | Biến đổi | Ví dụ |
|---|---|---|
| `drop_filter` | bỏ một điều kiện WHERE | mất `year = 2024` |
| `join_type` | INNER ↔ LEFT JOIN | đếm cả khách không có hóa đơn |
| `distinct` | `COUNT(DISTINCT x)` ↔ `COUNT(x)` | đếm trùng |
| `boundary` | lệch biên ngày `<` ↔ `<=` | sót ngày 31/12 |
| `order_dir` | ASC ↔ DESC | top thấp nhất thay vì cao nhất |
| `wrong_col` | cột tương tự sai | `Customer.Country` thay vì `BillingCountry` |
| `agg_fn` | SUM ↔ AVG / thiếu `* Quantity` | doanh thu sai |
| `fan_out` | JOIN thêm bảng làm nhân dòng trước khi SUM | doanh thu bị nhân |

Mutation nào tình cờ **vẫn cho kết quả đúng** thì được gán nhãn đúng theo kết quả chạy
(không ép nhãn sai).

## 5. Điểm chuẩn (gold)

Chạy candidate và gold SQL, so kết quả:

- **Đúng** khi mọi cột của gold khớp với một cột nào đó của candidate (cho phép thêm cột,
  đổi tên và đổi thứ tự cột), so tập dòng không thứ tự (hoặc có thứ tự nếu
  `order_matters`), số thực làm tròn 2 chữ số.
- **Sai** khi khác kết quả, lỗi cú pháp, hoặc timeout.
- Mỗi bài sai được gán **loại lỗi** (từ mutation, hoặc mình phân loại tay cho output agent)
  để phân tích theo loại.
- Mình rà tay ~20 trường hợp biên (khớp/không khớp sát nút) và ghi lại quyết định.

## 6. Giám khảo

Cả hai nhận **cùng input**: câu hỏi, schema (DDL + 3 dòng mẫu/bảng), câu SQL. **Không
được chạy SQL**, không thấy gold SQL, không thấy nguồn tạo bài. Mã bài ẩn danh, xáo trộn.

### A – `rubric.md`
Tiêu chí bằng lời: hiểu đúng ý câu hỏi; đúng bảng và điều kiện JOIN; đủ và đúng điều kiện
lọc; đúng phép tổng hợp và nhóm; đúng sắp xếp/giới hạn; xử lý NULL, trùng lặp, nhân dòng.
Bảng thang điểm 0–10. Trả về:
```json
{"verdict": "correct|incorrect", "score": 0-10, "reason": "..."}
```

### B – `formula.md`
1. Liệt kê yêu cầu `R = {r_1..r_n}` từ câu hỏi, mỗi yêu cầu có loại
   (filter, aggregate, group, order, limit, output).
2. Với từng yêu cầu: `s_i ∈ {0, 0.5, 1}` (không đáp ứng / một phần / đáp ứng).
3. Liệt kê lỗi cấu trúc `E`, mỗi lỗi có mức phạt cố định:
   | Lỗi | p |
   |---|---|
   | sai cú pháp / cột hoặc bảng không tồn tại | 1.0 |
   | JOIN nhân dòng làm sai phép tổng hợp | 0.6 |
   | sai loại JOIN | 0.5 |
   | thiếu/thừa DISTINCT | 0.4 |
4. Tính:
   ```
   coverage = Σ s_i / n
   penalty  = Π_{e ∈ E} (1 − p_e)
   S        = round(10 · coverage · penalty, 2)
   verdict  = correct  nếu  S ≥ 8  và không có lỗi p = 1.0
   ```
   Trả về `{"requirements": [...], "errors": [...], "S": ..., "verdict": ...}`.

Khi phân tích, mình so `requirements` mà B liệt kê với `requirements` gold (§3) để tách
lỗi của B thành **liệt kê thiếu yêu cầu**, **đánh dấu sai**, hay **tính sai**.

## 7. Chỉ số

| Chỉ số | Ý nghĩa |
|---|---|
| **Accuracy** của verdict | đúng/sai so với kết quả chạy (chỉ số chính) |
| **Recall bắt lỗi** | trong các SQL sai, bao nhiêu % bị giám khảo bắt (quan trọng nhất trong thực tế) |
| **False alarm** | trong các SQL đúng, bao nhiêu % bị chê oan |
| **AUROC** của điểm | điểm số có tách được đúng/sai không, không phụ thuộc ngưỡng |
| Theo loại lỗi / mức độ | ma trận recall theo `drop_filter`, `fan_out`... và easy/medium/hard |
| **Tỉ lệ bị bẫy** | trên nhóm T: bao nhiêu % bị comment tự tin đánh lừa |
| Độ ổn định | tỉ lệ verdict đổi khi chấm lại |
| (B) lỗi đo / lỗi tính | recall yêu cầu so với gold; tỉ lệ `S` báo cáo ≠ công thức |
| Chi phí | token và thời gian mỗi lượt (chỉ đo được ở chế độ API) |

Thống kê: kèm khoảng tin cậy 95% (bootstrap) và kiểm định McNemar cho hiệu accuracy
A vs B, để biết chênh lệch có thật hay do nhiễu.

## 8. Cách chạy & cấu trúc

```
examples/sql-judge-comparison/
├── SPEC.md
├── README.md               # kết quả + nhận xét sau khi chạy
├── download_db.sh
├── questions.yaml          # 30 câu + gold SQL + requirements
├── judges/{rubric,formula}.md
├── db.py                   # chạy read-only, so khớp kết quả (§5)
├── mutate.py               # các phép gây lỗi (§4)
├── generate.py             # sinh candidate G1–G3 bằng deep agent (cần API key)
├── flow.py                 # chạy giám khảo bằng deep agent (cần API key)
├── external.py             # export/collect cho sub-agent (không cần API key)
├── metrics.py
└── runs/                   # batch, đáp án, report.md
```

- Có API key: `generate.py` → `flow.py`, giống thí nghiệm 1.
- Không có API key (như phiên này): sinh G1–G3 và chấm bằng sub-agent Claude qua
  `external.py`, chỉ cho dùng Read/Write, và kiểm tra lại lịch sử thao tác để bảo đảm
  không đọc gold.
- Mỗi batch giám khảo 10 bài, **không có 2 bài cùng câu hỏi trong một batch** (để giảm việc
  so sánh chéo đã thấy ở thí nghiệm 1).
- Có test cho `db.py` (so khớp kết quả) và `mutate.py` (mỗi phép biến đổi), lint bằng ruff.

Ước tính số sub-agent ở chế độ không API key:
sinh bài ~9, chấm 150 bài × 2 giám khảo × 2 lần ÷ 10 = 60 (Haiku), thêm 30 nếu chạy Sonnet.

## 9. Cần bạn quyết định

| # | Câu hỏi | Mình đề xuất |
|---|---|---|
| Q1 | Có đưa danh sách yêu cầu (requirements) cho giám khảo không? | **Không**: giám khảo phải tự hiểu câu hỏi, giống thực tế. Có thể chạy thêm một nhánh "có requirements" để so sánh. |
| Q2 | Model giám khảo | **Haiku** (2 lần chấm) là chính, **Sonnet** (1 lần) để xem công thức có giúp model yếu bắt kịp model mạnh không |
| Q3 | Số câu hỏi / candidate | 30 câu / ~150 candidate |
| Q4 | Ngưỡng `S ≥ 8` của B | Giữ cố định trước khi chạy (không chỉnh sau khi xem kết quả); AUROC bù cho việc chọn ngưỡng |
| Q5 | Thêm giám khảo C "lai" (rubric cho phần hiểu ý + công thức để gộp điểm)? | Để sang vòng sau, sau khi có kết quả A vs B |
| Q6 | Ngôn ngữ câu hỏi | Tiếng Việt |

## 10. Ngoài phạm vi

- Không cho giám khảo chạy SQL (khi đó bài toán thành "so kết quả", không còn là đánh giá LLM).
- Không tối ưu agent sinh SQL; chất lượng của G1–G3 chỉ cần đa dạng.
- Không đánh giá tiêu chí chủ quan (giọng văn, giải thích), đó là bài 4.

## 11. Tiêu chí hoàn thành

- [ ] 30 câu hỏi, gold SQL chạy được, đã rà mơ hồ.
- [ ] ~150 candidate có nhãn gold, tỉ lệ đúng trong khoảng 35–65%.
- [ ] Hai giám khảo chạy xong theo §9, 0 lượt đọc file ngoài phạm vi.
- [ ] `runs/report.md` có đủ chỉ số §7, kèm khoảng tin cậy và McNemar.
- [ ] README tóm tắt kết luận và giới hạn; test + ruff pass; commit và push lên nhánh.
