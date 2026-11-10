package com.moonligh.nutritionist.config;

import java.io.IOException;

import org.springframework.core.Ordered;
import org.springframework.web.filter.OncePerRequestFilter;

import com.moonligh.consult.security.AuthTokens;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 开发态在缺少网关头时注入测试账号，必须排在 AccountAuthFilter 之前。
 */
public class DevPrincipalFilter extends OncePerRequestFilter implements Ordered {

    private final NutritionistSecurityProperties properties;

    public DevPrincipalFilter(NutritionistSecurityProperties properties) {
        this.properties = properties;
    }

    @Override
    public int getOrder() {
        return Ordered.HIGHEST_PRECEDENCE + 10;
    }

    @Override
    protected boolean shouldNotFilter(HttpServletRequest request) {
        return !properties.isEnabled();
    }

    @Override
    protected void doFilterInternal(
            HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        String account = request.getHeader(AuthTokens.ACCOUNT_HEADER);
        if (account != null && !account.isBlank()) {
            filterChain.doFilter(request, response);
            return;
        }
        String accountId = properties.getAccountId();
        filterChain.doFilter(new HttpServletRequestWrapper(request) {
            @Override
            public String getHeader(String name) {
                if (AuthTokens.ACCOUNT_HEADER.equalsIgnoreCase(name)) {
                    return accountId;
                }
                return super.getHeader(name);
            }
        }, response);
    }
}
