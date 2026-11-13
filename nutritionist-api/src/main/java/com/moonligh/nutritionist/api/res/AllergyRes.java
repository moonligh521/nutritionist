package com.moonligh.nutritionist.api.res;

/** 一条已保存的过敏记录。 */
public record AllergyRes(
        /** 过敏记录编号。 */
        String allergyId,
        /** 记录版本。 */
        String version,
        /** 是否已确认。 */
        boolean confirmed) {
}
