-- 减重首批菜谱。只有已发布版本。番茄使用食材 138 西红柿。油、盐、生抽写入配料。

INSERT INTO recipe (recipe_id, display_name, current_version, created_at) VALUES
('wl-rice-bowl', '米饭', '1', '2026-11-13 00:00:00.000'),
('wl-oat-milk', '燕麦牛奶', '1', '2026-11-13 00:00:00.000'),
('wl-bread-milk', '全麦面包配牛奶', '1', '2026-11-13 00:00:00.000'),
('wl-noodle-plain', '清水面', '1', '2026-11-13 00:00:00.000'),
('wl-chicken-broccoli', '鸡胸肉炒西兰花', '1', '2026-11-13 00:00:00.000'),
('wl-tofu-cabbage', '北豆腐烧小白菜', '1', '2026-11-13 00:00:00.000'),
('wl-egg-tomato', '番茄炒蛋', '1', '2026-11-13 00:00:00.000'),
('wl-shrimp-cucumber', '虾仁炒黄瓜', '1', '2026-11-13 00:00:00.000'),
('wl-grass-carp-steam', '清蒸草鱼', '1', '2026-11-13 00:00:00.000'),
('wl-pork-carrot', '里脊炒胡萝卜', '1', '2026-11-13 00:00:00.000'),
('wl-spinach-blanch', '焯菠菜', '1', '2026-11-13 00:00:00.000'),
('wl-broccoli-blanch', '焯西兰花', '1', '2026-11-13 00:00:00.000'),
('wl-oats-water', '清水燕麦', '1', '2026-11-13 00:00:00.000'),
('wl-apple', '苹果', '1', '2026-11-13 00:00:00.000'),
('wl-banana', '香蕉', '1', '2026-11-13 00:00:00.000'),
('wl-yogurt', '原味酸奶', '1', '2026-11-13 00:00:00.000'),
('wl-boiled-egg', '水煮蛋', '1', '2026-11-13 00:00:00.000');

INSERT INTO recipe_version (recipe_id, version, status_code, approved_at)
SELECT recipe_id, '1', 2, '2026-11-13 00:00:00.000' FROM recipe
WHERE recipe_id LIKE 'wl-%';

INSERT INTO recipe_ingredient (recipe_id, recipe_version, food_item_id, quantity, unit_code) VALUES
('wl-rice-bowl', '1', '1', 60, 1),
('wl-oat-milk', '1', '54', 40, 1),
('wl-oat-milk', '1', '590', 200, 1),
('wl-bread-milk', '1', '42', 60, 1),
('wl-bread-milk', '1', '590', 200, 1),
('wl-noodle-plain', '1', '28', 80, 1),
('wl-noodle-plain', '1', '668', 1, 1),
('wl-chicken-broccoli', '1', '405', 100, 1),
('wl-chicken-broccoli', '1', '93', 150, 1),
('wl-chicken-broccoli', '1', '654', 8, 1),
('wl-chicken-broccoli', '1', '668', 1, 1),
('wl-chicken-broccoli', '1', '186', 10, 1),
('wl-tofu-cabbage', '1', '606', 120, 1),
('wl-tofu-cabbage', '1', '78', 150, 1),
('wl-tofu-cabbage', '1', '654', 8, 1),
('wl-tofu-cabbage', '1', '672', 8, 1),
('wl-tofu-cabbage', '1', '191', 5, 1),
('wl-egg-tomato', '1', '580', 100, 1),
('wl-egg-tomato', '1', '138', 200, 1),
('wl-egg-tomato', '1', '654', 8, 1),
('wl-egg-tomato', '1', '668', 1, 1),
('wl-shrimp-cucumber', '1', '904', 80, 1),
('wl-shrimp-cucumber', '1', '154', 150, 1),
('wl-shrimp-cucumber', '1', '654', 6, 1),
('wl-shrimp-cucumber', '1', '668', 1, 1),
('wl-shrimp-cucumber', '1', '198', 5, 1),
('wl-grass-carp-steam', '1', '449', 120, 1),
('wl-grass-carp-steam', '1', '186', 15, 1),
('wl-grass-carp-steam', '1', '198', 5, 1),
('wl-grass-carp-steam', '1', '672', 8, 1),
('wl-pork-carrot', '1', '352', 80, 1),
('wl-pork-carrot', '1', '132', 120, 1),
('wl-pork-carrot', '1', '654', 8, 1),
('wl-pork-carrot', '1', '668', 1, 1),
('wl-spinach-blanch', '1', '99', 150, 1),
('wl-spinach-blanch', '1', '668', 1, 1),
('wl-broccoli-blanch', '1', '93', 200, 1),
('wl-oats-water', '1', '54', 50, 1),
('wl-apple', '1', '257', 150, 1),
('wl-banana', '1', '310', 120, 1),
('wl-yogurt', '1', '595', 150, 1),
('wl-boiled-egg', '1', '580', 50, 1);

