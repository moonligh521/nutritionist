package com.moonligh.nutritionist.domain.target;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;

import org.junit.jupiter.api.Test;

class ChineseDri2023EnergyTest {

    @Test
    void lightActivityManAged18To29UsesPublishedMegajoules() {
        assertEquals(new BigDecimal("2151"), ChineseDri2023Energy.kcal(1, 25, 1).orElseThrow());
    }

    @Test
    void laterAdultBandsUseTheirOwnRows() {
        assertEquals(new BigDecimal("2051"), ChineseDri2023Energy.kcal(1, 40, 1).orElseThrow());
        assertEquals(new BigDecimal("1950"), ChineseDri2023Energy.kcal(1, 64, 1).orElseThrow());
        assertEquals(new BigDecimal("1599"), ChineseDri2023Energy.kcal(2, 50, 1).orElseThrow());
    }

    @Test
    void olderAdultsUsePublishedRowsAndSkipUnpublishedHighActivity() {
        assertEquals(new BigDecimal("1900"), ChineseDri2023Energy.kcal(1, 70, 1).orElseThrow());
        assertEquals(new BigDecimal("1501"), ChineseDri2023Energy.kcal(2, 80, 1).orElseThrow());
        assertTrue(ChineseDri2023Energy.kcal(1, 70, 3).isEmpty());
    }

    @Test
    void proteinRecommendationFollowsTheSameAgeBands() {
        assertEquals(new BigDecimal("65"), ChineseDri2023Energy.proteinGrams(1, 25).orElseThrow());
        assertEquals(new BigDecimal("55"), ChineseDri2023Energy.proteinGrams(2, 40).orElseThrow());
        assertEquals(new BigDecimal("72"), ChineseDri2023Energy.proteinGrams(1, 70).orElseThrow());
        assertTrue(ChineseDri2023Energy.proteinGrams(2, 17).isEmpty());
    }

    @Test
    void fatRangeUsesTwentyToThirtyPercentOfEnergy() {
        assertEquals(new BigDecimal("47.8"), ChineseDri2023Energy.fatMinimumGrams(new BigDecimal("2151")));
        assertEquals(new BigDecimal("71.7"), ChineseDri2023Energy.fatMaximumGrams(new BigDecimal("2151")));
    }

    @Test
    void agesOutsideThePublishedTableAreNotEstimated() {
        assertTrue(ChineseDri2023Energy.kcal(2, 17, 1).isEmpty());
    }
}
