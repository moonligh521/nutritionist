package com.moonligh.nutritionist.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.moonligh.consult.framework.GlobalExceptionHandler;
import com.moonligh.consult.framework.TraceIdFilter;
import com.moonligh.consult.security.AuthTokens;
import com.moonligh.nutritionist.common.IdempotencyKeyFilter;
import com.moonligh.nutritionist.domain.profile.InMemoryProfileRepository;
import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryIdempotencyStore;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryPatientBindingStore;
import com.moonligh.nutritionist.service.IdempotencyService;
import com.moonligh.nutritionist.service.PatientBindingService;
import com.moonligh.nutritionist.service.ProfileService;

class ProfileControllerTest {

    private MockMvc mockMvc;

    @BeforeEach
    void setUp() {
        FakePatientGateway gateway = new FakePatientGateway();
        gateway.put("acc-1", "pat-1", "pv1");
        InMemoryPatientBindingStore bindingStore = new InMemoryPatientBindingStore();
        PatientBindingService bindings = new PatientBindingService(bindingStore, gateway);
        bindings.bind("acc-1", "pat-1", "pv1");
        ObjectMapper mapper = new ObjectMapper().registerModule(new JavaTimeModule());
        ProfileController controller = new ProfileController(
                new ProfileService(new InMemoryProfileRepository(), bindings),
                new IdempotencyService(new InMemoryIdempotencyStore()),
                mapper);
        mockMvc = MockMvcBuilders.standaloneSetup(controller)
                .addFilters(new TraceIdFilter(), new IdempotencyKeyFilter())
                .setControllerAdvice(new GlobalExceptionHandler())
                .build();
    }

    @Test
    void profileWriteUsesAccountAndIdempotency() throws Exception {
        String body = """
                {
                  "patientId":"pat-1",
                  "patientVersion":"pv1",
                  "sexCode":1,
                  "birthDate":"1990-01-01",
                  "heightCm":175,
                  "timezone":"Asia/Shanghai",
                  "activityLevelCode":2,
                  "goalTypeCode":1
                }
                """;

        mockMvc.perform(put("/api/nutrition/profile")
                        .header(AuthTokens.ACCOUNT_HEADER, "acc-1")
                        .header(IdempotencyKeyFilter.HEADER, "profile-key-1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(body))
                .andExpect(jsonPath("$.code").value(200))
                .andExpect(jsonPath("$.data.profileVersion").value("1"));

        mockMvc.perform(put("/api/nutrition/profile")
                        .header(AuthTokens.ACCOUNT_HEADER, "acc-1")
                        .header(IdempotencyKeyFilter.HEADER, "profile-key-1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(body))
                .andExpect(jsonPath("$.code").value(200))
                .andExpect(jsonPath("$.data.profileVersion").value("1"));
    }
}
