package com.moonligh.nutritionist.config;

import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.service.PatientBindingService;

/**
 * 本地假患者网关下预置压测账号，避免推荐创建在绑定校验处失败。
 */
@Component
@ConditionalOnProperty(name = "nutritionist.identity.mode", havingValue = "fake", matchIfMissing = true)
@ConditionalOnProperty(prefix = "nutritionist.security.dev-principal", name = "enabled", havingValue = "true")
public class DevPatientSeed implements ApplicationRunner {

    private final FakePatientGateway gateway;
    private final PatientBindingService bindings;
    private final NutritionistSecurityProperties principal;

    public DevPatientSeed(
            FakePatientGateway gateway,
            PatientBindingService bindings,
            NutritionistSecurityProperties principal) {
        this.gateway = gateway;
        this.bindings = bindings;
        this.principal = principal;
    }

    @Override
    public void run(ApplicationArguments args) {
        String accountId = principal.getAccountId();
        gateway.put(accountId, "pat-1", "pv1");
        bindings.bind(accountId, "pat-1", "pv1");
    }
}
