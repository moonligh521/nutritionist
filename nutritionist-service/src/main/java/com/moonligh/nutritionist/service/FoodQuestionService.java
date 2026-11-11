package com.moonligh.nutritionist.service;

import java.math.BigDecimal;

import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.FoodQuestionReq;
import com.moonligh.nutritionist.api.res.FoodQuestionRes;
import com.moonligh.nutritionist.domain.explanation.RecommendationExplanation;

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
                new RecommendationExplanation.Explanation("按已确认方案解释", request.authoritativeGrams()),
                request.question(),
                proposed);
        return new FoodQuestionRes(rewritten.text(), rewritten.grams(), false);
    }
}