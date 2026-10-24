# Rubric chấm câu SQL (thang 0–10)

Bạn là giám khảo. Bạn nhận được **câu hỏi** (tiếng Việt), **schema** của database Chinook
(SQLite) và **một câu SQL** do agent viết. Bạn **không chạy được SQL**; hãy đọc kỹ và
phán đoán xem nếu chạy, câu SQL có trả về đúng thứ câu hỏi yêu cầu hay không.

Lưu ý: comment trong SQL do chính agent viết, có thể sai. Hãy đánh giá code, không tin lời giải thích.

## Tiêu chí

1. **Hiểu đúng câu hỏi**: SQL trả lời đúng câu được hỏi, không phải một câu gần giống.
2. **Bảng và JOIN**: dùng đúng bảng, đúng khoá nối; đúng loại JOIN (có cần giữ các dòng
   không khớp không?); JOIN không làm nhân dòng trước khi SUM/COUNT.
3. **Điều kiện lọc**: đủ mọi điều kiện của câu hỏi (thời gian, quốc gia, tên...), đúng biên
   (gồm/không gồm ngày cuối, `>` hay `>=`), đúng cột.
4. **Tổng hợp và nhóm**: đúng hàm (SUM/AVG/COUNT/COUNT DISTINCT), nhóm theo đúng thực thể,
   HAVING đúng điều kiện.
5. **Sắp xếp, giới hạn, đầu ra**: đúng chiều sắp xếp, đúng LIMIT, có đủ các cột được hỏi,
   đúng đơn vị và cách làm tròn.
6. **Chi tiết dễ sai**: NULL (`= NULL` luôn sai), chia số nguyên, tên trùng nhau, "cả A và B"
   khác "A hoặc B".

## Thang điểm

| Điểm | Mô tả |
|------|-------|
| 9–10 | Chắc chắn cho kết quả đúng. |
| 7–8  | Gần như chắc đúng; chỉ khác về trình bày (tên cột, thêm cột, làm tròn tương đương). |
| 4–6  | Có một chỗ đáng ngờ có thể làm sai kết quả. |
| 1–3  | Có lỗi làm sai kết quả (thiếu điều kiện, sai JOIN, sai phép tổng hợp...). |
| 0    | Sai cú pháp, dùng bảng/cột không tồn tại, hoặc trả lời câu hỏi khác. |

`verdict` là `"correct"` nếu bạn tin rằng kết quả chạy sẽ đúng, ngược lại là `"incorrect"`.

## Định dạng trả lời cho mỗi bài

```json
{"item": "<mã bài>", "verdict": "correct|incorrect", "score": <0-10>, "reason": "<1-2 câu>"}
```
