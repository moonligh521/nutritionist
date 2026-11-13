package com.moonligh.nutritionist.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * 本地开发注入测试账号。生产必须关闭。
 */
@ConfigurationProperties(prefix = "nutritionist.security.dev-principal")
public class NutritionistSecurityProperties {

    private boolean enabled = false;
    private String accountId = "dev-account";
    private String role = "patient";

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
