# -*- coding: utf-8 -*-
"""生成约 5000 条可向量化的家常/川菜为主测试菜谱 CSV。"""
from __future__ import annotations

from collections import Counter
from itertools import product
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "nutritionist-service" / "src" / "test" / "resources" / "testdata" / "nutrition_recipe_5k.csv"

MUST = ["土豆", "玉米", "胡萝卜", "白菜", "猪肉", "牛肉", "五花肉", "鸡肉"]
PROTEINS = ["猪肉", "五花肉", "牛肉", "鸡肉", "鸡胸肉", "鸡蛋", "北豆腐", "虾仁", "带鱼", "排骨"]
VEGS = [
    "土豆", "玉米", "胡萝卜", "白菜", "番茄", "青椒", "茄子", "西兰花", "洋葱",
    "芹菜", "豆角", "菠菜", "冬瓜", "黄瓜", "莲藕", "青菜", "豆芽", "冬瓜",
]
SIDES = ["粉丝", "木耳", "香菇", "金针菇", "豆腐干", "粉条", "海带", ""]
METHODS = [
    ("炒", "热锅下油，主料滑炒至断生，再下配菜翻匀，调味出锅。"),
    ("炖", "主料焯水后与配菜同炖至软烂入味，汤汁收浓即可。"),
    ("煮", "汤锅烧开下主料与配菜，小火煮透，调味盛出。"),
    ("蒸", "主料与配菜码盘，上汽蒸至熟透，淋汁即可。"),
    ("烧", "主料煎香后加配菜与调味汁焖烧入味。"),
    ("烩", "汤汁烧开后下主料配菜同烩至软糯入味。"),
]
# 家常、川菜占比拉高
CUISINES = (
    ["家常"] * 8
    + ["川菜"] * 8
    + ["粤菜", "鲁菜", "湘菜", "东北", "苏菜"]
)
KINDS = ["菜", "汤", "主食", "小吃"]
COOKWARE = ["锅", "砂锅", "蒸锅", "炒锅", "电饭煲"]

# 标签/适合：减肥、糖尿病(控糖)、高血压(控盐)、低嘌呤等；含「一菜多病」组合
PROFILE_SETS = [
    ("减肥;减脂;家常", "控糖", ""),
    ("减肥;快手", "控盐", ""),
    ("减脂;家常", "控糖;控盐", ""),
    ("家常;下饭", "控糖", "高嘌呤"),
    ("快手;家常", "控盐", ""),
    ("暖胃;家常", "", ""),
    ("下饭;川味", "", "控糖"),
    ("减肥;清淡", "控糖;控盐", "高嘌呤"),
    # 同一道菜同时服务多种慢病场景
    ("减肥;减脂;清淡", "控糖;控盐;低嘌呤", ""),
    ("家常;快手", "控糖;控盐", ""),
    ("减脂;家常", "控盐;低嘌呤", ""),
    ("减肥;家常", "控糖;低嘌呤", ""),
]

# 必选食材各自都要出现在「单病 / 双病 / 三病」菜里
MULTI_DISEASE_PROFILES = [
    ("减肥;家常", "控糖", ""),
    ("减肥;家常", "控盐", ""),
    ("减脂;清淡", "低嘌呤", ""),
    ("减肥;减脂", "控糖;控盐", ""),
    ("清淡;家常", "控糖;低嘌呤", ""),
    ("清淡;快手", "控盐;低嘌呤", ""),
    ("减肥;清淡;家常", "控糖;控盐;低嘌呤", ""),
]


def row_line(
    rid: str,
    name: str,
    kind: str,
    cuisine: str,
    tags: str,
    suitable: str,
    unsuitable: str,
    mains: str,
    aux: str,
    seasoning: str,
    step: str,
    tool: str,
) -> str:
    step = step.replace(",", "，")
    return ",".join(
        [rid, name, kind, cuisine, tags, suitable, unsuitable, mains, aux, seasoning, step, tool, ""]
    )


