package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Optional;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.dialogue.MemoryExtraction;
import com.moonligh.nutritionist.domain.dialogue.MemoryQueryType;
import com.moonligh.nutritionist.domain.dialogue.PreferencePolarity;
import com.moonligh.nutritionist.domain.dialogue.PreferenceStrength;

class MemoryExtractorTest {

    @Test
    void fallbackExtractsAvoidLikeAndQuery() {
        MemoryExtractor extractor = new MemoryExtractor(null);

        MemoryExtraction avoid = extractor.extract("我不吃海带帮推荐");
        assertEquals(1, avoid.events().size());
        assertEquals("海带", avoid.events().getFirst().subject());
        assertEquals(PreferencePolarity.AVOID, avoid.events().getFirst().polarity());

        MemoryExtraction dislike = extractor.extract("我不喜欢洋葱");
        assertEquals(1, dislike.events().size());
        assertEquals("洋葱", dislike.events().getFirst().subject());
        assertEquals(PreferencePolarity.AVOID, dislike.events().getFirst().polarity());

        MemoryExtraction celery = extractor.extractRulesOnly("我不喜欢芹菜");
        assertEquals("芹菜", celery.events().getFirst().subject());
        assertEquals(PreferencePolarity.AVOID, celery.events().getFirst().polarity());

        MemoryExtraction like = extractor.extract("我最喜欢娃娃菜");
        assertEquals("娃娃菜", like.events().getFirst().subject());
        assertEquals(PreferencePolarity.LIKE, like.events().getFirst().polarity());

        MemoryExtraction query = extractor.extract("我以前不喜欢什么");
        assertFalse(query.queries().isEmpty());
        assertEquals(MemoryQueryType.PAST_AVOID, query.queries().getFirst().type());
    }

    @Test
    void absoluteStrengthFromStrongLanguage() {
        MemoryExtraction extracted = new MemoryExtractor(null).extract("绝对不吃香菜");
        assertEquals(PreferenceStrength.ABSOLUTE, extracted.events().getFirst().strength());
    }

    @Test
    void modelJsonWinsOverFallback() {
        MemoryExtractor extractor = new MemoryExtractor(prompt -> Optional.of("""
                {"events":[{"op":"ASSERT","subject":"洋葱","subjectType":"FOOD","polarity":"AVOID",
                "strength":"MODERATE","scope":"PERMANENT","evidence":"不喜欢洋葱","confidence":0.9}],
                "queries":[],"turnOnlyHints":[],"allergySuspects":[],"eventId":"e1"}
                """));
        MemoryExtraction extracted = extractor.extract("随便说点什么");
        assertEquals("洋葱", extracted.events().getFirst().subject());
        assertEquals("e1", extracted.eventId());
        assertTrue(extracted.hasWork());
    }
}
