package com.moonligh.nutritionist.api.res;

import java.util.List;

/** 库存快照。版本变化表示库存已更新。 */
public record PantrySnapshotRes(
        /** 库存版本。配餐与方案确认时须携带。 */
        String pantryVersion,
        /** 当前所有批次。 */
        List<PantryItemRes> items) {

    public PantrySnapshotRes {
        items = List.copyOf(items);
    }
}
