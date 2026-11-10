package com.moonligh.nutritionist.service;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.common.BusinessException;
import com.moonligh.nutritionist.common.ErrorCode;
import com.moonligh.nutritionist.domain.profile.PatientRef;
import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryPatientBindingStore;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

class PatientBindingServiceTest {

    private PatientBindingService service;
    private FakePatientGateway gateway;

    @BeforeEach
    void setUp() {
        gateway = new FakePatientGateway();
        gateway.put("acc-1", "pat-1", "v1");
        service = new PatientBindingService(new InMemoryPatientBindingStore(), gateway);
    }

    @Test
    void unboundPatientCannotWriteBusiness() {
        BusinessException ex = assertThrows(
                BusinessException.class,
                () -> service.requireBoundPatient("acc-1", "pat-1", "v1"));
        assertEquals(ErrorCode.PATIENT_NOT_BOUND, ex.getErrorCode());
    }

    @Test
    void patientVersionConflictWhenGatewayVersionChanged() {
        service.bind("acc-1", "pat-1", "v1");
        gateway.put("acc-1", "pat-1", "v2");

        BusinessException ex = assertThrows(
                BusinessException.class,
                () -> service.requireBoundPatient("acc-1", "pat-1", "v1"));
        assertEquals(ErrorCode.PATIENT_VERSION_CONFLICT, ex.getErrorCode());
    }

    @Test
    void boundPatientWithMatchingVersionPasses() {
        service.bind("acc-1", "pat-1", "v1");
        PatientRef ref = service.requireBoundPatient("acc-1", "pat-1", "v1");
        assertEquals("pat-1", ref.patientId());
        assertEquals("v1", ref.patientVersion());
    }
}
