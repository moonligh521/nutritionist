package com.moonligh.nutritionist.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

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
import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryIdempotencyStore;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryPatientBindingStore;
import com.moonligh.nutritionist.service.IdempotencyService;
import com.moonligh.nutritionist.service.PatientBindingService;

class PatientBindingControllerTest {

    private MockMvc mockMvc;
    private FakePatientGateway gateway;

    @BeforeEach
    void setUp() {
        gateway = new FakePatientGateway();
        gateway.put("acc-1", "pat-1", "v1");
        ObjectMapper mapper = new ObjectMapper().registerModule(new JavaTimeModule());
        PatientBindingController controller = new PatientBindingController(
                new PatientBindingService(new InMemoryPatientBindingStore(), gateway),
                new IdempotencyService(new InMemoryIdempotencyStore()),
                mapper);
        mockMvc = MockMvcBuilders.standaloneSetup(controller)
                .addFilters(new TraceIdFilter(), new IdempotencyKeyFilter())
                .setControllerAdvice(new GlobalExceptionHandler())
                .build();
    }


    @Test
    void bindRequiresIdempotencyKey() throws Exception {
        mockMvc.perform(post("/api/nutrition/patients/bind")
                        .header(AuthTokens.ACCOUNT_HEADER, "acc-1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"patientId\":\"pat-1\",\"patientVersion\":\"v1\"}"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(1002));
    }

    @Test
    void bindSucceedsAndReplaysSameKey() throws Exception {
        String body = "{\"patientId\":\"pat-1\",\"patientVersion\":\"v1\"}";
        mockMvc.perform(post("/api/nutrition/patients/bind")
                        .header(AuthTokens.ACCOUNT_HEADER, "acc-1")
                        .header(IdempotencyKeyFilter.HEADER, "k-bind-1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(body))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(200))
                .andExpect(jsonPath("$.data.patientId").value("pat-1"));

        mockMvc.perform(post("/api/nutrition/patients/bind")
                        .header(AuthTokens.ACCOUNT_HEADER, "acc-1")
                        .header(IdempotencyKeyFilter.HEADER, "k-bind-1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(body))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(200))
                .andExpect(jsonPath("$.data.patientVersion").value("v1"));
    }

    @Test
    void sameKeyDifferentBodyConflicts() throws Exception {
        mockMvc.perform(post("/api/nutrition/patients/bind")
                        .header(AuthTokens.ACCOUNT_HEADER, "acc-1")
                        .header(IdempotencyKeyFilter.HEADER, "k-bind-2")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"patientId\":\"pat-1\",\"patientVersion\":\"v1\"}"))
                .andExpect(jsonPath("$.code").value(200));

        mockMvc.perform(post("/api/nutrition/patients/bind")
                        .header(AuthTokens.ACCOUNT_HEADER, "acc-1")
                        .header(IdempotencyKeyFilter.HEADER, "k-bind-2")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"patientId\":\"pat-1\",\"patientVersion\":\"v2\"}"))
                .andExpect(jsonPath("$.code").value(2604));
    }
}
