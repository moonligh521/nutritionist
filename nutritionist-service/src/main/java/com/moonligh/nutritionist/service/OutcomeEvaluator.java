package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

import org.springframework.stereotype.Service;

/**
 * P4 evaluation skeleton. It emits all six independent dimensions so later
 * clinical rules can evolve without changing the workflow contract.
 */
@Service
public class OutcomeEvaluator {

    public Evaluation evaluate(Input input) {
        BigDecimal change = input.currentWeightKg().subtract(input.previousWeightKg());
        Decision decision = input.urgent() ? Decision.STOP
                : input.safetyConcern() ? Decision.HUMAN_REVIEW
                : Decision.KEEP_PLAN;
        int deficitDeltaKcal = 0;
        List<CategoryEvaluation> categories = List.of(
                category(Category.SAFETY, input.safetyConcern() || input.urgent()),
                category(Category.ADHERENCE, false),
                category(Category.SATIETY, false),
                category(Category.WEIGHT_TREND, change.abs().compareTo(new BigDecimal("0.5")) > 0),
                category(Category.METABOLIC_RESPONSE, false),
                category(Category.PRACTICALITY, false));
        return new Evaluation(categories, decision, deficitDeltaKcal);
    }

    private static CategoryEvaluation category(Category category, boolean requiresAttention) {
        return new CategoryEvaluation(category, requiresAttention, requiresAttention ? "REVIEW" : "STABLE");
    }

    public enum Category {
        SAFETY,
        ADHERENCE,
        SATIETY,
        WEIGHT_TREND,
        METABOLIC_RESPONSE,
        PRACTICALITY
    }

    public enum Decision {
        KEEP_PLAN,
        ADJUST_FUTURE_MEALS,
        HUMAN_REVIEW,
        STOP
    }

    public record Input(
            BigDecimal previousWeightKg,
            BigDecimal currentWeightKg,
            boolean safetyConcern,
            boolean urgent,
            Instant observedAt) {
    }

    public record CategoryEvaluation(Category category, boolean requiresAttention, String reasonCode) {
    }

    public record Evaluation(List<CategoryEvaluation> categories, Decision decision, int deficitDeltaKcal) {
        public Evaluation {
            categories = List.copyOf(categories);
        }
    }
}
