package com.moonligh.nutritionist.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.http.codec.ServerSentEvent;

import com.moonligh.nutritionist.domain.dialogue.DialogueReply;
import com.moonligh.nutritionist.domain.dialogue.LongTermMemory;
import com.moonligh.nutritionist.service.dialogue.DialogueOrchestrator;
import com.moonligh.nutritionist.service.dialogue.DialogueOrchestrator.TurnCommand;

class AgentTurnSseContractTest {

    @Test
    void turnEmitsReplyThenDoneOnly() {
        DialogueOrchestrator orchestrator = mock(DialogueOrchestrator.class);
        when(orchestrator.handle(any(TurnCommand.class))).thenReturn(new DialogueReply(
                "s-sse",
                List.of("GREETING"),
                List.of(),
                List.of(),
                List.of(),
                List.of(),
                "",
                null,
                "你好",
                List.of(),
                LongTermMemory.empty(),
                1,
                "",
                List.of(),
                0L,
                List.of(),
                List.of()));
        AgentTurnController controller = new AgentTurnController(orchestrator);

        List<ServerSentEvent<Object>> events = controller.turn(new AgentTurnController.TurnRequest(
                "s-sse", null, List.of(), List.of(), List.of(), List.of(), List.of(), List.of(),
                null, "你好", List.of())).collectList().block();

        assertEquals(2, events.size());
        assertEquals("reply", events.get(0).event());
        assertTrue(events.get(0).data() instanceof DialogueReply);
        assertEquals("s-sse", ((DialogueReply) events.get(0).data()).sessionId());
        assertEquals("done", events.get(1).event());
    }

    @Test
    void blankRequestEmitsErrorOnly() {
        AgentTurnController controller = new AgentTurnController(mock(DialogueOrchestrator.class));
        List<ServerSentEvent<Object>> events = controller.turn(new AgentTurnController.TurnRequest(
                "s1", null, List.of(), List.of(), List.of(), List.of(), List.of(), List.of(),
                null, "  ", List.of())).collectList().block();
        assertEquals(1, events.size());
        assertEquals("error", events.get(0).event());
        assertTrue(((Map<?, ?>) events.get(0).data()).get("message").toString().contains("请输入"));
    }
}
