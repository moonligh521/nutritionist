package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.Comparator;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.common.EntityTable;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataStore;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.CreateProfessionalTargetReq;
import com.moonligh.nutritionist.api.res.ProfessionalTargetRes;
import com.moonligh.nutritionist.domain.safety.SafetyPermission;

@Service
public class ProfessionalTargetService {

    /** 专业人员写下的营养目标，按目标编号保存。 */
    private final EntityTable<Target> targets = new EntityTable<>(Target::targetId);
    private final NutritionDataStore records;

    public ProfessionalTargetService() {
        this(null);
    }

    @Autowired
    public ProfessionalTargetService(NutritionDataStore records) {
        this.records = records;
    }

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
        targets.save(target);
        if (records != null) {
            records.saveTarget(target);
        }
        return target;
    }

    public ProfessionalTargetRes revoke(String role, String targetId) {
        requireProfessional(role);
        if (targetId == null || targetId.isBlank()) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        Target current = targets.find(targetId).orElse(null);
        if (current == null && records != null) {
            current = records.findTarget(targetId).orElse(null);
        }
        if (current == null) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        Instant expiry = current.effectiveAt().isAfter(Instant.now()) ? current.effectiveAt() : Instant.now();
        Target revoked = new Target(
                current.targetId(), current.version(), current.patientId(), current.nutrientCode(),
                current.minimum(), current.maximum(), current.effectiveAt(), expiry, current.createdAt());
        targets.save(revoked);
        if (records != null) {
            records.expireTarget(revoked.targetId(), revoked.version(), expiry);
        }
        return toResponse(revoked);
    }

    public Optional<Target> activeFor(String patientId, Instant at) {
        loadStored(patientId);
        return targets.all().stream()
                .filter(target -> target.patientId().equals(patientId)
                        && !at.isBefore(target.effectiveAt())
                        && at.isBefore(target.expiresAt()))
                .max(Comparator.comparing(Target::createdAt));
    }

    public Optional<Target> activeNutrient(String patientId, Instant at, String nutrientCode) {
        loadStored(patientId);
        return targets.all().stream()
                .filter(target -> target.patientId().equals(patientId)
                        && nutrientCode.equals(target.nutrientCode())
                        && !at.isBefore(target.effectiveAt())
                        && at.isBefore(target.expiresAt()))
                .max(Comparator.comparing(Target::createdAt));
    }

    private void loadStored(String patientId) {
        if (records == null) {
            return;
        }
        for (Target loaded : records.targets(patientId)) {
            targets.saveIfAbsent(loaded);
        }
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

    /** 创建专业目标时需要的内容。 */
    public record CreateRequest(
            /** 适用患者标识。 */
            String patientId,
            /** 营养素代码。 */
            String nutrientCode,
            /** 下限值。 */
            BigDecimal minimum,
            /** 上限值。 */
            BigDecimal maximum,
            /** 生效时间。 */
            Instant effectiveAt,
            /** 过期时间。 */
            Instant expiresAt) {
    }

    /** 已经保存的一条专业目标。 */
    public record Target(
            /** 目标编号。 */
            String targetId,
            /** 目标版本。 */
            String version,
            /** 患者编号。 */
            String patientId,
            /** 营养素代码。 */
            String nutrientCode,
            /** 下限值。 */
            BigDecimal minimum,
            /** 上限值。 */
            BigDecimal maximum,
            /** 生效时间。 */
            Instant effectiveAt,
            /** 过期时间。 */
            Instant expiresAt,
            /** 创建时间。 */
            Instant createdAt) {
    }
}
