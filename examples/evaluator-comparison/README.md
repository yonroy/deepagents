# Evaluator comparison: rubric `.md` vs. công thức toán

Một luồng mini để trả lời câu hỏi: **giám khảo LLM chấm theo hướng dẫn bằng chữ (rubric `.md`)
hay chấm theo hàm toán học (bắt agent đo biến và tự tính) thì đáng tin hơn?**

```
                ┌──────────────┐
 ticket ──────► │ worker agent │ ──► bản tóm tắt (nhiệm vụ đơn giản)
                └──────────────┘
 40 bản tóm tắt tổng hợp, biết trước điểm thật (gold)
        │
        ├──► Judge A  "rubric"        đọc /rubric.md  → chấm tổng thể 0–10
        ├──► Judge B  "formula"       đọc /formula.md → đo N, C, H, W → tự tính S
        └──► Judge B' "formula+calc"  như B, có thêm tool calculator
        │
        ▼
   so với gold: Spearman, MAE, xếp cặp đúng, độ lệch khi lặp, lỗi đếm biến, lỗi tính toán
```

## Nhiệm vụ & cách có "đáp án"

- **Nhiệm vụ**: tóm tắt ticket chăm sóc khách hàng trong ≤ 60 từ (5 ticket tiếng Việt, `dataset.py`).
- **Bộ dữ liệu chấm**: mỗi ticket sinh 8 bản tóm tắt bằng cách ghép các câu đã gán nhãn:
  câu chứa ý chính, câu bịa đặt, câu xã giao độn chữ. Vì vậy biết chính xác
  `C` (số ý có mặt), `H` (số chi tiết bịa), `W` (số từ) → điểm gold.
  Biến thể: `perfect`, `miss1`, `miss2`, `halluc1`, `verbose`, `very_verbose`, `miss3_halluc1`, `halluc2`.
- **Hai giám khảo nhận cùng input** (ticket gốc + danh sách ý chính + bản tóm tắt) và cùng
  tiêu chí; khác nhau duy nhất ở cách diễn đạt tiêu chí:
  - [`judges/rubric.md`](judges/rubric.md): mô tả bằng lời + bảng thang điểm.
  - [`judges/formula.md`](judges/formula.md): `S = 10 · C/N · max(0, 1 − 0.5H) · brevity(W)`.
- Mỗi giám khảo là một `create_deep_agent`; file hướng dẫn được đặt vào filesystem ảo
  của agent và agent bắt buộc phải `read_file` trước khi chấm.

## Chỉ số

| Chỉ số | Ý nghĩa |
|---|---|
| Spearman ↑ | Xếp hạng của giám khảo khớp xếp hạng gold đến đâu (chỉ số chính) |
| MAE ↓ | Sai số tuyệt đối trung bình so với gold (thang 0–10) |
| Xếp cặp đúng ↑ | Trong cùng một ticket, với 2 bản chênh gold ≥ 1, giám khảo có chọn đúng bản tốt hơn không |
| Lệch khi lặp ↓ | Độ lệch chuẩn điểm khi chấm lại cùng một bản (độ ổn định) |
| Đếm biến đúng ↑ | (chỉ judge công thức) tỉ lệ đếm đúng cả `C` và `H` |
| Tính sai ↓ | (chỉ judge công thức) điểm báo cáo ≠ công thức áp lên chính các biến nó báo cáo → lỗi số học |

Hai chỉ số cuối tách được lỗi của judge công thức thành **đo sai** hay **tính sai**.

## Chạy

```bash
cd examples/evaluator-comparison
uv sync

# Chạy thật (cần ANTHROPIC_API_KEY); 3 judge × 40 bản × 2 lần ≈ 240 lượt gọi agent
export ANTHROPIC_API_KEY=...
uv run python flow.py

# Chạy nhỏ để thử
uv run python flow.py --limit 8 --repeats 1

# Model khác / chỉ một số judge
uv run python flow.py --model anthropic:claude-haiku-5-5 --judges rubric,formula

# Offline: FakeModel giả lập LLM, chỉ để kiểm tra luồng chạy (số liệu vô nghĩa)
uv run python flow.py --model fake
```

Kết quả ghi ra `results/report.md` (bảng tổng hợp + điểm từng bản) và `results/raw.json`.

## Lưu ý khi đọc kết quả

- Gold được tính bằng **đúng** công thức trong `formula.md`, nên judge công thức có lợi thế
  về thang điểm (MAE). Muốn so công bằng hơn, hãy ưu tiên **Spearman** và **xếp cặp đúng**
  (chỉ quan tâm thứ tự), hoặc thay gold bằng điểm do người chấm.
- Kỳ vọng thường gặp: rubric chấm "dễ tính" với bản dài dòng và thiếu nhất quán khi lặp;
  công thức ổn định hơn nhưng chỉ tốt bằng khả năng đếm `C`/`H` của model. Hãy chạy để xác nhận
  với model của bạn, đừng tin kỳ vọng.
- Muốn thử nhiệm vụ khác: sửa `TICKETS`/`VARIANTS` trong `dataset.py` và hai file trong `judges/`.
