from typing import Any

from langchain_core.language_models.fake_chat_models import GenericFakeChatModel
from langchain_core.messages import AIMessage

import flow


class ScriptedModel(GenericFakeChatModel):
    def bind_tools(self, tools: Any, **kwargs: Any) -> "ScriptedModel":
        return self


def test_run_batch_reads_files_and_parses_answers(monkeypatch):
    read = {"name": "read_file", "args": {"file_path": "/batch.md"}, "id": "c1", "type": "tool_call"}
    model = ScriptedModel(
        messages=iter(
            [AIMessage(content="", tool_calls=[read]), AIMessage(content='Kết quả:\n[{"item": "C001", "verdict": "correct", "score": 9}]\nxong')]
        )
    )
    monkeypatch.setitem(flow.MODELS, "fake", model)
    answers = flow._run_batch("fake", {"/batch.md": "## C001"}, "chấm")
    assert answers == [{"item": "C001", "verdict": "correct", "score": 9}]


def test_run_sql_tool_is_read_only():
    assert "rows" in flow.run_sql.invoke({"sql": "SELECT 1"})
    assert "Error" in flow.run_sql.invoke({"sql": "DROP TABLE Artist"})
