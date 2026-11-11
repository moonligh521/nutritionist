package com.moonligh.nutritionist.domain.profile;

import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

public class InMemoryProfileRepository implements ProfileRepository {

    private final ConcurrentHashMap<String, Profile> profiles = new ConcurrentHashMap<>();

    @Override
    public Optional<Profile> findByPatientId(String patientId) {
        return Optional.ofNullable(profiles.get(patientId));
    }

    @Override
    public synchronized boolean save(Profile profile, Long expectedVersion) {
        Profile current = profiles.get(profile.patientId());
        if (current == null && expectedVersion != null) {
            return false;
        }
        if (current != null && (expectedVersion == null || current.version() != expectedVersion)) {
            return false;
        }
        profiles.put(profile.patientId(), profile);
        return true;
    }
}
