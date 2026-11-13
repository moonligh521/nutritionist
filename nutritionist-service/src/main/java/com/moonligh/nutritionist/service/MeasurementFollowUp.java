package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.nutritionist.api.req.CreateMeasurementReq;
import com.moonligh.nutritionist.api.req.CreateRecommendationReq;

/**
 * 非紧急测量之后，按原有约束重算当天方案。
 * 不因短期体重变化扩大热量缺口。没有已保存的方案时不做新配餐。
 */
@Service
public class MeasurementFollowUp {

    private static final ZoneId SERVICE_ZONE = ZoneId.of("Asia/Shanghai");

    private final OutcomeEvaluator evaluator;
    private final DeterministicRecommendationWork work;
    private final SolvedMealService solvedMeals;
    private final DecisionReplayService replay;
    private OutcomeEvaluator.Evaluation lastDecision;

    public MeasurementFollowUp(
            OutcomeEvaluator evaluator,
            DeterministicRecommendationWork work,
            SolvedMealService solvedMeals,
            DecisionReplayService replay) {
        this.evaluator = evaluator;
        this.work = work;
        this.solvedMeals = solvedMeals;
        this.replay = replay;
    }

    public void refresh(CreateMeasurementReq request) {
        if (request == null || request.urgent() || request.observedAt() == null || request.patientId() == null) {
            return;
        }
        lastDecision = evaluator.evaluate(new OutcomeEvaluator.Input(
                BigDecimal.ZERO,
                BigDecimal.ZERO,
                false,
                request.urgent(),
                request.observedAt()));
        LocalDate date = request.observedAt().atZone(SERVICE_ZONE).toLocalDate();
        if (replay != null) {
            replay.record(
                    request.patientId() + "|" + date,
                    request.patientId(),
                    "measurement",
                    List.of("KEEP", "deficit-0"),
                    "outcome-evaluator",
                    "deficit=" + lastDecision.deficitDeltaKcal());
        }
        if (lastDecision.deficitDeltaKcal() != 0) {
            return;
        }
        try {
            solvedMeals.find(request.patientId(), date);
        } catch (BusinessException missing) {
            return;
        }
        try {
            solvedMeals.save(request.patientId(), date, work.compose(new CreateRecommendationReq(
                    request.patientId(),
                    request.patientVersion(),
                    null,
                    null,
                    2,
                    null,
                    date,
                    SERVICE_ZONE.getId(),
                    null)));
        } catch (BusinessException error) {
            return;
        }
    }

    /** 最近一次测量形成的决策。热量缺口保持为 0。 */
    public OutcomeEvaluator.Evaluation lastDecision() {
        return lastDecision;
    }
}
