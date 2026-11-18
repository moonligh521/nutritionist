package com.moonligh.nutritionist.config;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.test.context.runner.ApplicationContextRunner;

class RecallDegradePropertiesBindingTest {

    private final ApplicationContextRunner runner = new ApplicationContextRunner()
            .withUserConfiguration(Config.class)
            .withPropertyValues("nutritionist.recall.degrade.enabled=true");

    @Test
    void bindsEnabledFromEnvironment() {
        runner.run(ctx -> assertTrue(ctx.getBean(RecallDegradeProperties.class).isEnabled()));
    }

    @EnableConfigurationProperties(RecallDegradeProperties.class)
    static class Config {
    }
}
