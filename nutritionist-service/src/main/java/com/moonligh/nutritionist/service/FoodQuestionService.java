package com.moonligh.nutritionist.service;

import java.math.BigDecimal;

import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.FoodQuestionReq;
import com.moonligh.nutritionist.api.res.FoodQuestionRes;
import com.moonligh.nutritionist.domain.explanation.RecommendationExplanation;
import com.moonligh.nutritionist.domain.nutrition.FoodItem;
import com.moonligh.nutritionist.domain.nutrition.IngredientNutritionCalculator;
import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.nutrition.StapleFoods;

@Service
public class FoodQuestionService {

    private final RecommendationExplanation explanations;

    public FoodQuestionService(RecommendationExplanation explanations) {
        this.explanations = explanations;
    }

    public FoodQuestionRes answer(FoodQuestionReq request) {
        if (request == null || request.planId() == null || request.planId().isBlank()
                || request.question() == null || request.question().isBlank()
                || request.authoritativeGrams() == null) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        BigDecimal proposed = request.proposedGrams() == null ? request.authoritativeGrams() : request.proposedGrams();
        RecommendationExplanation.Explanation rewritten = explanations.acceptRewrite(
                new RecommendationExplanation.Explanation(explain(request), request.authoritativeGrams()),
                request.question(),
                proposed);
        return new FoodQuestionRes(rewritten.text(), rewritten.grams(), false);
    }

    private static String explain(FoodQuestionReq request) {
        FoodItem food = request.foodItemId() == null ? null : StapleFoods.find(request.foodItemId());
        if (food == null) {
            return "按已确认方案解释";
        }
        BigDecimal sodium = new IngredientNutritionCalculator().calculate(food, request.authoritativeGrams()).stream()
                .filter(nutrient -> nutrient.type() == NutrientType.SODIUM && nutrient.value() != null)
                .map(nutrient -> nutrient.value())
                .findFirst()
                .orElse(BigDecimal.ZERO);
        return "按已确认方案，该食材在确定克数下钠为 " + sodium.stripTrailingZeros().toPlainString() + " 毫克";
    }
}