package com.moonligh.nutritionist.infrastructure.clinicalrecord;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.service.ClinicalRecordDirectory;

@Component
public class HttpClinicalRecordDirectory implements ClinicalRecordDirectory {

    private final String baseUrl;
    private final String token;
    private final ObjectMapper mapper;
    private final HttpClient http = HttpClient.newBuilder().connectTimeout(Duration.ofSeconds(2)).build();

    public HttpClinicalRecordDirectory(
            @Value("${nutritionist.clinical-record.base-url:}") String baseUrl,
            @Value("${nutritionist.clinical-record.token:}") String token,
            ObjectMapper mapper) {
        this.baseUrl = baseUrl == null ? "" : baseUrl.replaceAll("/$", "");
        this.token = token == null ? "" : token;
        this.mapper = mapper;
    }

    @Override
    public boolean enabled() {
        return !baseUrl.isBlank();
    }

    @Override
    public boolean hasPresentDiagnosis(String patientId, String code) {
        return presentDiagnosisCodes(patientId).contains(code);
    }

    @Override
    public java.util.List<String> presentDiagnosisCodes(String patientId) {
        java.util.List<String> codes = new java.util.ArrayList<>();
        for (JsonNode item : snapshot(patientId).path("diagnoses")) {
            if ("PRESENT".equals(item.path("statement").asText()) && !item.path("code").asText().isBlank()) {
                codes.add(item.path("code").asText());
            }
        }
        return java.util.List.copyOf(codes);
    }

    @Override
    public void declarePresentDiagnosis(String patientId, String code) {
        String commandId = "nutritionist:" + patientId + ":" + code + ":PRESENT";
        String body = """
                {"commandId":"%s","patientId":"%s","facts":[{"factType":"DIAGNOSIS","statement":"PRESENT","author":"PATIENT","code":"%s","displayName":"%s"}]}
                """.formatted(commandId, patientId, code, code);
        exchange("POST", baseUrl + "/internal/facts", body);
    }

    private JsonNode snapshot(String patientId) {
        return exchange("GET", baseUrl + "/internal/patients/" + patientId + "/snapshot", null);
    }

    private JsonNode exchange(String method, String url, String body) {
        try {
            HttpRequest.Builder builder = HttpRequest.newBuilder(URI.create(url)).timeout(Duration.ofSeconds(2));
            if (!token.isBlank()) {
                builder.header("X-Internal-Token", token);
            }
            if ("POST".equals(method)) {
                builder.header("Content-Type", "application/json")
                        .POST(HttpRequest.BodyPublishers.ofString(body));
            } else {
                builder.GET();
            }
            HttpResponse<String> response = http.send(builder.build(), HttpResponse.BodyHandlers.ofString());
            if (response.statusCode() < 200 || response.statusCode() >= 300) {
                throw new BusinessException(ErrorCode.CHART_UNAVAILABLE);
            }
            JsonNode root = mapper.readTree(response.body());
            if (root.path("code").asInt() != 200) {
                throw new BusinessException(ErrorCode.CHART_UNAVAILABLE);
            }
            return root.path("data");
        } catch (BusinessException error) {
            throw error;
        } catch (Exception error) {
            throw new BusinessException(ErrorCode.CHART_UNAVAILABLE);
        }
    }
}
