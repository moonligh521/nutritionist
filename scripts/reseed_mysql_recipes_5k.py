# -*- coding: utf-8 -*-
"""把 nutrition_recipe_5k.csv 先写入 MySQL（拿真实自增 id），再回写 CSV 供向量灌库。"""
from __future__ import annotations

import re
from datetime import datetime
from pathlib import Path

import pymysql

ROOT = Path(__file__).resolve().parents[1]
LOCAL = ROOT / "config" / "application-local.yml"
CSV = ROOT / "nutritionist-service" / "src" / "test" / "resources" / "testdata" / "nutrition_recipe_5k.csv"
V43 = ROOT / "nutritionist-service" / "src" / "main" / "resources" / "db" / "migration" / "V43__recipe_id_to_bigint.sql"
MARKER = "[vec5k]"  # 写入 display_name 前缀，便于重复灌溉时清理


def load_jdbc() -> tuple[str, int, str, str, str]:
    import yaml

    raw = yaml.safe_load(LOCAL.read_text(encoding="utf-8"))
    ds = (raw.get("spring") or {}).get("datasource") or raw.get("datasource")
    if not isinstance(ds, dict):
        # 兼容顶层未包 spring 的写法：扫描嵌套
        def find_ds(node):
            if isinstance(node, dict):
                if "url" in node and "username" in node and str(node.get("url", "")).startswith("jdbc:mysql"):
                    return node
                for value in node.values():
                    found = find_ds(value)
                    if found:
                        return found
            return None

        ds = find_ds(raw)
    if not ds:
        raise SystemExit("application-local.yml 缺少 datasource")
    jdbc = str(ds["url"])
    user = str(ds["username"])
    password = str(ds["password"])
    m = re.match(r"jdbc:mysql://([^:/]+):?(\d+)?/([^?]+)", jdbc)
    if not m:
        raise SystemExit("无法解析 jdbc url: " + jdbc)
    host, port, db = m.group(1), int(m.group(2) or 3306), m.group(3)
    return host, port, db, user, password


def column_type(conn, table: str, column: str) -> str | None:
    with conn.cursor() as cur:
        cur.execute(
            """
            SELECT DATA_TYPE FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME=%s AND COLUMN_NAME=%s
            """,
            (table, column),
        )
        row = cur.fetchone()
        return row[0] if row else None


def apply_v43_if_needed(conn) -> None:
    # 旧 schema：recipe 仍有字符串业务菜号列 recipe_id
    dtype = column_type(conn, "recipe", "recipe_id")
    if dtype is None:
        print("V43 already applied (recipe.recipe_id absent)", flush=True)
        return
    if dtype in ("bigint", "int"):
        print("V43 already applied (recipe.recipe_id is numeric — unexpected); skip", flush=True)
        return
    print(f"applying V43 (recipe.recipe_id type={dtype})...", flush=True)
    sql = V43.read_text(encoding="utf-8")
    statements = []
    for block in sql.split(";"):
        lines = [
            ln
            for ln in block.splitlines()
            if ln.strip() and not ln.strip().startswith("--")
        ]
        stmt = "\n".join(lines).strip()
        if stmt:
            statements.append(stmt)
    with conn.cursor() as cur:
        for i, stmt in enumerate(statements, 1):
            preview = " ".join(stmt.split())[:80]
            print(f"V43 [{i}/{len(statements)}] {preview}", flush=True)
            cur.execute(stmt)
            conn.commit()
    print(f"V43 applied, statements={len(statements)}", flush=True)


def parse_csv_rows(path: Path) -> list[dict]:
    text = path.read_text(encoding="utf-8-sig")
    rows = []
    header = None
    for line in text.splitlines():
        raw = line.strip()
        if not raw or raw.startswith("#"):
            continue
        cells = raw.split(",")
        if header is None:
            header = cells
            continue
        item = {header[i]: (cells[i] if i < len(cells) else "") for i in range(len(header))}
        if item.get("示例") == "是":
            continue
        if not item.get("菜名"):
            continue
        rows.append(item)
    return rows


