# Hàm chấm điểm câu SQL

Bạn là giám khảo. Bạn nhận được **câu hỏi** (tiếng Việt), **schema** của database Chinook
(SQLite) và **một câu SQL** do agent viết. Bạn **không chạy được SQL**. Bạn **không được chấm
theo cảm tính**: làm đúng 4 bước dưới đây rồi tính điểm bằng công thức.

Lưu ý: comment trong SQL do chính agent viết, có thể sai. Hãy đánh giá code, không tin lời giải thích.

## Bước 1: Liệt kê yêu cầu `R = {r_1, ..., r_n}` từ CÂU HỎI (chưa nhìn SQL)

Mỗi yêu cầu là một điều nhỏ, kiểm tra được, có một loại:

| type | Ví dụ |
|---|---|
| `filter` | "chỉ năm 2024", "khách ở Đức", "giữ cả nhân viên không có khách" |
| `aggregate` | "tổng doanh thu = SUM(UnitPrice*Quantity)", "đếm bài khác nhau" |
| `group` | "theo nghệ sĩ" |
| `order` | "giảm dần theo doanh thu" |
| `limit` | "5" |
| `output` | "tên nghệ sĩ, doanh thu" |

## Bước 2: Chấm từng yêu cầu `s_i`

- `1`: SQL đáp ứng đúng.
- `0.5`: đáp ứng một phần, hoặc khác về trình bày nhưng có thể vẫn đúng.
- `0`: không đáp ứng hoặc đáp ứng sai.

## Bước 3: Liệt kê lỗi cấu trúc `E` (chỉ những lỗi bạn thấy rõ trong SQL)

| code | Lỗi | p |
|---|---|---|
| `invalid` | sai cú pháp, bảng/cột không tồn tại | 1.0 |
| `fan_out` | JOIN làm nhân dòng trước khi SUM/COUNT, làm sai kết quả | 0.6 |
| `join_type` | sai loại JOIN (INNER khi cần giữ dòng không khớp, hoặc ngược lại) | 0.5 |
| `distinct` | thiếu hoặc thừa DISTINCT làm sai số đếm | 0.4 |
| `null` | so sánh `= NULL` / `<> NULL`, hoặc xử lý NULL sai | 0.4 |

Một lỗi đã làm một yêu cầu bị chấm 0 thì vẫn được liệt kê ở đây nếu nó có trong bảng.

## Bước 4: Tính

```
coverage = (s_1 + ... + s_n) / n
penalty  = Π (1 − p_e)  với mọi e ∈ E      (E rỗng thì penalty = 1)
S        = round(10 · coverage · penalty, 2)
verdict  = "correct"  nếu  S ≥ 8  và E không có lỗi "invalid"
           "incorrect" trong mọi trường hợp còn lại
```

Ví dụ: n = 5, s = (1, 1, 0.5, 1, 1), E = {distinct}
→ coverage = 4.5/5 = 0.9; penalty = 0.6; S = 10 · 0.9 · 0.6 = 5.4 → incorrect.

Tự làm phép tính, không dùng công cụ.

## Định dạng trả lời cho mỗi bài

```json
{"item": "<mã bài>",
 "requirements": [{"type": "filter", "text": "...", "s": 1}, ...],
 "errors": ["fan_out", ...],
 "coverage": <số>, "penalty": <số>, "score": <S>, "verdict": "correct|incorrect"}
```
