package com.moonligh.nutritionist.api.req;

import java.util.List;

/** 用户确认识别草稿后，才把食材写入正式库存。 */
public record ConfirmPantryReq(
        /** 患者标识。 */
        String patientId,
        /** 患者主数据版本。 */
        String patientVersion,
        /** 要确认的识别草稿编号。 */
        String draftId,
        /** 用户核对后的食材列表。 */
        List<ConfirmedPantryItemReq> items) {

    public ConfirmPantryReq {
        items = items == null ? List.of() : List.copyOf(items);
    }
}
