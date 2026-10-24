# SQL judge comparison: rubric `.md` vs. công thức toán

Thí nghiệm 2 (spec: [`SPEC.md`](SPEC.md)). Câu hỏi: khi **không được chạy SQL**, giám khảo LLM
nào phán đoán đúng hơn một câu SQL là đúng hay sai: giám khảo đọc **rubric bằng lời**
([`judges/rubric.md`](judges/rubric.md)) hay giám khảo phải **đo biến và tính công thức**
([`judges/formula.md`](judges/formula.md))?

Điểm chuẩn **độc lập với cả hai giám khảo**: chạy câu SQL trên database Chinook và so kết
quả với SQL chuẩn ([`db.py`](db.py)).

## Kết quả

122 câu SQL cho 30 câu hỏi tiếng Việt: 78 đúng, 44 sai theo kết quả chạy. 78 batch
giám khảo rubric/formula (cộng 39 batch minitable ở mục dưới), toàn bộ là sub-agent Claude chỉ được dùng Read/Write. Lịch sử thao tác đã
được kiểm tra: 234/234 lượt đọc đều nằm trong 3 file cho phép, không ai đọc đáp án.
Báo cáo đầy đủ ở [`runs/report.md`](runs/report.md).

| Giám khảo | Model | Lượt | Accuracy (CI 95%) | Bắt lỗi | Chê oan | AUROC | Bị bẫy | Đổi ý khi chấm lại |
|---|---|---|---|---|---|---|---|---|
| **rubric** | Haiku | 244 | **99%** (98–100) | **98%** | 0% | 0.99 | **0%** | **0%** |
| **rubric** | Sonnet | 122 | **99%** (98–100) | **98%** | 0% | 0.99 | **0%** | n/a |
| formula | Haiku | 244 | 93% (89–97) | 81% | 0% | **1.00** | 11% | 4% |
| formula | Sonnet | 122 | 97% (93–99) | 91% | 0% | 0.99 | 0% | n/a |

McNemar (lượt chấm đầu): Haiku có 6 bài chỉ rubric đúng, 0 bài chỉ công thức đúng (**p = 0.031**);
Sonnet là 3 so với 0 (p = 0.25, chưa đủ ý nghĩa thống kê).

### Kết luận theo spec (ngưỡng S ≥ 8 cố định từ trước)

**Rubric thắng.** Chênh lệch có ý nghĩa thống kê với Haiku. Với Sonnet thì cùng chiều nhưng
chưa đủ mẫu để khẳng định.

### Vì sao công thức thua: khâu đo tốt, khâu gộp điểm hỏng

- **Phần đo của công thức rất tốt.** AUROC 0.99–1.00, 0% tính sai, 0% verdict trái quy tắc,
  liệt kê yêu cầu khớp ~97–99% với danh sách gold.
- **19/21 lần công thức bỏ sót lỗi, giám khảo đã *thấy* lỗi** (chấm yêu cầu đó 0 hoặc 0.5)
  nhưng bài vẫn qua ngưỡng. Ví dụ: C055 thiếu hẳn điều kiện "năm 2024", có 6 yêu cầu,
  coverage = 5/6 nên S = 8.33 ≥ 8, và verdict ra **đúng**.
- Nguyên nhân: công thức **lấy trung bình** các yêu cầu, trong khi với SQL **chỉ cần sai
  một yêu cầu là kết quả sai**. Bảng lỗi cấu trúc cũng không có mã cho "thiếu điều kiện
  lọc" hay "sai chiều sắp xếp", nên các lỗi đó không bị trừ thêm điểm.
