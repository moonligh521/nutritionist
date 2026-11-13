package com.moonligh.nutritionist.infrastructure.persistence;

import java.util.Optional;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.nutritionist.domain.profile.Profile;
import com.moonligh.nutritionist.domain.profile.ProfileRepository;

@Repository
public class ProfileRepositoryImpl implements ProfileRepository {

    private final ProfileMapper profiles;
    private final ObjectMapper mapper;

    public ProfileRepositoryImpl(ProfileMapper profiles, ObjectMapper mapper) {
        this.profiles = profiles;
        this.mapper = mapper;
    }

    @Override
    public Optional<Profile> findByPatientId(String patientId) {
        return profiles.findByPatientId(patientId).stream().findFirst();
    }

    @Override
    @Transactional
    public boolean save(Profile profile, Long expectedVersion) {
        boolean saved;
        if (expectedVersion == null) {
            saved = profiles.insert(
                            profile.profileId(),
                            profile.accountId(),
                            profile.patientId(),
                            profile.patientVersion(),
                            profile.version(),
                            profile.sexCode(),
                            profile.birthDate(),
                            profile.heightCm(),
                            profile.timezone(),
                            profile.activityLevelCode(),
                            profile.goalTypeCode(),
                            profile.updatedAt())
                    == 1;
        } else {
            saved = profiles.update(
                            profile.patientVersion(),
                            profile.version(),
                            profile.sexCode(),
                            profile.birthDate(),
                            profile.heightCm(),
                            profile.timezone(),
                            profile.activityLevelCode(),
                            profile.goalTypeCode(),
                            profile.updatedAt(),
                            profile.patientId(),
                            expectedVersion)
                    == 1;
        }
        if (saved) {
            profiles.insertSnapshot(profile.profileId(), profile.version(), serialize(profile), profile.updatedAt());
        }
        return saved;
    }

    private String serialize(Profile profile) {
        try {
            return mapper.writeValueAsString(profile);
        } catch (JsonProcessingException error) {
            throw new IllegalStateException("Cannot serialize profile snapshot", error);
        }
    }
}
