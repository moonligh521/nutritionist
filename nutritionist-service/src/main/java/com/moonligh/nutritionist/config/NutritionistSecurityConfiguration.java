package com.moonligh.nutritionist.config;

import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 营养服务鉴权：AccountAuth 由 platform-security 自动装配；此处仅开发态注入测试账号。
 */
@Configuration
@EnableConfigurationProperties(NutritionistSecurityProperties.class)
public class NutritionistSecurityConfiguration {

    @Bean
    @ConditionalOnProperty(prefix = "nutritionist.security.dev-principal", name = "enabled", havingValue = "true")
    public FilterRegistrationBean<DevPrincipalFilter> devPrincipalFilter(NutritionistSecurityProperties properties) {
        FilterRegistrationBean<DevPrincipalFilter> bean =
                new FilterRegistrationBean<>(new DevPrincipalFilter(properties));
        bean.setOrder(new DevPrincipalFilter(properties).getOrder());
        bean.addUrlPatterns("/api/*");
        return bean;
    }
}
