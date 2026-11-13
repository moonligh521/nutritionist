package com.moonligh.nutritionist.domain.workflow;

/**
 * Java 固定的推荐循环。模型不能增删步骤，也不能回到求解。
 */
public enum WorkflowStep {
    PERCEIVE_INPUT,
    ASSESS_SAFETY,
    BUILD_TARGETS,
    ALLOCATE_MEAL_BUDGET,
    BUILD_CANDIDATES,
    SOLVE,
    VALIDATE_PRACTICALITY,
    VALIDATE_SOLUTION,
    BUILD_TUTORIAL,
    GENERATE_PRESENTATION,
    REVALIDATE_OUTPUT,
    COMPLETE
}
