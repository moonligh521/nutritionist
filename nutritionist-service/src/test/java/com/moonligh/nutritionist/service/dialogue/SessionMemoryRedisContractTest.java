package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;

import org.junit.jupiter.api.Test;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.nutritionist.domain.dialogue.LongTermMemory;
import com.moonligh.nutritionist.domain.dialogue.SessionSnapshot;

class SessionMemoryRedisContractTest {

    @Test
    void longTermEmptyGetterIsNotPersistedAndLegacyEmptyFieldIgnored() throws Exception {
        ObjectMapper json = new ObjectMapper()
                .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        LongTermMemory empty = LongTermMemory.empty();
        assertFalse(json.writeValueAsString(empty).contains("\"empty\""));

        SessionSnapshot legacy = json.readValue(
                """
                {"sessionId":"s1","patientId":"","longTerm":{"version":"","conditions":[],"allergens":[],\
                "medications":[],"measurementStopsPlanning":false,"tasteItems":[],"preferenceEpoch":0,"empty":true},\
                "foodIds":[],"missing":[],"corrections":[],"excludedDishIds":[],"dishSlots":[],\
                "turnHints":"","revision":0,"preferenceEpoch":0}
                """,
                SessionSnapshot.class);
        assertEquals("", legacy.longTerm().version());
        assertEquals(0L, legacy.longTerm().preferenceEpoch());
    }
}
