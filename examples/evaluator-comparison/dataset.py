"""Tickets and synthetic summaries whose true quality is known by construction.

Each candidate summary is assembled from labelled sentences (a fact sentence per
key point, invented "hallucination" sentences, and neutral filler), so the true
values of N, C, H and W, and therefore the gold score, are known exactly.
"""

from __future__ import annotations

import random
from dataclasses import dataclass, field

MAX_WORDS = 60


@dataclass
class Ticket:
    id: str
    text: str
    key_points: list[str]
    fact_sentences: list[str]
    hallucinations: list[str]


@dataclass
class Candidate:
    id: str
    ticket: Ticket
    summary: str
    truth: dict[str, int] = field(default_factory=dict)
    gold: float = 0.0


FILLER = [
    "Bộ phận hỗ trợ đã tiếp nhận thông tin và đang xem xét yêu cầu này một cách cẩn thận.",
    "Chúng tôi luôn trân trọng sự kiên nhẫn của khách hàng trong quá trình xử lý vấn đề.",
    "Ticket này được ghi nhận vào hệ thống để các bộ phận liên quan có thể theo dõi tiếp.",
    "Nhân viên phụ trách sẽ cập nhật tình hình cho khách hàng qua kênh liên lạc phù hợp.",
    "Đây là một trường hợp cần được quan tâm để đảm bảo trải nghiệm tốt cho người dùng.",
    "Mọi thông tin bổ sung từ phía khách hàng đều sẽ giúp quá trình xử lý nhanh hơn.",
]

TICKETS = [
    Ticket(
        id="T1",
        text=(
            "Chào shop, mình đặt đơn #48213 hôm 12/10, đã thanh toán qua thẻ. Hôm nay nhận hàng "
            "thì tai nghe bị nứt vỏ bên trái, hộp bị móp. Mình muốn được đổi một chiếc mới chứ "
            "không cần hoàn tiền. Tuần sau mình đi công tác nên mong shop xử lý trước thứ Sáu."
        ),
        key_points=[
            "Đơn #48213",
            "Tai nghe nứt vỏ bên trái khi nhận",
            "Khách muốn đổi sản phẩm mới, không hoàn tiền",
            "Cần xử lý trước thứ Sáu",
        ],
        fact_sentences=[
            "Khách báo đơn #48213.",
            "Tai nghe bị nứt vỏ bên trái khi nhận hàng.",
            "Khách muốn đổi chiếc mới, không cần hoàn tiền.",
            "Cần xử lý trước thứ Sáu vì khách sắp đi công tác.",
        ],
        hallucinations=[
            "Khách yêu cầu hoàn lại 100% tiền qua ví điện tử.",
            "Đây là lần thứ ba khách gặp lỗi với cùng sản phẩm.",
        ],
    ),
    Ticket(
        id="T2",
        text=(
            "Từ sáng nay mình không đăng nhập được app trên iPhone, cứ báo 'Mã OTP hết hạn' dù "
            "vừa nhận mã. Trên web thì vẫn vào bình thường. Mình đã cài lại app hai lần rồi. "
            "Tài khoản đăng ký bằng số 0912xxx789."
        ),
        key_points=[
            "Không đăng nhập được app iPhone từ sáng nay",
            "Lỗi báo OTP hết hạn dù vừa nhận mã",
            "Web vẫn đăng nhập bình thường",
            "Đã cài lại app hai lần",
        ],
        fact_sentences=[
            "Từ sáng nay khách không đăng nhập được app trên iPhone.",
            "App báo OTP hết hạn dù khách vừa nhận mã.",
            "Đăng nhập trên web vẫn bình thường.",
            "Khách đã cài lại app hai lần.",
        ],
        hallucinations=[
            "Khách đang dùng điện thoại Android đời cũ.",
            "Tài khoản của khách đã bị khóa do nghi ngờ gian lận.",
        ],
    ),
    Ticket(
        id="T3",
        text=(
            "Công ty mình dùng gói Business 20 người. Hóa đơn tháng 9 tính 25 người, dư 5 suất. "
            "Kế toán cần hóa đơn điều chỉnh trước ngày 30 để quyết toán. Nhờ bên bạn kiểm tra "
            "và gửi lại hóa đơn đúng."
        ),
        key_points=[
            "Gói Business 20 người",
            "Hóa đơn tháng 9 tính sai 25 người",
            "Cần hóa đơn điều chỉnh",
            "Hạn trước ngày 30",
        ],
        fact_sentences=[
            "Khách dùng gói Business 20 người.",
            "Hóa đơn tháng 9 bị tính thành 25 người.",
            "Khách cần gửi lại hóa đơn điều chỉnh.",
            "Hạn chót là trước ngày 30 để kế toán quyết toán.",
        ],
        hallucinations=[
            "Khách muốn nâng cấp lên gói Enterprise 50 người.",
            "Khách đã bị trừ tiền hai lần trong tháng 9.",
        ],
    ),
    Ticket(
        id="T4",
        text=(
            "Mình đặt bàn 6 người lúc 19h tối thứ Bảy tại chi nhánh Quận 3 nhưng giờ muốn đổi "
            "sang 8 người. Trong nhóm có một bạn dị ứng đậu phộng, nhờ nhà hàng lưu ý giúp."
        ),
        key_points=[
            "Đặt bàn 19h thứ Bảy, chi nhánh Quận 3",
            "Đổi số người từ 6 lên 8",
            "Có khách dị ứng đậu phộng",
            "Yêu cầu nhà hàng lưu ý món ăn",
        ],
        fact_sentences=[
            "Khách đặt bàn 19h thứ Bảy tại chi nhánh Quận 3.",
            "Khách muốn đổi từ 6 lên 8 người.",
            "Trong nhóm có một người dị ứng đậu phộng.",
            "Khách nhờ nhà hàng lưu ý khi chuẩn bị món.",
        ],
        hallucinations=[
            "Khách muốn đổi sang chi nhánh Quận 7.",
            "Khách yêu cầu phòng riêng có karaoke.",
        ],
    ),
    Ticket(
        id="T5",
        text=(
            "Gói cước 4G của mình hết dung lượng tốc độ cao từ ngày 15 dù mới dùng khoảng 3GB "
            "trên tổng 10GB theo thống kê trên điện thoại. Mình muốn nhà mạng kiểm tra lại và "
            "cộng bù dung lượng nếu tính sai."
        ),
        key_points=[
            "Gói 4G báo hết dung lượng tốc độ cao từ ngày 15",
            "Điện thoại thống kê mới dùng khoảng 3GB/10GB",
            "Yêu cầu kiểm tra lại",
            "Yêu cầu cộng bù nếu tính sai",
        ],
        fact_sentences=[
            "Gói 4G báo hết dung lượng tốc độ cao từ ngày 15.",
            "Theo điện thoại khách mới dùng khoảng 3GB trên 10GB.",
            "Khách yêu cầu nhà mạng kiểm tra lại.",
            "Khách muốn được cộng bù dung lượng nếu tính sai.",
        ],
        hallucinations=[
            "Khách muốn hủy hợp đồng và chuyển sang nhà mạng khác.",
            "Khách đã bị trừ 500.000 đồng trong tài khoản chính.",
        ],
    ),
]

