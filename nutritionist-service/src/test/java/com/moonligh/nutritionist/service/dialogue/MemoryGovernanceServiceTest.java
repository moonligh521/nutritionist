package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.ObjectProvider;

import com.moonligh.nutritionist.domain.dialogue.AppliedMemoryWrite;
import com.moonligh.nutritionist.domain.dialogue.MemoryEvent;
import com.moonligh.nutritionist.domain.dialogue.MemoryExtraction;
import com.moonligh.nutritionist.domain.dialogue.PreferencePolarity;
import com.moonligh.nutritionist.domain.dialogue.PreferenceStrength;
import com.moonligh.nutritionist.infrastructure.persistence.DietPreferenceMapper;

class MemoryGovernanceServiceTest {

    @Test
    void mergeAndRetractRoundTrip() {
        PreferenceStore store = new PreferenceStore();
        PreferencePersistence persistence = new PreferencePersistence(emptyMapper());
        SessionMemoryStore sessions = new SessionMemoryStore();
        MemoryGovernanceService governance = new MemoryGovernanceService(
                store, persistence, sessions, new LongTermMemoryLoader(null, store));

        store.commit(
                "session:s1",
                new MemoryExtraction(
                        List.of(MemoryEvent.assertFood(
                                PreferencePolarity.AVOID, PreferenceStrength.MODERATE, "海带", "不吃")),
                        List.of(),
                        List.of(),
                        List.of(),
                        "",
                        "e-merge-1"));
        sessions.getOrCreate("s1");

        AppliedMemoryWrite merged = governance.mergeSessionToPatient("s1", "p1", "actor");
        assertTrue(merged.committed());
        assertEquals(List.of("海带"), store.snapshot("p1").avoidFoods());

        AppliedMemoryWrite retracted = governance.retract("p1", "海带", "我没说过");
        assertTrue(retracted.committed());
        assertEquals(List.of(), store.snapshot("p1").avoidFoods());
    }

    private static ObjectProvider<DietPreferenceMapper> emptyMapper() {
        return new ObjectProvider<>() {
            @Override
            public DietPreferenceMapper getObject() {
                return null;
            }

            @Override
            public DietPreferenceMapper getObject(Object... args) {
                return null;
            }

            @Override
            public DietPreferenceMapper getIfAvailable() {
                return null;
            }

            @Override
            public DietPreferenceMapper getIfUnique() {
                return null;
            }
        };
    }
}
