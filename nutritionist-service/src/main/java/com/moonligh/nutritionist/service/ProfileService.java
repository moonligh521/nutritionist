package com.moonligh.nutritionist.service;

import java.time.Instant;
import java.time.ZoneId;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.UpsertProfileReq;
import com.moonligh.nutritionist.api.res.ProfileRes;
import com.moonligh.nutritionist.domain.profile.Profile;
import com.moonligh.nutritionist.domain.profile.ProfileRepository;

@Service
public class ProfileService {

    private final ProfileRepository profiles;
    private final PatientBindingService bindings;

    public ProfileService(ProfileRepository profiles, PatientBindingService bindings) {
        this.profiles = profiles;
        this.bindings = bindings;
    }

    public ProfileRes upsert(String accountId, UpsertProfileReq request) {
        validate(request);
        bindings.requireBoundPatient(accountId, request.patientId(), request.patientVersion());
        Profile current = profiles.findByPatientId(request.patientId()).orElse(null);
        Long expectedVersion = parseExpectedVersion(request.profileVersion());
        if (current == null && expectedVersion != null) {
            throw new BusinessException(ErrorCode.PROFILE_VERSION_CONFLICT);
        }
        if (current != null && (expectedVersion == null || current.version() != expectedVersion)) {
            throw new BusinessException(ErrorCode.PROFILE_VERSION_CONFLICT);
        }

        long nextVersion = current == null ? 1 : current.version() + 1;
        Instant now = Instant.now();
        Profile profile = new Profile(
                current == null ? UUID.randomUUID().toString() : current.profileId(),
                accountId,
                request.patientId(),
                request.patientVersion(),
                nextVersion,
                request.sexCode(),
                request.birthDate(),
                request.heightCm(),
                request.timezone(),
                request.activityLevelCode(),
                request.goalTypeCode(),
                now);
        if (!profiles.save(profile, expectedVersion)) {
            throw new BusinessException(ErrorCode.PROFILE_VERSION_CONFLICT);
        }
        return toResponse(profile);
    }

    private static void validate(UpsertProfileReq request) {
        if (request == null
                || blank(request.patientId())
                || blank(request.patientVersion())
                || request.sexCode() == null
                || request.birthDate() == null
                || request.heightCm() == null
                || request.heightCm().signum() <= 0
                || blank(request.timezone())
                || request.goalTypeCode() == null) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        try {
            ZoneId.of(request.timezone());
        } catch (RuntimeException error) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
    }

    private static Long parseExpectedVersion(String version) {
        if (version == null || version.isBlank()) {
            return null;
        }
        try {
            return Long.valueOf(version);
        } catch (NumberFormatException error) {
            throw new BusinessException(ErrorCode.PROFILE_VERSION_CONFLICT);
        }
    }

    private static boolean blank(String value) {
        return value == null || value.isBlank();
    }

    private static ProfileRes toResponse(Profile profile) {
        return new ProfileRes(
                profile.profileId(),
                Long.toString(profile.version()),
                profile.patientId(),
                profile.patientVersion(),
                profile.updatedAt());
    }
}
