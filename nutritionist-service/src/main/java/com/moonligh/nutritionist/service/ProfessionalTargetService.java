package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.Comparator;
import java.util.Optional;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.CreateProfessionalTargetReq;
import com.moonligh.nutritionist.api.res.ProfessionalTargetRes;
import com.moonligh.nutritionist.domain.safety.SafetyPermission;

@Service
public class ProfessionalTargetService {

    private final ConcurrentHashMap<String, Target> targets = new ConcurrentHashMap<>();

    public ProfessionalTargetRes create(String role, CreateProfessionalTargetReq request) {
        Target target = create(role, new CreateRequest(
                request.patientId(),
                request.nutrientCode(),
                request.minimum(),
                request.maximum(),
                request.effectiveAt(),
                request.expiresAt()));
        return toResponse(target);
    }

    public SafetyPermission authorizePlanning(String patientId, Instant at, boolean nonOverridableSafety) {
        if (activeFor(patientId, at).isEmpty()) {
            throw new BusinessException(ErrorCode.PROFESSIONAL_TARGET_REQUIRED);
        }
        if (nonOverridableSafety) {
            return SafetyPermission.HUMAN_REVIEW;
        }
        return SafetyPermission.ALLOWED;
    }

    public Target create(String role, CreateRequest request) {
        requireProfessional(role);
        validate(request);
        Target target = new Target(
                UUID.randomUUID().toString(), "1", request.patientId(), request.nutrientCode(),
                request.minimum(), request.maximum(), request.effectiveAt(), request.expiresAt(), Instant.now());
        targets.put(target.targetId(), target);
        return target;
    }

    public Optional<Target> activeFor(String patientId, Instant at) {
        return targets.values().stream()
                .filter(target -> target.patientId().equals(patientId)
                        && !at.isBefore(target.effectiveAt())
                        && at.isBefore(target.expiresAt()))
                .max(Comparator.comparing(Target::createdAt));
    }

    private static ProfessionalTargetRes toResponse(Target target) {
        return new ProfessionalTargetRes(
                target.targetId(),
                target.version(),
                target.patientId(),
                target.nutrientCode(),
                target.minimum(),
                target.maximum(),
                target.effectiveAt(),
                target.expiresAt());
    }

    private static void requireProfessional(String role) {
        if (!"staff".equals(role) && !"nutritionist_pro".equals(role)) {
            throw new BusinessException(ErrorCode.PROFESSIONAL_TARGET_REQUIRED);
        }
    }

    private static void validate(CreateRequest request) {
        if (request == null || request.patientId() == null || request.patientId().isBlank()
                || request.nutrientCode() == null || request.nutrientCode().isBlank()
                || request.minimum() == null || request.maximum() == null
                || request.minimum().compareTo(request.maximum()) > 0
                || request.effectiveAt() == null || request.expiresAt() == null
                || !request.effectiveAt().isBefore(request.expiresAt())) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
    }

    public record CreateRequest(
            String patientId,
            String nutrientCode,
            BigDecimal minimum,
            BigDecimal maximum,
            Instant effectiveAt,
            Instant expiresAt) {
    }

    public record Target(
            String targetId,
            String version,
            String patientId,
            String nutrientCode,
            BigDecimal minimum,
            BigDecimal maximum,
            Instant effectiveAt,
            Instant expiresAt,
            Instant createdAt) {
    }
}
