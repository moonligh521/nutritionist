package com.moonligh.nutritionist.domain.target;

public record FormulaDefinition(String formulaId, String version, FormulaStatus status) {

    public static FormulaDefinition published(String formulaId) {
        return new FormulaDefinition(formulaId, "1", FormulaStatus.PUBLISHED);
    }
}
