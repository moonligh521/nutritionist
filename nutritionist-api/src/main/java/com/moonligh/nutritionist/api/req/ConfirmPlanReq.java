package com.moonligh.nutritionist.api.req;

/** 确认一份已经算好的方案。确认不等于已经吃下去。 */
public record ConfirmPlanReq(
        /** 待确认的方案版本。 */
        String planVersion,
        /** 确认时库存版本。版本不一致则拒绝确认。 */
        String pantryVersion,
        /** 确认时画像版本。 */
        String profileVersion) {
}
