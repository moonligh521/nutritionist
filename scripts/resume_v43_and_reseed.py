# -*- coding: utf-8 -*-
"""幂等续跑：把仍为 VARCHAR 的 recipe_id 子表迁到 BIGINT，再灌 5k 测试菜。"""
from __future__ import annotations

import re
import sys
from datetime import datetime
from pathlib import Path

import pymysql
import yaml

ROOT = Path(__file__).resolve().parents[1]
LOCAL = ROOT / "config" / "application-local.yml"
CSV = ROOT / "nutritionist-service" / "src" / "test" / "resources" / "testdata" / "nutrition_recipe_5k.csv"
MARKER = "[vec5k]"

CHILD_TABLES = [
    ("recipe_version", "uk_recipe_version", "(recipe_id, version)"),
    ("recipe_ingredient", None, None),
    ("recipe_step", "uk_recipe_step", "(recipe_id, recipe_version, step_no)"),
    ("recipe_step_dependency", "uk_recipe_step_dependency", "(recipe_id, recipe_version, step_no, depends_on_step_no)"),
    ("recipe_equipment_variant", "uk_recipe_equipment", "(recipe_id, recipe_version, equipment_code)"),
    ("recipe_nutrition_result", "uk_recipe_nutrition", "(recipe_id, recipe_version, nutrient_code)"),
    ("solved_meal_dish", None, None),
    ("recipe_search_chunk", None, None),
]


def log(msg: str) -> None:
    print(msg, flush=True)


def connect():
    raw = yaml.safe_load(LOCAL.read_text(encoding="utf-8"))
    ds = raw["spring"]["datasource"]
    m = re.match(r"jdbc:mysql://([^:/]+):?(\d+)?/([^?]+)", ds["url"])
    return pymysql.connect(
        host=m.group(1),
        port=int(m.group(2) or 3306),
        user=ds["username"],
        password=str(ds["password"]),
        database=m.group(3),
        charset="utf8mb4",
        autocommit=False,
        connect_timeout=20,
        read_timeout=600,
        write_timeout=600,
    )


def table_exists(cur, table: str) -> bool:
    cur.execute(
        """
        SELECT 1 FROM information_schema.TABLES
        WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = %s
        """,
        (table,),
    )
    return cur.fetchone() is not None


def col_type(cur, table: str, column: str) -> str | None:
    cur.execute(
        """
        SELECT DATA_TYPE FROM information_schema.COLUMNS
        WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = %s AND COLUMN_NAME = %s
        """,
        (table, column),
    )
    row = cur.fetchone()
    return row[0] if row else None


def index_exists(cur, table: str, index: str) -> bool:
    cur.execute(
        """
        SELECT 1 FROM information_schema.STATISTICS
        WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = %s AND INDEX_NAME = %s
        LIMIT 1
        """,
        (table, index),
    )
    return cur.fetchone() is not None


