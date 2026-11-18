package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.dialogue.AppliedMemoryWrite;
import com.moonligh.nutritionist.domain.dialogue.MemoryEvent;
import com.moonligh.nutritionist.domain.dialogue.MemoryExtraction;
import com.moonligh.nutritionist.domain.dialogue.MemoryQuery;
import com.moonligh.nutritionist.domain.dialogue.MemoryQueryType;
import com.moonligh.nutritionist.domain.dialogue.PreferencePolarity;
import com.moonligh.nutritionist.domain.dialogue.PreferenceSnapshot;
import com.moonligh.nutritionist.domain.dialogue.PreferenceStrength;
import com.moonligh.nutritionist.domain.dialogue.SubjectType;

class PreferenceStoreTest {

    private final PreferenceStore store = new PreferenceStore();

    @Test
    void avoidThenLikeThenNeutralKeepsSingleCurrentFood() {
        String owner = "p1";
        commit(owner, MemoryEvent.assertFood(PreferencePolarity.AVOID, PreferenceStrength.MODERATE, "海带", "不喜欢海带"));
        assertEquals(List.of("海带"), store.snapshot(owner).avoidFoods());

        commit(owner, MemoryEvent.assertFood(PreferencePolarity.LIKE, PreferenceStrength.STRONG, "海带", "现在喜欢海带"));
        PreferenceSnapshot liked = store.snapshot(owner);
        assertEquals(List.of(), liked.avoidFoods());
        assertEquals(List.of("海带"), liked.preferLikes());
        assertEquals(1, liked.current().stream().filter(i -> i.subject().equals("海带")).count());

        commit(owner, MemoryEvent.retractFood("海带", "无所谓了"));
        PreferenceSnapshot neutral = store.snapshot(owner);
        assertEquals(List.of(), neutral.avoidFoods());
        assertEquals(List.of(), neutral.preferLikes());
        assertTrue(neutral.history().size() >= 3);
    }

    @Test
    void absoluteAvoidAppearsInHardFilterProjection() {
        commit("p2", MemoryEvent.assertFood(
                PreferencePolarity.AVOID, PreferenceStrength.ABSOLUTE, "香菜", "绝对不吃香菜"));
        assertEquals(List.of("香菜"), store.snapshot("p2").absoluteAvoidFoods());
        assertEquals(List.of("香菜"), store.snapshot("p2").avoidFoods());
    }

    @Test
    void sameEventIdIsIdempotent() {
        MemoryEvent event = MemoryEvent.assertFood(
                PreferencePolarity.AVOID, PreferenceStrength.MODERATE, "洋葱", "不吃洋葱");
        MemoryExtraction extraction = new MemoryExtraction(
                List.of(event), List.of(), List.of(), List.of(), "", "evt-1");
        AppliedMemoryWrite first = store.commit("p3", extraction);
        AppliedMemoryWrite second = store.commit("p3", extraction);
        assertTrue(first.committed());
        assertTrue(second.committed());
        assertEquals(1, store.snapshot("p3").history().size());
        assertEquals(first.preferenceEpoch(), second.preferenceEpoch());
    }

    @Test
    void cuisineAndTagUseSubjectTypeNotPolarity() {
        commit("p4", new MemoryEvent(
                com.moonligh.nutritionist.domain.dialogue.MemoryOp.ASSERT,
                "川菜",
                SubjectType.CUISINE,
                PreferencePolarity.LIKE,
                PreferenceStrength.MODERATE,
                com.moonligh.nutritionist.domain.dialogue.PreferenceScope.PERMANENT,
                null, null, "", "", 1.0, "喜欢川菜"));
        commit("p4", new MemoryEvent(
                com.moonligh.nutritionist.domain.dialogue.MemoryOp.ASSERT,
                "减肥",
                SubjectType.TAG,
                PreferencePolarity.LIKE,
                PreferenceStrength.MODERATE,
                com.moonligh.nutritionist.domain.dialogue.PreferenceScope.PERMANENT,
                null, null, "", "", 1.0, "减肥"));
        PreferenceSnapshot snap = store.snapshot("p4");
        assertEquals(List.of("川菜"), snap.preferCuisines());
        assertEquals(List.of("减肥"), snap.preferTags());
    }

    @Test
    void pastAvoidAndAvoidThenLikeQueries() {
        commit("p5", MemoryEvent.assertFood(PreferencePolarity.AVOID, PreferenceStrength.MODERATE, "海带", "以前不喜欢"));
        commit("p5", MemoryEvent.assertFood(PreferencePolarity.LIKE, PreferenceStrength.MODERATE, "海带", "现在喜欢"));
        assertEquals(List.of("海带"), store.answer("p5", new MemoryQuery(MemoryQueryType.PAST_AVOID, "")));
        assertEquals(List.of("海带"), store.answer("p5", new MemoryQuery(MemoryQueryType.AVOID_THEN_LIKE, "")));
        assertEquals(List.of(), store.answer("p5", new MemoryQuery(MemoryQueryType.CURRENT_AVOID, "")));
    }

    private void commit(String owner, MemoryEvent event) {
        store.commit(owner, new MemoryExtraction(List.of(event), List.of(), List.of(), List.of(), "", ""));
    }
}
