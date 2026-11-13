package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.nutrition.FoodItem;
import com.moonligh.nutritionist.domain.nutrition.FoodNutrient;
import com.moonligh.nutritionist.domain.nutrition.IngredientNutritionCalculator;
import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.nutrition.StapleFoods;

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
        IngredientNutritionCalculator calculator = new IngredientNutritionCalculator();
        BigDecimal energy = BigDecimal.ZERO;
        BigDecimal sodium = BigDecimal.ZERO;
        for (ActualIngredientChange change : changes) {
            FoodItem food = StapleFoods.find(change.foodItemId());
            if (food == null || change.actualQuantity() == null) {
                continue;
            }
            for (FoodNutrient nutrient : calculator.calculate(food, change.actualQuantity())) {
                if (nutrient.value() == null) {
                    continue;
                }
                if (nutrient.type() == NutrientType.ENERGY) {
                    energy = energy.add(nutrient.value());
                }
                if (nutrient.type() == NutrientType.SODIUM) {
                    sodium = sodium.add(nutrient.value());
                }
            }
        }
        return new RevisionResult(
                accepted,
                accepted ? RevisionStatus.IN_PROGRESS : RevisionStatus.WAITING_REVISION,
                added,
                allergyConflict ? "ALLERGY" : accepted ? "RECALCULATED" : "NUTRITION_LIMIT",
                energy,
                sodium,
                changes.stream()
                        .map(ActualIngredientChange::remainder)
                        .filter(value -> value != null)
                        .reduce(BigDecimal.ZERO, BigDecimal::add));
    }

    public enum RevisionStatus {
        IN_PROGRESS,
        WAITING_REVISION
    }

    public record ActualIngredientChange(
            String foodItemId,
            BigDecimal plannedQuantity,
            BigDecimal actualQuantity,
            boolean allergen,
            BigDecimal finishedWeight,
            BigDecimal consumedQuantity) {

        public ActualIngredientChange(
                String foodItemId, BigDecimal plannedQuantity, BigDecimal actualQuantity, boolean allergen) {
            this(foodItemId, plannedQuantity, actualQuantity, allergen, null, null);
        }

        /** 成品重量减去实际食用量。两者缺一则无法计算剩余量。 */
        public BigDecimal remainder() {
            if (finishedWeight == null || consumedQuantity == null) {
                return null;
            }
            return finishedWeight.subtract(consumedQuantity);
        }
    }

    public record RevisionResult(
            boolean accepted,
            RevisionStatus status,
            BigDecimal additionalQuantity,
            String reasonCode,
            BigDecimal energyKcal,
            BigDecimal sodiumMg,
            BigDecimal remainder) {
    }
}
