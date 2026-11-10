package com.moonligh.nutritionist.common;

/**
 * 业务错误码。1xxx 通用，21xx～30xx 营养域。
 */
public enum ErrorCode {

    UNKNOWN_ERROR(1000, "未知错误"),
    PARAM_INVALID(1001, "参数校验失败"),
    PARAM_MISSING(1002, "缺少必填参数"),
    TOO_MANY_REQUESTS(1003, "请求太频繁，请稍后再试。"),
    SERVICE_BUSY(1004, "服务繁忙，请稍后再试。"),

    PATIENT_NOT_BOUND(2101, "未绑定就诊人"),
    PATIENT_VERSION_CONFLICT(2102, "患者版本已变化"),
    PROFILE_VERSION_CONFLICT(2103, "画像版本冲突"),

    SAFETY_NOT_ALLOWED(2201, "当次安全许可不允许自动配餐"),
    MEDICATION_RULE_NOT_COVERED(2202, "药物场景无已发布规则"),

    TARGET_RULE_MISSING(2301, "无已发布目标规则"),
    PROFESSIONAL_TARGET_REQUIRED(2302, "需要专业目标"),

    FOOD_DATA_REJECTED(2401, "关键营养数据未达门槛"),
    RECIPE_NOT_PUBLISHED(2402, "菜谱未发布或已失效"),

    PANTRY_VERSION_CONFLICT(2501, "库存版本冲突"),
    PANTRY_RESERVATION_FAILED(2502, "预留失败"),

    RECOMMENDATION_IN_PROGRESS(2601, "同范围任务单飞中"),
    RECOMMENDATION_EXPIRED(2602, "提交前版本复核失败"),
    SOLVER_INFEASIBLE(2603, "硬约束无解"),
    IDEMPOTENCY_CONFLICT(2604, "同键不同请求体"),

    PLAN_NOT_CONFIRMABLE(2701, "方案状态不可确认"),

    COOKING_DEVIATION_UNSUPPORTED(2801, "当前版本不接受执行偏差"),

    KILL_SWITCH_ACTIVE(3001, "能力已紧急停止");

    private final int code;
    private final String message;

    ErrorCode(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
