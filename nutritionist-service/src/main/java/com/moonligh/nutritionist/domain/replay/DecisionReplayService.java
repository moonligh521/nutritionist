package com.moonligh.nutritionist.domain.replay;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HexFormat;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

@Service
public class DecisionReplayService {

    private final ConcurrentHashMap<String, Snapshot> snapshots = new ConcurrentHashMap<>();

    public Snapshot record(
            String planVersion,
            String profileSnapshot,
            String rulesSnapshot,
            List<String> constraintIds,
            String solverVersion,
            String solverLayerResult) {
        Snapshot snapshot = new Snapshot(
                planVersion,
                sha256(profileSnapshot),
                sha256(rulesSnapshot),
                List.copyOf(constraintIds),
                solverVersion,
                sha256(solverLayerResult));
        snapshots.put(planVersion, snapshot);
        return snapshot;
    }

    public Optional<Snapshot> find(String planVersion) {
        return Optional.ofNullable(snapshots.get(planVersion));
    }

    private static String sha256(String value) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
            return HexFormat.of().formatHex(digest);
        } catch (NoSuchAlgorithmException error) {
            throw new IllegalStateException(error);
        }
    }

    public record Snapshot(
            String planVersion,
            String profileHash,
            String rulesHash,
            List<String> constraintIds,
            String solverVersion,
            String solverLayerHash) {

        public Snapshot {
            constraintIds = List.copyOf(constraintIds);
        }
    }
}