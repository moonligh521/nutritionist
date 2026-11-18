package com.moonligh.nutritionist.domain.dialogue;

/** 理解层可产出、规划层可执行的任务类型。 */
public enum TaskType {
    GREETING,
    OUT_OF_SCOPE,
    RECOMMEND,
    REPLACE_ONE,
    ADD_KIND,
    MISSING,
    SUBSTITUTE,
    CONFIRM_FOODS
}
