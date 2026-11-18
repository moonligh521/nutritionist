package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.dialogue.DialogueTask;
import com.moonligh.nutritionist.domain.dialogue.TaskType;
import com.moonligh.nutritionist.domain.dialogue.TurnIntent;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext;

class IntentSafetyNetTest {

    private final IntentSafetyNet net = new IntentSafetyNet();

    @Test
    void recommendAskWithoutFoodsRepairsOutOfScopeToRecommend() {
        TurnIntent oos = TurnIntent.ofTasks(List.of(DialogueTask.outOfScope("帮我推荐")));
        UnderstandContext ctx = UnderstandContext.of(
                "帮我推荐", List.of(), com.moonligh.nutritionist.domain.dialogue.LongTermMemory.empty());
        TurnIntent repaired = net.repair(oos, ctx);
        assertEquals(1, repaired.tasks().size());
        assertEquals(TaskType.RECOMMEND, repaired.tasks().getFirst().type());
        assertTrue(repaired.tasks().getFirst().rawFoods().isEmpty());
    }
}
