package com.moonligh.nutritionist.domain.profile;

import java.util.Optional;

import com.moonligh.nutritionist.domain.common.EntityTable;

/**
 * 没有数据库时的饮食画像表。单元测试用它。
 */
public class InMemoryProfileRepository implements ProfileRepository {

    private final EntityTable<Profile> profiles = new EntityTable<>(Profile::patientId);

    @Override
    public Optional<Profile> findByPatientId(String patientId) {
        return profiles.find(patientId);
    }

    @Override
    public synchronized boolean save(Profile profile, Long expectedVersion) {
        Profile current = profiles.find(profile.patientId()).orElse(null);
        if (current == null && expectedVersion != null) {
            return false;
        }
        if (current != null && (expectedVersion == null || current.version() != expectedVersion)) {
            return false;
        }
        profiles.save(profile);
        return true;
    }
}
