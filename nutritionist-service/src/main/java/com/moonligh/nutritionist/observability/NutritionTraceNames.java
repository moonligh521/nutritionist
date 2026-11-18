package com.moonligh.nutritionist.observability;

/**
 * 营养对话/检索稳定 span 名。Langfuse 与挂号同项目，按名字筛选回归。
 */
public final class NutritionTraceNames {

    public static final String TURN = "nutrition.turn";
    /** 问餐同步链根 span（与 TURN 同开，便于筛选）。 */
    public static final String ASK_MEAL = "nutrition.ask_meal";
    public static final String MEMORY_EXTRACT = "nutrition.memory.extract";
    public static final String MEMORY_COMMIT = "nutrition.memory.commit";
    public static final String MEMORY_REFRESH = "nutrition.memory.refresh";
    public static final String MEMORY_ANSWER = "nutrition.memory.answer";
    public static final String UNDERSTAND = "nutrition.understand";
    public static final String PLAN = "nutrition.plan";
    public static final String EXECUTE = "nutrition.execute";
    public static final String SESSION_SAVE = "nutrition.session.save";
    public static final String RECALL = "nutrition.recall";
    public static final String RECALL_NARROW = "nutrition.recall.narrow";
    public static final String RECALL_RANK = "nutrition.recall.rank";

    private NutritionTraceNames() {
    }
}
