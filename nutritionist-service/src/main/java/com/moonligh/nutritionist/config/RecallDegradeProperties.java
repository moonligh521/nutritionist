package com.moonligh.nutritionist.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

/** 检索软约束降级开关。点名菜系 SCALAR_EMPTY 永不降级。 */
@ConfigurationProperties(prefix = "nutritionist.recall.degrade")
public class RecallDegradeProperties {

    /** 由 application.yml 绑定；点名菜系 SCALAR_EMPTY 仍 fail-closed。 */
    private boolean enabled = false;

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
}
