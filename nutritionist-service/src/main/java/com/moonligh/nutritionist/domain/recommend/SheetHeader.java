package com.moonligh.nutritionist.domain.recommend;

import java.util.ArrayList;
import java.util.List;

/** CSV 表头：列名与下标的类型化索引。 */
public final class SheetHeader {

    private final List<Column> columns;

    private SheetHeader(List<Column> columns) {
        this.columns = List.copyOf(columns);
    }

    public static SheetHeader from(List<String> cells) {
        List<Column> columns = new ArrayList<>();
        if (cells != null) {
            for (int index = 0; index < cells.size(); index++) {
                String name = cells.get(index) == null ? "" : cells.get(index).trim();
                if (!name.isBlank()) {
                    columns.add(new Column(name, index));
                }
            }
        }
        return new SheetHeader(columns);
    }

    public void require(String name) {
        if (indexOf(name) < 0) {
            throw new IllegalArgumentException("表头缺少" + name);
        }
    }

    public String cell(List<String> cells, String name) {
        int index = indexOf(name);
        if (index < 0 || cells == null || index >= cells.size()) {
            return "";
        }
        String value = cells.get(index);
        return value == null ? "" : value.trim();
    }

    private int indexOf(String name) {
        if (name == null || name.isBlank()) {
            return -1;
        }
        for (Column column : columns) {
            if (column.name().equals(name)) {
                return column.index();
            }
        }
        return -1;
    }

    public record Column(String name, int index) {
    }
}
