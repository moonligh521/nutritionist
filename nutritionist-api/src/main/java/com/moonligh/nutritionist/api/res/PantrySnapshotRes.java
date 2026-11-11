package com.moonligh.nutritionist.api.res;

import java.util.List;

public record PantrySnapshotRes(String pantryVersion, List<PantryItemRes> items) {

    public PantrySnapshotRes {
        items = List.copyOf(items);
    }
}
