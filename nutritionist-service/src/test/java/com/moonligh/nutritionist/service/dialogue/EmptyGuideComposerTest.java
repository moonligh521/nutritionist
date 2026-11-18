package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.recommend.RecallEmptyReason;

class EmptyGuideComposerTest {

    private final EmptyGuideComposer composer = new EmptyGuideComposer();

    @Test
    void noFeasibleWithCuisineSuggestsDropCuisine() {
        EmptyGuideComposer.Guide guide = composer.compose(
                RecallEmptyReason.NO_FEASIBLE_MAINS, true, false);
        assertTrue(guide.actions().contains("DROP_CUISINE"));
        assertTrue(guide.actions().contains("ADD_FOODS"));
        assertTrue(guide.text().contains("不限菜系"));
    }
}
