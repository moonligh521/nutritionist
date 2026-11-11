package com.moonligh.nutritionist.infrastructure.persistence;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Optional;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.nutritionist.domain.profile.Profile;
import com.moonligh.nutritionist.domain.profile.ProfileRepository;

@Repository
public class JdbcProfileRepository implements ProfileRepository {

    private final JdbcTemplate jdbc;
    private final ObjectMapper mapper;

    public JdbcProfileRepository(JdbcTemplate jdbc, ObjectMapper mapper) {
        this.jdbc = jdbc;
        this.mapper = mapper;
    }

    @Override
    public Optional<Profile> findByPatientId(String patientId) {
        return jdbc.query(
                        """
                        SELECT profile_id, account_id, patient_id, patient_version, version,
                               sex_code, birth_date, height_cm, timezone, activity_level_code,
                               goal_type_code, updated_at
                        FROM user_profile WHERE patient_id = ?
                        """,
                        JdbcProfileRepository::map,
                        patientId)
                .stream()
                .findFirst();
    }

    @Override
    @Transactional
    public boolean save(Profile profile, Long expectedVersion) {
        boolean saved;
        if (expectedVersion == null) {
            saved = jdbc.update(
                            """
                            INSERT INTO user_profile
                              (profile_id, account_id, patient_id, patient_version, version,
                               sex_code, birth_date, height_cm, timezone, activity_level_code,
                               goal_type_code, updated_at)
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                            """,
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
                            Timestamp.from(profile.updatedAt()))
                    == 1;
        } else {
            saved = jdbc.update(
                            """
                            UPDATE user_profile
                            SET patient_version = ?, version = ?, sex_code = ?, birth_date = ?,
                                height_cm = ?, timezone = ?, activity_level_code = ?,
                                goal_type_code = ?, updated_at = ?
                            WHERE patient_id = ? AND version = ?
                            """,
                            profile.patientVersion(),
                            profile.version(),
                            profile.sexCode(),
                            profile.birthDate(),
                            profile.heightCm(),
                            profile.timezone(),
                            profile.activityLevelCode(),
                            profile.goalTypeCode(),
                            Timestamp.from(profile.updatedAt()),
                            profile.patientId(),
                            expectedVersion)
                    == 1;
        }
        if (saved) {
            jdbc.update(
                    """
                    INSERT INTO profile_snapshot (profile_id, version, snapshot_json, created_at)
                    VALUES (?, ?, ?, ?)
                    """,
                    profile.profileId(),
                    profile.version(),
                    serialize(profile),
                    Timestamp.from(profile.updatedAt()));
        }
        return saved;
    }

    private static Profile map(ResultSet rs, int row) throws SQLException {
        return new Profile(
                rs.getString("profile_id"),
                rs.getString("account_id"),
                rs.getString("patient_id"),
                rs.getString("patient_version"),
                rs.getLong("version"),
                rs.getInt("sex_code"),
                rs.getDate("birth_date").toLocalDate(),
                rs.getBigDecimal("height_cm"),
                rs.getString("timezone"),
                (Integer) rs.getObject("activity_level_code"),
                rs.getInt("goal_type_code"),
                rs.getTimestamp("updated_at").toInstant());
    }

    private String serialize(Profile profile) {
        try {
            return mapper.writeValueAsString(profile);
        } catch (JsonProcessingException error) {
            throw new IllegalStateException("Cannot serialize profile snapshot", error);
        }
    }
}
