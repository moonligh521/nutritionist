-- 减重食谱用到的食材补缺。只补还没有的项目，已有数值不覆盖。
-- 同一条 USDA 记录对上已有能量和蛋白质后，才补水分、维生素E、钙。
-- 燕麦片的胆固醇和饱和脂肪来自另一条 USDA 干燕麦，能量仍用台湾食药署原值。
-- 鸡胸肉、草鱼原来的数值对不上任何公开记录，整行换为台湾食药署生品。鸡胸肉膳食纤维 USDA 生胸肉记为 0。
DELETE FROM food_nutrient WHERE food_id IN (405, 449) AND is_deleted = 0;

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT food_id, nutrient_code, amount, remark
FROM (
    SELECT 1 AS food_id, 12 AS nutrient_code, 11.62 AS amount, 'USDA_FDC:168877 Rice, white, long-grain, regular, raw, enriched' AS remark
    UNION ALL
    SELECT 1 AS food_id, 13 AS nutrient_code, 0.11 AS amount, 'USDA_FDC:168877 Rice, white, long-grain, regular, raw, enriched' AS remark
    UNION ALL
    SELECT 1 AS food_id, 14 AS nutrient_code, 28 AS amount, 'USDA_FDC:168877 Rice, white, long-grain, regular, raw, enriched' AS remark
    UNION ALL
    SELECT 28 AS food_id, 12 AS nutrient_code, 9.01 AS amount, 'USDA_FDC:169731 Noodles, egg, dry, enriched' AS remark
    UNION ALL
    SELECT 28 AS food_id, 13 AS nutrient_code, 0.37 AS amount, 'USDA_FDC:169731 Noodles, egg, dry, enriched' AS remark
    UNION ALL
    SELECT 28 AS food_id, 14 AS nutrient_code, 35 AS amount, 'USDA_FDC:169731 Noodles, egg, dry, enriched' AS remark
    UNION ALL
    SELECT 42 AS food_id, 12 AS nutrient_code, 39.01 AS amount, 'USDA_FDC:172688 Bread, whole-wheat, commercially prepared' AS remark
    UNION ALL
    SELECT 42 AS food_id, 13 AS nutrient_code, 2.66 AS amount, 'USDA_FDC:172688 Bread, whole-wheat, commercially prepared' AS remark
    UNION ALL
    SELECT 42 AS food_id, 14 AS nutrient_code, 161 AS amount, 'USDA_FDC:172688 Bread, whole-wheat, commercially prepared' AS remark
    UNION ALL
    SELECT 54 AS food_id, 9 AS nutrient_code, 0 AS amount, 'USDA_FDC:173904 Cereals, oats, regular and quick, not fortified, dry' AS remark
    UNION ALL
    SELECT 54 AS food_id, 10 AS nutrient_code, 1.11 AS amount, 'USDA_FDC:173904 Cereals, oats, regular and quick, not fortified, dry' AS remark
    UNION ALL
    SELECT 78 AS food_id, 12 AS nutrient_code, 95.32 AS amount, 'USDA_FDC:170390 Cabbage, chinese (pak-choi), raw' AS remark
    UNION ALL
    SELECT 78 AS food_id, 13 AS nutrient_code, 0.09 AS amount, 'USDA_FDC:170390 Cabbage, chinese (pak-choi), raw' AS remark
    UNION ALL
    SELECT 78 AS food_id, 14 AS nutrient_code, 105 AS amount, 'USDA_FDC:170390 Cabbage, chinese (pak-choi), raw' AS remark
    UNION ALL
    SELECT 93 AS food_id, 12 AS nutrient_code, 89.3 AS amount, 'USDA_FDC:170379 Broccoli, raw' AS remark
    UNION ALL
    SELECT 93 AS food_id, 13 AS nutrient_code, 0.78 AS amount, 'USDA_FDC:170379 Broccoli, raw' AS remark
    UNION ALL
    SELECT 93 AS food_id, 14 AS nutrient_code, 47 AS amount, 'USDA_FDC:170379 Broccoli, raw' AS remark
    UNION ALL
    SELECT 99 AS food_id, 12 AS nutrient_code, 91.4 AS amount, 'USDA_FDC:168462 Spinach, raw' AS remark
    UNION ALL
    SELECT 99 AS food_id, 13 AS nutrient_code, 2.03 AS amount, 'USDA_FDC:168462 Spinach, raw' AS remark
    UNION ALL
    SELECT 99 AS food_id, 14 AS nutrient_code, 99 AS amount, 'USDA_FDC:168462 Spinach, raw' AS remark
    UNION ALL
    SELECT 132 AS food_id, 12 AS nutrient_code, 88.29 AS amount, 'USDA_FDC:170393 Carrots, raw' AS remark
    UNION ALL
    SELECT 132 AS food_id, 13 AS nutrient_code, 0.66 AS amount, 'USDA_FDC:170393 Carrots, raw' AS remark
    UNION ALL
    SELECT 132 AS food_id, 14 AS nutrient_code, 33 AS amount, 'USDA_FDC:170393 Carrots, raw' AS remark
    UNION ALL
    SELECT 138 AS food_id, 12 AS nutrient_code, 94.52 AS amount, 'USDA_FDC:170457 Tomatoes, red, ripe, raw, year round average' AS remark
    UNION ALL
    SELECT 138 AS food_id, 13 AS nutrient_code, 0.54 AS amount, 'USDA_FDC:170457 Tomatoes, red, ripe, raw, year round average' AS remark
    UNION ALL
    SELECT 138 AS food_id, 14 AS nutrient_code, 10 AS amount, 'USDA_FDC:170457 Tomatoes, red, ripe, raw, year round average' AS remark
    UNION ALL
    SELECT 154 AS food_id, 12 AS nutrient_code, 95.23 AS amount, 'USDA_FDC:168409 Cucumber, with peel, raw' AS remark
    UNION ALL
    SELECT 154 AS food_id, 13 AS nutrient_code, 0.03 AS amount, 'USDA_FDC:168409 Cucumber, with peel, raw' AS remark
    UNION ALL
    SELECT 154 AS food_id, 14 AS nutrient_code, 16 AS amount, 'USDA_FDC:168409 Cucumber, with peel, raw' AS remark
    UNION ALL
    SELECT 186 AS food_id, 12 AS nutrient_code, 90.5 AS amount, 'USDA_FDC:170007 Onions, welsh, raw' AS remark
    UNION ALL
    SELECT 186 AS food_id, 13 AS nutrient_code, 0.51 AS amount, 'USDA_FDC:170007 Onions, welsh, raw' AS remark
    UNION ALL
    SELECT 186 AS food_id, 14 AS nutrient_code, 18 AS amount, 'USDA_FDC:170007 Onions, welsh, raw' AS remark
    UNION ALL
    SELECT 191 AS food_id, 12 AS nutrient_code, 58.58 AS amount, 'USDA_FDC:169230 Garlic, raw' AS remark
    UNION ALL
    SELECT 191 AS food_id, 13 AS nutrient_code, 0.08 AS amount, 'USDA_FDC:169230 Garlic, raw' AS remark
    UNION ALL
    SELECT 191 AS food_id, 14 AS nutrient_code, 181 AS amount, 'USDA_FDC:169230 Garlic, raw' AS remark
    UNION ALL
    SELECT 198 AS food_id, 12 AS nutrient_code, 78.89 AS amount, 'USDA_FDC:169231 Ginger root, raw' AS remark
    UNION ALL
    SELECT 198 AS food_id, 13 AS nutrient_code, 0.26 AS amount, 'USDA_FDC:169231 Ginger root, raw' AS remark
    UNION ALL
    SELECT 198 AS food_id, 14 AS nutrient_code, 16 AS amount, 'USDA_FDC:169231 Ginger root, raw' AS remark
    UNION ALL
    SELECT 257 AS food_id, 12 AS nutrient_code, 85.56 AS amount, 'USDA_FDC:171688 Apples, raw, with skin (Includes foods for USDA''s Food Distribution Program)' AS remark
    UNION ALL
    SELECT 257 AS food_id, 13 AS nutrient_code, 0.18 AS amount, 'USDA_FDC:171688 Apples, raw, with skin (Includes foods for USDA''s Food Distribution Program)' AS remark
    UNION ALL
    SELECT 257 AS food_id, 14 AS nutrient_code, 6 AS amount, 'USDA_FDC:171688 Apples, raw, with skin (Includes foods for USDA''s Food Distribution Program)' AS remark
    UNION ALL
    SELECT 310 AS food_id, 12 AS nutrient_code, 74.91 AS amount, 'USDA_FDC:173944 Bananas, raw' AS remark
    UNION ALL
    SELECT 310 AS food_id, 13 AS nutrient_code, 0.1 AS amount, 'USDA_FDC:173944 Bananas, raw' AS remark
    UNION ALL
    SELECT 310 AS food_id, 14 AS nutrient_code, 5 AS amount, 'USDA_FDC:173944 Bananas, raw' AS remark
    UNION ALL
    SELECT 405 AS food_id, 1 AS nutrient_code, 117 AS amount, 'TFDA:I0402402 去皮清肉(肉鸡)，生，鸡胸部位' AS remark
    UNION ALL
    SELECT 405 AS food_id, 2 AS nutrient_code, 23.3 AS amount, 'TFDA:I0402402 去皮清肉(肉鸡)，生，鸡胸部位' AS remark
    UNION ALL
    SELECT 405 AS food_id, 3 AS nutrient_code, 0.6 AS amount, 'TFDA:I0402402 去皮清肉(肉鸡)，生，鸡胸部位' AS remark
    UNION ALL
    SELECT 405 AS food_id, 4 AS nutrient_code, 1.9 AS amount, 'TFDA:I0402402 去皮清肉(肉鸡)，生，鸡胸部位' AS remark
    UNION ALL
    SELECT 405 AS food_id, 5 AS nutrient_code, 0 AS amount, 'USDA_FDC:171077 Chicken, broiler or fryers, breast, skinless, boneless, meat only, raw' AS remark
    UNION ALL
    SELECT 405 AS food_id, 6 AS nutrient_code, 33 AS amount, 'TFDA:I0402402 去皮清肉(肉鸡)，生，鸡胸部位' AS remark
    UNION ALL
    SELECT 405 AS food_id, 7 AS nutrient_code, 333 AS amount, 'TFDA:I0402402 去皮清肉(肉鸡)，生，鸡胸部位' AS remark
    UNION ALL
    SELECT 405 AS food_id, 8 AS nutrient_code, 239 AS amount, 'TFDA:I0402402 去皮清肉(肉鸡)，生，鸡胸部位' AS remark
    UNION ALL
    SELECT 405 AS food_id, 9 AS nutrient_code, 70 AS amount, 'TFDA:I0402402 去皮清肉(肉鸡)，生，鸡胸部位' AS remark
    UNION ALL
    SELECT 405 AS food_id, 10 AS nutrient_code, 0.6 AS amount, 'TFDA:I0402402 去皮清肉(肉鸡)，生，鸡胸部位' AS remark
    UNION ALL
    SELECT 405 AS food_id, 12 AS nutrient_code, 73 AS amount, 'TFDA:I0402402 去皮清肉(肉鸡)，生，鸡胸部位' AS remark
    UNION ALL
    SELECT 405 AS food_id, 13 AS nutrient_code, 0.23 AS amount, 'TFDA:I0402402 去皮清肉(肉鸡)，生，鸡胸部位' AS remark
    UNION ALL
    SELECT 405 AS food_id, 14 AS nutrient_code, 4 AS amount, 'TFDA:I0402402 去皮清肉(肉鸡)，生，鸡胸部位' AS remark
    UNION ALL
    SELECT 449 AS food_id, 1 AS nutrient_code, 91 AS amount, 'TFDA:J0401401 草鱼(含皮)，生' AS remark
    UNION ALL
    SELECT 449 AS food_id, 2 AS nutrient_code, 17.2 AS amount, 'TFDA:J0401401 草鱼(含皮)，生' AS remark
    UNION ALL
    SELECT 449 AS food_id, 3 AS nutrient_code, 0.8 AS amount, 'TFDA:J0401401 草鱼(含皮)，生' AS remark
    UNION ALL
    SELECT 449 AS food_id, 4 AS nutrient_code, 2 AS amount, 'TFDA:J0401401 草鱼(含皮)，生' AS remark
    UNION ALL
    SELECT 449 AS food_id, 6 AS nutrient_code, 37 AS amount, 'TFDA:J0401401 草鱼(含皮)，生' AS remark
    UNION ALL
    SELECT 449 AS food_id, 7 AS nutrient_code, 376 AS amount, 'TFDA:J0401401 草鱼(含皮)，生' AS remark
    UNION ALL
    SELECT 449 AS food_id, 8 AS nutrient_code, 201 AS amount, 'TFDA:J0401401 草鱼(含皮)，生' AS remark
    UNION ALL
    SELECT 449 AS food_id, 9 AS nutrient_code, 36 AS amount, 'TFDA:J0401401 草鱼(含皮)，生' AS remark
    UNION ALL
    SELECT 449 AS food_id, 10 AS nutrient_code, 0.5 AS amount, 'TFDA:J0401401 草鱼(含皮)，生' AS remark
    UNION ALL
    SELECT 449 AS food_id, 12 AS nutrient_code, 78.8 AS amount, 'TFDA:J0401401 草鱼(含皮)，生' AS remark
    UNION ALL
    SELECT 449 AS food_id, 13 AS nutrient_code, 0.4 AS amount, 'TFDA:J0401401 草鱼(含皮)，生' AS remark
    UNION ALL
    SELECT 449 AS food_id, 14 AS nutrient_code, 63 AS amount, 'TFDA:J0401401 草鱼(含皮)，生' AS remark
    UNION ALL
    SELECT 580 AS food_id, 12 AS nutrient_code, 76.15 AS amount, 'USDA_FDC:171287 Egg, whole, raw, fresh' AS remark
    UNION ALL
    SELECT 580 AS food_id, 13 AS nutrient_code, 1.05 AS amount, 'USDA_FDC:171287 Egg, whole, raw, fresh' AS remark
    UNION ALL
    SELECT 580 AS food_id, 14 AS nutrient_code, 56 AS amount, 'USDA_FDC:171287 Egg, whole, raw, fresh' AS remark
    UNION ALL
    SELECT 590 AS food_id, 12 AS nutrient_code, 88.13 AS amount, 'USDA_FDC:172217 Milk, whole, 3.25% milkfat, without added vitamin A and vitamin D' AS remark
    UNION ALL
    SELECT 590 AS food_id, 13 AS nutrient_code, 0.07 AS amount, 'USDA_FDC:172217 Milk, whole, 3.25% milkfat, without added vitamin A and vitamin D' AS remark
    UNION ALL
    SELECT 590 AS food_id, 14 AS nutrient_code, 113 AS amount, 'USDA_FDC:172217 Milk, whole, 3.25% milkfat, without added vitamin A and vitamin D' AS remark
    UNION ALL
    SELECT 606 AS food_id, 12 AS nutrient_code, 69.83 AS amount, 'USDA_FDC:172475 Tofu, raw, firm, prepared with calcium sulfate' AS remark
    UNION ALL
    SELECT 606 AS food_id, 14 AS nutrient_code, 683 AS amount, 'USDA_FDC:172475 Tofu, raw, firm, prepared with calcium sulfate' AS remark
    UNION ALL
    SELECT 654 AS food_id, 12 AS nutrient_code, 0 AS amount, 'USDA_FDC:172336 Oil, canola' AS remark
    UNION ALL
    SELECT 654 AS food_id, 13 AS nutrient_code, 17.46 AS amount, 'USDA_FDC:172336 Oil, canola' AS remark
    UNION ALL
    SELECT 654 AS food_id, 14 AS nutrient_code, 0 AS amount, 'USDA_FDC:172336 Oil, canola' AS remark
    UNION ALL
    SELECT 672 AS food_id, 12 AS nutrient_code, 71.15 AS amount, 'USDA_FDC:174277 Soy sauce made from soy and wheat (shoyu)' AS remark
    UNION ALL
    SELECT 672 AS food_id, 13 AS nutrient_code, 0 AS amount, 'USDA_FDC:174277 Soy sauce made from soy and wheat (shoyu)' AS remark
    UNION ALL
    SELECT 672 AS food_id, 14 AS nutrient_code, 33 AS amount, 'USDA_FDC:174277 Soy sauce made from soy and wheat (shoyu)' AS remark
) incoming
WHERE NOT EXISTS (
    SELECT 1 FROM food_nutrient current
    WHERE current.food_id = incoming.food_id
      AND current.nutrient_code = incoming.nutrient_code
      AND current.is_deleted = 0
);
