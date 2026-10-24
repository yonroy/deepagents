# Kết quả: rubric vs công thức trên Text-to-SQL

122 câu SQL, 78 đúng / 44 sai theo kết quả chạy thật.

## Tổng hợp

| Giám khảo | Model | Lượt | Accuracy (CI 95%) ↑ | Bắt lỗi ↑ | Chê oan ↓ | AUROC ↑ | Bị bẫy ↓ | Đổi ý khi chấm lại ↓ | Thiếu đáp án |
|---|---|---|---|---|---|---|---|---|---|
| formula | haiku | 244 | 93% (89%–97%) | 81% | 0% | 1.00 | 11% | 4% | 0 |
| formula | sonnet | 122 | 97% (93%–99%) | 91% | 0% | 0.99 | 0% | n/a | 0 |
| minitable | haiku | 244 | 95% (91%–98%) | 98% | 7% | 0.98 | 0% | 4% | 0 |
| minitable | sonnet | 122 | 99% (98%–100%) | 98% | 0% | 0.99 | 0% | n/a | 0 |
| rubric | haiku | 244 | 99% (98%–100%) | 98% | 0% | 0.99 | 0% | 0% | 0 |
| rubric | sonnet | 122 | 99% (98%–100%) | 98% | 0% | 0.99 | 0% | n/a | 0 |

## So từng cặp giám khảo (McNemar, lượt chấm đầu tiên)

- **haiku**, formula vs minitable: chỉ formula đúng 6 bài, chỉ minitable đúng 6 bài, p = 1.000 (n = 122)
- **haiku**, formula vs rubric: chỉ formula đúng 0 bài, chỉ rubric đúng 6 bài, p = 0.031 (n = 122)
- **haiku**, minitable vs rubric: chỉ minitable đúng 0 bài, chỉ rubric đúng 6 bài, p = 0.031 (n = 122)
- **sonnet**, formula vs minitable: chỉ formula đúng 0 bài, chỉ minitable đúng 3 bài, p = 0.250 (n = 122)
- **sonnet**, formula vs rubric: chỉ formula đúng 0 bài, chỉ rubric đúng 3 bài, p = 0.250 (n = 122)
- **sonnet**, minitable vs rubric: chỉ minitable đúng 0 bài, chỉ rubric đúng 0 bài, p = 1.000 (n = 122)

## Giám khảo công thức: lỗi nằm ở đâu

| Giám khảo | Model | Liệt kê yêu cầu (so với gold, xấp xỉ) | Tính sai | Verdict trái quy tắc |
|---|---|---|---|---|
| formula | haiku | 97% | 0% | 0% |
| formula | sonnet | 99% | 0% | 0% |

## Accuracy theo nguồn bài

| | formula haiku | formula sonnet | minitable haiku | minitable sonnet | rubric haiku | rubric sonnet | n |
|---|---|---|---|---|---|---|---|
| G1 | 100% | 100% | 92% | 100% | 100% | 100% | 30 |
| G2 | 97% | 97% | 91% | 97% | 97% | 97% | 29 |
| G3 | 100% | 100% | 92% | 100% | 100% | 100% | 20 |
| M | 81% | 91% | 100% | 100% | 100% | 100% | 34 |
| T | 89% | 100% | 100% | 100% | 100% | 100% | 9 |

## Accuracy theo độ khó

| | formula haiku | formula sonnet | minitable haiku | minitable sonnet | rubric haiku | rubric sonnet | n |
|---|---|---|---|---|---|---|---|
| easy | 94% | 100% | 97% | 100% | 100% | 100% | 33 |
| hard | 94% | 96% | 93% | 98% | 98% | 98% | 45 |
| medium | 91% | 95% | 94% | 100% | 100% | 100% | 44 |

## Accuracy theo loại lỗi cố ý (M + T)

| | formula haiku | formula sonnet | minitable haiku | minitable sonnet | rubric haiku | rubric sonnet | n |
|---|---|---|---|---|---|---|---|
| agg_fn | 50% | 100% | 100% | 100% | 100% | 100% | 1 |
| and_to_or | 100% | 100% | 100% | 100% | 100% | 100% | 2 |
| boundary | 50% | 100% | 100% | 100% | 100% | 100% | 4 |
| count_star | 100% | 100% | 100% | 100% | 100% | 100% | 2 |
| distinct | 100% | 100% | 100% | 100% | 100% | 100% | 4 |
| drop_filter | 50% | 50% | 100% | 100% | 100% | 100% | 4 |
| extra_filter | 100% | 100% | 100% | 100% | 100% | 100% | 2 |
| fan_out | 100% | 100% | 100% | 100% | 100% | 100% | 3 |
| filter_before_agg | 100% | 100% | 100% | 100% | 100% | 100% | 2 |
| integer_division | 100% | 100% | 100% | 100% | 100% | 100% | 1 |
| join_type | 100% | 100% | 100% | 100% | 100% | 100% | 2 |
| null_compare | 100% | 100% | 100% | 100% | 100% | 100% | 1 |
| order_dir | 75% | 100% | 100% | 100% | 100% | 100% | 2 |
| unit | 0% | 100% | 100% | 100% | 100% | 100% | 1 |
| wrong_agg_filter | 50% | 100% | 100% | 100% | 100% | 100% | 1 |
| wrong_col | 100% | 100% | 100% | 100% | 100% | 100% | 1 |
| wrong_denominator | 50% | 100% | 100% | 100% | 100% | 100% | 1 |
| wrong_group | 88% | 75% | 100% | 100% | 100% | 100% | 4 |
| wrong_join_key | 100% | 100% | 100% | 100% | 100% | 100% | 3 |
| wrong_scope | 100% | 100% | 100% | 100% | 100% | 100% | 1 |
| wrong_value | 100% | 100% | 100% | 100% | 100% | 100% | 1 |
