package com.moonligh.nutritionist.domain.safety;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

import java.math.BigDecimal;

import org.junit.jupiter.api.Test;

class ObesityDietInitializationTest {

    @Test
    void publishedMealSharesReserveTheRestOfTheDay() {
        assertEquals(30, ObesityDietInitialization.publishedSharePercent(1));
        assertEquals(40, ObesityDietInitialization.publishedSharePercent(2));
        assertEquals(30, ObesityDietInitialization.publishedSharePercent(3));
        assertNull(ObesityDietInitialization.publishedSharePercent(9));
    }

    @Test
    void overweightAndObesityUseThePublishedFractionsOfRequirement() {
        assertEquals(new BigDecimal("1700"), ObesityDietInitialization.energyCeiling(new BigDecimal("2000"), false));
        assertEquals(new BigDecimal("1600"), ObesityDietInitialization.energyCeiling(new BigDecimal("2000"), true));
    }
}
