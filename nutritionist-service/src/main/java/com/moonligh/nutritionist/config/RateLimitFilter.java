package com.moonligh.nutritionist.config;

import java.io.IOException;

import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import com.moonligh.consult.security.AuthTokens;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class RateLimitFilter extends OncePerRequestFilter implements Ordered {

    private final AccountRateLimiter limiter;

    public RateLimitFilter(AccountRateLimiter limiter) {
        this.limiter = limiter;
    }

    @Override
    public int getOrder() {
        return Ordered.HIGHEST_PRECEDENCE + 30;
    }

    @Override
    protected boolean shouldNotFilter(HttpServletRequest request) {
        String path = request.getRequestURI();
        return path == null || !path.startsWith("/api/nutrition/");
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        String accountId = request.getHeader(AuthTokens.ACCOUNT_HEADER);
        if (accountId == null || accountId.isBlank()) {
            accountId = "anonymous";
        }
        String path = request.getRequestURI();
        String method = request.getMethod();
        if (path.contains("/pantry/recognize")) {
            limiter.acquire(accountId, "recognize", 1);
        } else if ("POST".equals(method) && path.endsWith("/recommendations")) {
            limiter.acquire(accountId, "recommend", 2);
        } else if ("GET".equals(method)) {
            limiter.acquire(accountId, "read", 20);
        } else {
            limiter.acquire(accountId, "write", 5);
        }
        filterChain.doFilter(request, response);
    }
}
