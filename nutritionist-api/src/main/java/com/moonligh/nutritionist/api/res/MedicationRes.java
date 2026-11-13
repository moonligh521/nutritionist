package com.moonligh.nutritionist.api.res;

/** 一条已保存的用药记录。 */
public record MedicationRes(
        /** 用药记录编号。 */
        String medicationId,
        /** 记录版本。 */
        String version,
        /** 用药信息是否已确认完整。 */
        boolean completeConfirmed) {
}
