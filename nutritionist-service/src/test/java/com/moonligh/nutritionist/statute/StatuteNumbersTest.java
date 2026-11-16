package com.moonligh.nutritionist.statute;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class StatuteNumbersTest {

    @Test
    void readsChineseAndArabicArticleNumbers() {
        assertEquals(13, StatuteNumbers.parse("第十三条"));
        assertEquals(143, StatuteNumbers.parse("第一百四十三条"));
        assertEquals(143, StatuteNumbers.parse("143"));
        assertEquals(1254, StatuteNumbers.parse("第一千二百五十四条"));
    }
}
