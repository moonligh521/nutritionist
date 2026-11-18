package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.dialogue.MemoryExtraction;
import com.moonligh.nutritionist.domain.dialogue.PreferencePolarity;
import com.moonligh.nutritionist.domain.dialogue.PreferenceStrength;
import com.moonligh.nutritionist.domain.dialogue.SubjectType;

class MemoryExtractorAbsoluteAvoidTest {

    @Test
    void absoluteCannotEatUsesRulesWithoutModel() {
        MemoryExtractor extractor = new MemoryExtractor(prompt -> {
            throw new AssertionError("model should not be called for absolute avoid template");
        });
        MemoryExtraction extraction = extractor.extract("我绝对不能吃香菜");
        assertTrue(extraction.hasWork());
        assertEquals(1, extraction.events().size());
        assertEquals("香菜", extraction.events().getFirst().subject());
        assertEquals(SubjectType.FOOD, extraction.events().getFirst().subjectType());
        assertEquals(PreferencePolarity.AVOID, extraction.events().getFirst().polarity());
        assertEquals(PreferenceStrength.ABSOLUTE, extraction.events().getFirst().strength());
    }
}
