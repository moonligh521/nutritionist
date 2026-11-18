package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.dialogue.AppliedMemoryWrite;
import com.moonligh.nutritionist.domain.dialogue.MemoryEvent;
import com.moonligh.nutritionist.domain.dialogue.MemoryExtraction;
import com.moonligh.nutritionist.domain.dialogue.PreferencePolarity;
import com.moonligh.nutritionist.domain.dialogue.PreferenceStrength;

class PreferencePersistenceContractTest {

    @Test
    void dbFailureDoesNotMutateLocalProjection() {
        PreferencePersistence persistence = mock(PreferencePersistence.class);
        when(persistence.available()).thenReturn(true);
        when(persistence.eventSeen(anyString())).thenReturn(false);
        when(persistence.loadFacts(anyString())).thenReturn(List.of());
        doThrow(new RuntimeException("db down"))
                .when(persistence)
                .persistCommit(anyString(), any(), anyLong());

        MemoryMetrics metrics = new MemoryMetrics();
        PreferenceStore store = new PreferenceStore(persistence, false, metrics);
        AppliedMemoryWrite write = store.commit(
                "p-db",
                new MemoryExtraction(
                        List.of(MemoryEvent.assertFood(
                                PreferencePolarity.AVOID, PreferenceStrength.MODERATE, "海带", "不喜欢")),
                        List.of(),
                        List.of(),
                        List.of(),
                        "",
                        "evt-fail"));

        assertFalse(write.committed());
        assertEquals(List.of(), store.snapshot("p-db").avoidFoods());
        assertEquals(1, metrics.snapshot().writeFails());
        assertTrue(metrics.snapshot().lastWriteError().contains("db down"));
    }

    @Test
    void unavailablePersistenceMarksWriteFail() {
        PreferencePersistence persistence = mock(PreferencePersistence.class);
        when(persistence.available()).thenReturn(false);
        MemoryMetrics metrics = new MemoryMetrics();
        PreferenceStore store = new PreferenceStore(persistence, false, metrics);
        AppliedMemoryWrite write = store.commit(
                "p-na",
                new MemoryExtraction(
                        List.of(MemoryEvent.assertFood(
                                PreferencePolarity.AVOID, PreferenceStrength.ABSOLUTE, "香菜", "绝对不")),
                        List.of(),
                        List.of(),
                        List.of(),
                        "",
                        "evt-na"));
        assertFalse(write.committed());
        assertEquals(1, metrics.snapshot().writeFails());
        assertTrue(metrics.snapshot().lastWriteError().contains("unavailable"));
    }

    @Test
    void dbSuccessHydratesAvoidFoods() {
        PreferencePersistence persistence = mock(PreferencePersistence.class);
        when(persistence.available()).thenReturn(true);
        when(persistence.eventSeen(anyString())).thenReturn(false);
        when(persistence.loadFacts(anyString())).thenReturn(List.of());
        when(persistence.persistCommit(anyString(), any(), anyLong())).thenReturn(true);

        PreferenceStore store = new PreferenceStore(persistence, false);
        AppliedMemoryWrite write = store.commit(
                "p-ok",
                new MemoryExtraction(
                        List.of(MemoryEvent.assertFood(
                                PreferencePolarity.AVOID, PreferenceStrength.ABSOLUTE, "香菜", "绝对不")),
                        List.of(),
                        List.of(),
                        List.of(),
                        "",
                        "evt-ok"));

        assertTrue(write.committed());
        assertEquals(List.of("香菜"), store.snapshot("p-ok").avoidFoods());
        assertEquals(List.of("香菜"), store.snapshot("p-ok").absoluteAvoidFoods());
    }

    @Test
    void detailEventIdFitsLegacyVarchar64() {
        String factId = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee";
        String eventId = PreferencePersistence.detailEventId(factId);
        assertEquals(factId, eventId);
        assertTrue(eventId.length() <= 64);
        // 旧实现 uuid:uuid = 73，会触发 Data truncation
        assertTrue((factId + ":" + factId).length() > 64);
    }

    @Test
    void clientMergeUsesModerateNotAbsolute() {
        PreferenceStore store = new PreferenceStore();
        store.merge("p-client", List.of("洋葱"), List.of(), List.of(), List.of());
        assertEquals(List.of("洋葱"), store.snapshot("p-client").avoidFoods());
        assertEquals(List.of(), store.snapshot("p-client").absoluteAvoidFoods());
    }
}
