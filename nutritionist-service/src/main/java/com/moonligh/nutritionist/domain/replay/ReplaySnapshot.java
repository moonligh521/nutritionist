package com.moonligh.nutritionist.domain.replay;

import java.util.List;

/** 某次配餐当时的画像、规则和求解摘要。只保留哈希。 */
public record ReplaySnapshot(
        String planVersion,
        String profileHash,
        String rulesHash,
        List<String> constraintIds,
        String solverVersion,
        String solverLayerHash) {

    public ReplaySnapshot {
        constraintIds = List.copyOf(constraintIds);
    }
}
