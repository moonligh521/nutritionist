package com.moonligh.nutritionist.domain.profile;

import java.util.Optional;

public interface ProfileRepository {

    Optional<Profile> findByPatientId(String patientId);

    boolean save(Profile profile, Long expectedVersion);
}