- Các giám khảo tự nhận ra điều này trong báo cáo ("Neither missing filter matches an error
  code… both stay above the 8 threshold. I followed the formula strictly."). Đây chính là
  rủi ro của công thức: **agent làm đúng công thức kể cả khi công thức sai**.

### Phân tích thăm dò (sau khi xem kết quả, cần kiểm chứng trên dữ liệu mới)

| Quy tắc gộp điểm của công thức | formula Haiku | formula Sonnet |
|---|---|---|
| S ≥ 8 (cam kết trong spec) | 93% | 97% |
| S ≥ 9.5 | 100% | 99% |
| mọi `s_i = 1` và không có lỗi cấu trúc | 100% | 99% |

Chỉ cần đổi sang quy tắc "**mọi yêu cầu phải đạt**", công thức đã ngang rubric (rubric lỗi
duy nhất ở C050, là ca biên giới bên dưới). Bài học: với nhiệm vụ đúng/sai nhị phân,
**hàm gộp phải là AND (min), không phải trung bình**.

## Giám khảo thứ ba: `minitable` (tự dựng mini bảng SQL)

Giám khảo [`judges/minitable.md`](judges/minitable.md) không đọc rubric hay công thức. Nó
**tự hiểu bài toán bằng dữ liệu**: dựng một database SQLite *rỗng* có schema Chinook
([`minidb.py`](minidb.py), không có dòng dữ liệu thật nào), tự chèn 3–10 dòng mỗi bảng chứa
các ca biên (hóa đơn nhiều dòng, NULL, ngày cuối kỳ có giờ, tên trùng, hoà điểm…), **tự tính tay
đáp án mong đợi trước**, rồi mới chạy SQL ứng viên trên mini bảng và so sánh.
Fixture và query của từng bài nằm ở `runs/judge/minidb/`.

| Giám khảo | Model | Accuracy (CI 95%) | Bắt lỗi | Chê oan | Bị bẫy | Đổi ý khi chấm lại |
|---|---|---|---|---|---|---|
| rubric | Haiku | 99% (98–100) | 98% | 0% | 0% | 0% |
| **minitable** | Haiku | 95% (91–98) | **98%** | **7%** | 0% | 4% |
| formula | Haiku | 93% (89–97) | 81% | 0% | 11% | 4% |
| rubric | Sonnet | 99% (98–100) | 98% | 0% | 0% | — |
| **minitable** | Sonnet | **99%** (98–100) | **98%** | **0%** | 0% | — |
| formula | Sonnet | 97% (93–99) | 91% | 0% | 0% | — |

- **Bắt lỗi rất tốt.** Cả hai model đều bắt 100% số lỗi cố ý và bài bẫy; lỗi duy nhất bị bỏ
  sót là ca biên giới C050. Comment tự tin trong bài bẫy vô tác dụng, vì giám khảo *chạy thử*
  thay vì đọc lời giải thích ("expected 15.00, got 25.00").
- **Điểm yếu riêng là chê oan (Haiku 7%)**, do *ca biên tưởng tượng*. Toàn bộ 11 lần chê oan
  rơi vào 4 câu hỏi có chữ "mỗi"/"từng" (Q20, Q24, Q05, Q26). Giám khảo tự thêm vào mini bảng
  những trường hợp **không có trong dữ liệu thật**: loại media không bán được bài nào, khách
  không có hóa đơn, quốc gia NULL. Sau đó nó kết luận SQL sai vì không xử lý các trường hợp ấy.
  Đây là tranh cãi về cách hiểu câu hỏi chứ không phải lỗi thật trên Chinook. Sonnet không mắc
  lỗi này (0% chê oan), vì nó tự đánh giá được ca nào đáng phạt.
- **Đắt hơn nhiều.** Trung bình ~30 lần gọi tool mỗi batch (so với 5), ~1.5–2.5 phút mỗi batch
  (so với ~25 giây), ~95k token mỗi batch (so với ~68k).
- McNemar: với Haiku, rubric hơn minitable 6–0 bài (p = 0.031); với Sonnet, minitable và rubric
  hoà 0–0.

### Ba kiểu thất bại khác nhau

| Giám khảo | Kiểu thất bại điển hình |
|---|---|
| rubric | gần như không có trên bộ dữ liệu này (chạm trần) |
| formula | **nuông chiều**: thấy lỗi nhưng hàm gộp trung bình vẫn cho qua |
| minitable | **khắt khe quá**: tự tạo ca biên không tồn tại trong dữ liệu thật rồi phạt |

Gợi ý cho vòng sau: bảo `minitable` **chỉ phạt ca biên mà câu hỏi nói rõ**, hoặc cho nó xem
thống kê dữ liệu (ví dụ "mọi loại media đều có bài đã bán"), rồi đo lại tỉ lệ chê oan.

## So với thí nghiệm 1

| | Thí nghiệm 1 (tóm tắt ticket) | Thí nghiệm 2 (SQL) |
|---|---|---|
| Điểm chuẩn | tính bằng chính công thức của B | chạy SQL thật, độc lập |
| Thắng | **công thức** (Spearman 1.00 vs 0.84) | **rubric** (99% vs 93–97%) |
| Điểm yếu của bên thua | rubric hiểu "dài lê thê" mỗi lần một kiểu | công thức gộp điểm sai, không phải do đo sai |

Rút ra chung: **công thức mạnh ở khâu đo** (ổn định, không tính sai, tách được đúng/sai),
nhưng **chỉ tốt bằng thiết kế của nó**. Khi điểm chuẩn khớp với công thức thì công thức
thắng; khi công thức gộp sai cách, rubric (để model tự phán đoán tổng thể) an toàn hơn.

## Giới hạn

- **Bài sai chủ yếu là lỗi cố ý gây ra.** Agent viết SQL gần như toàn đúng (78/79), nên 43/44
  bài sai đến từ phép gây lỗi (M) và bài bẫy (T). Lỗi thật của agent có thể khó hơn.
- **Bài toán hơi dễ với giám khảo.** Rubric đạt 99%, nên chạm trần và khó tách tiếp.
  Vòng sau cần SQL sai tinh vi hơn.
- **Ca biên giới C050** (liệt kê thêm 5 nhân viên không phụ trách khách nào, với doanh thu 0):
  mình gán là *sai*. Mọi giám khảo, ở mọi lượt, đều kết luận *đúng*. Nếu gán ngược lại,
  rubric đạt 100%. Quy tắc "mọi yêu cầu phải đạt" ở bảng thăm dò bắt được C050 chỉ vì
  giám khảo đã cho yêu cầu "nhân viên hỗ trợ" 0.5 điểm.
- Mỗi giám khảo chấm 10 bài một lượt (không có 2 bài cùng câu hỏi trong một batch). Cả SQL
  sinh ra lẫn giám khảo đều là model Claude. Chỉ có 1 database và 30 câu hỏi.
- 16/78 giám khảo gọi lạc sang công cụ liệt kê phiên làm việc (chỉ đọc, không chứa đáp án).
  Một file đáp án bị dính rác sau mảng JSON; phần đọc chỉ lấy mảng đầu tiên.

## Cấu trúc & cách chạy

```
SPEC.md              spec đã duyệt
questions.yaml       30 câu hỏi + SQL chuẩn + requirements + phép gây lỗi/bẫy
db.py                chạy read-only, so khớp kết quả (cho phép thêm cột, đổi tên, ghép họ tên)
mutate.py            áp phép gây lỗi lên SQL chuẩn
check_questions.py   chạy mọi SQL chuẩn và phép gây lỗi, báo phép nào không làm đổi kết quả
judges/              rubric.md, formula.md, minitable.md
minidb.py            database rỗng có schema Chinook để giám khảo minitable chạy fixture tự dựng
external.py          export/collect cho sub-agent (không cần API key)
flow.py              cùng luồng nhưng bằng deep agent qua API (cần ANTHROPIC_API_KEY)
metrics.py           accuracy, recall, AUROC, McNemar, bootstrap CI, phân tích công thức
query.py             công cụ chạy SQL read-only cho agent sinh SQL G1
runs/                dữ liệu đã chạy: batch, đáp án, candidates.json, report.md
tests/               test cho db, mutate, flow
```

```bash
cd examples/sql-judge-comparison
./download_db.sh && uv sync
uv run --group test pytest -q              # 40 test

# Có API key: sinh SQL và chấm bằng deep agent
uv run python external.py export-gen && uv run python flow.py gen
uv run python external.py build && uv run python external.py export-judge
uv run python flow.py judge && uv run python external.py report

# Không có API key: giao các file trong runs/gen/ và runs/judge/batches/ cho agent khác,
# rồi chạy lại external.py build / report
```
