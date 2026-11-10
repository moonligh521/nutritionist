package com.moonligh.nutritionist.infrastructure.identity;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;

import com.moonligh.nutritionist.domain.profile.PatientGateway;
import com.moonligh.nutritionist.domain.profile.PatientSnapshot;

/**
 * 调用挂号 identity 校验患者归属与版本。
 * 当前先留出 HTTP 形状，具体路径随挂号仓契约落地。
 */
@Component
@ConditionalOnProperty(name = "nutritionist.identity.mode", havingValue = "http")
public class HttpPatientGateway implements PatientGateway {

    private final RestClient restClient;

    public HttpPatientGateway(
            RestClient.Builder builder,
            @Value("${nutritionist.identity.base-url:http://127.0.0.1:18081}") String baseUrl) {
        this.restClient = builder.baseUrl(baseUrl).build();
    }

    @Override
    public Optional<PatientSnapshot> findOwnedPatient(String accountId, String patientId) {
        PatientRemoteRes body = restClient
                .get()
                .uri("/internal/patients/{patientId}?accountId={accountId}", patientId, accountId)
                .retrieve()
                .body(PatientRemoteRes.class);
        if (body == null) {
            return Optional.empty();
        }
        return Optional.of(new PatientSnapshot(body.patientId(), body.patientVersion(), body.ownedByAccount()));
    }

    public record PatientRemoteRes(String patientId, String patientVersion, boolean ownedByAccount) {
    }
}
