package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.dialogue.DialogueTask;
import com.moonligh.nutritionist.domain.dialogue.LongTermMemory;
import com.moonligh.nutritionist.domain.dialogue.PreferenceItem;
import com.moonligh.nutritionist.domain.dialogue.PreferencePolarity;
import com.moonligh.nutritionist.domain.dialogue.PreferenceScope;
import com.moonligh.nutritionist.domain.dialogue.PreferenceStrength;
import com.moonligh.nutritionist.domain.dialogue.SubjectType;
import com.moonligh.nutritionist.domain.dialogue.TaskType;
import com.moonligh.nutritionist.domain.dialogue.TurnIntent;
import com.moonligh.nutritionist.domain.recognition.ModelCompletion;

class IntentUnderstanderTest {

    @Test
    void modelTasksWinOverAnyGuessing() {
        ModelCompletion model = prompt -> Optional.of("""
                {"tasks":[
                  {"type":"REPLACE_ONE","dishHint":"番茄炒蛋"},
                  {"type":"ADD_KIND","kind":"汤"}
                ]}
                """);
        IntentUnderstander understander = new IntentUnderstander(model);

        List<DialogueTask> tasks = understander.understand("番茄炒蛋不想吃换一个再加个汤", List.of());

        assertEquals(List.of(TaskType.REPLACE_ONE, TaskType.ADD_KIND), tasks.stream().map(DialogueTask::type).toList());
        assertEquals("番茄炒蛋", tasks.get(0).dishHint());
        assertEquals("汤", tasks.get(1).kind());
    }

    @Test
    void withoutModelSafetyNetRepairsReplaceAndSoupFromOutOfScope() {
        IntentUnderstander understander = new IntentUnderstander(null);

        List<DialogueTask> tasks = understander.understand("番茄炒蛋不想吃换一个再加个汤", List.of());

        assertEquals(List.of(TaskType.REPLACE_ONE, TaskType.ADD_KIND),
                tasks.stream().map(DialogueTask::type).toList());
        assertEquals("番茄炒蛋不想吃", tasks.get(0).dishHint());
        assertEquals("汤", tasks.get(1).kind());
    }

    @Test
    void withoutModelRecommendAskBecomesEmptyRecommend() {
        IntentUnderstander understander = new IntentUnderstander(null);

        List<DialogueTask> tasks = understander.understand("帮我推荐", List.of());

        assertEquals(1, tasks.size());
        assertEquals(TaskType.RECOMMEND, tasks.getFirst().type());
        assertTrue(tasks.getFirst().rawFoods().isEmpty());
    }

    @Test
    void withoutModelUsesExplicitFoodsAsRecommend() {
        IntentUnderstander understander = new IntentUnderstander(null);

        List<DialogueTask> tasks = understander.understand("随便说点什么", List.of("番茄", "鸡蛋"));

        assertEquals(TaskType.RECOMMEND, tasks.getFirst().type());
        assertEquals(List.of("番茄", "鸡蛋"), tasks.getFirst().rawFoods());
    }

    @Test
    void withoutModelGreetsOnShortHello() {
        IntentUnderstander understander = new IntentUnderstander(null);
        assertEquals(TaskType.GREETING, understander.understand("你好", List.of()).getFirst().type());
    }

    @Test
    void invalidModelJsonFallsBackThin() {
        AtomicReference<String> seen = new AtomicReference<>();
        ModelCompletion model = prompt -> {
            seen.set(prompt);
            return Optional.of("不是json");
        };
        IntentUnderstander understander = new IntentUnderstander(model);

        List<DialogueTask> tasks = understander.understand("北京天气咋样", List.of());

        assertTrue(seen.get().contains("理解器"));
        assertEquals(TaskType.OUT_OF_SCOPE, tasks.getFirst().type());
    }

    @Test
    void interpretPromptIncludesPreferenceSnapshotAndParsesConstraints() {
        AtomicReference<String> seen = new AtomicReference<>();
        ModelCompletion model = prompt -> {
            seen.set(prompt);
            return Optional.of("""
                    {"tasks":[{"type":"RECOMMEND","rawFoods":["番茄"]}],
                     "turnConstraints":{"avoidFoods":["香菜"],"absoluteAvoidFoods":["虾"],"cuisine":"川菜","preferTags":["清淡"],"turnHints":["少油"]}}
                    """);
        };
        LongTermMemory prefs = new LongTermMemory(
                "owner:p1",
                List.of("控糖"),
                List.of("花生"),
                List.of(),
                false,
                List.of(new PreferenceItem(
                        "海带",
                        SubjectType.FOOD,
                        PreferencePolarity.AVOID,
                        PreferenceStrength.MODERATE,
                        PreferenceScope.PERMANENT)),
                1L);
        IntentUnderstander understander = new IntentUnderstander(model);

        TurnIntent intent = understander.interpret("少油川菜，别放香菜", List.of("番茄"), prefs, List.of("水煮蛋", "番茄炒蛋"));

        String prompt = seen.get();
        assertTrue(prompt.contains("海带"));
        assertTrue(prompt.contains("控糖"));
        assertTrue(prompt.contains("水煮蛋"));
        assertTrue(prompt.contains("REPLACE_ONE"));
        assertTrue(prompt.contains("再加个汤"));
        assertTrue(prompt.contains("OUT_OF_SCOPE"));
        assertTrue(prompt.indexOf("REPLACE_ONE") < prompt.lastIndexOf("OUT_OF_SCOPE"));
        assertEquals(TaskType.RECOMMEND, intent.tasks().getFirst().type());
        assertEquals(List.of("香菜"), intent.constraints().avoidFoods());
        assertEquals(List.of("虾"), intent.constraints().absoluteAvoidFoods());
        assertEquals("川菜", intent.constraints().cuisine());
    }

    @Test
    void promptCompressesEmptyPrefsAsNone() {
        String prompt = IntentUnderstander.prompt("你好", List.of(), LongTermMemory.empty(), List.of());
        assertTrue(prompt.contains("忌口=无"));
        assertTrue(prompt.contains("当前已荐菜=无"));
    }
}
