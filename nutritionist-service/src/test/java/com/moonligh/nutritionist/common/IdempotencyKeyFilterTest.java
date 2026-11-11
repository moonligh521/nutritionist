package com.moonligh.nutritionist.common;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moonligh.consult.framework.GlobalExceptionHandler;
import com.moonligh.consult.framework.Result;
import com.moonligh.consult.framework.TraceIdFilter;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

class IdempotencyKeyFilterTest {

    private MockMvc mockMvc;

    @BeforeEach
    void setUp() {
        mockMvc = MockMvcBuilders.standaloneSetup(new ProbeController())
                .addFilters(new TraceIdFilter(), new IdempotencyKeyFilter())
                .setControllerAdvice(new GlobalExceptionHandler())
                .build();
    }

    @Test
    void writeWithoutIdempotencyKeyIsRejected() throws Exception {
        mockMvc.perform(post("/api/nutrition/profile").contentType(MediaType.APPLICATION_JSON).content("{}"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(1002));
    }

    @Test
    void writeWithIdempotencyKeyPassesFilter() throws Exception {
        mockMvc.perform(post("/api/nutrition/profile")
                        .header(IdempotencyKeyFilter.HEADER, "k-1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{}"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(200));
    }

    @RestController
    static class ProbeController {

        @PostMapping("/api/nutrition/profile")
        Result<String> profile() {
            return Result.ok("ok");
        }
    }
}
