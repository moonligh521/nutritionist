package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.math.BigDecimal;
import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.UpsertProfileReq;
import com.moonligh.nutritionist.domain.profile.InMemoryProfileRepository;
import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryPatientBindingStore;

class ProfileServiceTest {

    private ProfileService service;

    @BeforeEach
    void setUp() {
        FakePatientGateway gateway = new FakePatientGateway();
        gateway.put("acc-1", "pat-1", "pv1");
        InMemoryPatientBindingStore bindings = new InMemoryPatientBindingStore();
        new PatientBindingService(bindings, gateway).bind("acc-1", "pat-1", "pv1");
        service = new ProfileService(
                new InMemoryProfileRepository(),
                new PatientBindingService(bindings, gateway));
    }

    @Test
    void createsAndUpdatesProfileWithVersion() {
        var created = service.upsert("acc-1", request(null, "pv1"));
        assertEquals("1", created.profileVersion());

        var updated = service.upsert("acc-1", request("1", "pv1"));
        assertEquals("2", updated.profileVersion());
        assertEquals(created.profileId(), updated.profileId());
    }

    @Test
    void rejectsStaleProfileVersion() {
        service.upsert("acc-1", request(null, "pv1"));

        BusinessException error = assertThrows(
                BusinessException.class,
                () -> service.upsert("acc-1", request("0", "pv1")));

        assertEquals(ErrorCode.PROFILE_VERSION_CONFLICT, error.getErrorCode());
    }

    @Test
    void rejectsChangedPatientVersion() {
        BusinessException error = assertThrows(
                BusinessException.class,
                () -> service.upsert("acc-1", request(null, "pv2")));

        assertEquals(ErrorCode.PATIENT_VERSION_CONFLICT, error.getErrorCode());
    }

    private static UpsertProfileReq request(String profileVersion, String patientVersion) {
        return new UpsertProfileReq(
                "pat-1",
                patientVersion,
                profileVersion,
                1,
                LocalDate.of(1990, 1, 1),
                new BigDecimal("175"),
                "Asia/Shanghai",
                2,
                1);
    }
}
