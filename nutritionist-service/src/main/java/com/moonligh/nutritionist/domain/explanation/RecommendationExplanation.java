package com.moonligh.nutritionist.domain.explanation;

import java.math.BigDecimal;

import org.springframework.stereotype.Component;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;

@Component
public class RecommendationExplanation {

    public Explanation acceptRewrite(Explanation facts, String rewrittenText, BigDecimal rewrittenGrams) {
        if (facts == null || rewrittenText == null || rewrittenText.isBlank() || rewrittenGrams == null
                || facts.grams().compareTo(rewrittenGrams) != 0) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        return new Explanation(rewrittenText, facts.grams());
    }

    public record Explanation(String text, BigDecimal grams) {
    }
}