INSERT INTO recipe_step (recipe_id, recipe_version, step_no, instruction_text) VALUES
('wl-rice-bowl', '1', 1, '大米按生重下锅煮熟，盛入碗中。'),
('wl-oat-milk', '1', 1, '燕麦片和牛奶一起煮开，不再另加糖。'),
('wl-bread-milk', '1', 1, '全麦面包配牛奶，不再另加糖。'),
('wl-noodle-plain', '1', 1, '面条煮熟，加入食盐 1 克。'),
('wl-chicken-broccoli', '1', 1, '西兰花掰小朵，大葱切段。锅中放菜籽油 8 克，放入鸡胸肉和葱段翻炒，再加西兰花和食盐 1 克炒熟。'),
('wl-tofu-cabbage', '1', 1, '北豆腐切块，小白菜洗净。锅中放菜籽油 8 克，放入豆腐、小白菜、大蒜 5 克和生抽 8 克烧熟。'),
('wl-egg-tomato', '1', 1, '西红柿切块，鸡蛋打散。锅中放菜籽油 8 克，先炒鸡蛋，再加西红柿和食盐 1 克炒熟。'),
('wl-shrimp-cucumber', '1', 1, '黄瓜切片。锅中放菜籽油 6 克，放入虾仁、黄瓜、生姜 5 克和食盐 1 克炒熟。'),
('wl-grass-carp-steam', '1', 1, '草鱼段放上大葱 15 克和生姜 5 克，蒸熟后淋生抽 8 克。'),
('wl-pork-carrot', '1', 1, '胡萝卜切片。锅中放菜籽油 8 克，放入猪里脊、胡萝卜和食盐 1 克炒熟。'),
('wl-spinach-blanch', '1', 1, '菠菜放入沸水焯熟，加食盐 1 克。'),
('wl-broccoli-blanch', '1', 1, '西兰花放入沸水焯熟，沥干后食用。'),
('wl-oats-water', '1', 1, '燕麦片加水煮开，不再另加糖和牛奶。'),
('wl-apple', '1', 1, '苹果洗净后食用。'),
('wl-banana', '1', 1, '香蕉去皮后食用。额度不够时不加入这一餐。'),
('wl-yogurt', '1', 1, '原味酸奶倒入碗中，不再另加糖。'),
('wl-boiled-egg', '1', 1, '鸡蛋煮熟后去壳。');

INSERT INTO recipe_equipment_variant (recipe_id, recipe_version, equipment_code, variant_text)
SELECT recipe_id, '1', '碗', '按已发布步骤使用碗。' FROM recipe WHERE recipe_id IN ('wl-rice-bowl', 'wl-bread-milk', 'wl-apple', 'wl-banana', 'wl-yogurt');

INSERT INTO recipe_equipment_variant (recipe_id, recipe_version, equipment_code, variant_text)
SELECT recipe_id, '1', '锅', '按已发布步骤使用锅。' FROM recipe WHERE recipe_id LIKE 'wl-%'
AND recipe_id NOT IN ('wl-rice-bowl', 'wl-bread-milk', 'wl-apple', 'wl-banana', 'wl-yogurt');
