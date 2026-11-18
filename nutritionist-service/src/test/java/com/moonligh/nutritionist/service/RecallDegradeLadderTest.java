package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.config.RecallDegradeProperties;
import com.moonligh.nutritionist.domain.recommend.RecallContext;
import com.moonligh.nutritionist.domain.recommend.RecallEmptyReason;

class RecallDegradeLadderTest {

    @Test
    void disabledBlocksAllDegrade() {
        RecallDegradeLadder ladder = ladder(false);
        RecallContext ctx = new RecallContext("川菜", "", List.of(), List.of(), "");
        assertFalse(ladder.allowDegrade(ctx, RecallEmptyReason.NO_FEASIBLE_MAINS));
    }

    @Test
    void namedCuisineScalarEmptyNeverDegrades() {
        RecallDegradeLadder ladder = ladder(true);
        RecallContext ctx = new RecallContext("XYZ菜", "", List.of(), List.of(), "");
        assertFalse(ladder.allowDegrade(ctx, RecallEmptyReason.SCALAR_EMPTY));
    }

    @Test
    void namedCuisineNoFeasibleMainsMayDegradeWhenEnabled() {
        RecallDegradeLadder ladder = ladder(true);
        RecallContext ctx = new RecallContext("川菜", "", List.of(), List.of(), "");
        assertTrue(ladder.allowDegrade(ctx, RecallEmptyReason.NO_FEASIBLE_MAINS));
        RecallContext step1 = ladder.next(ctx, 0);
        assertEquals("川菜", step1.cuisine());
        RecallContext step2 = ladder.next(step1, 1);
        assertEquals("", step2.cuisine());
    }

    private static RecallDegradeLadder ladder(boolean enabled) {
        RecallDegradeProperties props = new RecallDegradeProperties();
        props.setEnabled(enabled);
        return new RecallDegradeLadder(props);
    }
}
