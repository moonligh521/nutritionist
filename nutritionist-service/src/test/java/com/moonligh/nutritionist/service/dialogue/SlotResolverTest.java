package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.dialogue.DialogueTask;
import com.moonligh.nutritionist.domain.dialogue.LongTermMemory;
import com.moonligh.nutritionist.domain.dialogue.TaskType;
import com.moonligh.nutritionist.domain.dialogue.TurnIntent;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext.DishRef;

class SlotResolverTest {

    private final SlotResolver resolver = new SlotResolver();

    @Test
    void dishIndexMapsToName() {
        UnderstandContext ctx = new UnderstandContext(
                "换第二个",
                List.of(),
                List.of(new DishRef(1, "1", "水煮蛋"), new DishRef(2, "2", "番茄炒蛋")),
                "",
                "RECOMMENDED",
                LongTermMemory.empty());
        TurnIntent intent = TurnIntent.ofTasks(List.of(DialogueTask.replaceOne("")));
        TurnIntent resolved = resolver.resolve(intent, ctx, List.of(2));
        assertEquals(TaskType.REPLACE_ONE, resolved.tasks().getFirst().type());
        assertEquals("番茄炒蛋", resolved.tasks().getFirst().dishHint());
    }

    @Test
    void ambiguousReplaceAsksClarify() {
        UnderstandContext ctx = new UnderstandContext(
                "换一个",
                List.of(),
                List.of(new DishRef(1, "1", "水煮蛋"), new DishRef(2, "2", "番茄炒蛋")),
                "",
                "RECOMMENDED",
                LongTermMemory.empty());
        TurnIntent intent = TurnIntent.ofTasks(List.of(DialogueTask.replaceOne("")));
        TurnIntent resolved = resolver.resolve(intent, ctx, List.of(0));
        assertTrue(resolved.tasks().isEmpty());
        assertTrue(resolved.needsClarify());
        assertEquals("DISH_REF", resolved.ambiguities().getFirst().code());
    }
}
