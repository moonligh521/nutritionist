package com.moonligh.nutritionist.domain.target;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.math.BigDecimal;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.domain.safety.SafetyPermission;

class NutritionTargetCalculatorTest {

    @Test
    void noPublishedFormulaReturns2301() {
        var calculator = new NutritionTargetCalculator(new FormulaRegistry(List.of()));

        BusinessException error = assertThrows(
                BusinessException.class,
                () -> calculator.calculate(completeInput()));

        assertEquals(ErrorCode.TARGET_RULE_MISSING, error.getErrorCode());
    }

    @Test
    void missingInputNeedsMoreData() {
        var calculator = new NutritionTargetCalculator(
                new FormulaRegistry(List.of(FormulaDefinition.published("formula-1"))));

        var result = calculator.calculate(new TargetInput(null, 1, null, null, null));

        assertEquals(SafetyPermission.NEED_MORE_DATA, result.permission());
    }

    @Test
    void multiplePublishedFormulasRequireHumanReview() {
        var calculator = new NutritionTargetCalculator(new FormulaRegistry(List.of(
                FormulaDefinition.published("formula-1"),
                FormulaDefinition.published("formula-2"))));

        var result = calculator.calculate(completeInput());

        assertEquals(SafetyPermission.HUMAN_REVIEW, result.permission());
    }

    private static TargetInput completeInput() {
        return new TargetInput(
                36,
                1,
                new BigDecimal("175"),
                new BigDecimal("70"),
                new BigDecimal("1.4"));
    }
}
