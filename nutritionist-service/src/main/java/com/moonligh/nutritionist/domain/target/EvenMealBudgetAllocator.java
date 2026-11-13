package com.moonligh.nutritionist.domain.target;

import java.util.List;

import org.springframework.stereotype.Component;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.domain.safety.SafetyPermission;

@Component
public class EvenMealBudgetAllocator implements MealBudgetAllocator {

    @Override
    public MealBudgetAllocation allocate(TargetCalculationResult target) {
        if (target == null || target.permission() != SafetyPermission.ALLOWED || target.formulaId() == null) {
            throw new BusinessException(ErrorCode.SAFETY_NOT_ALLOWED);
        }
        throw new BusinessException(ErrorCode.PARAM_INVALID);
    }

    @Override
    public MealBudgetAllocation allocate(TargetCalculationResult target, List<MealBudgetAllocation.MealShare> confirmed) {
        if (target == null || target.permission() != SafetyPermission.ALLOWED || target.formulaId() == null) {
            throw new BusinessException(ErrorCode.SAFETY_NOT_ALLOWED);
        }
        int sum = 0;
        if (confirmed != null) {
            for (MealBudgetAllocation.MealShare share : confirmed) {
                if (share.percent() <= 0) {
                    throw new BusinessException(ErrorCode.PARAM_INVALID);
                }
                sum += share.percent();
            }
        }
        if (sum != 100) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        return new MealBudgetAllocation(target.formulaId(), confirmed);
    }
}