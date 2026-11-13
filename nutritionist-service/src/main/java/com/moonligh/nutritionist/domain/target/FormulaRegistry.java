package com.moonligh.nutritionist.domain.target;

import java.util.List;

public class FormulaRegistry {

    private final List<FormulaDefinition> formulas;

    public FormulaRegistry(List<FormulaDefinition> formulas) {
        this.formulas = List.copyOf(formulas);
    }

    public List<FormulaDefinition> published() {
        return formulas.stream()
                .filter(formula -> formula.status() == FormulaStatus.PUBLISHED)
                .toList();
    }
}
