package com.moonligh.nutritionist.domain.target;

import java.util.List;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.domain.safety.SafetyPermission;

public class NutritionTargetCalculator {

    private final FormulaRegistry registry;

    public NutritionTargetCalculator(FormulaRegistry registry) {
        this.registry = registry;
    }

    public TargetCalculationResult calculate(TargetInput input) {
        List<FormulaDefinition> published = registry.published();
        if (published.isEmpty()) {
            throw new BusinessException(ErrorCode.TARGET_RULE_MISSING);
        }
        if (input == null || !input.complete()) {
            return new TargetCalculationResult(
                    SafetyPermission.NEED_MORE_DATA,
                    null,
                    List.of("TARGET_INPUT_INCOMPLETE"));
        }
        if (published.size() > 1) {
            return new TargetCalculationResult(
                    SafetyPermission.HUMAN_REVIEW,
                    null,
                    List.of("MULTIPLE_PUBLISHED_FORMULAS"));
        }
        return new TargetCalculationResult(
                SafetyPermission.ALLOWED,
                published.getFirst().formulaId(),
                List.of());
    }
}
