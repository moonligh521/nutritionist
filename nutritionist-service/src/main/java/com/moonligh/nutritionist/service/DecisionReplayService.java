package com.moonligh.nutritionist.service;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HexFormat;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.common.EntityTable;
import com.moonligh.nutritionist.domain.replay.ReplaySnapshot;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataStore;

/**
 * 记住某次配餐当时用过的画像、规则和约束。
 * 只存内容哈希，方便以后回答“当时为什么这样配”。
 */
@Service
public class DecisionReplayService {

    private final EntityTable<ReplaySnapshot> snapshots = new EntityTable<>(ReplaySnapshot::planVersion);
    private final NutritionDataStore records;

    public DecisionReplayService() {
        this(null);
    }

    @Autowired
    public DecisionReplayService(NutritionDataStore records) {
        this.records = records;
    }

    public ReplaySnapshot record(
            String planVersion,
            String profileSnapshot,
            String rulesSnapshot,
            List<String> constraintIds,
            String solverVersion,
            String solverLayerResult) {
        ReplaySnapshot snapshot = new ReplaySnapshot(
                planVersion,
                sha256(profileSnapshot),
                sha256(rulesSnapshot),
                List.copyOf(constraintIds),
                solverVersion,
                sha256(solverLayerResult));
        snapshots.save(snapshot);
        if (records != null) {
            records.saveReplay(snapshot);
        }
        return snapshot;
    }

    public Optional<ReplaySnapshot> find(String planVersion) {
        Optional<ReplaySnapshot> cached = snapshots.find(planVersion);
        if (cached.isPresent() || records == null) {
            return cached;
        }
        Optional<ReplaySnapshot> stored = records.findReplay(planVersion);
        stored.ifPresent(snapshots::save);
        return stored;
    }

    private static String sha256(String value) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
            return HexFormat.of().formatHex(digest);
        } catch (NoSuchAlgorithmException error) {
            throw new IllegalStateException(error);
        }
    }
}
