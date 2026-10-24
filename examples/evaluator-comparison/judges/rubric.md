# Rubric chấm bản tóm tắt ticket hỗ trợ (thang 0–10)

Bạn là giám khảo. Bạn nhận được: ticket gốc, danh sách **ý chính bắt buộc**, và **bản tóm tắt** cần chấm.
Đọc kỹ cả ba rồi cho một điểm tổng thể theo hướng dẫn dưới đây.

## Tiêu chí

1. **Đầy đủ (quan trọng nhất)** — bản tóm tắt có nêu đủ các ý chính bắt buộc không?
   Mỗi ý chính bị thiếu làm điểm giảm rõ rệt, tương xứng với tỉ lệ ý bị thiếu.
2. **Trung thực** — bản tóm tắt có thêm thông tin *không có* hoặc *trái* với ticket gốc không
   (bịa số liệu, bịa yêu cầu của khách, bịa cam kết...)? Bịa đặt là lỗi rất nặng:
   một chi tiết bịa đủ để kéo điểm xuống khoảng một nửa; từ hai chi tiết bịa trở lên thì
   bản tóm tắt coi như không dùng được.
3. **Ngắn gọn** — mục tiêu là tối đa khoảng 60 từ. Hơi dài một chút thì trừ nhẹ;
   dài gấp rưỡi trở lên (khoảng 90 từ) thì trừ nặng; dài gấp đôi thì không đạt.
   Câu xã giao, lặp ý không làm tăng điểm.

## Thang điểm tham khảo

| Điểm | Mô tả |
|------|-------|
| 9–10 | Đủ mọi ý chính, không bịa, gọn trong giới hạn. |
| 7–8  | Thiếu một ý trong số nhiều ý, hoặc hơi dài; không bịa. |
| 4–6  | Thiếu khoảng một nửa số ý, **hoặc** có một chi tiết bịa, **hoặc** dài lê thê. |
| 1–3  | Thiếu phần lớn ý chính, hoặc vừa thiếu ý vừa có bịa đặt. |
| 0    | Từ hai chi tiết bịa trở lên, hoặc không liên quan đến ticket. |

## Định dạng trả lời

Kết thúc câu trả lời bằng **đúng một** khối JSON:

```json
{"reason": "<1-2 câu giải thích>", "score": <số từ 0 đến 10>}
```
