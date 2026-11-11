package com.moonligh.nutritionist.infrastructure.identity;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;

import com.moonligh.consult.framework.Result;
import com.moonligh.consult.security.AuthTokens;
import com.moonligh.nutritionist.domain.profile.PatientGateway;
import com.moonligh.nutritionist.domain.profile.PatientSnapshot;

/**
 * 调用挂号 identity 校验患者归属与版本。
 */
@Component
@ConditionalOnProperty(name = "nutritionist.identity.mode", havingValue = "http")
public class HttpPatientGateway implements PatientGateway {

    private final RestClient restClient;
    private final String internalToken;

    public HttpPatientGateway(
            RestClient.Builder builder,
            @Value("${nutritionist.identity.base-url:http://127.0.0.1:18082}") String baseUrl,
            @Value("${nutritionist.identity.internal-token:consult-internal}") String internalToken) {
        this.restClient = builder.baseUrl(baseUrl).build();
        this.internalToken = internalToken;
    }

    @Override
    public Optional<PatientSnapshot> findOwnedPatient(String accountId, String patientId) {
        try {
            Result<PatientRemoteRes> body = restClient
                    .get()
                    .uri("/internal/persons/{patientId}", patientId)
                    .header(AuthTokens.ACCOUNT_HEADER, accountId)
                    .header(AuthTokens.INTERNAL_HEADER, internalToken)
                    .retrieve()
                    .body(new ParameterizedTypeReference<Result<PatientRemoteRes>>() {});
            if (body == null || !body.isSuccess() || body.getData() == null) {
                return Optional.empty();
            }
            PatientRemoteRes row = body.getData();
            return Optional.of(new PatientSnapshot(row.id(), row.patientVersion(), true));
        } catch (RuntimeException error) {
            return Optional.empty();
        }
    }

    public record PatientRemoteRes(
            String id, String name, String patientVersion, boolean isDefault) {
    }
}
