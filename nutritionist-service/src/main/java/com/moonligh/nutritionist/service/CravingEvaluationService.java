package com.moonligh.nutritionist.service;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.CravingEvalReq;
import com.moonligh.nutritionist.api.res.CravingEvalRes;

@Service
public class CravingEvaluationService {

    private final ClinicalRecordService clinical;

    public CravingEvaluationService() {
        this(null);
    }

    @Autowired
    public CravingEvaluationService(ClinicalRecordService clinical) {
        this.clinical = clinical;
    }

    public static final int REASON_ALLERGY = 1;
    public static final int REASON_QUANTIFIED_LIMIT = 2;
    public static final int REASON_WITHIN_BUDGET = 3;

    public CravingEvalRes evaluate(CravingEvalReq request) {
        if (request == null || request.reasonCode() == null || request.desiredPortion() == null
                || request.foodItemId() == null || request.foodItemId().isBlank()) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        boolean recordedAllergy = clinical != null
                && clinical.confirmedAllergen(request.patientId(), request.foodItemId());
        Result result = evaluate(new Request(
                request.foodItemId(),
                request.desiredPortion(),
                request.maximumPortion() == null ? request.desiredPortion() : request.maximumPortion(),
                request.reasonCode() == REASON_ALLERGY || recordedAllergy));
        if (request.reasonCode() == REASON_ALLERGY && result.disposition() != Disposition.REJECTED_ALLERGY) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        return new CravingEvalRes(result.disposition().code(), result.allowedPortion(), result.message(), false);
    }

    public Result evaluate(Request request) {
        if (request.allergy()) {
            return new Result(Disposition.REJECTED_ALLERGY, BigDecimal.ZERO, "绝对过敏禁忌，不能试吃");
        }
        BigDecimal allowed = request.desiredPortion().min(request.maximumPortion()).max(BigDecimal.ZERO);
        if (allowed.compareTo(request.desiredPortion()) < 0) {
            return new Result(Disposition.LIMITED_PORTION, allowed, "可在限制份量内安排，不代表无风险");
        }
        return new Result(Disposition.ALLOWED, allowed, "按既定额度安排");
    }

    public enum Disposition {
        REJECTED_ALLERGY(1),
        LIMITED_PORTION(2),
        ALLOWED(3);

        private final int code;

        Disposition(int code) {
            this.code = code;
        }

        public int code() {
            return code;
        }
    }

    public record Request(
            String foodItemId,
            BigDecimal desiredPortion,
            BigDecimal maximumPortion,
            boolean allergy) {
    }

    public record Result(Disposition disposition, BigDecimal allowedPortion, String message) {
    }
}