def migrate_child(conn, table: str, unique_name: str | None, unique_cols: str | None) -> None:
    cur = conn.cursor()
    if not table_exists(cur, table):
        log(f"skip missing table {table}")
        return
    rid_type = col_type(cur, table, "recipe_id")
    ref_type = col_type(cur, table, "recipe_ref")
    if rid_type in ("bigint", "int") and ref_type is None:
        log(f"ok {table}.recipe_id already bigint")
        return
    if rid_type is None and ref_type in ("bigint", "int"):
        # 上次停在 CHANGE 前
        log(f"finish rename recipe_ref -> recipe_id on {table}")
        cur.execute(
            f"ALTER TABLE {table} CHANGE COLUMN recipe_ref recipe_id BIGINT NOT NULL COMMENT '菜谱主键，对应 recipe.id'"
        )
        conn.commit()
        if unique_name and unique_cols and not index_exists(cur, table, unique_name):
            cur.execute(f"ALTER TABLE {table} ADD UNIQUE KEY {unique_name} {unique_cols}")
            conn.commit()
        if table == "recipe_search_chunk" and not index_exists(cur, table, "PRIMARY"):
            cur.execute(f"ALTER TABLE {table} ADD PRIMARY KEY (recipe_id)")
            conn.commit()
        return

    if rid_type and rid_type not in ("bigint", "int"):
        if ref_type is None:
            log(f"add recipe_ref on {table}")
            if table == "recipe_search_chunk":
                cur.execute(
                    "ALTER TABLE recipe_search_chunk ADD COLUMN recipe_ref BIGINT NULL COMMENT '菜谱主键，对应 recipe.id' FIRST"
                )
            elif table == "solved_meal_dish":
                cur.execute(
                    "ALTER TABLE solved_meal_dish ADD COLUMN recipe_ref BIGINT NULL COMMENT '菜谱主键，对应 recipe.id' AFTER meal_date"
                )
            else:
                cur.execute(
                    f"ALTER TABLE {table} ADD COLUMN recipe_ref BIGINT NULL COMMENT '菜谱主键，对应 recipe.id' AFTER id"
                )
            conn.commit()
        log(f"backfill {table}")
        # recipe 可能仍有 varchar recipe_id，或已删除仅剩 id
        recipe_biz = col_type(cur, "recipe", "recipe_id")
        if recipe_biz and recipe_biz not in ("bigint", "int"):
            cur.execute(
                f"""
                UPDATE {table} child
                INNER JOIN recipe r ON r.recipe_id = child.recipe_id
                SET child.recipe_ref = r.id
                """
            )
        else:
            # 业务菜号已删：无法回填字符串键；清空孤儿
            log(f"warn {table}: recipe.recipe_id gone; cannot join string keys")
        conn.commit()
        cur.execute(f"DELETE FROM {table} WHERE recipe_ref IS NULL")
        conn.commit()
        if unique_name and index_exists(cur, table, unique_name):
            cur.execute(f"ALTER TABLE {table} DROP INDEX {unique_name}")
            conn.commit()
        if table == "recipe_search_chunk" and index_exists(cur, table, "PRIMARY"):
            cur.execute("ALTER TABLE recipe_search_chunk DROP PRIMARY KEY")
            conn.commit()
        if col_type(cur, table, "recipe_id") is not None:
            cur.execute(f"ALTER TABLE {table} DROP COLUMN recipe_id")
            conn.commit()
        cur.execute(
            f"ALTER TABLE {table} CHANGE COLUMN recipe_ref recipe_id BIGINT NOT NULL COMMENT '菜谱主键，对应 recipe.id'"
        )
        conn.commit()
        if unique_name and unique_cols and not index_exists(cur, table, unique_name):
            cur.execute(f"ALTER TABLE {table} ADD UNIQUE KEY {unique_name} {unique_cols}")
            conn.commit()
        if table == "recipe_search_chunk" and not index_exists(cur, table, "PRIMARY"):
            cur.execute("ALTER TABLE recipe_search_chunk ADD PRIMARY KEY (recipe_id)")
            conn.commit()
        log(f"migrated {table}")
        return
    log(f"noop {table} rid={rid_type} ref={ref_type}")


def drop_recipe_business_id(conn) -> None:
    cur = conn.cursor()
    dtype = col_type(cur, "recipe", "recipe_id")
    if dtype is None:
        log("recipe.recipe_id already dropped")
        return
    if dtype in ("bigint", "int"):
        log("unexpected numeric recipe.recipe_id on recipe table; skip drop")
        return
    if index_exists(cur, "recipe", "uk_recipe_id"):
        cur.execute("ALTER TABLE recipe DROP INDEX uk_recipe_id")
        conn.commit()
    cur.execute("ALTER TABLE recipe DROP COLUMN recipe_id")
    conn.commit()
    log("dropped recipe.recipe_id")


