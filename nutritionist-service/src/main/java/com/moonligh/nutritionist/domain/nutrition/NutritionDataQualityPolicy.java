package com.moonligh.nutritionist.domain.nutrition;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class NutritionDataQualityPolicy {

    private final String policyVersion;

    public NutritionDataQualityPolicy(String policyVersion) {
        this.policyVersion = policyVersion;
    }

    public DataQualityDecision evaluate(FoodItem food, Set<NutrientType> criticalNutrients) {
        List<String> reasons = new ArrayList<>();
        for (NutrientType critical : criticalNutrients) {
            FoodNutrient nutrient = food.nutrients().stream()
                    .filter(candidate -> candidate.type() == critical)
                    .findFirst()
                    .orElse(null);
            if (nutrient == null || nutrient.quality() == NutrientQuality.UNKNOWN) {
                reasons.add("CRITICAL_NUTRIENT_UNKNOWN:" + critical.name());
            }
        }
        if (!reasons.isEmpty()) {
            return new DataQualityDecision(DataQualityDisposition.REJECT, policyVersion, reasons);
        }
        boolean hasUnknown = food.nutrients().stream()
                .anyMatch(nutrient -> nutrient.quality() == NutrientQuality.UNKNOWN);
        return new DataQualityDecision(
                hasUnknown ? DataQualityDisposition.RESTRICT : DataQualityDisposition.ACCEPT,
                policyVersion,
                List.of());
    }
}