def clear_previous_seed(conn) -> int:
    with conn.cursor() as cur:
        cur.execute(
            "SELECT id FROM recipe WHERE display_name LIKE %s",
            (MARKER + "%",),
        )
        ids = [r[0] for r in cur.fetchall()]
        if not ids:
            return 0
        placeholders = ",".join(["%s"] * len(ids))
        for table in (
            "recipe_search_chunk",
            "recipe_nutrition_result",
            "recipe_equipment_variant",
            "recipe_step_dependency",
            "recipe_step",
            "recipe_ingredient",
            "recipe_version",
            "solved_meal_dish",
        ):
            # solved_meal_dish / search_chunk 可能无对应行
            try:
                cur.execute(f"DELETE FROM {table} WHERE recipe_id IN ({placeholders})", ids)
            except pymysql.err.ProgrammingError:
                pass
        cur.execute(f"DELETE FROM recipe WHERE id IN ({placeholders})", ids)
    conn.commit()
    return len(ids)


def insert_recipes(conn, rows: list[dict]) -> list[tuple[str, dict]]:
    """返回 [(数字id, 原行), ...]"""
    now = datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f")[:-3]
    out: list[tuple[str, dict]] = []
    with conn.cursor() as cur:
        for row in rows:
            name = MARKER + row["菜名"]
            cur.execute(
                "INSERT INTO recipe (display_name, current_version, created_at) VALUES (%s,%s,%s)",
                (name, "1", now),
            )
            rid = cur.lastrowid
            cur.execute(
                """
                INSERT INTO recipe_version (recipe_id, version, status_code, approved_at)
                VALUES (%s,'1',2,%s)
                """,
                (rid, now),
            )
            cookware = row.get("厨具") or "锅"
            step = row.get("做法") or "按菜名烹制。"
            cur.execute(
                """
                INSERT INTO recipe_equipment_variant (recipe_id, recipe_version, equipment_code, variant_text)
                VALUES (%s,'1',%s,%s)
                """,
                (rid, cookware[:64], f"按已发布步骤使用{cookware}。"),
            )
            cur.execute(
                """
                INSERT INTO recipe_step (recipe_id, recipe_version, step_no, instruction_text)
                VALUES (%s,'1',1,%s)
                """,
                (rid, step[:2000]),
            )
            out.append((str(rid), row))
            if len(out) % 200 == 0:
                conn.commit()
                print(f"mysql inserted {len(out)}/{len(rows)}", flush=True)
    conn.commit()
    return out


def write_csv(path: Path, mapped: list[tuple[str, dict]]) -> None:
    header = "菜号,菜名,种类,菜系,标签,适合,不适合,主料,辅料,调味,做法,厨具,示例"
    lines = [
        "# 由 reseed_mysql_recipes_5k.py 生成：菜号=MySQL recipe.id；菜名带 [vec5k] 前缀便于清理。",
        header,
    ]
    for rid, row in mapped:
        name = row["菜名"]
        if not name.startswith(MARKER):
            # CSV 对外仍用原菜名；库内 display_name 带 marker
            pass
        lines.append(
            ",".join(
                [
                    rid,
                    name,
                    row.get("种类", "菜"),
                    row.get("菜系", "家常"),
                    row.get("标签", ""),
                    row.get("适合", ""),
                    row.get("不适合", ""),
                    row.get("主料", ""),
                    row.get("辅料", ""),
                    row.get("调味", ""),
                    (row.get("做法") or "").replace(",", "，"),
                    row.get("厨具", "锅"),
                    "",
                ]
            )
        )
    path.write_text("\n".join(lines) + "\n", encoding="utf-8-sig")


def main() -> None:
    import sys

    def log(msg: str) -> None:
        print(msg, flush=True)

    if not CSV.is_file():
        raise SystemExit(f"missing csv: {CSV}")
    host, port, db, user, password = load_jdbc()
    log(f"connecting {host}:{port}/{db} as {user}")
    conn = pymysql.connect(
        host=host,
        port=port,
        user=user,
        password=password,
        database=db,
        charset="utf8mb4",
        autocommit=False,
        connect_timeout=15,
        read_timeout=600,
        write_timeout=600,
    )
    log("connected")
    try:
        apply_v43_if_needed(conn)
        removed = clear_previous_seed(conn)
        log(f"cleared previous {MARKER} recipes: {removed}")
        source = parse_csv_rows(CSV)
        log(f"source csv rows={len(source)}")
        mapped = insert_recipes(conn, source)
        write_csv(CSV, mapped)
        log(f"wrote {CSV} with real recipe.id count={len(mapped)}")
        if mapped:
            log(f"id range {mapped[0][0]} .. {mapped[-1][0]}")
    finally:
        conn.close()
        log("done")


if __name__ == "__main__":
    main()