def ensure_flyway_43(conn) -> None:
    cur = conn.cursor()
    if not table_exists(cur, "flyway_schema_history"):
        return
    cur.execute("SELECT 1 FROM flyway_schema_history WHERE version = '43' LIMIT 1")
    if cur.fetchone():
        log("flyway 43 already recorded")
        return
    cur.execute("SELECT COALESCE(MAX(installed_rank), 0) + 1 FROM flyway_schema_history")
    rank = cur.fetchone()[0]
    cur.execute(
        """
        INSERT INTO flyway_schema_history
          (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success)
        VALUES
          (%s, '43', 'recipe id to bigint', 'SQL', 'V43__recipe_id_to_bigint.sql', NULL, 'reseed', NOW(), 1, 1)
        """,
        (rank,),
    )
    conn.commit()
    log(f"recorded flyway 43 rank={rank}")


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
        if item.get("示例") == "是" or not item.get("菜名"):
            continue
        rows.append(item)
    return rows


def clear_previous_seed(conn) -> int:
    cur = conn.cursor()
    cur.execute("SELECT id FROM recipe WHERE display_name LIKE %s", (MARKER + "%",))
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
        if not table_exists(cur, table):
            continue
        try:
            cur.execute(f"DELETE FROM {table} WHERE recipe_id IN ({placeholders})", ids)
        except Exception as exc:
            log(f"clear warn {table}: {exc}")
    cur.execute(f"DELETE FROM recipe WHERE id IN ({placeholders})", ids)
    conn.commit()
    return len(ids)


def insert_and_rewrite(conn, rows: list[dict]) -> None:
    now = datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f")[:-3]
    mapped: list[tuple[str, dict]] = []
    cur = conn.cursor()
    for row in rows:
        name = MARKER + row["菜名"]
        cur.execute(
            "INSERT INTO recipe (display_name, current_version, created_at) VALUES (%s,%s,%s)",
            (name, "1", now),
        )
        rid = cur.lastrowid
        cur.execute(
            "INSERT INTO recipe_version (recipe_id, version, status_code, approved_at) VALUES (%s,'1',2,%s)",
            (rid, now),
        )
        cookware = (row.get("厨具") or "锅")[:64]
        step = (row.get("做法") or "按菜名烹制。")[:2000]
        if table_exists(cur, "recipe_equipment_variant"):
            cur.execute(
                """
                INSERT INTO recipe_equipment_variant (recipe_id, recipe_version, equipment_code, variant_text)
                VALUES (%s,'1',%s,%s)
                """,
                (rid, cookware, f"按已发布步骤使用{cookware}。"),
            )
        cur.execute(
            """
            INSERT INTO recipe_step (recipe_id, recipe_version, step_no, instruction_text)
            VALUES (%s,'1',1,%s)
            """,
            (rid, step),
        )
        mapped.append((str(rid), row))
        if len(mapped) % 200 == 0:
            conn.commit()
            log(f"mysql inserted {len(mapped)}/{len(rows)}")
    conn.commit()
    header = "菜号,菜名,种类,菜系,标签,适合,不适合,主料,辅料,调味,做法,厨具,示例"
    lines = [
        "# 由 resume_v43_and_reseed.py 生成：菜号=MySQL recipe.id",
        header,
    ]
    for rid, row in mapped:
        lines.append(
            ",".join(
                [
                    rid,
                    row["菜名"],
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
    CSV.write_text("\n".join(lines) + "\n", encoding="utf-8-sig")
    log(f"csv rewritten count={len(mapped)} range={mapped[0][0]}..{mapped[-1][0]}")


def main() -> None:
    conn = connect()
    log("connected")
    try:
        for table, uniq, cols in CHILD_TABLES:
            migrate_child(conn, table, uniq, cols)
        drop_recipe_business_id(conn)
        ensure_flyway_43(conn)
        removed = clear_previous_seed(conn)
        log(f"cleared previous seed={removed}")
        source = parse_csv_rows(CSV)
        log(f"source rows={len(source)}")
        insert_and_rewrite(conn, source)
        log("mysql reseed complete")
    finally:
        conn.close()


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        log(f"FAILED {type(exc).__name__}: {exc}")
        sys.exit(1)
