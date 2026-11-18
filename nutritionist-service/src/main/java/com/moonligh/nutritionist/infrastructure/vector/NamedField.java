package com.moonligh.nutritionist.infrastructure.vector;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** 向量库标量字段：名称 + 值。仅在对接 VectorDocument 时转 Map。 */
public record NamedField(String name, String value) {

    public NamedField {
        name = name == null ? "" : name;
        value = value == null ? "" : value;
    }

    public static Map<String, String> toMap(List<NamedField> fields) {
        Map<String, String> map = new LinkedHashMap<>();
        if (fields == null) {
            return map;
        }
        for (NamedField field : fields) {
            if (field != null && !field.name().isBlank()) {
                map.put(field.name(), field.value());
            }
        }
        return map;
    }

    public static Map<String, String> descriptionsToMap(List<FieldDescription> descriptions) {
        Map<String, String> map = new LinkedHashMap<>();
        if (descriptions == null) {
            return map;
        }
        for (FieldDescription item : descriptions) {
            if (item != null && !item.name().isBlank()) {
                map.put(item.name(), item.description());
            }
        }
        return map;
    }

    public record FieldDescription(String name, String description) {
        public FieldDescription {
            name = name == null ? "" : name;
            description = description == null ? "" : description;
        }
    }

    public record NamedStringList(String name, List<String> values) {
        public NamedStringList {
            name = name == null ? "" : name;
            values = values == null ? List.of() : List.copyOf(values);
        }

        public static Map<String, List<String>> toMap(List<NamedStringList> fields) {
            Map<String, List<String>> map = new LinkedHashMap<>();
            if (fields == null) {
                return map;
            }
            for (NamedStringList field : fields) {
                if (field != null && !field.name().isBlank()) {
                    map.put(field.name(), field.values());
                }
            }
            return map;
        }
    }

    public static List<NamedField> of(NamedField... fields) {
        List<NamedField> list = new ArrayList<>();
        if (fields != null) {
            for (NamedField field : fields) {
                if (field != null) {
                    list.add(field);
                }
            }
        }
        return List.copyOf(list);
    }
}
