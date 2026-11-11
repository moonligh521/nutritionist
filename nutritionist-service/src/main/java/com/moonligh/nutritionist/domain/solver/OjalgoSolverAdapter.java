package com.moonligh.nutritionist.domain.solver;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.ojalgo.optimisation.Expression;
import org.ojalgo.optimisation.ExpressionsBasedModel;
import org.ojalgo.optimisation.Optimisation;
import org.ojalgo.optimisation.Variable;
import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.nutrition.NutrientType;

@Component
public class OjalgoSolverAdapter implements NutritionSolver {

    @Override
    public SolverResult solve(SolverRequest request) {
        validate(request);
        ExpressionsBasedModel model = new ExpressionsBasedModel();
        List<Variable> quantities = request.candidates().stream()
                .map(candidate -> model.addVariable(candidate.candidateId())
                        .lower(BigDecimal.ZERO)
                        .upper(candidate.maximumQuantity()))
                .toList();

        for (SolverConstraint constraint : request.constraints()) {
            Expression amount = model.addExpression(constraint.constraintId());
            addNutrientCoefficients(amount, quantities, request.candidates(), constraint.nutrientType());
            if (constraint.hard()) {
                if (constraint.minimum() != null) {
                    amount.lower(constraint.minimum());
                }
                if (constraint.maximum() != null) {
                    amount.upper(constraint.maximum());
                }
            }
            if (constraint.target() != null) {
                Variable shortage = model.addVariable(constraint.constraintId() + "-shortage")
                        .lower(BigDecimal.ZERO)
                        .weight(1);
                Variable excess = model.addVariable(constraint.constraintId() + "-excess")
                        .lower(BigDecimal.ZERO)
                        .weight(1);
                Expression target = model.addExpression(constraint.constraintId() + "-target")
                        .level(constraint.target());
                addNutrientCoefficients(target, quantities, request.candidates(), constraint.nutrientType());
                target.set(shortage, BigDecimal.ONE);
                target.set(excess, BigDecimal.ONE.negate());
            }
        }

        Optimisation.Result result = model.minimise();
        if (!result.getState().isFeasible()) {
            throw new SolverInfeasibleException(conflicts(request));
        }
        List<SolverResult.CandidateQuantity> selected = new ArrayList<>();
        for (int index = 0; index < request.candidates().size(); index++) {
            selected.add(new SolverResult.CandidateQuantity(
                    request.candidates().get(index).candidateId(),
                    BigDecimal.valueOf(result.doubleValue(index)).stripTrailingZeros()));
        }
        return new SolverResult(selected, BigDecimal.valueOf(result.getValue()));
    }

    private static void addNutrientCoefficients(
            Expression expression,
            List<Variable> variables,
            List<SolverCandidate> candidates,
            NutrientType nutrientType) {
        for (int index = 0; index < candidates.size(); index++) {
            BigDecimal amount = candidates.get(index).nutrients().stream()
                    .filter(nutrient -> nutrient.nutrientType() == nutrientType)
                    .map(CandidateNutrient::amountPerUnit)
                    .findFirst()
                    .orElse(BigDecimal.ZERO);
            expression.set(variables.get(index), amount);
        }
    }

    private static List<SolverConflict> conflicts(SolverRequest request) {
        return request.constraints().stream()
                .filter(SolverConstraint::hard)
                .map(constraint -> {
                    BigDecimal maximum = request.candidates().stream()
                            .map(candidate -> candidate.nutrients().stream()
                                    .filter(nutrient -> nutrient.nutrientType() == constraint.nutrientType())
                                    .map(CandidateNutrient::amountPerUnit)
                                    .findFirst()
                                    .orElse(BigDecimal.ZERO)
                                    .multiply(candidate.maximumQuantity()))
                            .reduce(BigDecimal.ZERO, BigDecimal::add);
                    return new SolverConflict(
                            constraint.constraintId(),
                            constraint.nutrientType(),
                            constraint.minimum(),
                            constraint.maximum(),
                            BigDecimal.ZERO,
                            maximum);
                })
                .toList();
    }

    private static void validate(SolverRequest request) {
        if (request == null || request.candidates().isEmpty() || request.constraints().isEmpty()) {
            throw new IllegalArgumentException("solver request must contain candidates and constraints");
        }
    }
}
