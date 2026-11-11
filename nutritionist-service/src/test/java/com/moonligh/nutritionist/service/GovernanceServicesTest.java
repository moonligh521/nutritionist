package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.time.Instant;

import org.junit.jupiter.api.Test;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;

class GovernanceServicesTest {

    @Test
    void professionalTargetRejectsPatientRoleAndExpiredTarget() {
        ProfessionalTargetService service = new ProfessionalTargetService();
        var request = new ProfessionalTargetService.CreateRequest(
                "pat-1", "ENERGY", new BigDecimal("1200"), new BigDecimal("1500"),
                Instant.now().minusSeconds(60), Instant.now().plusSeconds(3600));

        assertThrows(BusinessException.class, () -> service.create("patient", request));
        var target = service.create("nutritionist_pro", request);
        assertTrue(service.activeFor("pat-1", Instant.now()).isPresent());
        assertEquals(target.targetId(), service.activeFor("pat-1", Instant.now()).orElseThrow().targetId());
    }

    @Test
    void killSwitchStopsMatchingCapabilityAndAppendsAudit() {
        KillSwitchService service = new KillSwitchService();

        service.activate("recommendation", "diabetes", "on-call-1", "incident");

        BusinessException error = assertThrows(
                BusinessException.class, () -> service.requireEnabled("recommendation", "diabetes"));
        assertEquals(ErrorCode.KILL_SWITCH_ACTIVE, error.getErrorCode());
        assertFalse(service.auditEvents().isEmpty());

        service.deactivate("recommendation", "diabetes", "lead-1", "lead-2");
        service.requireEnabled("recommendation", "diabetes");
        assertFalse(service.isActive("recommendation", "diabetes"));
    }
}
