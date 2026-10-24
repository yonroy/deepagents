# Hàm chấm điểm bản tóm tắt ticket hỗ trợ

Bạn là giám khảo. Bạn nhận được: ticket gốc, danh sách **ý chính bắt buộc** (đánh số),
và **bản tóm tắt** cần chấm. Bạn **không được chấm theo cảm tính** — phải đo các biến
dưới đây rồi tính điểm bằng công thức.

## Bước 1 — Đo biến

| Biến | Định nghĩa |
|------|-----------|
| `N`  | Số ý chính bắt buộc (đếm trong danh sách được cấp). |
| `C`  | Số ý chính được bản tóm tắt nêu ra (đúng nghĩa, có thể diễn đạt khác). `0 ≤ C ≤ N`. |
| `H`  | Số chi tiết trong bản tóm tắt **không có hoặc trái** với ticket gốc (bịa đặt). Câu xã giao chung chung không tính. |
| `W`  | Số từ của bản tóm tắt = số token tách theo khoảng trắng. |

## Bước 2 — Tính

$$
\text{coverage} = \frac{C}{N}
$$

$$
\text{faithful} = \max\left(0,\; 1 - 0.5 \cdot H\right)
$$

$$
\text{brevity} =
\begin{cases}
1 & W \le 60 \\
\max\left(0,\; 1 - \dfrac{W - 60}{60}\right) & W > 60
\end{cases}
$$

$$
S = 10 \cdot \text{coverage} \cdot \text{faithful} \cdot \text{brevity}
$$

Làm tròn `S` đến 2 chữ số thập phân. Hãy viết ra từng bước tính.

## Định dạng trả lời

Kết thúc câu trả lời bằng **đúng một** khối JSON:

```json
{"N": <int>, "C": <int>, "H": <int>, "W": <int>, "score": <S>}
```
