# Kết quả so sánh bộ đánh giá

- Model: `Claude Haiku sub-agents (Read/Write only)`, 40 bản tóm tắt có điểm chuẩn, lặp 2 lần mỗi giám khảo.

| Giám khảo | Spearman ↑ | MAE ↓ | Xếp cặp đúng ↑ | Lệch khi lặp ↓ | Lỗi parse ↓ | Đếm biến đúng (C,H) ↑ | Tính sai ↓ | Token/lần | Giây/lần |
|---|---|---|---|---|---|---|---|---|---|
| rubric | 0.84 | 0.87 | 89% | 0.65 | 0% | — | — | 0 | 0.0 |
| formula | 1.00 | 0.08 | 100% | 0.11 | 0% | 96% | 0% | 0 | 0.0 |

**Tốt nhất theo Spearman (hoà thì xét MAE): `formula`**

## Chi tiết từng bản tóm tắt

| Bản tóm tắt | Thật (C,H,W) | Gold | rubric | formula |
|---|---|---|---|---|
| T1-perfect | 4,0,35 | 10 | 10/10 | 10/10 |
| T1-miss1 | 3,0,25 | 7.5 | 6/7 | 7.5/7.5 |
| T1-miss2 | 2,0,16 | 5 | 4/4 | 5/5 |
| T1-halluc1 | 4,1,46 | 5 | 5/5 | 5/5 |
| T1-verbose | 4,0,91 | 4.83 | 0/0 | 4.83/4.83 |
| T1-very_verbose | 4,0,128 | 0 | 0/4 | 0/0 |
| T1-miss3_halluc1 | 1,1,23 | 1.25 | 0/0 | 1.25/1.25 |
| T1-halluc2 | 3,2,54 | 0 | 0/0 | 0/0 |
| T2-perfect | 4,0,35 | 10 | 10/10 | 10/10 |
| T2-miss1 | 3,0,25 | 7.5 | 7/7 | 7.5/7.5 |
| T2-miss2 | 2,0,17 | 5 | 4/4 | 5/5 |
| T2-halluc1 | 4,1,43 | 5 | 4/5 | 5/5 |
| T2-verbose | 4,0,90 | 5 | 3/5 | 5/5 |
| T2-very_verbose | 4,0,128 | 0 | 6/1 | 0/0 |
| T2-miss3_halluc1 | 1,1,15 | 1.25 | 2/2 | 1.25/1.25 |
| T2-halluc2 | 3,2,44 | 0 | 0/0 | 0/0 |
| T3-perfect | 4,0,34 | 10 | 10/9 | 10/10 |
| T3-miss1 | 3,0,28 | 7.5 | 7/7 | 3.75/7.5 |
| T3-miss2 | 2,0,17 | 5 | 4/5 | 5/5 |
| T3-halluc1 | 4,1,43 | 5 | 5/5 | 5/5 |
| T3-verbose | 4,0,91 | 4.83 | 7/4 | 4.83/4.83 |
| T3-very_verbose | 4,0,127 | 0 | 6/5 | 0/0 |
| T3-miss3_halluc1 | 1,1,15 | 1.25 | 1/2 | 1.25/1.25 |
| T3-halluc2 | 3,2,45 | 0 | 0/0 | 0/0 |
| T4-perfect | 4,0,38 | 10 | 10/10 | 10/10 |
| T4-miss1 | 3,0,28 | 7.5 | 7/7 | 10/7.5 |
| T4-miss2 | 2,0,20 | 5 | 4/4 | 5/5 |
| T4-halluc1 | 4,1,46 | 5 | 5/5 | 5/5 |
| T4-verbose | 4,0,92 | 4.67 | 7/3 | 4.67/4.67 |
| T4-very_verbose | 4,0,131 | 0 | 0/5 | 0/0 |
| T4-miss3_halluc1 | 1,1,19 | 1.25 | 1/1 | 1.25/1.25 |
| T4-halluc2 | 3,2,42 | 0 | 0/0 | 0/0 |
| T5-perfect | 4,0,40 | 10 | 10/10 | 10/10 |
| T5-miss1 | 3,0,30 | 7.5 | 6/7 | 7.5/7.5 |
| T5-miss2 | 2,0,18 | 5 | 5/5 | 5/5 |
| T5-halluc1 | 4,1,51 | 5 | 5/5 | 5/5 |
| T5-verbose | 4,0,97 | 3.83 | 0/5 | 3.83/3.83 |
| T5-very_verbose | 4,0,131 | 0 | 3/2 | 0/0 |
| T5-miss3_halluc1 | 1,1,21 | 1.25 | 1/2 | 1.25/1.25 |
| T5-halluc2 | 3,2,53 | 0 | 0/0 | 0/0 |
