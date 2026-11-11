package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CookingRevisionService {

    private final BigDecimal maximumAdditionalQuantity;

    public CookingRevisionService() {
        this(new BigDecimal("5"));
    }

    public CookingRevisionService(BigDecimal maximumAdditionalQuantity) {
        this.maximumAdditionalQuantity = maximumAdditionalQuantity;
    }

    public RevisionResult recalculate(String executionId, List<ActualIngredientChange> changes) {
        if (executionId == null || executionId.isBlank() || changes == null || changes.isEmpty()) {
            throw new IllegalArgumentException("executionId and changes are required");
        }
        BigDecimal added = changes.stream()
                .map(change -> change.actualQuantity().subtract(change.plannedQuantity()).max(BigDecimal.ZERO))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        boolean allergyConflict = changes.stream().anyMatch(ActualIngredientChange::allergen);
        boolean accepted = !allergyConflict && added.compareTo(maximumAdditionalQuantity) <= 0;
        return new RevisionResult(
                accepted,
                accepted ? RevisionStatus.IN_PROGRESS : RevisionStatus.WAITING_REVISION,
                added,
                allergyConflict ? "ALLERGY" : accepted ? "RECALCULATED" : "NUTRITION_LIMIT");
    }

    public enum RevisionStatus {
        IN_PROGRESS,
        WAITING_REVISION
    }

    public record ActualIngredientChange(
            String foodItemId,
            BigDecimal plannedQuantity,
            BigDecimal actualQuantity,
            boolean allergen) {
    }

    public record RevisionResult(
            boolean accepted,
            RevisionStatus status,
            BigDecimal additionalQuantity,
            String reasonCode) {
    }
}
