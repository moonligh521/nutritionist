package com.moonligh.nutritionist.domain.dialogue;

/** 饮食偏好极性：与临床过敏、subjectType 分开。 */
public enum PreferencePolarity {
    /** 不喜欢 / 不想吃（负向偏好，非过敏） */
    AVOID,
    /** 喜欢 / 最喜欢（正向偏好） */
    LIKE,
    /** 不再强调喜欢或厌恶；不等于 LIKE */
    NEUTRAL
}
