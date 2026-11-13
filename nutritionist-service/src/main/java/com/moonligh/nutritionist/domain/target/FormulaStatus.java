package com.moonligh.nutritionist.domain.target;

public enum FormulaStatus {
    DRAFT(1),
    CLINICAL_REVIEW(2),
    TESTED(3),
    PUBLISHED(4),
    RETIRED(5);

    private final int code;

    FormulaStatus(int code) {
        this.code = code;
    }

    public int code() {
        return code;
    }
}
