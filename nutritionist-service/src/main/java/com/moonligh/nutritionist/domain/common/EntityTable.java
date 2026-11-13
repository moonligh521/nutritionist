package com.moonligh.nutritionist.domain.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.Supplier;

/**
 * 按编号存放实体的小表。
 * 业务代码用 find / save，不直接使用 Map。
 * 方法都加了锁，多个请求同时读写也不会把同一行写乱。
 */
public final class EntityTable<T> {

    private final List<T> rows = new ArrayList<>();
    private final Function<T, String> idOf;

    public EntityTable(Function<T, String> idOf) {
        this.idOf = idOf;
    }

    public synchronized T findOrCreate(String id, Supplier<T> factory) {
        Optional<T> found = find(id);
        if (found.isPresent()) {
            return found.get();
        }
        T created = factory.get();
        rows.add(created);
        return created;
    }

    public synchronized Optional<T> find(String id) {
        for (T row : rows) {
            if (idOf.apply(row).equals(id)) {
                return Optional.of(row);
            }
        }
        return Optional.empty();
    }

    /** 有同一编号就换成新的一行，没有就追加。 */
    public synchronized void save(T row) {
        String id = idOf.apply(row);
        for (int index = 0; index < rows.size(); index++) {
            if (idOf.apply(rows.get(index)).equals(id)) {
                rows.set(index, row);
                return;
            }
        }
        rows.add(row);
    }

    /** 编号已存在时不覆盖，返回 false。用来防止同一件事写两次。 */
    public synchronized boolean saveIfAbsent(T row) {
        if (find(idOf.apply(row)).isPresent()) {
            return false;
        }
        rows.add(row);
        return true;
    }

    public synchronized List<T> all() {
        return List.copyOf(rows);
    }

    public synchronized int size() {
        return rows.size();
    }

    public synchronized void remove(String id) {
        rows.removeIf(row -> idOf.apply(row).equals(id));
    }

    public synchronized void removeIf(Predicate<T> match) {
        rows.removeIf(match);
    }
}