# (variant name, number of facts kept, hallucinations added, pad to roughly this many words)
VARIANTS: list[tuple[str, int, int, int | None]] = [
    ("perfect", 4, 0, None),
    ("miss1", 3, 0, None),
    ("miss2", 2, 0, None),
    ("halluc1", 4, 1, None),
    ("verbose", 4, 0, 88),
    ("very_verbose", 4, 0, 125),
    ("miss3_halluc1", 1, 1, None),
    ("halluc2", 3, 2, None),
]


def word_count(text: str) -> int:
    return len(text.split())


def gold_score(n: int, c: int, h: int, w: int) -> float:
    """Ground-truth score; the same function `judges/formula.md` describes."""
    coverage = c / n
    faithful = max(0.0, 1 - 0.5 * h)
    brevity = 1.0 if w <= MAX_WORDS else max(0.0, 1 - (w - MAX_WORDS) / MAX_WORDS)
    return round(10 * coverage * faithful * brevity, 2)


def build_candidates(seed: int = 7) -> list[Candidate]:
    rng = random.Random(seed)
    candidates: list[Candidate] = []
    for ticket in TICKETS:
        for name, keep, n_halluc, pad_to in VARIANTS:
            facts = rng.sample(ticket.fact_sentences, keep)
            # Keep facts in ticket order so dropping one doesn't read as shuffled.
            facts.sort(key=ticket.fact_sentences.index)
            sentences = facts + ticket.hallucinations[:n_halluc]
            rng.shuffle(sentences)
            if pad_to:
                filler = rng.sample(FILLER, len(FILLER))
                while word_count(" ".join(sentences)) < pad_to and filler:
                    sentences.append(filler.pop())
            summary = " ".join(sentences)
            truth = {
                "N": len(ticket.key_points),
                "C": keep,
                "H": n_halluc,
                "W": word_count(summary),
            }
            candidates.append(
                Candidate(
                    id=f"{ticket.id}-{name}",
                    ticket=ticket,
                    summary=summary,
                    truth=truth,
                    gold=gold_score(truth["N"], truth["C"], truth["H"], truth["W"]),
                )
            )
    return candidates