def main() -> None:
    rows: list[str] = []
    coverage = Counter()

    def add(
        name: str,
        kind: str,
        cuisine: str,
        mains: str,
        aux: str,
        step: str,
        profile_idx: int,
        tool: str,
    ) -> None:
        if len(rows) >= 5000:
            return
        tags, suitable, unsuitable = PROFILE_SETS[profile_idx % len(PROFILE_SETS)]
        # 川菜多一点麻辣家常感，但仍保留控糖/控盐标签样本
        if cuisine == "川菜" and profile_idx % 5 == 0:
            tags = "家常;下饭;川味"
        if cuisine == "家常" and profile_idx % 4 == 0:
            tags = "减肥;减脂;家常"
            suitable = "控糖;控盐"
            unsuitable = ""
        seasoning = "食盐:2;菜籽油:8" if "蒸" not in step else "食盐:1;生抽:5"
        if suitable == "控盐" or "控盐" in suitable:
            seasoning = "少盐:1;菜籽油:6"
        if "减肥" in tags or "减脂" in tags:
            seasoning = "少油:5;食盐:1"
        rid = str(10001 + len(rows))
        rows.append(
            row_line(rid, name, kind, cuisine, tags, suitable, unsuitable, mains, aux, seasoning, step, tool)
        )
        blob = name + mains + aux
        for item in MUST:
            if item in blob:
                coverage[item] += 1

    # 1) 强制：每个必选食材 × 家常/川菜 × 单病/多病标签
    for must in MUST:
        partners = (VEGS if must in PROTEINS else PROTEINS)[:6]
        for cuisine in ["家常", "川菜"]:
            for profile_i, (tags, suitable, unsuitable) in enumerate(MULTI_DISEASE_PROFILES):
                partner = partners[profile_i % len(partners)]
                method_name, step = METHODS[profile_i % len(METHODS)]
                if must in PROTEINS:
                    mains = f"{must}:120;{partner}:90"
                    name = f"{partner}{method_name}{must}"
                else:
                    mains = f"{partner}:120;{must}:100"
                    name = f"{must}{method_name}{partner}"
                # 多病组合用清淡炖煮，更贴近控糖控盐场景
                if ";" in suitable:
                    kind = "汤" if profile_i % 2 == 0 else "菜"
                    if kind == "汤":
                        name = f"清淡{must}{partner}汤"
                        step = f"少油少盐，{must}与{partner}同煮至软，适合多种饮食限制。"
                    else:
                        name = f"清淡{must}{method_name}{partner}"
                        step = f"少油烹制{must}与{partner}，调味偏淡，兼顾多种慢病餐单。"
                else:
                    kind = "菜"
                # 直接写入指定多病档案，不走默认 PROFILE 轮转
                if len(rows) >= 5000:
                    break
                seasoning = "少油:5;少盐:1" if suitable else "食盐:2;菜籽油:8"
                # 数字菜号：预留 1..10000 给库内正式菜，测试数据从 10001 起
                rid = str(10001 + len(rows))
                rows.append(
                    row_line(
                        rid,
                        name,
                        kind,
                        cuisine,
                        tags,
                        suitable,
                        unsuitable,
                        mains,
                        "木耳:15" if cuisine == "川菜" else "香菇:15",
                        seasoning,
                        step,
                        COOKWARE[len(rows) % len(COOKWARE)],
                    )
                )
                blob = name + mains
                for item in MUST:
                    if item in blob:
                        coverage[item] += 1

    # 1b) 必选食材 × 家常/川菜 × 多种做法（补数量）
    for must in MUST:
        for cuisine in ["家常", "川菜"]:
            for method_name, step in METHODS:
                for partner in (VEGS if must in PROTEINS else PROTEINS)[:8]:
                    if must in PROTEINS:
                        mains = f"{must}:120;{partner}:90"
                        name = f"{partner}{method_name}{must}"
                    else:
                        mains = f"{partner}:120;{must}:100"
                        name = f"{must}{method_name}{partner}"
                    kind = "汤" if method_name in {"煮", "炖"} and coverage[must] % 3 == 0 else "菜"
                    if kind == "汤":
                        name = f"{must}{partner}汤"
                        step = f"清水烧开，下{must}与{partner}煮至熟软，调味即可。"
                    add(
                        name,
                        kind,
                        cuisine,
                        mains,
                        "木耳:20" if cuisine == "川菜" else "香菇:20",
                        step,
                        len(rows),
                        COOKWARE[len(rows) % len(COOKWARE)],
                    )

    # 2) 家常/川菜组合填充到 5000，兼顾减肥/控糖/控盐标签轮转
    for i, (prot, veg, (method_name, step), kind, cuisine) in enumerate(
        product(PROTEINS, VEGS, METHODS, KINDS, ["家常", "川菜", "家常", "川菜", "粤菜", "东北", "湘菜"])
    ):
        if len(rows) >= 5000:
            break
        aux = SIDES[i % len(SIDES)]
        aux = f"{aux}:30" if aux else ""
        name = f"{veg}{method_name}{prot}"
        use_step = step
        if kind == "汤":
            name = f"{veg}{prot}汤"
            use_step = f"汤锅烧开，下{prot}与{veg}，小火煮透调味。"
        elif kind == "主食":
            name = f"{veg}{prot}盖饭"
            use_step = f"{prot}与{veg}炒熟，浇在米饭上即可。"
        elif kind == "小吃":
            name = f"{veg}{prot}饼"
            use_step = f"{prot}馅与{veg}拌匀，烙至两面金黄。"
        add(
            name,
            kind,
            cuisine,
            f"{prot}:110;{veg}:90",
            aux,
            use_step,
            i,
            COOKWARE[i % len(COOKWARE)],
        )

    # 3) 不足则家常补齐
    n = 0
    while len(rows) < 5000:
        prot = PROTEINS[n % len(PROTEINS)]
        veg = VEGS[n % len(VEGS)]
        method_name, step = METHODS[n % len(METHODS)]
        cuisine = "家常" if n % 2 == 0 else "川菜"
        add(
            f"{cuisine}{veg}{prot}{method_name}",
            "菜",
            cuisine,
            f"{prot}:100;{veg}:80",
            "金针菇:25",
            step,
            n,
            COOKWARE[n % len(COOKWARE)],
        )
        n += 1

    assert len(rows) == 5000
    assert all(coverage[m] >= 40 for m in MUST), dict(coverage)

    # 每个必选食材都要能在「多病适合」菜里查到
    multi_disease_hits = Counter()
    for line in rows:
        parts = line.split(",")
        if len(parts) < 8:
            continue
        suitable = parts[5]
        mains = parts[7]
        if suitable.count(";") < 1:
            continue
        for item in MUST:
            if item in mains or item in parts[1]:
                multi_disease_hits[item] += 1
    assert all(multi_disease_hits[m] >= 3 for m in MUST), dict(multi_disease_hits)

    OUT.parent.mkdir(parents=True, exist_ok=True)
    header = "菜号,菜名,种类,菜系,标签,适合,不适合,主料,辅料,调味,做法,厨具,示例"
    text = "\n".join(
        [
            "# 测试菜谱约 5000 道：菜号为数字（自 10001 起，对齐 MySQL recipe.id 形态）；含家常/川菜与多病标签。",
            header,
            *rows,
            "",
        ]
    )
    OUT.write_text(text, encoding="utf-8-sig")
    home = sum(1 for r in rows if ",家常," in r)
    chuan = sum(1 for r in rows if ",川菜," in r)
    jianfei = sum(1 for r in rows if "减肥" in r)
    ketang = sum(1 for r in rows if "控糖" in r)
    keyan = sum(1 for r in rows if "控盐" in r)
    duobing = sum(1 for r in rows if r.split(",")[5].count(";") >= 1)
    print(
        f"wrote {OUT} rows={len(rows)} home={home} sichuan={chuan} "
        f"减肥={jianfei} 控糖={ketang} 控盐={keyan} 多病适合={duobing} "
        f"coverage={dict(coverage)} multi={dict(multi_disease_hits)}"
    )


if __name__ == "__main__":
    main()
