-- 开放数据补录。每条记录保留来源；未知值不生成记录。
-- 按有效食材名称唯一匹配，并跳过已有的同食材同营养素记录。

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 274, 'USDA_FDC:171321 Spices, cloves, ground'
FROM food f
WHERE f.name = '丁香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 5.97, 'USDA_FDC:171321 Spices, cloves, ground'
FROM food f
WHERE f.name = '丁香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 65.53, 'USDA_FDC:171321 Spices, cloves, ground'
FROM food f
WHERE f.name = '丁香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 13, 'USDA_FDC:171321 Spices, cloves, ground'
FROM food f
WHERE f.name = '丁香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 33.9, 'USDA_FDC:171321 Spices, cloves, ground'
FROM food f
WHERE f.name = '丁香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 277, 'USDA_FDC:171321 Spices, cloves, ground'
FROM food f
WHERE f.name = '丁香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1020, 'USDA_FDC:171321 Spices, cloves, ground'
FROM food f
WHERE f.name = '丁香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 104, 'USDA_FDC:171321 Spices, cloves, ground'
FROM food f
WHERE f.name = '丁香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:171321 Spices, cloves, ground'
FROM food f
WHERE f.name = '丁香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 3.952, 'USDA_FDC:171321 Spices, cloves, ground'
FROM food f
WHERE f.name = '丁香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 36, 'TFDA:D3000206 豐水梨'
FROM food f
WHERE f.name = '丰水梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丰水梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.5, 'TFDA:D3000206 豐水梨'
FROM food f
WHERE f.name = '丰水梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丰水梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 9.4, 'TFDA:D3000206 豐水梨'
FROM food f
WHERE f.name = '丰水梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丰水梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:D3000206 豐水梨'
FROM food f
WHERE f.name = '丰水梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丰水梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1, 'TFDA:D3000206 豐水梨'
FROM food f
WHERE f.name = '丰水梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丰水梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'TFDA:D3000206 豐水梨'
FROM food f
WHERE f.name = '丰水梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丰水梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 157, 'TFDA:D3000206 豐水梨'
FROM food f
WHERE f.name = '丰水梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丰水梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 15, 'TFDA:D3000206 豐水梨'
FROM food f
WHERE f.name = '丰水梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丰水梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:D3000206 豐水梨'
FROM food f
WHERE f.name = '丰水梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丰水梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 89.7, 'TFDA:D3000206 豐水梨'
FROM food f
WHERE f.name = '丰水梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丰水梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.13, 'TFDA:D3000206 豐水梨'
FROM food f
WHERE f.name = '丰水梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丰水梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 2, 'TFDA:D3000206 豐水梨'
FROM food f
WHERE f.name = '丰水梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丰水梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 0, 'TFDA:O0700801 烏龍茶茶湯'
FROM food f
WHERE f.name = '乌龙茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌龙茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'TFDA:O0700801 烏龍茶茶湯'
FROM food f
WHERE f.name = '乌龙茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌龙茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:O0700801 烏龍茶茶湯'
FROM food f
WHERE f.name = '乌龙茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌龙茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'TFDA:O0700801 烏龍茶茶湯'
FROM food f
WHERE f.name = '乌龙茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌龙茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 99.9, 'TFDA:O0700801 烏龍茶茶湯'
FROM food f
WHERE f.name = '乌龙茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌龙茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:O0700801 烏龍茶茶湯'
FROM food f
WHERE f.name = '乌龙茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌龙茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 534, 'USDA_FDC:169414 Seeds, flaxseed'
FROM food f
WHERE f.name = '亚麻籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 18.29, 'USDA_FDC:169414 Seeds, flaxseed'
FROM food f
WHERE f.name = '亚麻籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 28.88, 'USDA_FDC:169414 Seeds, flaxseed'
FROM food f
WHERE f.name = '亚麻籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 42.16, 'USDA_FDC:169414 Seeds, flaxseed'
FROM food f
WHERE f.name = '亚麻籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 27.3, 'USDA_FDC:169414 Seeds, flaxseed'
FROM food f
WHERE f.name = '亚麻籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 30, 'USDA_FDC:169414 Seeds, flaxseed'
FROM food f
WHERE f.name = '亚麻籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 813, 'USDA_FDC:169414 Seeds, flaxseed'
FROM food f
WHERE f.name = '亚麻籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 642, 'USDA_FDC:169414 Seeds, flaxseed'
FROM food f
WHERE f.name = '亚麻籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169414 Seeds, flaxseed'
FROM food f
WHERE f.name = '亚麻籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 3.663, 'USDA_FDC:169414 Seeds, flaxseed'
FROM food f
WHERE f.name = '亚麻籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 884, 'USDA_FDC:167702 Oil, flaxseed, cold pressed'
FROM food f
WHERE f.name = '亚麻籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.11, 'USDA_FDC:167702 Oil, flaxseed, cold pressed'
FROM food f
WHERE f.name = '亚麻籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:167702 Oil, flaxseed, cold pressed'
FROM food f
WHERE f.name = '亚麻籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 99.98, 'USDA_FDC:167702 Oil, flaxseed, cold pressed'
FROM food f
WHERE f.name = '亚麻籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:167702 Oil, flaxseed, cold pressed'
FROM food f
WHERE f.name = '亚麻籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'USDA_FDC:167702 Oil, flaxseed, cold pressed'
FROM food f
WHERE f.name = '亚麻籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 0, 'USDA_FDC:167702 Oil, flaxseed, cold pressed'
FROM food f
WHERE f.name = '亚麻籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 1, 'USDA_FDC:167702 Oil, flaxseed, cold pressed'
FROM food f
WHERE f.name = '亚麻籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:167702 Oil, flaxseed, cold pressed'
FROM food f
WHERE f.name = '亚麻籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 8.976, 'USDA_FDC:167702 Oil, flaxseed, cold pressed'
FROM food f
WHERE f.name = '亚麻籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '亚麻籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 364, 'TFDA:A0320202 低筋麵粉'
FROM food f
WHERE f.name = '低筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 8.1, 'TFDA:A0320202 低筋麵粉'
FROM food f
WHERE f.name = '低筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 78.2, 'TFDA:A0320202 低筋麵粉'
FROM food f
WHERE f.name = '低筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.2, 'TFDA:A0320202 低筋麵粉'
FROM food f
WHERE f.name = '低筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2, 'TFDA:A0320202 低筋麵粉'
FROM food f
WHERE f.name = '低筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'TFDA:A0320202 低筋麵粉'
FROM food f
WHERE f.name = '低筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 148, 'TFDA:A0320202 低筋麵粉'
FROM food f
WHERE f.name = '低筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 75, 'TFDA:A0320202 低筋麵粉'
FROM food f
WHERE f.name = '低筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.2, 'TFDA:A0320202 低筋麵粉'
FROM food f
WHERE f.name = '低筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 12, 'TFDA:A0320202 低筋麵粉'
FROM food f
WHERE f.name = '低筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.01, 'TFDA:A0320202 低筋麵粉'
FROM food f
WHERE f.name = '低筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 12, 'TFDA:A0320202 低筋麵粉'
FROM food f
WHERE f.name = '低筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 11, 'TFDA:P0300201 低鈉鹽'
FROM food f
WHERE f.name = '低钠盐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低钠盐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'TFDA:P0300201 低鈉鹽'
FROM food f
WHERE f.name = '低钠盐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低钠盐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 2.8, 'TFDA:P0300201 低鈉鹽'
FROM food f
WHERE f.name = '低钠盐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低钠盐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0, 'TFDA:P0300201 低鈉鹽'
FROM food f
WHERE f.name = '低钠盐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低钠盐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 18341, 'TFDA:P0300201 低鈉鹽'
FROM food f
WHERE f.name = '低钠盐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低钠盐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 26007, 'TFDA:P0300201 低鈉鹽'
FROM food f
WHERE f.name = '低钠盐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低钠盐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 83, 'TFDA:P0300201 低鈉鹽'
FROM food f
WHERE f.name = '低钠盐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低钠盐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 0.7, 'TFDA:P0300201 低鈉鹽'
FROM food f
WHERE f.name = '低钠盐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低钠盐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:P0300201 低鈉鹽'
FROM food f
WHERE f.name = '低钠盐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低钠盐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 289, 'TFDA:P0300201 低鈉鹽'
FROM food f
WHERE f.name = '低钠盐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '低钠盐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 114, 'USDA_FDC:174347 Game meat, rabbit, wild, raw'
FROM food f
WHERE f.name = '兔肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '兔肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 21.79, 'USDA_FDC:174347 Game meat, rabbit, wild, raw'
FROM food f
WHERE f.name = '兔肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '兔肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:174347 Game meat, rabbit, wild, raw'
FROM food f
WHERE f.name = '兔肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '兔肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2.32, 'USDA_FDC:174347 Game meat, rabbit, wild, raw'
FROM food f
WHERE f.name = '兔肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '兔肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:174347 Game meat, rabbit, wild, raw'
FROM food f
WHERE f.name = '兔肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '兔肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 50, 'USDA_FDC:174347 Game meat, rabbit, wild, raw'
FROM food f
WHERE f.name = '兔肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '兔肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 378, 'USDA_FDC:174347 Game meat, rabbit, wild, raw'
FROM food f
WHERE f.name = '兔肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '兔肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 226, 'USDA_FDC:174347 Game meat, rabbit, wild, raw'
FROM food f
WHERE f.name = '兔肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '兔肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 81, 'USDA_FDC:174347 Game meat, rabbit, wild, raw'
FROM food f
WHERE f.name = '兔肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '兔肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.69, 'USDA_FDC:174347 Game meat, rabbit, wild, raw'
FROM food f
WHERE f.name = '兔肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '兔肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 106, 'TFDA:J0406601 海鱺'
FROM food f
WHERE f.name = '军曹鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '军曹鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.4, 'TFDA:J0406601 海鱺'
FROM food f
WHERE f.name = '军曹鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '军曹鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0406601 海鱺'
FROM food f
WHERE f.name = '军曹鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '军曹鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2.1, 'TFDA:J0406601 海鱺'
FROM food f
WHERE f.name = '军曹鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '军曹鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 131, 'TFDA:J0406601 海鱺'
FROM food f
WHERE f.name = '军曹鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '军曹鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 323, 'TFDA:J0406601 海鱺'
FROM food f
WHERE f.name = '军曹鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '军曹鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 227, 'TFDA:J0406601 海鱺'
FROM food f
WHERE f.name = '军曹鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '军曹鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 54, 'TFDA:J0406601 海鱺'
FROM food f
WHERE f.name = '军曹鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '军曹鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.1, 'TFDA:J0406601 海鱺'
FROM food f
WHERE f.name = '军曹鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '军曹鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 77.4, 'TFDA:J0406601 海鱺'
FROM food f
WHERE f.name = '军曹鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '军曹鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.32, 'TFDA:J0406601 海鱺'
FROM food f
WHERE f.name = '军曹鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '军曹鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 6, 'TFDA:J0406601 海鱺'
FROM food f
WHERE f.name = '军曹鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '军曹鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 131, 'TFDA:R4701001 冷凍豆腐'
FROM food f
WHERE f.name = '冻豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '冻豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 12.9, 'TFDA:R4701001 冷凍豆腐'
FROM food f
WHERE f.name = '冻豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '冻豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 3.9, 'TFDA:R4701001 冷凍豆腐'
FROM food f
WHERE f.name = '冻豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '冻豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 7.1, 'TFDA:R4701001 冷凍豆腐'
FROM food f
WHERE f.name = '冻豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '冻豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.2, 'TFDA:R4701001 冷凍豆腐'
FROM food f
WHERE f.name = '冻豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '冻豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 8, 'TFDA:R4701001 冷凍豆腐'
FROM food f
WHERE f.name = '冻豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '冻豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 109, 'TFDA:R4701001 冷凍豆腐'
FROM food f
WHERE f.name = '冻豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '冻豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 219, 'TFDA:R4701001 冷凍豆腐'
FROM food f
WHERE f.name = '冻豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '冻豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.3, 'TFDA:R4701001 冷凍豆腐'
FROM food f
WHERE f.name = '冻豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '冻豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 75, 'TFDA:R4701001 冷凍豆腐'
FROM food f
WHERE f.name = '冻豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '冻豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 4.82, 'TFDA:R4701001 冷凍豆腐'
FROM food f
WHERE f.name = '冻豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '冻豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 240, 'TFDA:R4701001 冷凍豆腐'
FROM food f
WHERE f.name = '冻豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '冻豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 31, 'TFDA:B0600101 豆薯'
FROM food f
WHERE f.name = '凉薯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '凉薯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.7, 'TFDA:B0600101 豆薯'
FROM food f
WHERE f.name = '凉薯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '凉薯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 6.8, 'TFDA:B0600101 豆薯'
FROM food f
WHERE f.name = '凉薯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '凉薯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:B0600101 豆薯'
FROM food f
WHERE f.name = '凉薯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '凉薯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.3, 'TFDA:B0600101 豆薯'
FROM food f
WHERE f.name = '凉薯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '凉薯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 4, 'TFDA:B0600101 豆薯'
FROM food f
WHERE f.name = '凉薯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '凉薯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 108, 'TFDA:B0600101 豆薯'
FROM food f
WHERE f.name = '凉薯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '凉薯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 16, 'TFDA:B0600101 豆薯'
FROM food f
WHERE f.name = '凉薯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '凉薯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:B0600101 豆薯'
FROM food f
WHERE f.name = '凉薯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '凉薯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 92.1, 'TFDA:B0600101 豆薯'
FROM food f
WHERE f.name = '凉薯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '凉薯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:B0600101 豆薯'
FROM food f
WHERE f.name = '凉薯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '凉薯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 12, 'TFDA:B0600101 豆薯'
FROM food f
WHERE f.name = '凉薯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '凉薯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 76, 'TFDA:J0416001 單角革單棘魨(含皮)'
FROM food f
WHERE f.name = '剥皮鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '剥皮鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 17.9, 'TFDA:J0416001 單角革單棘魨(含皮)'
FROM food f
WHERE f.name = '剥皮鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '剥皮鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0416001 單角革單棘魨(含皮)'
FROM food f
WHERE f.name = '剥皮鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '剥皮鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0, 'TFDA:J0416001 單角革單棘魨(含皮)'
FROM food f
WHERE f.name = '剥皮鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '剥皮鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 87, 'TFDA:J0416001 單角革單棘魨(含皮)'
FROM food f
WHERE f.name = '剥皮鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '剥皮鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 306, 'TFDA:J0416001 單角革單棘魨(含皮)'
FROM food f
WHERE f.name = '剥皮鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '剥皮鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 160, 'TFDA:J0416001 單角革單棘魨(含皮)'
FROM food f
WHERE f.name = '剥皮鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '剥皮鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 39, 'TFDA:J0416001 單角革單棘魨(含皮)'
FROM food f
WHERE f.name = '剥皮鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '剥皮鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:J0416001 單角革單棘魨(含皮)'
FROM food f
WHERE f.name = '剥皮鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '剥皮鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 81.3, 'TFDA:J0416001 單角革單棘魨(含皮)'
FROM food f
WHERE f.name = '剥皮鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '剥皮鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.82, 'TFDA:J0416001 單角革單棘魨(含皮)'
FROM food f
WHERE f.name = '剥皮鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '剥皮鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 4, 'TFDA:J0416001 單角革單棘魨(含皮)'
FROM food f
WHERE f.name = '剥皮鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '剥皮鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 130, 'TFDA:J0405801 大口黑鱸'
FROM food f
WHERE f.name = '加州鲈'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '加州鲈' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.7, 'TFDA:J0405801 大口黑鱸'
FROM food f
WHERE f.name = '加州鲈'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '加州鲈' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0405801 大口黑鱸'
FROM food f
WHERE f.name = '加州鲈'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '加州鲈' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 4.6, 'TFDA:J0405801 大口黑鱸'
FROM food f
WHERE f.name = '加州鲈'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '加州鲈' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 101, 'TFDA:J0405801 大口黑鱸'
FROM food f
WHERE f.name = '加州鲈'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '加州鲈' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 362, 'TFDA:J0405801 大口黑鱸'
FROM food f
WHERE f.name = '加州鲈'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '加州鲈' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 176, 'TFDA:J0405801 大口黑鱸'
FROM food f
WHERE f.name = '加州鲈'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '加州鲈' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 59, 'TFDA:J0405801 大口黑鱸'
FROM food f
WHERE f.name = '加州鲈'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '加州鲈' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.2, 'TFDA:J0405801 大口黑鱸'
FROM food f
WHERE f.name = '加州鲈'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '加州鲈' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 75.4, 'TFDA:J0405801 大口黑鱸'
FROM food f
WHERE f.name = '加州鲈'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '加州鲈' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.74, 'TFDA:J0405801 大口黑鱸'
FROM food f
WHERE f.name = '加州鲈'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '加州鲈' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 17, 'TFDA:J0405801 大口黑鱸'
FROM food f
WHERE f.name = '加州鲈'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '加州鲈' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 51, 'TFDA:O0600101 可樂'
FROM food f
WHERE f.name = '可乐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可乐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 12.8, 'TFDA:O0600101 可樂'
FROM food f
WHERE f.name = '可乐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可乐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'TFDA:O0600101 可樂'
FROM food f
WHERE f.name = '可乐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可乐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 7, 'TFDA:O0600101 可樂'
FROM food f
WHERE f.name = '可乐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可乐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 0, 'TFDA:O0600101 可樂'
FROM food f
WHERE f.name = '可乐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可乐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 16, 'TFDA:O0600101 可樂'
FROM food f
WHERE f.name = '可乐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可乐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 87.1, 'TFDA:O0600101 可樂'
FROM food f
WHERE f.name = '可乐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可乐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 1, 'TFDA:O0600101 可樂'
FROM food f
WHERE f.name = '可乐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可乐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 884, 'USDA_FDC:171421 Oil, cocoa butter'
FROM food f
WHERE f.name = '可可脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可可脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'USDA_FDC:171421 Oil, cocoa butter'
FROM food f
WHERE f.name = '可可脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可可脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:171421 Oil, cocoa butter'
FROM food f
WHERE f.name = '可可脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可可脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 100, 'USDA_FDC:171421 Oil, cocoa butter'
FROM food f
WHERE f.name = '可可脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可可脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:171421 Oil, cocoa butter'
FROM food f
WHERE f.name = '可可脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可可脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'USDA_FDC:171421 Oil, cocoa butter'
FROM food f
WHERE f.name = '可可脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可可脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 0, 'USDA_FDC:171421 Oil, cocoa butter'
FROM food f
WHERE f.name = '可可脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可可脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 0, 'USDA_FDC:171421 Oil, cocoa butter'
FROM food f
WHERE f.name = '可可脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可可脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:171421 Oil, cocoa butter'
FROM food f
WHERE f.name = '可可脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可可脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 59.7, 'USDA_FDC:171421 Oil, cocoa butter'
FROM food f
WHERE f.name = '可可脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可可脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 11, 100, 'USDA_FDC:171421 Oil, cocoa butter'
FROM food f
WHERE f.name = '可可脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '可可脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 11
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 515, 'TFDA:P0200501 咖哩塊'
FROM food f
WHERE f.name = '咖喱块'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱块' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 5.6, 'TFDA:P0200501 咖哩塊'
FROM food f
WHERE f.name = '咖喱块'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱块' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 45.4, 'TFDA:P0200501 咖哩塊'
FROM food f
WHERE f.name = '咖喱块'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱块' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 34.5, 'TFDA:P0200501 咖哩塊'
FROM food f
WHERE f.name = '咖喱块'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱块' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 4.9, 'TFDA:P0200501 咖哩塊'
FROM food f
WHERE f.name = '咖喱块'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱块' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 4180, 'TFDA:P0200501 咖哩塊'
FROM food f
WHERE f.name = '咖喱块'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱块' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 272, 'TFDA:P0200501 咖哩塊'
FROM food f
WHERE f.name = '咖喱块'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱块' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 76, 'TFDA:P0200501 咖哩塊'
FROM food f
WHERE f.name = '咖喱块'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱块' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 48, 'TFDA:P0200501 咖哩塊'
FROM food f
WHERE f.name = '咖喱块'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱块' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 20, 'TFDA:P0200501 咖哩塊'
FROM food f
WHERE f.name = '咖喱块'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱块' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 2.1, 'TFDA:P0200501 咖哩塊'
FROM food f
WHERE f.name = '咖喱块'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱块' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 6.75, 'TFDA:P0200501 咖哩塊'
FROM food f
WHERE f.name = '咖喱块'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱块' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 83, 'TFDA:P0200501 咖哩塊'
FROM food f
WHERE f.name = '咖喱块'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱块' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 417, 'TFDA:P0200401 咖哩粉'
FROM food f
WHERE f.name = '咖喱粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 13.9, 'TFDA:P0200401 咖哩粉'
FROM food f
WHERE f.name = '咖喱粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 58.5, 'TFDA:P0200401 咖哩粉'
FROM food f
WHERE f.name = '咖喱粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 14.1, 'TFDA:P0200401 咖哩粉'
FROM food f
WHERE f.name = '咖喱粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 36.4, 'TFDA:P0200401 咖哩粉'
FROM food f
WHERE f.name = '咖喱粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 552, 'TFDA:P0200401 咖哩粉'
FROM food f
WHERE f.name = '咖喱粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1717, 'TFDA:P0200401 咖哩粉'
FROM food f
WHERE f.name = '咖喱粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 419, 'TFDA:P0200401 咖哩粉'
FROM food f
WHERE f.name = '咖喱粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.1, 'TFDA:P0200401 咖哩粉'
FROM food f
WHERE f.name = '咖喱粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 5.9, 'TFDA:P0200401 咖哩粉'
FROM food f
WHERE f.name = '咖喱粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 94.77, 'TFDA:P0200401 咖哩粉'
FROM food f
WHERE f.name = '咖喱粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 755, 'TFDA:P0200401 咖哩粉'
FROM food f
WHERE f.name = '咖喱粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '咖喱粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 77, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '喼汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '喼汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '喼汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '喼汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 19.17, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '喼汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '喼汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '喼汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '喼汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '喼汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '喼汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1300, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '喼汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '喼汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 800, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '喼汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '喼汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 60, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '喼汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '喼汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '喼汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '喼汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '喼汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '喼汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 31, 'TFDA:H1800101 翼豆'
FROM food f
WHERE f.name = '四棱豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '四棱豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.5, 'TFDA:H1800101 翼豆'
FROM food f
WHERE f.name = '四棱豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '四棱豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 4.7, 'TFDA:H1800101 翼豆'
FROM food f
WHERE f.name = '四棱豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '四棱豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.4, 'TFDA:H1800101 翼豆'
FROM food f
WHERE f.name = '四棱豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '四棱豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.4, 'TFDA:H1800101 翼豆'
FROM food f
WHERE f.name = '四棱豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '四棱豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'TFDA:H1800101 翼豆'
FROM food f
WHERE f.name = '四棱豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '四棱豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 176, 'TFDA:H1800101 翼豆'
FROM food f
WHERE f.name = '四棱豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '四棱豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 41, 'TFDA:H1800101 翼豆'
FROM food f
WHERE f.name = '四棱豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '四棱豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'TFDA:H1800101 翼豆'
FROM food f
WHERE f.name = '四棱豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '四棱豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.3, 'TFDA:H1800101 翼豆'
FROM food f
WHERE f.name = '四棱豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '四棱豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 91.8, 'TFDA:H1800101 翼豆'
FROM food f
WHERE f.name = '四棱豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '四棱豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.99, 'TFDA:H1800101 翼豆'
FROM food f
WHERE f.name = '四棱豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '四棱豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 86, 'TFDA:H1800101 翼豆'
FROM food f
WHERE f.name = '四棱豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '四棱豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 194, 'TFDA:J0401701 鬍鯰'
FROM food f
WHERE f.name = '塘鲺'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塘鲺' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 16.3, 'TFDA:J0401701 鬍鯰'
FROM food f
WHERE f.name = '塘鲺'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塘鲺' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0401701 鬍鯰'
FROM food f
WHERE f.name = '塘鲺'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塘鲺' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 13.8, 'TFDA:J0401701 鬍鯰'
FROM food f
WHERE f.name = '塘鲺'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塘鲺' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 37, 'TFDA:J0401701 鬍鯰'
FROM food f
WHERE f.name = '塘鲺'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塘鲺' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 380, 'TFDA:J0401701 鬍鯰'
FROM food f
WHERE f.name = '塘鲺'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塘鲺' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 220, 'TFDA:J0401701 鬍鯰'
FROM food f
WHERE f.name = '塘鲺'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塘鲺' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 86, 'TFDA:J0401701 鬍鯰'
FROM food f
WHERE f.name = '塘鲺'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塘鲺' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 5.3, 'TFDA:J0401701 鬍鯰'
FROM food f
WHERE f.name = '塘鲺'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塘鲺' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 68.9, 'TFDA:J0401701 鬍鯰'
FROM food f
WHERE f.name = '塘鲺'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塘鲺' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.31, 'TFDA:J0401701 鬍鯰'
FROM food f
WHERE f.name = '塘鲺'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塘鲺' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 4, 'TFDA:J0401701 鬍鯰'
FROM food f
WHERE f.name = '塘鲺'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塘鲺' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 166, 'TFDA:R6100101 冷凍花枝丸'
FROM food f
WHERE f.name = '墨鱼丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '墨鱼丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 12.7, 'TFDA:R6100101 冷凍花枝丸'
FROM food f
WHERE f.name = '墨鱼丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '墨鱼丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 13, 'TFDA:R6100101 冷凍花枝丸'
FROM food f
WHERE f.name = '墨鱼丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '墨鱼丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 7, 'TFDA:R6100101 冷凍花枝丸'
FROM food f
WHERE f.name = '墨鱼丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '墨鱼丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.9, 'TFDA:R6100101 冷凍花枝丸'
FROM food f
WHERE f.name = '墨鱼丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '墨鱼丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 456, 'TFDA:R6100101 冷凍花枝丸'
FROM food f
WHERE f.name = '墨鱼丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '墨鱼丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 131, 'TFDA:R6100101 冷凍花枝丸'
FROM food f
WHERE f.name = '墨鱼丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '墨鱼丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 181, 'TFDA:R6100101 冷凍花枝丸'
FROM food f
WHERE f.name = '墨鱼丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '墨鱼丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 113, 'TFDA:R6100101 冷凍花枝丸'
FROM food f
WHERE f.name = '墨鱼丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '墨鱼丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.7, 'TFDA:R6100101 冷凍花枝丸'
FROM food f
WHERE f.name = '墨鱼丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '墨鱼丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 65.5, 'TFDA:R6100101 冷凍花枝丸'
FROM food f
WHERE f.name = '墨鱼丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '墨鱼丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.74, 'TFDA:R6100101 冷凍花枝丸'
FROM food f
WHERE f.name = '墨鱼丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '墨鱼丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 11, 'TFDA:R6100101 冷凍花枝丸'
FROM food f
WHERE f.name = '墨鱼丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '墨鱼丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 7.7857, 'USDA_FDC:2515378 Nuts, macadamia nuts, raw'
FROM food f
WHERE f.name = '夏威夷果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '夏威夷果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 24.0943, 'USDA_FDC:2515378 Nuts, macadamia nuts, raw'
FROM food f
WHERE f.name = '夏威夷果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '夏威夷果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 64.93, 'USDA_FDC:2515378 Nuts, macadamia nuts, raw'
FROM food f
WHERE f.name = '夏威夷果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '夏威夷果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 7.563, 'USDA_FDC:2515378 Nuts, macadamia nuts, raw'
FROM food f
WHERE f.name = '夏威夷果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '夏威夷果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'USDA_FDC:2515378 Nuts, macadamia nuts, raw'
FROM food f
WHERE f.name = '夏威夷果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '夏威夷果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 372.6, 'USDA_FDC:2515378 Nuts, macadamia nuts, raw'
FROM food f
WHERE f.name = '夏威夷果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '夏威夷果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 208.4, 'USDA_FDC:2515378 Nuts, macadamia nuts, raw'
FROM food f
WHERE f.name = '夏威夷果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '夏威夷果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 145, 'TFDA:J0416601 毛鱗魚'
FROM food f
WHERE f.name = '多春鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '多春鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 14.1, 'TFDA:J0416601 毛鱗魚'
FROM food f
WHERE f.name = '多春鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '多春鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.4, 'TFDA:J0416601 毛鱗魚'
FROM food f
WHERE f.name = '多春鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '多春鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 9.4, 'TFDA:J0416601 毛鱗魚'
FROM food f
WHERE f.name = '多春鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '多春鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'TFDA:J0416601 毛鱗魚'
FROM food f
WHERE f.name = '多春鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '多春鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 310, 'TFDA:J0416601 毛鱗魚'
FROM food f
WHERE f.name = '多春鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '多春鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 177, 'TFDA:J0416601 毛鱗魚'
FROM food f
WHERE f.name = '多春鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '多春鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 289, 'TFDA:J0416601 毛鱗魚'
FROM food f
WHERE f.name = '多春鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '多春鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 199, 'TFDA:J0416601 毛鱗魚'
FROM food f
WHERE f.name = '多春鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '多春鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.9, 'TFDA:J0416601 毛鱗魚'
FROM food f
WHERE f.name = '多春鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '多春鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 74, 'TFDA:J0416601 毛鱗魚'
FROM food f
WHERE f.name = '多春鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '多春鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 2.79, 'TFDA:J0416601 毛鱗魚'
FROM food f
WHERE f.name = '多春鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '多春鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 317, 'TFDA:J0416601 毛鱗魚'
FROM food f
WHERE f.name = '多春鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '多春鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 19, 'TFDA:E3800201 大芥菜'
FROM food f
WHERE f.name = '大叶芥菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大叶芥菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.8, 'TFDA:E3800201 大芥菜'
FROM food f
WHERE f.name = '大叶芥菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大叶芥菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 3.4, 'TFDA:E3800201 大芥菜'
FROM food f
WHERE f.name = '大叶芥菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大叶芥菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.5, 'TFDA:E3800201 大芥菜'
FROM food f
WHERE f.name = '大叶芥菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大叶芥菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.6, 'TFDA:E3800201 大芥菜'
FROM food f
WHERE f.name = '大叶芥菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大叶芥菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 35, 'TFDA:E3800201 大芥菜'
FROM food f
WHERE f.name = '大叶芥菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大叶芥菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 180, 'TFDA:E3800201 大芥菜'
FROM food f
WHERE f.name = '大叶芥菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大叶芥菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 25, 'TFDA:E3800201 大芥菜'
FROM food f
WHERE f.name = '大叶芥菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大叶芥菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 94.6, 'TFDA:E3800201 大芥菜'
FROM food f
WHERE f.name = '大叶芥菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大叶芥菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 98, 'TFDA:E3800201 大芥菜'
FROM food f
WHERE f.name = '大叶芥菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大叶芥菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 17.013, 'USDA_FDC:2710819 Chia seeds, dry, raw'
FROM food f
WHERE f.name = '奇亚籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '奇亚籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 38.273, 'USDA_FDC:2710819 Chia seeds, dry, raw'
FROM food f
WHERE f.name = '奇亚籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '奇亚籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 32.89, 'USDA_FDC:2710819 Chia seeds, dry, raw'
FROM food f
WHERE f.name = '奇亚籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '奇亚籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'USDA_FDC:2710819 Chia seeds, dry, raw'
FROM food f
WHERE f.name = '奇亚籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '奇亚籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 642.1, 'USDA_FDC:2710819 Chia seeds, dry, raw'
FROM food f
WHERE f.name = '奇亚籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '奇亚籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 691.3, 'USDA_FDC:2710819 Chia seeds, dry, raw'
FROM food f
WHERE f.name = '奇亚籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '奇亚籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 5.78985, 'USDA_FDC:2346385 Cream cheese, full fat, block'
FROM food f
WHERE f.name = '奶油奶酪'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '奶油奶酪' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 4.55615, 'USDA_FDC:2346385 Cream cheese, full fat, block'
FROM food f
WHERE f.name = '奶油奶酪'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '奶油奶酪' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 33.49, 'USDA_FDC:2346385 Cream cheese, full fat, block'
FROM food f
WHERE f.name = '奶油奶酪'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '奶油奶酪' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 367.8, 'USDA_FDC:2346385 Cream cheese, full fat, block'
FROM food f
WHERE f.name = '奶油奶酪'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '奶油奶酪' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 124.8, 'USDA_FDC:2346385 Cream cheese, full fat, block'
FROM food f
WHERE f.name = '奶油奶酪'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '奶油奶酪' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 107.7, 'USDA_FDC:2346385 Cream cheese, full fat, block'
FROM food f
WHERE f.name = '奶油奶酪'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '奶油奶酪' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 101, 'USDA_FDC:2346385 Cream cheese, full fat, block'
FROM food f
WHERE f.name = '奶油奶酪'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '奶油奶酪' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 19.73, 'USDA_FDC:2346385 Cream cheese, full fat, block'
FROM food f
WHERE f.name = '奶油奶酪'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '奶油奶酪' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 333, 'TFDA:P0102001 薑粉'
FROM food f
WHERE f.name = '姜粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 10.4, 'TFDA:P0102001 薑粉'
FROM food f
WHERE f.name = '姜粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 70.5, 'TFDA:P0102001 薑粉'
FROM food f
WHERE f.name = '姜粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.6, 'TFDA:P0102001 薑粉'
FROM food f
WHERE f.name = '姜粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 19.8, 'TFDA:P0102001 薑粉'
FROM food f
WHERE f.name = '姜粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2849, 'TFDA:P0102001 薑粉'
FROM food f
WHERE f.name = '姜粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1905, 'TFDA:P0102001 薑粉'
FROM food f
WHERE f.name = '姜粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 178, 'TFDA:P0102001 薑粉'
FROM food f
WHERE f.name = '姜粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.4, 'TFDA:P0102001 薑粉'
FROM food f
WHERE f.name = '姜粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 8.9, 'TFDA:P0102001 薑粉'
FROM food f
WHERE f.name = '姜粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 18.39, 'TFDA:P0102001 薑粉'
FROM food f
WHERE f.name = '姜粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 195, 'TFDA:P0102001 薑粉'
FROM food f
WHERE f.name = '姜粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 312, 'USDA_FDC:172231 Spices, turmeric, ground'
FROM food f
WHERE f.name = '姜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 9.68, 'USDA_FDC:172231 Spices, turmeric, ground'
FROM food f
WHERE f.name = '姜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 67.14, 'USDA_FDC:172231 Spices, turmeric, ground'
FROM food f
WHERE f.name = '姜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.25, 'USDA_FDC:172231 Spices, turmeric, ground'
FROM food f
WHERE f.name = '姜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 22.7, 'USDA_FDC:172231 Spices, turmeric, ground'
FROM food f
WHERE f.name = '姜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 27, 'USDA_FDC:172231 Spices, turmeric, ground'
FROM food f
WHERE f.name = '姜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 2080, 'USDA_FDC:172231 Spices, turmeric, ground'
FROM food f
WHERE f.name = '姜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 299, 'USDA_FDC:172231 Spices, turmeric, ground'
FROM food f
WHERE f.name = '姜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:172231 Spices, turmeric, ground'
FROM food f
WHERE f.name = '姜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.838, 'USDA_FDC:172231 Spices, turmeric, ground'
FROM food f
WHERE f.name = '姜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '姜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 375, 'USDA_FDC:170923 Spices, cumin seed'
FROM food f
WHERE f.name = '孜然'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '孜然' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 17.81, 'USDA_FDC:170923 Spices, cumin seed'
FROM food f
WHERE f.name = '孜然'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '孜然' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 44.24, 'USDA_FDC:170923 Spices, cumin seed'
FROM food f
WHERE f.name = '孜然'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '孜然' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 22.27, 'USDA_FDC:170923 Spices, cumin seed'
FROM food f
WHERE f.name = '孜然'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '孜然' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 10.5, 'USDA_FDC:170923 Spices, cumin seed'
FROM food f
WHERE f.name = '孜然'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '孜然' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 168, 'USDA_FDC:170923 Spices, cumin seed'
FROM food f
WHERE f.name = '孜然'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '孜然' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1788, 'USDA_FDC:170923 Spices, cumin seed'
FROM food f
WHERE f.name = '孜然'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '孜然' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 499, 'USDA_FDC:170923 Spices, cumin seed'
FROM food f
WHERE f.name = '孜然'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '孜然' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170923 Spices, cumin seed'
FROM food f
WHERE f.name = '孜然'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '孜然' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.535, 'USDA_FDC:170923 Spices, cumin seed'
FROM food f
WHERE f.name = '孜然'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '孜然' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 68, 'TFDA:J0403001 鮟鱇'
FROM food f
WHERE f.name = '安康鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '安康鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 14.9, 'TFDA:J0403001 鮟鱇'
FROM food f
WHERE f.name = '安康鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '安康鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.6, 'TFDA:J0403001 鮟鱇'
FROM food f
WHERE f.name = '安康鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '安康鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.5, 'TFDA:J0403001 鮟鱇'
FROM food f
WHERE f.name = '安康鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '安康鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 117, 'TFDA:J0403001 鮟鱇'
FROM food f
WHERE f.name = '安康鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '安康鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 302, 'TFDA:J0403001 鮟鱇'
FROM food f
WHERE f.name = '安康鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '安康鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 140, 'TFDA:J0403001 鮟鱇'
FROM food f
WHERE f.name = '安康鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '安康鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 71, 'TFDA:J0403001 鮟鱇'
FROM food f
WHERE f.name = '安康鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '安康鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.2, 'TFDA:J0403001 鮟鱇'
FROM food f
WHERE f.name = '安康鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '安康鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 83, 'TFDA:J0403001 鮟鱇'
FROM food f
WHERE f.name = '安康鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '安康鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.4, 'TFDA:J0403001 鮟鱇'
FROM food f
WHERE f.name = '安康鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '安康鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 8, 'TFDA:J0403001 鮟鱇'
FROM food f
WHERE f.name = '安康鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '安康鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 267, 'TFDA:I0308301 豬腹脇排'
FROM food f
WHERE f.name = '小排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 18.7, 'TFDA:I0308301 豬腹脇排'
FROM food f
WHERE f.name = '小排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:I0308301 豬腹脇排'
FROM food f
WHERE f.name = '小排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 20.7, 'TFDA:I0308301 豬腹脇排'
FROM food f
WHERE f.name = '小排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 67, 'TFDA:I0308301 豬腹脇排'
FROM food f
WHERE f.name = '小排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 324, 'TFDA:I0308301 豬腹脇排'
FROM food f
WHERE f.name = '小排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 182, 'TFDA:I0308301 豬腹脇排'
FROM food f
WHERE f.name = '小排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 58, 'TFDA:I0308301 豬腹脇排'
FROM food f
WHERE f.name = '小排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 9, 'TFDA:I0308301 豬腹脇排'
FROM food f
WHERE f.name = '小排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 63.6, 'TFDA:I0308301 豬腹脇排'
FROM food f
WHERE f.name = '小排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.21, 'TFDA:I0308301 豬腹脇排'
FROM food f
WHERE f.name = '小排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 7, 'TFDA:I0308301 豬腹脇排'
FROM food f
WHERE f.name = '小排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 0, 'USDA_FDC:175040 Leavening agents, baking soda'
FROM food f
WHERE f.name = '小苏打'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小苏打' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'USDA_FDC:175040 Leavening agents, baking soda'
FROM food f
WHERE f.name = '小苏打'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小苏打' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:175040 Leavening agents, baking soda'
FROM food f
WHERE f.name = '小苏打'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小苏打' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0, 'USDA_FDC:175040 Leavening agents, baking soda'
FROM food f
WHERE f.name = '小苏打'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小苏打' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:175040 Leavening agents, baking soda'
FROM food f
WHERE f.name = '小苏打'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小苏打' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 27360, 'USDA_FDC:175040 Leavening agents, baking soda'
FROM food f
WHERE f.name = '小苏打'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小苏打' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 0, 'USDA_FDC:175040 Leavening agents, baking soda'
FROM food f
WHERE f.name = '小苏打'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小苏打' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 0, 'USDA_FDC:175040 Leavening agents, baking soda'
FROM food f
WHERE f.name = '小苏打'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小苏打' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:175040 Leavening agents, baking soda'
FROM food f
WHERE f.name = '小苏打'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小苏打' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'USDA_FDC:175040 Leavening agents, baking soda'
FROM food f
WHERE f.name = '小苏打'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小苏打' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 345, 'USDA_FDC:171323 Spices, fennel seed'
FROM food f
WHERE f.name = '小茴香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小茴香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 15.8, 'USDA_FDC:171323 Spices, fennel seed'
FROM food f
WHERE f.name = '小茴香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小茴香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 52.29, 'USDA_FDC:171323 Spices, fennel seed'
FROM food f
WHERE f.name = '小茴香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小茴香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 14.87, 'USDA_FDC:171323 Spices, fennel seed'
FROM food f
WHERE f.name = '小茴香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小茴香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 39.8, 'USDA_FDC:171323 Spices, fennel seed'
FROM food f
WHERE f.name = '小茴香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小茴香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 88, 'USDA_FDC:171323 Spices, fennel seed'
FROM food f
WHERE f.name = '小茴香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小茴香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1694, 'USDA_FDC:171323 Spices, fennel seed'
FROM food f
WHERE f.name = '小茴香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小茴香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 487, 'USDA_FDC:171323 Spices, fennel seed'
FROM food f
WHERE f.name = '小茴香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小茴香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:171323 Spices, fennel seed'
FROM food f
WHERE f.name = '小茴香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小茴香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.48, 'USDA_FDC:171323 Spices, fennel seed'
FROM food f
WHERE f.name = '小茴香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小茴香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 362, 'TFDA:A0300101 小麥'
FROM food f
WHERE f.name = '小麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 14.1, 'TFDA:A0300101 小麥'
FROM food f
WHERE f.name = '小麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 69.2, 'TFDA:A0300101 小麥'
FROM food f
WHERE f.name = '小麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2.6, 'TFDA:A0300101 小麥'
FROM food f
WHERE f.name = '小麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 11.3, 'TFDA:A0300101 小麥'
FROM food f
WHERE f.name = '小麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'TFDA:A0300101 小麥'
FROM food f
WHERE f.name = '小麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 364, 'TFDA:A0300101 小麥'
FROM food f
WHERE f.name = '小麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 241, 'TFDA:A0300101 小麥'
FROM food f
WHERE f.name = '小麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.5, 'TFDA:A0300101 小麥'
FROM food f
WHERE f.name = '小麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 12.6, 'TFDA:A0300101 小麥'
FROM food f
WHERE f.name = '小麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 3.5, 'TFDA:A0300101 小麥'
FROM food f
WHERE f.name = '小麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 19, 'TFDA:A0300101 小麥'
FROM food f
WHERE f.name = '小麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 341, 'USDA_FDC:175205 Broadbeans (fava beans), mature seeds, raw'
FROM food f
WHERE f.name = '干蚕豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干蚕豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 26.12, 'USDA_FDC:175205 Broadbeans (fava beans), mature seeds, raw'
FROM food f
WHERE f.name = '干蚕豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干蚕豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 58.29, 'USDA_FDC:175205 Broadbeans (fava beans), mature seeds, raw'
FROM food f
WHERE f.name = '干蚕豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干蚕豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.53, 'USDA_FDC:175205 Broadbeans (fava beans), mature seeds, raw'
FROM food f
WHERE f.name = '干蚕豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干蚕豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 25, 'USDA_FDC:175205 Broadbeans (fava beans), mature seeds, raw'
FROM food f
WHERE f.name = '干蚕豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干蚕豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 13, 'USDA_FDC:175205 Broadbeans (fava beans), mature seeds, raw'
FROM food f
WHERE f.name = '干蚕豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干蚕豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1062, 'USDA_FDC:175205 Broadbeans (fava beans), mature seeds, raw'
FROM food f
WHERE f.name = '干蚕豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干蚕豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 421, 'USDA_FDC:175205 Broadbeans (fava beans), mature seeds, raw'
FROM food f
WHERE f.name = '干蚕豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干蚕豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:175205 Broadbeans (fava beans), mature seeds, raw'
FROM food f
WHERE f.name = '干蚕豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干蚕豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.254, 'USDA_FDC:175205 Broadbeans (fava beans), mature seeds, raw'
FROM food f
WHERE f.name = '干蚕豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干蚕豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 382, 'TFDA:E7510101 乾長辣椒(紅皮)'
FROM food f
WHERE f.name = '干辣椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干辣椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 19.9, 'TFDA:E7510101 乾長辣椒(紅皮)'
FROM food f
WHERE f.name = '干辣椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干辣椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 47.6, 'TFDA:E7510101 乾長辣椒(紅皮)'
FROM food f
WHERE f.name = '干辣椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干辣椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 17.2, 'TFDA:E7510101 乾長辣椒(紅皮)'
FROM food f
WHERE f.name = '干辣椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干辣椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 41.4, 'TFDA:E7510101 乾長辣椒(紅皮)'
FROM food f
WHERE f.name = '干辣椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干辣椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 40, 'TFDA:E7510101 乾長辣椒(紅皮)'
FROM food f
WHERE f.name = '干辣椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干辣椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 2017, 'TFDA:E7510101 乾長辣椒(紅皮)'
FROM food f
WHERE f.name = '干辣椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干辣椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 298, 'TFDA:E7510101 乾長辣椒(紅皮)'
FROM food f
WHERE f.name = '干辣椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干辣椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 4.8, 'TFDA:E7510101 乾長辣椒(紅皮)'
FROM food f
WHERE f.name = '干辣椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干辣椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 13.3, 'TFDA:E7510101 乾長辣椒(紅皮)'
FROM food f
WHERE f.name = '干辣椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干辣椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 30.28, 'TFDA:E7510101 乾長辣椒(紅皮)'
FROM food f
WHERE f.name = '干辣椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干辣椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 100, 'TFDA:E7510101 乾長辣椒(紅皮)'
FROM food f
WHERE f.name = '干辣椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干辣椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 371, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '意大利面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '意大利面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 13.04, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '意大利面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '意大利面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 74.67, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '意大利面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '意大利面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.51, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '意大利面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '意大利面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.2, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '意大利面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '意大利面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 6, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '意大利面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '意大利面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 223, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '意大利面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '意大利面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 189, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '意大利面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '意大利面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '意大利面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '意大利面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.277, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '意大利面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '意大利面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 221, 'TFDA:P1002401 排骨醬'
FROM food f
WHERE f.name = '排骨酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '排骨酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.3, 'TFDA:P1002401 排骨醬'
FROM food f
WHERE f.name = '排骨酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '排骨酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 43.1, 'TFDA:P1002401 排骨醬'
FROM food f
WHERE f.name = '排骨酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '排骨酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 4.4, 'TFDA:P1002401 排骨醬'
FROM food f
WHERE f.name = '排骨酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '排骨酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.4, 'TFDA:P1002401 排骨醬'
FROM food f
WHERE f.name = '排骨酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '排骨酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 4196, 'TFDA:P1002401 排骨醬'
FROM food f
WHERE f.name = '排骨酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '排骨酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 278, 'TFDA:P1002401 排骨醬'
FROM food f
WHERE f.name = '排骨酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '排骨酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 51, 'TFDA:P1002401 排骨醬'
FROM food f
WHERE f.name = '排骨酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '排骨酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.8, 'TFDA:P1002401 排骨醬'
FROM food f
WHERE f.name = '排骨酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '排骨酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 39.1, 'TFDA:P1002401 排骨醬'
FROM food f
WHERE f.name = '排骨酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '排骨酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.09, 'TFDA:P1002401 排骨醬'
FROM food f
WHERE f.name = '排骨酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '排骨酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 6, 'TFDA:P1002401 排骨醬'
FROM food f
WHERE f.name = '排骨酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '排骨酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 33, 'TFDA:D1900301 無籽西瓜'
FROM food f
WHERE f.name = '无籽西瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无籽西瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.9, 'TFDA:D1900301 無籽西瓜'
FROM food f
WHERE f.name = '无籽西瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无籽西瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 8.2, 'TFDA:D1900301 無籽西瓜'
FROM food f
WHERE f.name = '无籽西瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无籽西瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0, 'TFDA:D1900301 無籽西瓜'
FROM food f
WHERE f.name = '无籽西瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无籽西瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.6, 'TFDA:D1900301 無籽西瓜'
FROM food f
WHERE f.name = '无籽西瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无籽西瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'TFDA:D1900301 無籽西瓜'
FROM food f
WHERE f.name = '无籽西瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无籽西瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 150, 'TFDA:D1900301 無籽西瓜'
FROM food f
WHERE f.name = '无籽西瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无籽西瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 23, 'TFDA:D1900301 無籽西瓜'
FROM food f
WHERE f.name = '无籽西瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无籽西瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 90.5, 'TFDA:D1900301 無籽西瓜'
FROM food f
WHERE f.name = '无籽西瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无籽西瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.07, 'TFDA:D1900301 無籽西瓜'
FROM food f
WHERE f.name = '无籽西瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无籽西瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 15, 'TFDA:D1900301 無籽西瓜'
FROM food f
WHERE f.name = '无籽西瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无籽西瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 67, 'TFDA:D4400101 無花果'
FROM food f
WHERE f.name = '无花果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无花果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.2, 'TFDA:D4400101 無花果'
FROM food f
WHERE f.name = '无花果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无花果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 16.5, 'TFDA:D4400101 無花果'
FROM food f
WHERE f.name = '无花果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无花果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.4, 'TFDA:D4400101 無花果'
FROM food f
WHERE f.name = '无花果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无花果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.5, 'TFDA:D4400101 無花果'
FROM food f
WHERE f.name = '无花果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无花果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 9, 'TFDA:D4400101 無花果'
FROM food f
WHERE f.name = '无花果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无花果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 288, 'TFDA:D4400101 無花果'
FROM food f
WHERE f.name = '无花果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无花果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 24, 'TFDA:D4400101 無花果'
FROM food f
WHERE f.name = '无花果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无花果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'TFDA:D4400101 無花果'
FROM food f
WHERE f.name = '无花果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无花果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.2, 'TFDA:D4400101 無花果'
FROM food f
WHERE f.name = '无花果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无花果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 81.3, 'TFDA:D4400101 無花果'
FROM food f
WHERE f.name = '无花果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无花果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.8, 'TFDA:D4400101 無花果'
FROM food f
WHERE f.name = '无花果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无花果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 36, 'TFDA:D4400101 無花果'
FROM food f
WHERE f.name = '无花果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '无花果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 72, 'TFDA:J2500201 蛙形蟹'
FROM food f
WHERE f.name = '旭蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '旭蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 16.6, 'TFDA:J2500201 蛙形蟹'
FROM food f
WHERE f.name = '旭蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '旭蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 2.8, 'TFDA:J2500201 蛙形蟹'
FROM food f
WHERE f.name = '旭蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '旭蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:J2500201 蛙形蟹'
FROM food f
WHERE f.name = '旭蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '旭蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 343, 'TFDA:J2500201 蛙形蟹'
FROM food f
WHERE f.name = '旭蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '旭蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 303, 'TFDA:J2500201 蛙形蟹'
FROM food f
WHERE f.name = '旭蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '旭蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 119, 'TFDA:J2500201 蛙形蟹'
FROM food f
WHERE f.name = '旭蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '旭蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 54, 'TFDA:J2500201 蛙形蟹'
FROM food f
WHERE f.name = '旭蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '旭蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:J2500201 蛙形蟹'
FROM food f
WHERE f.name = '旭蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '旭蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 78.2, 'TFDA:J2500201 蛙形蟹'
FROM food f
WHERE f.name = '旭蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '旭蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.36, 'TFDA:J2500201 蛙形蟹'
FROM food f
WHERE f.name = '旭蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '旭蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 178, 'TFDA:J2500201 蛙形蟹'
FROM food f
WHERE f.name = '旭蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '旭蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 76, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '明太鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '明太鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 17.17, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '明太鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '明太鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '明太鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '明太鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.82, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '明太鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '明太鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 159, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '明太鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '明太鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 331, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '明太鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '明太鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 190, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '明太鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '明太鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 61, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '明太鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '明太鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.148, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '明太鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '明太鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 241, 'TFDA:R1800201 春捲皮'
FROM food f
WHERE f.name = '春卷皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '春卷皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 8.3, 'TFDA:R1800201 春捲皮'
FROM food f
WHERE f.name = '春卷皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '春卷皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 50.4, 'TFDA:R1800201 春捲皮'
FROM food f
WHERE f.name = '春卷皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '春卷皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.7, 'TFDA:R1800201 春捲皮'
FROM food f
WHERE f.name = '春卷皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '春卷皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2, 'TFDA:R1800201 春捲皮'
FROM food f
WHERE f.name = '春卷皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '春卷皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 545, 'TFDA:R1800201 春捲皮'
FROM food f
WHERE f.name = '春卷皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '春卷皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 75, 'TFDA:R1800201 春捲皮'
FROM food f
WHERE f.name = '春卷皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '春卷皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 65, 'TFDA:R1800201 春捲皮'
FROM food f
WHERE f.name = '春卷皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '春卷皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:R1800201 春捲皮'
FROM food f
WHERE f.name = '春卷皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '春卷皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 38.9, 'TFDA:R1800201 春捲皮'
FROM food f
WHERE f.name = '春卷皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '春卷皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.09, 'TFDA:R1800201 春捲皮'
FROM food f
WHERE f.name = '春卷皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '春卷皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 16, 'TFDA:R1800201 春捲皮'
FROM food f
WHERE f.name = '春卷皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '春卷皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 47, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '朝鲜蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝鲜蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 3.27, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '朝鲜蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝鲜蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 10.51, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '朝鲜蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝鲜蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.15, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '朝鲜蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝鲜蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 5.4, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '朝鲜蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝鲜蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 94, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '朝鲜蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝鲜蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 370, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '朝鲜蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝鲜蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 90, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '朝鲜蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝鲜蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '朝鲜蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝鲜蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.036, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '朝鲜蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝鲜蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 31, 'USDA_FDC:171715 Carambola, (starfruit), raw'
FROM food f
WHERE f.name = '杨桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杨桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.04, 'USDA_FDC:171715 Carambola, (starfruit), raw'
FROM food f
WHERE f.name = '杨桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杨桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 6.73, 'USDA_FDC:171715 Carambola, (starfruit), raw'
FROM food f
WHERE f.name = '杨桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杨桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.33, 'USDA_FDC:171715 Carambola, (starfruit), raw'
FROM food f
WHERE f.name = '杨桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杨桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.8, 'USDA_FDC:171715 Carambola, (starfruit), raw'
FROM food f
WHERE f.name = '杨桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杨桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'USDA_FDC:171715 Carambola, (starfruit), raw'
FROM food f
WHERE f.name = '杨桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杨桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 133, 'USDA_FDC:171715 Carambola, (starfruit), raw'
FROM food f
WHERE f.name = '杨桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杨桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 12, 'USDA_FDC:171715 Carambola, (starfruit), raw'
FROM food f
WHERE f.name = '杨桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杨桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:171715 Carambola, (starfruit), raw'
FROM food f
WHERE f.name = '杨桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杨桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.019, 'USDA_FDC:171715 Carambola, (starfruit), raw'
FROM food f
WHERE f.name = '杨桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杨桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 224, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '板栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '板栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 4.2, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '板栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '板栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 49.07, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '板栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '板栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.11, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '板栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '板栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 3, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '板栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '板栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 447, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '板栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '板栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 96, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '板栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '板栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '板栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '板栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.164, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '板栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '板栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 91, 'TFDA:Q2100301 果凍'
FROM food f
WHERE f.name = '果冻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '果冻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 22.3, 'TFDA:Q2100301 果凍'
FROM food f
WHERE f.name = '果冻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '果冻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'TFDA:Q2100301 果凍'
FROM food f
WHERE f.name = '果冻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '果冻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.1, 'TFDA:Q2100301 果凍'
FROM food f
WHERE f.name = '果冻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '果冻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 30, 'TFDA:Q2100301 果凍'
FROM food f
WHERE f.name = '果冻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '果冻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 129, 'TFDA:Q2100301 果凍'
FROM food f
WHERE f.name = '果冻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '果冻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 25, 'TFDA:Q2100301 果凍'
FROM food f
WHERE f.name = '果冻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '果冻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:Q2100301 果凍'
FROM food f
WHERE f.name = '果冻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '果冻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 77.2, 'TFDA:Q2100301 果凍'
FROM food f
WHERE f.name = '果冻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '果冻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:Q2100301 果凍'
FROM food f
WHERE f.name = '果冻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '果冻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 2, 'TFDA:Q2100301 果凍'
FROM food f
WHERE f.name = '果冻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '果冻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 104, 'TFDA:J0401901 長體油胡瓜魚'
FROM food f
WHERE f.name = '柳叶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柳叶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 15, 'TFDA:J0401901 長體油胡瓜魚'
FROM food f
WHERE f.name = '柳叶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柳叶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0401901 長體油胡瓜魚'
FROM food f
WHERE f.name = '柳叶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柳叶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 4.4, 'TFDA:J0401901 長體油胡瓜魚'
FROM food f
WHERE f.name = '柳叶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柳叶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 104, 'TFDA:J0401901 長體油胡瓜魚'
FROM food f
WHERE f.name = '柳叶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柳叶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 175, 'TFDA:J0401901 長體油胡瓜魚'
FROM food f
WHERE f.name = '柳叶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柳叶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 318, 'TFDA:J0401901 長體油胡瓜魚'
FROM food f
WHERE f.name = '柳叶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柳叶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 224, 'TFDA:J0401901 長體油胡瓜魚'
FROM food f
WHERE f.name = '柳叶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柳叶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.9, 'TFDA:J0401901 長體油胡瓜魚'
FROM food f
WHERE f.name = '柳叶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柳叶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 79.8, 'TFDA:J0401901 長體油胡瓜魚'
FROM food f
WHERE f.name = '柳叶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柳叶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.44, 'TFDA:J0401901 長體油胡瓜魚'
FROM food f
WHERE f.name = '柳叶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柳叶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 246, 'TFDA:J0401901 長體油胡瓜魚'
FROM food f
WHERE f.name = '柳叶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柳叶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 224, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '栗子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '栗子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 4.2, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '栗子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '栗子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 49.07, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '栗子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '栗子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.11, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '栗子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '栗子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 3, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '栗子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '栗子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 447, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '栗子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '栗子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 96, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '栗子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '栗子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '栗子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '栗子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.164, 'USDA_FDC:170164 Nuts, chestnuts, chinese, raw'
FROM food f
WHERE f.name = '栗子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '栗子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 247, 'USDA_FDC:171320 Spices, cinnamon, ground'
FROM food f
WHERE f.name = '桂皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 3.99, 'USDA_FDC:171320 Spices, cinnamon, ground'
FROM food f
WHERE f.name = '桂皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 80.59, 'USDA_FDC:171320 Spices, cinnamon, ground'
FROM food f
WHERE f.name = '桂皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.24, 'USDA_FDC:171320 Spices, cinnamon, ground'
FROM food f
WHERE f.name = '桂皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 53.1, 'USDA_FDC:171320 Spices, cinnamon, ground'
FROM food f
WHERE f.name = '桂皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 10, 'USDA_FDC:171320 Spices, cinnamon, ground'
FROM food f
WHERE f.name = '桂皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 431, 'USDA_FDC:171320 Spices, cinnamon, ground'
FROM food f
WHERE f.name = '桂皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 64, 'USDA_FDC:171320 Spices, cinnamon, ground'
FROM food f
WHERE f.name = '桂皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:171320 Spices, cinnamon, ground'
FROM food f
WHERE f.name = '桂皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.345, 'USDA_FDC:171320 Spices, cinnamon, ground'
FROM food f
WHERE f.name = '桂皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 884, 'USDA_FDC:171024 Oil, cottonseed, salad or cooking'
FROM food f
WHERE f.name = '棉籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棉籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'USDA_FDC:171024 Oil, cottonseed, salad or cooking'
FROM food f
WHERE f.name = '棉籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棉籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:171024 Oil, cottonseed, salad or cooking'
FROM food f
WHERE f.name = '棉籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棉籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 100, 'USDA_FDC:171024 Oil, cottonseed, salad or cooking'
FROM food f
WHERE f.name = '棉籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棉籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:171024 Oil, cottonseed, salad or cooking'
FROM food f
WHERE f.name = '棉籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棉籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'USDA_FDC:171024 Oil, cottonseed, salad or cooking'
FROM food f
WHERE f.name = '棉籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棉籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 0, 'USDA_FDC:171024 Oil, cottonseed, salad or cooking'
FROM food f
WHERE f.name = '棉籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棉籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 0, 'USDA_FDC:171024 Oil, cottonseed, salad or cooking'
FROM food f
WHERE f.name = '棉籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棉籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:171024 Oil, cottonseed, salad or cooking'
FROM food f
WHERE f.name = '棉籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棉籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 25.9, 'USDA_FDC:171024 Oil, cottonseed, salad or cooking'
FROM food f
WHERE f.name = '棉籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棉籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 11, 100, 'USDA_FDC:171024 Oil, cottonseed, salad or cooking'
FROM food f
WHERE f.name = '棉籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棉籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 11
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 884, 'USDA_FDC:171015 Oil, palm'
FROM food f
WHERE f.name = '棕榈油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棕榈油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'USDA_FDC:171015 Oil, palm'
FROM food f
WHERE f.name = '棕榈油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棕榈油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:171015 Oil, palm'
FROM food f
WHERE f.name = '棕榈油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棕榈油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 100, 'USDA_FDC:171015 Oil, palm'
FROM food f
WHERE f.name = '棕榈油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棕榈油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:171015 Oil, palm'
FROM food f
WHERE f.name = '棕榈油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棕榈油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'USDA_FDC:171015 Oil, palm'
FROM food f
WHERE f.name = '棕榈油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棕榈油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 0, 'USDA_FDC:171015 Oil, palm'
FROM food f
WHERE f.name = '棕榈油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棕榈油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 0, 'USDA_FDC:171015 Oil, palm'
FROM food f
WHERE f.name = '棕榈油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棕榈油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:171015 Oil, palm'
FROM food f
WHERE f.name = '棕榈油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棕榈油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 49.3, 'USDA_FDC:171015 Oil, palm'
FROM food f
WHERE f.name = '棕榈油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棕榈油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 11, 100, 'USDA_FDC:171015 Oil, palm'
FROM food f
WHERE f.name = '棕榈油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '棕榈油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 11
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 19, 'USDA_FDC:170174 Nuts, coconut water (liquid from coconuts)'
FROM food f
WHERE f.name = '椰子水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.72, 'USDA_FDC:170174 Nuts, coconut water (liquid from coconuts)'
FROM food f
WHERE f.name = '椰子水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 3.71, 'USDA_FDC:170174 Nuts, coconut water (liquid from coconuts)'
FROM food f
WHERE f.name = '椰子水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'USDA_FDC:170174 Nuts, coconut water (liquid from coconuts)'
FROM food f
WHERE f.name = '椰子水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.1, 'USDA_FDC:170174 Nuts, coconut water (liquid from coconuts)'
FROM food f
WHERE f.name = '椰子水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 105, 'USDA_FDC:170174 Nuts, coconut water (liquid from coconuts)'
FROM food f
WHERE f.name = '椰子水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 250, 'USDA_FDC:170174 Nuts, coconut water (liquid from coconuts)'
FROM food f
WHERE f.name = '椰子水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 20, 'USDA_FDC:170174 Nuts, coconut water (liquid from coconuts)'
FROM food f
WHERE f.name = '椰子水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170174 Nuts, coconut water (liquid from coconuts)'
FROM food f
WHERE f.name = '椰子水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.176, 'USDA_FDC:170174 Nuts, coconut water (liquid from coconuts)'
FROM food f
WHERE f.name = '椰子水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 33, 'TFDA:G1400301 珊瑚菇'
FROM food f
WHERE f.name = '榆黄蘑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榆黄蘑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 4, 'TFDA:G1400301 珊瑚菇'
FROM food f
WHERE f.name = '榆黄蘑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榆黄蘑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 5.2, 'TFDA:G1400301 珊瑚菇'
FROM food f
WHERE f.name = '榆黄蘑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榆黄蘑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'TFDA:G1400301 珊瑚菇'
FROM food f
WHERE f.name = '榆黄蘑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榆黄蘑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.7, 'TFDA:G1400301 珊瑚菇'
FROM food f
WHERE f.name = '榆黄蘑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榆黄蘑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'TFDA:G1400301 珊瑚菇'
FROM food f
WHERE f.name = '榆黄蘑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榆黄蘑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 328, 'TFDA:G1400301 珊瑚菇'
FROM food f
WHERE f.name = '榆黄蘑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榆黄蘑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 133, 'TFDA:G1400301 珊瑚菇'
FROM food f
WHERE f.name = '榆黄蘑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榆黄蘑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:G1400301 珊瑚菇'
FROM food f
WHERE f.name = '榆黄蘑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榆黄蘑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 89.7, 'TFDA:G1400301 珊瑚菇'
FROM food f
WHERE f.name = '榆黄蘑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榆黄蘑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:G1400301 珊瑚菇'
FROM food f
WHERE f.name = '榆黄蘑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榆黄蘑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 3, 'TFDA:G1400301 珊瑚菇'
FROM food f
WHERE f.name = '榆黄蘑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榆黄蘑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 13.4938, 'USDA_FDC:2515375 Nuts, hazelnuts or filberts, raw'
FROM food f
WHERE f.name = '榛子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榛子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 26.5012, 'USDA_FDC:2515375 Nuts, hazelnuts or filberts, raw'
FROM food f
WHERE f.name = '榛子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榛子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 53.49, 'USDA_FDC:2515375 Nuts, hazelnuts or filberts, raw'
FROM food f
WHERE f.name = '榛子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榛子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 8.41, 'USDA_FDC:2515375 Nuts, hazelnuts or filberts, raw'
FROM food f
WHERE f.name = '榛子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榛子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'USDA_FDC:2515375 Nuts, hazelnuts or filberts, raw'
FROM food f
WHERE f.name = '榛子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榛子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 635.9, 'USDA_FDC:2515375 Nuts, hazelnuts or filberts, raw'
FROM food f
WHERE f.name = '榛子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榛子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 321.1, 'USDA_FDC:2515375 Nuts, hazelnuts or filberts, raw'
FROM food f
WHERE f.name = '榛子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榛子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 132, 'TFDA:D1000101 榴槤'
FROM food f
WHERE f.name = '榴莲'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榴莲' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.7, 'TFDA:D1000101 榴槤'
FROM food f
WHERE f.name = '榴莲'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榴莲' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 29.7, 'TFDA:D1000101 榴槤'
FROM food f
WHERE f.name = '榴莲'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榴莲' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.9, 'TFDA:D1000101 榴槤'
FROM food f
WHERE f.name = '榴莲'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榴莲' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.2, 'TFDA:D1000101 榴槤'
FROM food f
WHERE f.name = '榴莲'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榴莲' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'TFDA:D1000101 榴槤'
FROM food f
WHERE f.name = '榴莲'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榴莲' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 459, 'TFDA:D1000101 榴槤'
FROM food f
WHERE f.name = '榴莲'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榴莲' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 28, 'TFDA:D1000101 榴槤'
FROM food f
WHERE f.name = '榴莲'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榴莲' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'TFDA:D1000101 榴槤'
FROM food f
WHERE f.name = '榴莲'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榴莲' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.7, 'TFDA:D1000101 榴槤'
FROM food f
WHERE f.name = '榴莲'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榴莲' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 64.7, 'TFDA:D1000101 榴槤'
FROM food f
WHERE f.name = '榴莲'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榴莲' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 2.08, 'TFDA:D1000101 榴槤'
FROM food f
WHERE f.name = '榴莲'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榴莲' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 23, 'TFDA:D1000101 榴槤'
FROM food f
WHERE f.name = '榴莲'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '榴莲' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 387, 'USDA_FDC:170157 Nuts, acorns, raw'
FROM food f
WHERE f.name = '橡子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橡子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 6.15, 'USDA_FDC:170157 Nuts, acorns, raw'
FROM food f
WHERE f.name = '橡子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橡子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 40.75, 'USDA_FDC:170157 Nuts, acorns, raw'
FROM food f
WHERE f.name = '橡子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橡子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 23.86, 'USDA_FDC:170157 Nuts, acorns, raw'
FROM food f
WHERE f.name = '橡子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橡子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'USDA_FDC:170157 Nuts, acorns, raw'
FROM food f
WHERE f.name = '橡子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橡子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 539, 'USDA_FDC:170157 Nuts, acorns, raw'
FROM food f
WHERE f.name = '橡子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橡子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 79, 'USDA_FDC:170157 Nuts, acorns, raw'
FROM food f
WHERE f.name = '橡子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橡子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170157 Nuts, acorns, raw'
FROM food f
WHERE f.name = '橡子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橡子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 3.102, 'USDA_FDC:170157 Nuts, acorns, raw'
FROM food f
WHERE f.name = '橡子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橡子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 70, 'USDA_FDC:174196 Fish, flatfish (flounder and sole species), raw'
FROM food f
WHERE f.name = '比目鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '比目鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 12.41, 'USDA_FDC:174196 Fish, flatfish (flounder and sole species), raw'
FROM food f
WHERE f.name = '比目鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '比目鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:174196 Fish, flatfish (flounder and sole species), raw'
FROM food f
WHERE f.name = '比目鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '比目鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.93, 'USDA_FDC:174196 Fish, flatfish (flounder and sole species), raw'
FROM food f
WHERE f.name = '比目鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '比目鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:174196 Fish, flatfish (flounder and sole species), raw'
FROM food f
WHERE f.name = '比目鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '比目鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 296, 'USDA_FDC:174196 Fish, flatfish (flounder and sole species), raw'
FROM food f
WHERE f.name = '比目鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '比目鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 160, 'USDA_FDC:174196 Fish, flatfish (flounder and sole species), raw'
FROM food f
WHERE f.name = '比目鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '比目鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 252, 'USDA_FDC:174196 Fish, flatfish (flounder and sole species), raw'
FROM food f
WHERE f.name = '比目鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '比目鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 45, 'USDA_FDC:174196 Fish, flatfish (flounder and sole species), raw'
FROM food f
WHERE f.name = '比目鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '比目鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.441, 'USDA_FDC:174196 Fish, flatfish (flounder and sole species), raw'
FROM food f
WHERE f.name = '比目鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '比目鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 729, 'TFDA:P1001701 沙茶醬'
FROM food f
WHERE f.name = '沙茶酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙茶酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 10.2, 'TFDA:P1001701 沙茶醬'
FROM food f
WHERE f.name = '沙茶酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙茶酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 10.4, 'TFDA:P1001701 沙茶醬'
FROM food f
WHERE f.name = '沙茶酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙茶酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 71.8, 'TFDA:P1001701 沙茶醬'
FROM food f
WHERE f.name = '沙茶酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙茶酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.7, 'TFDA:P1001701 沙茶醬'
FROM food f
WHERE f.name = '沙茶酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙茶酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 421, 'TFDA:P1001701 沙茶醬'
FROM food f
WHERE f.name = '沙茶酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙茶酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 355, 'TFDA:P1001701 沙茶醬'
FROM food f
WHERE f.name = '沙茶酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙茶酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 282, 'TFDA:P1001701 沙茶醬'
FROM food f
WHERE f.name = '沙茶酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙茶酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 33, 'TFDA:P1001701 沙茶醬'
FROM food f
WHERE f.name = '沙茶酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙茶酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 13.2, 'TFDA:P1001701 沙茶醬'
FROM food f
WHERE f.name = '沙茶酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙茶酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 5.4, 'TFDA:P1001701 沙茶醬'
FROM food f
WHERE f.name = '沙茶酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙茶酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 40.72, 'TFDA:P1001701 沙茶醬'
FROM food f
WHERE f.name = '沙茶酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙茶酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 202, 'TFDA:P1001701 沙茶醬'
FROM food f
WHERE f.name = '沙茶酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙茶酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 39, 'USDA_FDC:327357 Nectarines, raw'
FROM food f
WHERE f.name = '油桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.06, 'USDA_FDC:327357 Nectarines, raw'
FROM food f
WHERE f.name = '油桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 9.18, 'USDA_FDC:327357 Nectarines, raw'
FROM food f
WHERE f.name = '油桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.28, 'USDA_FDC:327357 Nectarines, raw'
FROM food f
WHERE f.name = '油桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.5, 'USDA_FDC:327357 Nectarines, raw'
FROM food f
WHERE f.name = '油桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 13, 'USDA_FDC:327357 Nectarines, raw'
FROM food f
WHERE f.name = '油桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 131, 'USDA_FDC:327357 Nectarines, raw'
FROM food f
WHERE f.name = '油桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 26, 'USDA_FDC:327357 Nectarines, raw'
FROM food f
WHERE f.name = '油桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'USDA_FDC:327357 Nectarines, raw'
FROM food f
WHERE f.name = '油桃'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油桃' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 270, 'USDA_FDC:172451 Tofu, fried'
FROM food f
WHERE f.name = '油豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 18.82, 'USDA_FDC:172451 Tofu, fried'
FROM food f
WHERE f.name = '油豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 8.86, 'USDA_FDC:172451 Tofu, fried'
FROM food f
WHERE f.name = '油豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 20.18, 'USDA_FDC:172451 Tofu, fried'
FROM food f
WHERE f.name = '油豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.9, 'USDA_FDC:172451 Tofu, fried'
FROM food f
WHERE f.name = '油豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 16, 'USDA_FDC:172451 Tofu, fried'
FROM food f
WHERE f.name = '油豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 146, 'USDA_FDC:172451 Tofu, fried'
FROM food f
WHERE f.name = '油豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 287, 'USDA_FDC:172451 Tofu, fried'
FROM food f
WHERE f.name = '油豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:172451 Tofu, fried'
FROM food f
WHERE f.name = '油豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.918, 'USDA_FDC:172451 Tofu, fried'
FROM food f
WHERE f.name = '油豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 13, 'TFDA:E5300104 福山萵苣'
FROM food f
WHERE f.name = '油麦菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油麦菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1, 'TFDA:E5300104 福山萵苣'
FROM food f
WHERE f.name = '油麦菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油麦菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 2.3, 'TFDA:E5300104 福山萵苣'
FROM food f
WHERE f.name = '油麦菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油麦菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'TFDA:E5300104 福山萵苣'
FROM food f
WHERE f.name = '油麦菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油麦菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.4, 'TFDA:E5300104 福山萵苣'
FROM food f
WHERE f.name = '油麦菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油麦菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 20, 'TFDA:E5300104 福山萵苣'
FROM food f
WHERE f.name = '油麦菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油麦菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 248, 'TFDA:E5300104 福山萵苣'
FROM food f
WHERE f.name = '油麦菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油麦菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 22, 'TFDA:E5300104 福山萵苣'
FROM food f
WHERE f.name = '油麦菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油麦菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:E5300104 福山萵苣'
FROM food f
WHERE f.name = '油麦菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油麦菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 95.8, 'TFDA:E5300104 福山萵苣'
FROM food f
WHERE f.name = '油麦菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油麦菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.97, 'TFDA:E5300104 福山萵苣'
FROM food f
WHERE f.name = '油麦菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油麦菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 48, 'TFDA:E5300104 福山萵苣'
FROM food f
WHERE f.name = '油麦菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '油麦菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 73, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 17.44, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.01, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.6, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 4, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 429, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 78, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 73, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋生姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋生姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋生姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋生姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 17.44, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋生姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋生姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.01, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋生姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋生姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.6, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋生姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋生姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 4, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋生姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋生姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 429, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋生姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋生姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 78, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋生姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋生姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋生姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋生姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '洋生姜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋生姜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 47, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '洋蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 3.27, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '洋蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 10.51, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '洋蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.15, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '洋蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 5.4, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '洋蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 94, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '洋蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 370, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '洋蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 90, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '洋蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '洋蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.036, 'USDA_FDC:169205 Artichokes, (globe or french), raw'
FROM food f
WHERE f.name = '洋蓟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '洋蓟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 17, 'TFDA:F0700104 海帶結'
FROM food f
WHERE f.name = '海带结'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海带结' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.8, 'TFDA:F0700104 海帶結'
FROM food f
WHERE f.name = '海带结'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海带结' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 3.6, 'TFDA:F0700104 海帶結'
FROM food f
WHERE f.name = '海带结'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海带结' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:F0700104 海帶結'
FROM food f
WHERE f.name = '海带结'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海带结' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.4, 'TFDA:F0700104 海帶結'
FROM food f
WHERE f.name = '海带结'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海带结' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 230, 'TFDA:F0700104 海帶結'
FROM food f
WHERE f.name = '海带结'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海带结' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 7, 'TFDA:F0700104 海帶結'
FROM food f
WHERE f.name = '海带结'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海带结' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 11, 'TFDA:F0700104 海帶結'
FROM food f
WHERE f.name = '海带结'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海带结' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:F0700104 海帶結'
FROM food f
WHERE f.name = '海带结'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海带结' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 94.7, 'TFDA:F0700104 海帶結'
FROM food f
WHERE f.name = '海带结'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海带结' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.03, 'TFDA:F0700104 海帶結'
FROM food f
WHERE f.name = '海带结'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海带结' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 78, 'TFDA:F0700104 海帶結'
FROM food f
WHERE f.name = '海带结'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海带结' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 294, 'TFDA:F0210102 熟紫菜'
FROM food f
WHERE f.name = '海苔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海苔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 18.1, 'TFDA:F0210102 熟紫菜'
FROM food f
WHERE f.name = '海苔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海苔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 62.4, 'TFDA:F0210102 熟紫菜'
FROM food f
WHERE f.name = '海苔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海苔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.4, 'TFDA:F0210102 熟紫菜'
FROM food f
WHERE f.name = '海苔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海苔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 37.3, 'TFDA:F0210102 熟紫菜'
FROM food f
WHERE f.name = '海苔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海苔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 517, 'TFDA:F0210102 熟紫菜'
FROM food f
WHERE f.name = '海苔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海苔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1606, 'TFDA:F0210102 熟紫菜'
FROM food f
WHERE f.name = '海苔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海苔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 332, 'TFDA:F0210102 熟紫菜'
FROM food f
WHERE f.name = '海苔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海苔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.3, 'TFDA:F0210102 熟紫菜'
FROM food f
WHERE f.name = '海苔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海苔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 10.4, 'TFDA:F0210102 熟紫菜'
FROM food f
WHERE f.name = '海苔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海苔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.69, 'TFDA:F0210102 熟紫菜'
FROM food f
WHERE f.name = '海苔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海苔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 352, 'TFDA:F0210102 熟紫菜'
FROM food f
WHERE f.name = '海苔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海苔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 30, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '海鲜菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.9, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '海鲜菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 5.3, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '海鲜菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '海鲜菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.2, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '海鲜菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '海鲜菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 339, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '海鲜菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 85, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '海鲜菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '海鲜菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 90.8, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '海鲜菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '海鲜菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 2, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '海鲜菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 228, 'TFDA:P1002201 海鮮醬'
FROM food f
WHERE f.name = '海鲜酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.8, 'TFDA:P1002201 海鮮醬'
FROM food f
WHERE f.name = '海鲜酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 50.3, 'TFDA:P1002201 海鮮醬'
FROM food f
WHERE f.name = '海鲜酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2.2, 'TFDA:P1002201 海鮮醬'
FROM food f
WHERE f.name = '海鲜酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.4, 'TFDA:P1002201 海鮮醬'
FROM food f
WHERE f.name = '海鲜酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2271, 'TFDA:P1002201 海鮮醬'
FROM food f
WHERE f.name = '海鲜酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 133, 'TFDA:P1002201 海鮮醬'
FROM food f
WHERE f.name = '海鲜酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 39, 'TFDA:P1002201 海鮮醬'
FROM food f
WHERE f.name = '海鲜酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.4, 'TFDA:P1002201 海鮮醬'
FROM food f
WHERE f.name = '海鲜酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 39.2, 'TFDA:P1002201 海鮮醬'
FROM food f
WHERE f.name = '海鲜酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 9.84, 'TFDA:P1002201 海鮮醬'
FROM food f
WHERE f.name = '海鲜酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 15, 'TFDA:P1002201 海鮮醬'
FROM food f
WHERE f.name = '海鲜酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '海鲜酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 340, 'USDA_FDC:170859 Cream, fluid, heavy whipping'
FROM food f
WHERE f.name = '淡奶油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '淡奶油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.84, 'USDA_FDC:170859 Cream, fluid, heavy whipping'
FROM food f
WHERE f.name = '淡奶油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '淡奶油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 2.84, 'USDA_FDC:170859 Cream, fluid, heavy whipping'
FROM food f
WHERE f.name = '淡奶油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '淡奶油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 36.08, 'USDA_FDC:170859 Cream, fluid, heavy whipping'
FROM food f
WHERE f.name = '淡奶油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '淡奶油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:170859 Cream, fluid, heavy whipping'
FROM food f
WHERE f.name = '淡奶油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '淡奶油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 27, 'USDA_FDC:170859 Cream, fluid, heavy whipping'
FROM food f
WHERE f.name = '淡奶油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '淡奶油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 95, 'USDA_FDC:170859 Cream, fluid, heavy whipping'
FROM food f
WHERE f.name = '淡奶油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '淡奶油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 58, 'USDA_FDC:170859 Cream, fluid, heavy whipping'
FROM food f
WHERE f.name = '淡奶油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '淡奶油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 113, 'USDA_FDC:170859 Cream, fluid, heavy whipping'
FROM food f
WHERE f.name = '淡奶油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '淡奶油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 23.032, 'USDA_FDC:170859 Cream, fluid, heavy whipping'
FROM food f
WHERE f.name = '淡奶油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '淡奶油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 355, 'TFDA:A0320101 去筋麵粉'
FROM food f
WHERE f.name = '澄粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '澄粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.2, 'TFDA:A0320101 去筋麵粉'
FROM food f
WHERE f.name = '澄粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '澄粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 85.7, 'TFDA:A0320101 去筋麵粉'
FROM food f
WHERE f.name = '澄粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '澄粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:A0320101 去筋麵粉'
FROM food f
WHERE f.name = '澄粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '澄粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.4, 'TFDA:A0320101 去筋麵粉'
FROM food f
WHERE f.name = '澄粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '澄粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 29, 'TFDA:A0320101 去筋麵粉'
FROM food f
WHERE f.name = '澄粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '澄粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 9, 'TFDA:A0320101 去筋麵粉'
FROM food f
WHERE f.name = '澄粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '澄粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 38, 'TFDA:A0320101 去筋麵粉'
FROM food f
WHERE f.name = '澄粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '澄粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:A0320101 去筋麵粉'
FROM food f
WHERE f.name = '澄粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '澄粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 13.6, 'TFDA:A0320101 去筋麵粉'
FROM food f
WHERE f.name = '澄粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '澄粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.04, 'TFDA:A0320101 去筋麵粉'
FROM food f
WHERE f.name = '澄粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '澄粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 7, 'TFDA:A0320101 去筋麵粉'
FROM food f
WHERE f.name = '澄粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '澄粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 323, 'TFDA:R2700401 燒餅'
FROM food f
WHERE f.name = '烧饼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '烧饼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 9.1, 'TFDA:R2700401 燒餅'
FROM food f
WHERE f.name = '烧饼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '烧饼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 51.1, 'TFDA:R2700401 燒餅'
FROM food f
WHERE f.name = '烧饼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '烧饼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 9.1, 'TFDA:R2700401 燒餅'
FROM food f
WHERE f.name = '烧饼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '烧饼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.2, 'TFDA:R2700401 燒餅'
FROM food f
WHERE f.name = '烧饼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '烧饼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 458, 'TFDA:R2700401 燒餅'
FROM food f
WHERE f.name = '烧饼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '烧饼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 81, 'TFDA:R2700401 燒餅'
FROM food f
WHERE f.name = '烧饼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '烧饼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 65, 'TFDA:R2700401 燒餅'
FROM food f
WHERE f.name = '烧饼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '烧饼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'TFDA:R2700401 燒餅'
FROM food f
WHERE f.name = '烧饼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '烧饼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.5, 'TFDA:R2700401 燒餅'
FROM food f
WHERE f.name = '烧饼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '烧饼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 29.2, 'TFDA:R2700401 燒餅'
FROM food f
WHERE f.name = '烧饼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '烧饼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 3.48, 'TFDA:R2700401 燒餅'
FROM food f
WHERE f.name = '烧饼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '烧饼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 8, 'TFDA:R2700401 燒餅'
FROM food f
WHERE f.name = '烧饼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '烧饼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 902, 'USDA_FDC:171400 Fat, beef tallow'
FROM food f
WHERE f.name = '牛油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'USDA_FDC:171400 Fat, beef tallow'
FROM food f
WHERE f.name = '牛油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:171400 Fat, beef tallow'
FROM food f
WHERE f.name = '牛油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 100, 'USDA_FDC:171400 Fat, beef tallow'
FROM food f
WHERE f.name = '牛油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:171400 Fat, beef tallow'
FROM food f
WHERE f.name = '牛油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'USDA_FDC:171400 Fat, beef tallow'
FROM food f
WHERE f.name = '牛油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 0, 'USDA_FDC:171400 Fat, beef tallow'
FROM food f
WHERE f.name = '牛油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 0, 'USDA_FDC:171400 Fat, beef tallow'
FROM food f
WHERE f.name = '牛油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 109, 'USDA_FDC:171400 Fat, beef tallow'
FROM food f
WHERE f.name = '牛油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 49.8, 'USDA_FDC:171400 Fat, beef tallow'
FROM food f
WHERE f.name = '牛油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 11, 100, 'USDA_FDC:171400 Fat, beef tallow'
FROM food f
WHERE f.name = '牛油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 11
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 884, 'USDA_FDC:173573 Oil, avocado'
FROM food f
WHERE f.name = '牛油果油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油果油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'USDA_FDC:173573 Oil, avocado'
FROM food f
WHERE f.name = '牛油果油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油果油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:173573 Oil, avocado'
FROM food f
WHERE f.name = '牛油果油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油果油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 100, 'USDA_FDC:173573 Oil, avocado'
FROM food f
WHERE f.name = '牛油果油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油果油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:173573 Oil, avocado'
FROM food f
WHERE f.name = '牛油果油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油果油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'USDA_FDC:173573 Oil, avocado'
FROM food f
WHERE f.name = '牛油果油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油果油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 0, 'USDA_FDC:173573 Oil, avocado'
FROM food f
WHERE f.name = '牛油果油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油果油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 0, 'USDA_FDC:173573 Oil, avocado'
FROM food f
WHERE f.name = '牛油果油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油果油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 11.56, 'USDA_FDC:173573 Oil, avocado'
FROM food f
WHERE f.name = '牛油果油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油果油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 11, 100, 'USDA_FDC:173573 Oil, avocado'
FROM food f
WHERE f.name = '牛油果油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛油果油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 11
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 335, 'TFDA:R5200101 片狀肉乾(牛肉)'
FROM food f
WHERE f.name = '牛肉干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肉干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 30.3, 'TFDA:R5200101 片狀肉乾(牛肉)'
FROM food f
WHERE f.name = '牛肉干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肉干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 41.8, 'TFDA:R5200101 片狀肉乾(牛肉)'
FROM food f
WHERE f.name = '牛肉干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肉干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 5.2, 'TFDA:R5200101 片狀肉乾(牛肉)'
FROM food f
WHERE f.name = '牛肉干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肉干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1317, 'TFDA:R5200101 片狀肉乾(牛肉)'
FROM food f
WHERE f.name = '牛肉干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肉干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 603, 'TFDA:R5200101 片狀肉乾(牛肉)'
FROM food f
WHERE f.name = '牛肉干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肉干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 267, 'TFDA:R5200101 片狀肉乾(牛肉)'
FROM food f
WHERE f.name = '牛肉干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肉干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 100, 'TFDA:R5200101 片狀肉乾(牛肉)'
FROM food f
WHERE f.name = '牛肉干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肉干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.3, 'TFDA:R5200101 片狀肉乾(牛肉)'
FROM food f
WHERE f.name = '牛肉干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肉干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 17.9, 'TFDA:R5200101 片狀肉乾(牛肉)'
FROM food f
WHERE f.name = '牛肉干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肉干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.29, 'TFDA:R5200101 片狀肉乾(牛肉)'
FROM food f
WHERE f.name = '牛肉干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肉干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 12, 'TFDA:R5200101 片狀肉乾(牛肉)'
FROM food f
WHERE f.name = '牛肉干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肉干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 151, 'TFDA:I0108302 牛後腿腱子心(2022年取樣)'
FROM food f
WHERE f.name = '牛腱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛腱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 23.7, 'TFDA:I0108302 牛後腿腱子心(2022年取樣)'
FROM food f
WHERE f.name = '牛腱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛腱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 4, 'TFDA:I0108302 牛後腿腱子心(2022年取樣)'
FROM food f
WHERE f.name = '牛腱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛腱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 5.5, 'TFDA:I0108302 牛後腿腱子心(2022年取樣)'
FROM food f
WHERE f.name = '牛腱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛腱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'TFDA:I0108302 牛後腿腱子心(2022年取樣)'
FROM food f
WHERE f.name = '牛腱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛腱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 63, 'TFDA:I0108302 牛後腿腱子心(2022年取樣)'
FROM food f
WHERE f.name = '牛腱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛腱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 313, 'TFDA:I0108302 牛後腿腱子心(2022年取樣)'
FROM food f
WHERE f.name = '牛腱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛腱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 170, 'TFDA:I0108302 牛後腿腱子心(2022年取樣)'
FROM food f
WHERE f.name = '牛腱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛腱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 67, 'TFDA:I0108302 牛後腿腱子心(2022年取樣)'
FROM food f
WHERE f.name = '牛腱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛腱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.3, 'TFDA:I0108302 牛後腿腱子心(2022年取樣)'
FROM food f
WHERE f.name = '牛腱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛腱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 65.8, 'TFDA:I0108302 牛後腿腱子心(2022年取樣)'
FROM food f
WHERE f.name = '牛腱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛腱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.39, 'TFDA:I0108302 牛後腿腱子心(2022年取樣)'
FROM food f
WHERE f.name = '牛腱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛腱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 6, 'TFDA:I0108302 牛後腿腱子心(2022年取樣)'
FROM food f
WHERE f.name = '牛腱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛腱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 265, 'USDA_FDC:171328 Spices, oregano, dried'
FROM food f
WHERE f.name = '牛至'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛至' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 9, 'USDA_FDC:171328 Spices, oregano, dried'
FROM food f
WHERE f.name = '牛至'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛至' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 68.92, 'USDA_FDC:171328 Spices, oregano, dried'
FROM food f
WHERE f.name = '牛至'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛至' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 4.28, 'USDA_FDC:171328 Spices, oregano, dried'
FROM food f
WHERE f.name = '牛至'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛至' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 42.5, 'USDA_FDC:171328 Spices, oregano, dried'
FROM food f
WHERE f.name = '牛至'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛至' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 25, 'USDA_FDC:171328 Spices, oregano, dried'
FROM food f
WHERE f.name = '牛至'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛至' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1260, 'USDA_FDC:171328 Spices, oregano, dried'
FROM food f
WHERE f.name = '牛至'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛至' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 148, 'USDA_FDC:171328 Spices, oregano, dried'
FROM food f
WHERE f.name = '牛至'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛至' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:171328 Spices, oregano, dried'
FROM food f
WHERE f.name = '牛至'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛至' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.551, 'USDA_FDC:171328 Spices, oregano, dried'
FROM food f
WHERE f.name = '牛至'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛至' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 76, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '狭鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '狭鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 17.17, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '狭鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '狭鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '狭鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '狭鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.82, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '狭鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '狭鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 159, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '狭鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '狭鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 331, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '狭鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '狭鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 190, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '狭鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '狭鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 61, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '狭鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '狭鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.148, 'USDA_FDC:173725 Fish, pollock, Alaska, raw'
FROM food f
WHERE f.name = '狭鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '狭鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 902, 'USDA_FDC:171401 Lard'
FROM food f
WHERE f.name = '猪油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'USDA_FDC:171401 Lard'
FROM food f
WHERE f.name = '猪油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:171401 Lard'
FROM food f
WHERE f.name = '猪油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 100, 'USDA_FDC:171401 Lard'
FROM food f
WHERE f.name = '猪油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:171401 Lard'
FROM food f
WHERE f.name = '猪油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'USDA_FDC:171401 Lard'
FROM food f
WHERE f.name = '猪油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 0, 'USDA_FDC:171401 Lard'
FROM food f
WHERE f.name = '猪油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 0, 'USDA_FDC:171401 Lard'
FROM food f
WHERE f.name = '猪油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 95, 'USDA_FDC:171401 Lard'
FROM food f
WHERE f.name = '猪油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 39.2, 'USDA_FDC:171401 Lard'
FROM food f
WHERE f.name = '猪油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 11, 100, 'USDA_FDC:171401 Lard'
FROM food f
WHERE f.name = '猪油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 11
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 381, 'USDA_FDC:169698 Cornstarch'
FROM food f
WHERE f.name = '玉米淀粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米淀粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.26, 'USDA_FDC:169698 Cornstarch'
FROM food f
WHERE f.name = '玉米淀粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米淀粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 91.27, 'USDA_FDC:169698 Cornstarch'
FROM food f
WHERE f.name = '玉米淀粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米淀粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.05, 'USDA_FDC:169698 Cornstarch'
FROM food f
WHERE f.name = '玉米淀粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米淀粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.9, 'USDA_FDC:169698 Cornstarch'
FROM food f
WHERE f.name = '玉米淀粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米淀粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 9, 'USDA_FDC:169698 Cornstarch'
FROM food f
WHERE f.name = '玉米淀粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米淀粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 3, 'USDA_FDC:169698 Cornstarch'
FROM food f
WHERE f.name = '玉米淀粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米淀粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 13, 'USDA_FDC:169698 Cornstarch'
FROM food f
WHERE f.name = '玉米淀粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米淀粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169698 Cornstarch'
FROM food f
WHERE f.name = '玉米淀粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米淀粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.009, 'USDA_FDC:169698 Cornstarch'
FROM food f
WHERE f.name = '玉米淀粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米淀粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 33, 'TFDA:E1300201 玉米筍'
FROM food f
WHERE f.name = '玉米笋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米笋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.8, 'TFDA:E1300201 玉米筍'
FROM food f
WHERE f.name = '玉米笋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米笋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 7, 'TFDA:E1300201 玉米筍'
FROM food f
WHERE f.name = '玉米笋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米笋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'TFDA:E1300201 玉米筍'
FROM food f
WHERE f.name = '玉米笋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米笋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.1, 'TFDA:E1300201 玉米筍'
FROM food f
WHERE f.name = '玉米笋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米笋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'TFDA:E1300201 玉米筍'
FROM food f
WHERE f.name = '玉米笋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米笋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 219, 'TFDA:E1300201 玉米筍'
FROM food f
WHERE f.name = '玉米笋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米笋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 45, 'TFDA:E1300201 玉米筍'
FROM food f
WHERE f.name = '玉米笋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米笋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:E1300201 玉米筍'
FROM food f
WHERE f.name = '玉米笋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米笋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 90.5, 'TFDA:E1300201 玉米筍'
FROM food f
WHERE f.name = '玉米笋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米笋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.19, 'TFDA:E1300201 玉米筍'
FROM food f
WHERE f.name = '玉米笋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米笋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 9, 'TFDA:E1300201 玉米筍'
FROM food f
WHERE f.name = '玉米笋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '玉米笋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 306, 'USDA_FDC:170090 Seaweed, agar, dried'
FROM food f
WHERE f.name = '琼脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '琼脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 6.21, 'USDA_FDC:170090 Seaweed, agar, dried'
FROM food f
WHERE f.name = '琼脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '琼脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 80.88, 'USDA_FDC:170090 Seaweed, agar, dried'
FROM food f
WHERE f.name = '琼脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '琼脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.3, 'USDA_FDC:170090 Seaweed, agar, dried'
FROM food f
WHERE f.name = '琼脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '琼脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 7.7, 'USDA_FDC:170090 Seaweed, agar, dried'
FROM food f
WHERE f.name = '琼脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '琼脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 102, 'USDA_FDC:170090 Seaweed, agar, dried'
FROM food f
WHERE f.name = '琼脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '琼脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1125, 'USDA_FDC:170090 Seaweed, agar, dried'
FROM food f
WHERE f.name = '琼脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '琼脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 52, 'USDA_FDC:170090 Seaweed, agar, dried'
FROM food f
WHERE f.name = '琼脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '琼脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170090 Seaweed, agar, dried'
FROM food f
WHERE f.name = '琼脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '琼脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.061, 'USDA_FDC:170090 Seaweed, agar, dried'
FROM food f
WHERE f.name = '琼脂'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '琼脂' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 116, 'TFDA:P1002501 甜辣醬'
FROM food f
WHERE f.name = '甜辣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜辣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1, 'TFDA:P1002501 甜辣醬'
FROM food f
WHERE f.name = '甜辣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜辣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 28.1, 'TFDA:P1002501 甜辣醬'
FROM food f
WHERE f.name = '甜辣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜辣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0, 'TFDA:P1002501 甜辣醬'
FROM food f
WHERE f.name = '甜辣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜辣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.6, 'TFDA:P1002501 甜辣醬'
FROM food f
WHERE f.name = '甜辣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜辣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1968, 'TFDA:P1002501 甜辣醬'
FROM food f
WHERE f.name = '甜辣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜辣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 123, 'TFDA:P1002501 甜辣醬'
FROM food f
WHERE f.name = '甜辣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜辣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 17, 'TFDA:P1002501 甜辣醬'
FROM food f
WHERE f.name = '甜辣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜辣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 65.5, 'TFDA:P1002501 甜辣醬'
FROM food f
WHERE f.name = '甜辣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜辣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1, 'TFDA:P1002501 甜辣醬'
FROM food f
WHERE f.name = '甜辣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜辣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 9, 'TFDA:P1002501 甜辣醬'
FROM food f
WHERE f.name = '甜辣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜辣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 216, 'TFDA:P1002601 甜麵醬'
FROM food f
WHERE f.name = '甜面酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜面酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 4.5, 'TFDA:P1002601 甜麵醬'
FROM food f
WHERE f.name = '甜面酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜面酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 44, 'TFDA:P1002601 甜麵醬'
FROM food f
WHERE f.name = '甜面酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜面酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2.4, 'TFDA:P1002601 甜麵醬'
FROM food f
WHERE f.name = '甜面酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜面酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.7, 'TFDA:P1002601 甜麵醬'
FROM food f
WHERE f.name = '甜面酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜面酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1870, 'TFDA:P1002601 甜麵醬'
FROM food f
WHERE f.name = '甜面酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜面酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 179, 'TFDA:P1002601 甜麵醬'
FROM food f
WHERE f.name = '甜面酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜面酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 99, 'TFDA:P1002601 甜麵醬'
FROM food f
WHERE f.name = '甜面酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜面酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.8, 'TFDA:P1002601 甜麵醬'
FROM food f
WHERE f.name = '甜面酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜面酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 43.9, 'TFDA:P1002601 甜麵醬'
FROM food f
WHERE f.name = '甜面酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜面酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 4.37, 'TFDA:P1002601 甜麵醬'
FROM food f
WHERE f.name = '甜面酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜面酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 24, 'TFDA:P1002601 甜麵醬'
FROM food f
WHERE f.name = '甜面酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '甜面酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 94, 'TFDA:I9900101 虎皮蛙'
FROM food f
WHERE f.name = '田鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '田鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 21.1, 'TFDA:I9900101 虎皮蛙'
FROM food f
WHERE f.name = '田鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '田鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.6, 'TFDA:I9900101 虎皮蛙'
FROM food f
WHERE f.name = '田鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '田鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.4, 'TFDA:I9900101 虎皮蛙'
FROM food f
WHERE f.name = '田鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '田鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 70, 'TFDA:I9900101 虎皮蛙'
FROM food f
WHERE f.name = '田鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '田鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 249, 'TFDA:I9900101 虎皮蛙'
FROM food f
WHERE f.name = '田鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '田鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 151, 'TFDA:I9900101 虎皮蛙'
FROM food f
WHERE f.name = '田鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '田鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 52, 'TFDA:I9900101 虎皮蛙'
FROM food f
WHERE f.name = '田鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '田鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:I9900101 虎皮蛙'
FROM food f
WHERE f.name = '田鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '田鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 76.8, 'TFDA:I9900101 虎皮蛙'
FROM food f
WHERE f.name = '田鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '田鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.16, 'TFDA:I9900101 虎皮蛙'
FROM food f
WHERE f.name = '田鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '田鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 16, 'TFDA:I9900101 虎皮蛙'
FROM food f
WHERE f.name = '田鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '田鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 114, 'TFDA:P1003501 蕃茄醬'
FROM food f
WHERE f.name = '番茄沙司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄沙司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.6, 'TFDA:P1003501 蕃茄醬'
FROM food f
WHERE f.name = '番茄沙司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄沙司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 26.7, 'TFDA:P1003501 蕃茄醬'
FROM food f
WHERE f.name = '番茄沙司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄沙司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:P1003501 蕃茄醬'
FROM food f
WHERE f.name = '番茄沙司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄沙司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.4, 'TFDA:P1003501 蕃茄醬'
FROM food f
WHERE f.name = '番茄沙司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄沙司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1116, 'TFDA:P1003501 蕃茄醬'
FROM food f
WHERE f.name = '番茄沙司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄沙司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 392, 'TFDA:P1003501 蕃茄醬'
FROM food f
WHERE f.name = '番茄沙司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄沙司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 49, 'TFDA:P1003501 蕃茄醬'
FROM food f
WHERE f.name = '番茄沙司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄沙司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 67.8, 'TFDA:P1003501 蕃茄醬'
FROM food f
WHERE f.name = '番茄沙司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄沙司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 9.22, 'TFDA:P1003501 蕃茄醬'
FROM food f
WHERE f.name = '番茄沙司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄沙司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 11, 'TFDA:P1003501 蕃茄醬'
FROM food f
WHERE f.name = '番茄沙司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄沙司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 97, 'TFDA:J0410701 白姑魚'
FROM food f
WHERE f.name = '白姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 18.8, 'TFDA:J0410701 白姑魚'
FROM food f
WHERE f.name = '白姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0410701 白姑魚'
FROM food f
WHERE f.name = '白姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.8, 'TFDA:J0410701 白姑魚'
FROM food f
WHERE f.name = '白姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 85, 'TFDA:J0410701 白姑魚'
FROM food f
WHERE f.name = '白姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 332, 'TFDA:J0410701 白姑魚'
FROM food f
WHERE f.name = '白姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 207, 'TFDA:J0410701 白姑魚'
FROM food f
WHERE f.name = '白姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 77, 'TFDA:J0410701 白姑魚'
FROM food f
WHERE f.name = '白姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.8, 'TFDA:J0410701 白姑魚'
FROM food f
WHERE f.name = '白姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 78.2, 'TFDA:J0410701 白姑魚'
FROM food f
WHERE f.name = '白姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.24, 'TFDA:J0410701 白姑魚'
FROM food f
WHERE f.name = '白姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 33, 'TFDA:J0410701 白姑魚'
FROM food f
WHERE f.name = '白姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 182, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '白果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 4.32, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '白果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 37.6, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '白果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.68, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '白果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 7, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '白果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 510, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '白果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 124, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '白果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '白果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.319, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '白果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 31, 'TFDA:G1900201 雪白菇'
FROM food f
WHERE f.name = '白玉菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白玉菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.2, 'TFDA:G1900201 雪白菇'
FROM food f
WHERE f.name = '白玉菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白玉菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 6.4, 'TFDA:G1900201 雪白菇'
FROM food f
WHERE f.name = '白玉菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白玉菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0, 'TFDA:G1900201 雪白菇'
FROM food f
WHERE f.name = '白玉菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白玉菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.4, 'TFDA:G1900201 雪白菇'
FROM food f
WHERE f.name = '白玉菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白玉菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'TFDA:G1900201 雪白菇'
FROM food f
WHERE f.name = '白玉菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白玉菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 361, 'TFDA:G1900201 雪白菇'
FROM food f
WHERE f.name = '白玉菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白玉菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 80, 'TFDA:G1900201 雪白菇'
FROM food f
WHERE f.name = '白玉菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白玉菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:G1900201 雪白菇'
FROM food f
WHERE f.name = '白玉菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白玉菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 90.6, 'TFDA:G1900201 雪白菇'
FROM food f
WHERE f.name = '白玉菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白玉菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:G1900201 雪白菇'
FROM food f
WHERE f.name = '白玉菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白玉菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 1, 'TFDA:G1900201 雪白菇'
FROM food f
WHERE f.name = '白玉菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白玉菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 296, 'USDA_FDC:170933 Spices, pepper, white'
FROM food f
WHERE f.name = '白胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 10.4, 'USDA_FDC:170933 Spices, pepper, white'
FROM food f
WHERE f.name = '白胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 68.61, 'USDA_FDC:170933 Spices, pepper, white'
FROM food f
WHERE f.name = '白胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2.12, 'USDA_FDC:170933 Spices, pepper, white'
FROM food f
WHERE f.name = '白胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 26.2, 'USDA_FDC:170933 Spices, pepper, white'
FROM food f
WHERE f.name = '白胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 5, 'USDA_FDC:170933 Spices, pepper, white'
FROM food f
WHERE f.name = '白胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 73, 'USDA_FDC:170933 Spices, pepper, white'
FROM food f
WHERE f.name = '白胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 176, 'USDA_FDC:170933 Spices, pepper, white'
FROM food f
WHERE f.name = '白胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170933 Spices, pepper, white'
FROM food f
WHERE f.name = '白胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.626, 'USDA_FDC:170933 Spices, pepper, white'
FROM food f
WHERE f.name = '白胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 18, 'USDA_FDC:172237 Vinegar, distilled'
FROM food f
WHERE f.name = '白醋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白醋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'USDA_FDC:172237 Vinegar, distilled'
FROM food f
WHERE f.name = '白醋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白醋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.04, 'USDA_FDC:172237 Vinegar, distilled'
FROM food f
WHERE f.name = '白醋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白醋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0, 'USDA_FDC:172237 Vinegar, distilled'
FROM food f
WHERE f.name = '白醋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白醋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:172237 Vinegar, distilled'
FROM food f
WHERE f.name = '白醋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白醋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'USDA_FDC:172237 Vinegar, distilled'
FROM food f
WHERE f.name = '白醋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白醋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 2, 'USDA_FDC:172237 Vinegar, distilled'
FROM food f
WHERE f.name = '白醋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白醋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 4, 'USDA_FDC:172237 Vinegar, distilled'
FROM food f
WHERE f.name = '白醋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白醋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:172237 Vinegar, distilled'
FROM food f
WHERE f.name = '白醋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白醋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'USDA_FDC:172237 Vinegar, distilled'
FROM food f
WHERE f.name = '白醋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白醋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 276, 'USDA_FDC:170938 Spices, thyme, dried'
FROM food f
WHERE f.name = '百里香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百里香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 9.11, 'USDA_FDC:170938 Spices, thyme, dried'
FROM food f
WHERE f.name = '百里香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百里香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 63.94, 'USDA_FDC:170938 Spices, thyme, dried'
FROM food f
WHERE f.name = '百里香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百里香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 7.43, 'USDA_FDC:170938 Spices, thyme, dried'
FROM food f
WHERE f.name = '百里香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百里香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 37, 'USDA_FDC:170938 Spices, thyme, dried'
FROM food f
WHERE f.name = '百里香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百里香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 55, 'USDA_FDC:170938 Spices, thyme, dried'
FROM food f
WHERE f.name = '百里香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百里香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 814, 'USDA_FDC:170938 Spices, thyme, dried'
FROM food f
WHERE f.name = '百里香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百里香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 201, 'USDA_FDC:170938 Spices, thyme, dried'
FROM food f
WHERE f.name = '百里香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百里香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170938 Spices, thyme, dried'
FROM food f
WHERE f.name = '百里香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百里香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.73, 'USDA_FDC:170938 Spices, thyme, dried'
FROM food f
WHERE f.name = '百里香'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百里香' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 110, 'TFDA:J04099 真鯛平均值(去皮)'
FROM food f
WHERE f.name = '真鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '真鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.6, 'TFDA:J04099 真鯛平均值(去皮)'
FROM food f
WHERE f.name = '真鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '真鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.2, 'TFDA:J04099 真鯛平均值(去皮)'
FROM food f
WHERE f.name = '真鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '真鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2.5, 'TFDA:J04099 真鯛平均值(去皮)'
FROM food f
WHERE f.name = '真鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '真鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 60, 'TFDA:J04099 真鯛平均值(去皮)'
FROM food f
WHERE f.name = '真鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '真鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 427, 'TFDA:J04099 真鯛平均值(去皮)'
FROM food f
WHERE f.name = '真鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '真鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 243, 'TFDA:J04099 真鯛平均值(去皮)'
FROM food f
WHERE f.name = '真鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '真鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 60, 'TFDA:J04099 真鯛平均值(去皮)'
FROM food f
WHERE f.name = '真鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '真鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.9, 'TFDA:J04099 真鯛平均值(去皮)'
FROM food f
WHERE f.name = '真鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '真鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 75.5, 'TFDA:J04099 真鯛平均值(去皮)'
FROM food f
WHERE f.name = '真鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '真鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.38, 'TFDA:J04099 真鯛平均值(去皮)'
FROM food f
WHERE f.name = '真鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '真鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 9, 'TFDA:J04099 真鯛平均值(去皮)'
FROM food f
WHERE f.name = '真鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '真鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 9.9587, 'USDA_FDC:2346395 Nuts, pecans, halves, raw'
FROM food f
WHERE f.name = '碧根果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '碧根果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 12.6993, 'USDA_FDC:2346395 Nuts, pecans, halves, raw'
FROM food f
WHERE f.name = '碧根果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '碧根果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 73.28, 'USDA_FDC:2346395 Nuts, pecans, halves, raw'
FROM food f
WHERE f.name = '碧根果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '碧根果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 5.793, 'USDA_FDC:2346395 Nuts, pecans, halves, raw'
FROM food f
WHERE f.name = '碧根果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '碧根果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'USDA_FDC:2346395 Nuts, pecans, halves, raw'
FROM food f
WHERE f.name = '碧根果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '碧根果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 360.3, 'USDA_FDC:2346395 Nuts, pecans, halves, raw'
FROM food f
WHERE f.name = '碧根果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '碧根果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 252.7, 'USDA_FDC:2346395 Nuts, pecans, halves, raw'
FROM food f
WHERE f.name = '碧根果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '碧根果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 6.465, 'USDA_FDC:2346395 Nuts, pecans, halves, raw'
FROM food f
WHERE f.name = '碧根果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '碧根果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 884, 'USDA_FDC:171013 Oil, rice bran'
FROM food f
WHERE f.name = '稻米油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '稻米油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'USDA_FDC:171013 Oil, rice bran'
FROM food f
WHERE f.name = '稻米油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '稻米油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:171013 Oil, rice bran'
FROM food f
WHERE f.name = '稻米油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '稻米油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 100, 'USDA_FDC:171013 Oil, rice bran'
FROM food f
WHERE f.name = '稻米油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '稻米油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:171013 Oil, rice bran'
FROM food f
WHERE f.name = '稻米油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '稻米油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'USDA_FDC:171013 Oil, rice bran'
FROM food f
WHERE f.name = '稻米油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '稻米油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 0, 'USDA_FDC:171013 Oil, rice bran'
FROM food f
WHERE f.name = '稻米油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '稻米油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 0, 'USDA_FDC:171013 Oil, rice bran'
FROM food f
WHERE f.name = '稻米油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '稻米油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:171013 Oil, rice bran'
FROM food f
WHERE f.name = '稻米油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '稻米油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 19.7, 'USDA_FDC:171013 Oil, rice bran'
FROM food f
WHERE f.name = '稻米油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '稻米油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 11, 100, 'USDA_FDC:171013 Oil, rice bran'
FROM food f
WHERE f.name = '稻米油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '稻米油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 11
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 19, 'USDA_FDC:169301 Water convolvulus,raw'
FROM food f
WHERE f.name = '空心菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '空心菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.6, 'USDA_FDC:169301 Water convolvulus,raw'
FROM food f
WHERE f.name = '空心菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '空心菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 3.13, 'USDA_FDC:169301 Water convolvulus,raw'
FROM food f
WHERE f.name = '空心菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '空心菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'USDA_FDC:169301 Water convolvulus,raw'
FROM food f
WHERE f.name = '空心菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '空心菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.1, 'USDA_FDC:169301 Water convolvulus,raw'
FROM food f
WHERE f.name = '空心菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '空心菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 113, 'USDA_FDC:169301 Water convolvulus,raw'
FROM food f
WHERE f.name = '空心菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '空心菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 312, 'USDA_FDC:169301 Water convolvulus,raw'
FROM food f
WHERE f.name = '空心菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '空心菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 39, 'USDA_FDC:169301 Water convolvulus,raw'
FROM food f
WHERE f.name = '空心菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '空心菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169301 Water convolvulus,raw'
FROM food f
WHERE f.name = '空心菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '空心菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 92, 'TFDA:B0200301 紫山藥'
FROM food f
WHERE f.name = '紫山药'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫山药' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.8, 'TFDA:B0200301 紫山藥'
FROM food f
WHERE f.name = '紫山药'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫山药' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 19.6, 'TFDA:B0200301 紫山藥'
FROM food f
WHERE f.name = '紫山药'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫山药' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:B0200301 紫山藥'
FROM food f
WHERE f.name = '紫山药'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫山药' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.1, 'TFDA:B0200301 紫山藥'
FROM food f
WHERE f.name = '紫山药'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫山药' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 3, 'TFDA:B0200301 紫山藥'
FROM food f
WHERE f.name = '紫山药'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫山药' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 570, 'TFDA:B0200301 紫山藥'
FROM food f
WHERE f.name = '紫山药'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫山药' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 42, 'TFDA:B0200301 紫山藥'
FROM food f
WHERE f.name = '紫山药'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫山药' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 76.5, 'TFDA:B0200301 紫山藥'
FROM food f
WHERE f.name = '紫山药'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫山药' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.19, 'TFDA:B0200301 紫山藥'
FROM food f
WHERE f.name = '紫山药'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫山药' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 2, 'TFDA:B0200301 紫山藥'
FROM food f
WHERE f.name = '紫山药'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫山药' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 357, 'TFDA:A0500801 黑秈糯糙米'
FROM food f
WHERE f.name = '紫米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 10.1, 'TFDA:A0500801 黑秈糯糙米'
FROM food f
WHERE f.name = '紫米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 70.1, 'TFDA:A0500801 黑秈糯糙米'
FROM food f
WHERE f.name = '紫米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.5, 'TFDA:A0500801 黑秈糯糙米'
FROM food f
WHERE f.name = '紫米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.3, 'TFDA:A0500801 黑秈糯糙米'
FROM food f
WHERE f.name = '紫米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 3, 'TFDA:A0500801 黑秈糯糙米'
FROM food f
WHERE f.name = '紫米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 302, 'TFDA:A0500801 黑秈糯糙米'
FROM food f
WHERE f.name = '紫米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 205, 'TFDA:A0500801 黑秈糯糙米'
FROM food f
WHERE f.name = '紫米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.9, 'TFDA:A0500801 黑秈糯糙米'
FROM food f
WHERE f.name = '紫米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 14.8, 'TFDA:A0500801 黑秈糯糙米'
FROM food f
WHERE f.name = '紫米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 2.82, 'TFDA:A0500801 黑秈糯糙米'
FROM food f
WHERE f.name = '紫米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 9, 'TFDA:A0500801 黑秈糯糙米'
FROM food f
WHERE f.name = '紫米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 22, 'TFDA:E3400201 紅鳳菜'
FROM food f
WHERE f.name = '紫背天葵'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫背天葵' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.1, 'TFDA:E3400201 紅鳳菜'
FROM food f
WHERE f.name = '紫背天葵'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫背天葵' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 3.5, 'TFDA:E3400201 紅鳳菜'
FROM food f
WHERE f.name = '紫背天葵'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫背天葵' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.4, 'TFDA:E3400201 紅鳳菜'
FROM food f
WHERE f.name = '紫背天葵'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫背天葵' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.6, 'TFDA:E3400201 紅鳳菜'
FROM food f
WHERE f.name = '紫背天葵'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫背天葵' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 13, 'TFDA:E3400201 紅鳳菜'
FROM food f
WHERE f.name = '紫背天葵'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫背天葵' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 312, 'TFDA:E3400201 紅鳳菜'
FROM food f
WHERE f.name = '紫背天葵'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫背天葵' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 29, 'TFDA:E3400201 紅鳳菜'
FROM food f
WHERE f.name = '紫背天葵'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫背天葵' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 92.7, 'TFDA:E3400201 紅鳳菜'
FROM food f
WHERE f.name = '紫背天葵'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫背天葵' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.96, 'TFDA:E3400201 紅鳳菜'
FROM food f
WHERE f.name = '紫背天葵'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫背天葵' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 122, 'TFDA:E3400201 紅鳳菜'
FROM food f
WHERE f.name = '紫背天葵'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫背天葵' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 71, 'TFDA:E4900101 紫蘇'
FROM food f
WHERE f.name = '紫苏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫苏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 5.5, 'TFDA:E4900101 紫蘇'
FROM food f
WHERE f.name = '紫苏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫苏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 11.9, 'TFDA:E4900101 紫蘇'
FROM food f
WHERE f.name = '紫苏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫苏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.2, 'TFDA:E4900101 紫蘇'
FROM food f
WHERE f.name = '紫苏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫苏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 8.8, 'TFDA:E4900101 紫蘇'
FROM food f
WHERE f.name = '紫苏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫苏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'TFDA:E4900101 紫蘇'
FROM food f
WHERE f.name = '紫苏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫苏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 502, 'TFDA:E4900101 紫蘇'
FROM food f
WHERE f.name = '紫苏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫苏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 69, 'TFDA:E4900101 紫蘇'
FROM food f
WHERE f.name = '紫苏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫苏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.7, 'TFDA:E4900101 紫蘇'
FROM food f
WHERE f.name = '紫苏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫苏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 79.4, 'TFDA:E4900101 紫蘇'
FROM food f
WHERE f.name = '紫苏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫苏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 2.87, 'TFDA:E4900101 紫蘇'
FROM food f
WHERE f.name = '紫苏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫苏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 401, 'TFDA:E4900101 紫蘇'
FROM food f
WHERE f.name = '紫苏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '紫苏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 328, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '红小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.9, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '红小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 61.5, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '红小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.6, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '红小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 18.5, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '红小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '红小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1203, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '红小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 442, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '红小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.2, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '红小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 13.9, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '红小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 11.14, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '红小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 87, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '红小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 119, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '红杉鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红杉鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.9, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '红杉鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红杉鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '红杉鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红杉鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.3, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '红杉鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红杉鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 103, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '红杉鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红杉鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 329, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '红杉鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红杉鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 205, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '红杉鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红杉鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 64, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '红杉鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红杉鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.5, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '红杉鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红杉鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 76.3, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '红杉鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红杉鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.64, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '红杉鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红杉鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 21, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '红杉鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红杉鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 73, 'TFDA:D0600101 紅毛丹'
FROM food f
WHERE f.name = '红毛丹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红毛丹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1, 'TFDA:D0600101 紅毛丹'
FROM food f
WHERE f.name = '红毛丹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红毛丹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 17.9, 'TFDA:D0600101 紅毛丹'
FROM food f
WHERE f.name = '红毛丹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红毛丹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.7, 'TFDA:D0600101 紅毛丹'
FROM food f
WHERE f.name = '红毛丹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红毛丹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.5, 'TFDA:D0600101 紅毛丹'
FROM food f
WHERE f.name = '红毛丹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红毛丹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 8, 'TFDA:D0600101 紅毛丹'
FROM food f
WHERE f.name = '红毛丹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红毛丹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 152, 'TFDA:D0600101 紅毛丹'
FROM food f
WHERE f.name = '红毛丹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红毛丹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 23, 'TFDA:D0600101 紅毛丹'
FROM food f
WHERE f.name = '红毛丹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红毛丹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 80, 'TFDA:D0600101 紅毛丹'
FROM food f
WHERE f.name = '红毛丹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红毛丹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:D0600101 紅毛丹'
FROM food f
WHERE f.name = '红毛丹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红毛丹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 16, 'TFDA:D0600101 紅毛丹'
FROM food f
WHERE f.name = '红毛丹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红毛丹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 384, 'TFDA:N0100301 紅砂糖'
FROM food f
WHERE f.name = '红糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'TFDA:N0100301 紅砂糖'
FROM food f
WHERE f.name = '红糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 99.3, 'TFDA:N0100301 紅砂糖'
FROM food f
WHERE f.name = '红糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.5, 'TFDA:N0100301 紅砂糖'
FROM food f
WHERE f.name = '红糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'TFDA:N0100301 紅砂糖'
FROM food f
WHERE f.name = '红糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'TFDA:N0100301 紅砂糖'
FROM food f
WHERE f.name = '红糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 48, 'TFDA:N0100301 紅砂糖'
FROM food f
WHERE f.name = '红糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 1, 'TFDA:N0100301 紅砂糖'
FROM food f
WHERE f.name = '红糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:N0100301 紅砂糖'
FROM food f
WHERE f.name = '红糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 0, 'TFDA:N0100301 紅砂糖'
FROM food f
WHERE f.name = '红糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.11, 'TFDA:N0100301 紅砂糖'
FROM food f
WHERE f.name = '红糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 13, 'TFDA:N0100301 紅砂糖'
FROM food f
WHERE f.name = '红糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 884, 'TFDA:M2000101 紅花籽油'
FROM food f
WHERE f.name = '红花籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红花籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'TFDA:M2000101 紅花籽油'
FROM food f
WHERE f.name = '红花籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红花籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:M2000101 紅花籽油'
FROM food f
WHERE f.name = '红花籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红花籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 100, 'TFDA:M2000101 紅花籽油'
FROM food f
WHERE f.name = '红花籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红花籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'TFDA:M2000101 紅花籽油'
FROM food f
WHERE f.name = '红花籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红花籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 10.6, 'TFDA:M2000101 紅花籽油'
FROM food f
WHERE f.name = '红花籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红花籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 11, 100, 'TFDA:M2000101 紅花籽油'
FROM food f
WHERE f.name = '红花籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红花籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 11
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 0.1, 'TFDA:M2000101 紅花籽油'
FROM food f
WHERE f.name = '红花籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红花籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 33.68, 'TFDA:M2000101 紅花籽油'
FROM food f
WHERE f.name = '红花籽油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红花籽油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 0, 'TFDA:O0700501 紅茶茶湯'
FROM food f
WHERE f.name = '红茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.1, 'TFDA:O0700501 紅茶茶湯'
FROM food f
WHERE f.name = '红茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:O0700501 紅茶茶湯'
FROM food f
WHERE f.name = '红茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'TFDA:O0700501 紅茶茶湯'
FROM food f
WHERE f.name = '红茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 99.9, 'TFDA:O0700501 紅茶茶湯'
FROM food f
WHERE f.name = '红茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:O0700501 紅茶茶湯'
FROM food f
WHERE f.name = '红茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 75, 'TFDA:E2500101 紅蔥頭'
FROM food f
WHERE f.name = '红葱头'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红葱头' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 3.4, 'TFDA:E2500101 紅蔥頭'
FROM food f
WHERE f.name = '红葱头'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红葱头' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 16.4, 'TFDA:E2500101 紅蔥頭'
FROM food f
WHERE f.name = '红葱头'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红葱头' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.3, 'TFDA:E2500101 紅蔥頭'
FROM food f
WHERE f.name = '红葱头'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红葱头' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.5, 'TFDA:E2500101 紅蔥頭'
FROM food f
WHERE f.name = '红葱头'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红葱头' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 16, 'TFDA:E2500101 紅蔥頭'
FROM food f
WHERE f.name = '红葱头'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红葱头' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 298, 'TFDA:E2500101 紅蔥頭'
FROM food f
WHERE f.name = '红葱头'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红葱头' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 66, 'TFDA:E2500101 紅蔥頭'
FROM food f
WHERE f.name = '红葱头'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红葱头' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 79.1, 'TFDA:E2500101 紅蔥頭'
FROM food f
WHERE f.name = '红葱头'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红葱头' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.44, 'TFDA:E2500101 紅蔥頭'
FROM food f
WHERE f.name = '红葱头'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红葱头' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 21, 'TFDA:E2500101 紅蔥頭'
FROM food f
WHERE f.name = '红葱头'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红葱头' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 211, 'USDA_FDC:172443 Natto'
FROM food f
WHERE f.name = '纳豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '纳豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 19.4, 'USDA_FDC:172443 Natto'
FROM food f
WHERE f.name = '纳豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '纳豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 12.68, 'USDA_FDC:172443 Natto'
FROM food f
WHERE f.name = '纳豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '纳豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 11, 'USDA_FDC:172443 Natto'
FROM food f
WHERE f.name = '纳豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '纳豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 5.4, 'USDA_FDC:172443 Natto'
FROM food f
WHERE f.name = '纳豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '纳豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 7, 'USDA_FDC:172443 Natto'
FROM food f
WHERE f.name = '纳豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '纳豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 729, 'USDA_FDC:172443 Natto'
FROM food f
WHERE f.name = '纳豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '纳豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 174, 'USDA_FDC:172443 Natto'
FROM food f
WHERE f.name = '纳豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '纳豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:172443 Natto'
FROM food f
WHERE f.name = '纳豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '纳豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.591, 'USDA_FDC:172443 Natto'
FROM food f
WHERE f.name = '纳豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '纳豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 0, 'TFDA:O0701301 綠茶茶湯'
FROM food f
WHERE f.name = '绿茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绿茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.1, 'TFDA:O0701301 綠茶茶湯'
FROM food f
WHERE f.name = '绿茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绿茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:O0701301 綠茶茶湯'
FROM food f
WHERE f.name = '绿茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绿茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'TFDA:O0701301 綠茶茶湯'
FROM food f
WHERE f.name = '绿茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绿茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 99.9, 'TFDA:O0701301 綠茶茶湯'
FROM food f
WHERE f.name = '绿茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绿茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:O0701301 綠茶茶湯'
FROM food f
WHERE f.name = '绿茶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绿茶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 351, 'USDA_FDC:174258 Noodles, chinese, cellophane or long rice (mung beans), dehydrated'
FROM food f
WHERE f.name = '绿豆粉丝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绿豆粉丝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.16, 'USDA_FDC:174258 Noodles, chinese, cellophane or long rice (mung beans), dehydrated'
FROM food f
WHERE f.name = '绿豆粉丝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绿豆粉丝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 86.09, 'USDA_FDC:174258 Noodles, chinese, cellophane or long rice (mung beans), dehydrated'
FROM food f
WHERE f.name = '绿豆粉丝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绿豆粉丝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.06, 'USDA_FDC:174258 Noodles, chinese, cellophane or long rice (mung beans), dehydrated'
FROM food f
WHERE f.name = '绿豆粉丝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绿豆粉丝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.5, 'USDA_FDC:174258 Noodles, chinese, cellophane or long rice (mung beans), dehydrated'
FROM food f
WHERE f.name = '绿豆粉丝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绿豆粉丝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 10, 'USDA_FDC:174258 Noodles, chinese, cellophane or long rice (mung beans), dehydrated'
FROM food f
WHERE f.name = '绿豆粉丝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绿豆粉丝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 10, 'USDA_FDC:174258 Noodles, chinese, cellophane or long rice (mung beans), dehydrated'
FROM food f
WHERE f.name = '绿豆粉丝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绿豆粉丝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 32, 'USDA_FDC:174258 Noodles, chinese, cellophane or long rice (mung beans), dehydrated'
FROM food f
WHERE f.name = '绿豆粉丝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绿豆粉丝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:174258 Noodles, chinese, cellophane or long rice (mung beans), dehydrated'
FROM food f
WHERE f.name = '绿豆粉丝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绿豆粉丝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.017, 'USDA_FDC:174258 Noodles, chinese, cellophane or long rice (mung beans), dehydrated'
FROM food f
WHERE f.name = '绿豆粉丝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绿豆粉丝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 233, 'USDA_FDC:171317 Spices, basil, dried'
FROM food f
WHERE f.name = '罗勒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗勒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 22.98, 'USDA_FDC:171317 Spices, basil, dried'
FROM food f
WHERE f.name = '罗勒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗勒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 47.75, 'USDA_FDC:171317 Spices, basil, dried'
FROM food f
WHERE f.name = '罗勒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗勒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 4.07, 'USDA_FDC:171317 Spices, basil, dried'
FROM food f
WHERE f.name = '罗勒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗勒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 37.7, 'USDA_FDC:171317 Spices, basil, dried'
FROM food f
WHERE f.name = '罗勒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗勒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 76, 'USDA_FDC:171317 Spices, basil, dried'
FROM food f
WHERE f.name = '罗勒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗勒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 2630, 'USDA_FDC:171317 Spices, basil, dried'
FROM food f
WHERE f.name = '罗勒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗勒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 274, 'USDA_FDC:171317 Spices, basil, dried'
FROM food f
WHERE f.name = '罗勒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗勒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:171317 Spices, basil, dried'
FROM food f
WHERE f.name = '罗勒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗勒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.157, 'USDA_FDC:171317 Spices, basil, dried'
FROM food f
WHERE f.name = '罗勒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗勒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 239, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '罗望子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗望子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.8, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '罗望子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗望子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 62.5, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '罗望子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗望子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.6, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '罗望子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗望子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 5.1, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '罗望子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗望子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 28, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '罗望子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗望子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 628, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '罗望子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗望子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 113, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '罗望子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗望子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '罗望子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗望子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.272, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '罗望子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗望子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 69, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊乳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊乳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 3.56, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊乳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊乳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 4.45, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊乳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊乳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 4.14, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊乳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊乳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊乳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊乳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 50, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊乳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊乳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 204, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊乳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊乳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 111, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊乳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊乳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 11, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊乳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊乳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.667, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊乳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊乳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 69, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊奶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊奶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 3.56, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊奶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊奶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 4.45, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊奶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊奶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 4.14, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊奶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊奶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊奶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊奶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 50, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊奶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊奶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 204, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊奶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊奶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 111, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊奶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊奶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 11, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊奶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊奶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.667, 'USDA_FDC:171278 Milk, goat, fluid, with added vitamin D'
FROM food f
WHERE f.name = '羊奶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊奶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 31, 'USDA_FDC:168423 Mushrooms, morel, raw'
FROM food f
WHERE f.name = '羊肚菌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肚菌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 3.12, 'USDA_FDC:168423 Mushrooms, morel, raw'
FROM food f
WHERE f.name = '羊肚菌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肚菌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 5.1, 'USDA_FDC:168423 Mushrooms, morel, raw'
FROM food f
WHERE f.name = '羊肚菌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肚菌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.57, 'USDA_FDC:168423 Mushrooms, morel, raw'
FROM food f
WHERE f.name = '羊肚菌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肚菌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.8, 'USDA_FDC:168423 Mushrooms, morel, raw'
FROM food f
WHERE f.name = '羊肚菌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肚菌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 21, 'USDA_FDC:168423 Mushrooms, morel, raw'
FROM food f
WHERE f.name = '羊肚菌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肚菌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 411, 'USDA_FDC:168423 Mushrooms, morel, raw'
FROM food f
WHERE f.name = '羊肚菌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肚菌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 194, 'USDA_FDC:168423 Mushrooms, morel, raw'
FROM food f
WHERE f.name = '羊肚菌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肚菌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.065, 'USDA_FDC:168423 Mushrooms, morel, raw'
FROM food f
WHERE f.name = '羊肚菌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肚菌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 115, 'TFDA:J0405401 棕點石斑魚'
FROM food f
WHERE f.name = '老虎斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老虎斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 19.1, 'TFDA:J0405401 棕點石斑魚'
FROM food f
WHERE f.name = '老虎斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老虎斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0405401 棕點石斑魚'
FROM food f
WHERE f.name = '老虎斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老虎斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.7, 'TFDA:J0405401 棕點石斑魚'
FROM food f
WHERE f.name = '老虎斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老虎斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 79, 'TFDA:J0405401 棕點石斑魚'
FROM food f
WHERE f.name = '老虎斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老虎斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 409, 'TFDA:J0405401 棕點石斑魚'
FROM food f
WHERE f.name = '老虎斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老虎斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 205, 'TFDA:J0405401 棕點石斑魚'
FROM food f
WHERE f.name = '老虎斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老虎斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 87, 'TFDA:J0405401 棕點石斑魚'
FROM food f
WHERE f.name = '老虎斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老虎斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.4, 'TFDA:J0405401 棕點石斑魚'
FROM food f
WHERE f.name = '老虎斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老虎斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 76.9, 'TFDA:J0405401 棕點石斑魚'
FROM food f
WHERE f.name = '老虎斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老虎斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.28, 'TFDA:J0405401 棕點石斑魚'
FROM food f
WHERE f.name = '老虎斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老虎斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 13, 'TFDA:J0405401 棕點石斑魚'
FROM food f
WHERE f.name = '老虎斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老虎斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 83, 'TFDA:J0405601 駝背鱸'
FROM food f
WHERE f.name = '老鼠斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老鼠斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 18.1, 'TFDA:J0405601 駝背鱸'
FROM food f
WHERE f.name = '老鼠斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老鼠斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0405601 駝背鱸'
FROM food f
WHERE f.name = '老鼠斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老鼠斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.6, 'TFDA:J0405601 駝背鱸'
FROM food f
WHERE f.name = '老鼠斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老鼠斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 93, 'TFDA:J0405601 駝背鱸'
FROM food f
WHERE f.name = '老鼠斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老鼠斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 375, 'TFDA:J0405601 駝背鱸'
FROM food f
WHERE f.name = '老鼠斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老鼠斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 204, 'TFDA:J0405601 駝背鱸'
FROM food f
WHERE f.name = '老鼠斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老鼠斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 44, 'TFDA:J0405601 駝背鱸'
FROM food f
WHERE f.name = '老鼠斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老鼠斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.3, 'TFDA:J0405601 駝背鱸'
FROM food f
WHERE f.name = '老鼠斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老鼠斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 80.1, 'TFDA:J0405601 駝背鱸'
FROM food f
WHERE f.name = '老鼠斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老鼠斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.98, 'TFDA:J0405601 駝背鱸'
FROM food f
WHERE f.name = '老鼠斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老鼠斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 24, 'TFDA:J0405601 駝背鱸'
FROM food f
WHERE f.name = '老鼠斑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老鼠斑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 145, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '胖头鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胖头鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 18.7, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '胖头鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胖头鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '胖头鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胖头鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 7.2, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '胖头鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胖头鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 24, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '胖头鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胖头鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 345, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '胖头鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胖头鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 139, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '胖头鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胖头鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 53, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '胖头鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胖头鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.8, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '胖头鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胖头鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 74.2, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '胖头鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胖头鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.4, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '胖头鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胖头鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 37, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '胖头鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胖头鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 343, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 9.9, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 75.4, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.1, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 80, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 91, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 14.1, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 68.32, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 7, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 343, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 9.9, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 75.4, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.1, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 80, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 91, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 14.1, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 68.32, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 7, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '芡实米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芡实米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 60, 'USDA_FDC:172234 Mustard, prepared, yellow'
FROM food f
WHERE f.name = '芥末'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芥末' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 3.74, 'USDA_FDC:172234 Mustard, prepared, yellow'
FROM food f
WHERE f.name = '芥末'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芥末' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 5.83, 'USDA_FDC:172234 Mustard, prepared, yellow'
FROM food f
WHERE f.name = '芥末'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芥末' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.34, 'USDA_FDC:172234 Mustard, prepared, yellow'
FROM food f
WHERE f.name = '芥末'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芥末' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 4, 'USDA_FDC:172234 Mustard, prepared, yellow'
FROM food f
WHERE f.name = '芥末'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芥末' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1104, 'USDA_FDC:172234 Mustard, prepared, yellow'
FROM food f
WHERE f.name = '芥末'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芥末' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 152, 'USDA_FDC:172234 Mustard, prepared, yellow'
FROM food f
WHERE f.name = '芥末'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芥末' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 108, 'USDA_FDC:172234 Mustard, prepared, yellow'
FROM food f
WHERE f.name = '芥末'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芥末' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:172234 Mustard, prepared, yellow'
FROM food f
WHERE f.name = '芥末'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芥末' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.214, 'USDA_FDC:172234 Mustard, prepared, yellow'
FROM food f
WHERE f.name = '芥末'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芥末' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 40, 'TFDA:D3400101 椪柑'
FROM food f
WHERE f.name = '芦柑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芦柑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.8, 'TFDA:D3400101 椪柑'
FROM food f
WHERE f.name = '芦柑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芦柑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 10, 'TFDA:D3400101 椪柑'
FROM food f
WHERE f.name = '芦柑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芦柑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'TFDA:D3400101 椪柑'
FROM food f
WHERE f.name = '芦柑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芦柑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.5, 'TFDA:D3400101 椪柑'
FROM food f
WHERE f.name = '芦柑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芦柑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'TFDA:D3400101 椪柑'
FROM food f
WHERE f.name = '芦柑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芦柑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 74, 'TFDA:D3400101 椪柑'
FROM food f
WHERE f.name = '芦柑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芦柑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 14, 'TFDA:D3400101 椪柑'
FROM food f
WHERE f.name = '芦柑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芦柑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:D3400101 椪柑'
FROM food f
WHERE f.name = '芦柑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芦柑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 88.7, 'TFDA:D3400101 椪柑'
FROM food f
WHERE f.name = '芦柑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芦柑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.15, 'TFDA:D3400101 椪柑'
FROM food f
WHERE f.name = '芦柑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芦柑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 21, 'TFDA:D3400101 椪柑'
FROM food f
WHERE f.name = '芦柑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '芦柑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 227, 'TFDA:R2400401 花捲'
FROM food f
WHERE f.name = '花卷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花卷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 5.7, 'TFDA:R2400401 花捲'
FROM food f
WHERE f.name = '花卷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花卷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 47, 'TFDA:R2400401 花捲'
FROM food f
WHERE f.name = '花卷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花卷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.9, 'TFDA:R2400401 花捲'
FROM food f
WHERE f.name = '花卷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花卷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.5, 'TFDA:R2400401 花捲'
FROM food f
WHERE f.name = '花卷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花卷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 425, 'TFDA:R2400401 花捲'
FROM food f
WHERE f.name = '花卷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花卷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 74, 'TFDA:R2400401 花捲'
FROM food f
WHERE f.name = '花卷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花卷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 51, 'TFDA:R2400401 花捲'
FROM food f
WHERE f.name = '花卷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花卷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.6, 'TFDA:R2400401 花捲'
FROM food f
WHERE f.name = '花卷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花卷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 44.2, 'TFDA:R2400401 花捲'
FROM food f
WHERE f.name = '花卷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花卷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.49, 'TFDA:R2400401 花捲'
FROM food f
WHERE f.name = '花卷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花卷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 14, 'TFDA:R2400401 花捲'
FROM food f
WHERE f.name = '花卷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花卷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 359, 'TFDA:P0102201 花椒粒'
FROM food f
WHERE f.name = '花椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 10.3, 'TFDA:P0102201 花椒粒'
FROM food f
WHERE f.name = '花椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 53.6, 'TFDA:P0102201 花椒粒'
FROM food f
WHERE f.name = '花椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 12.5, 'TFDA:P0102201 花椒粒'
FROM food f
WHERE f.name = '花椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 45.7, 'TFDA:P0102201 花椒粒'
FROM food f
WHERE f.name = '花椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2780, 'TFDA:P0102201 花椒粒'
FROM food f
WHERE f.name = '花椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1213, 'TFDA:P0102201 花椒粒'
FROM food f
WHERE f.name = '花椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 199, 'TFDA:P0102201 花椒粒'
FROM food f
WHERE f.name = '花椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'TFDA:P0102201 花椒粒'
FROM food f
WHERE f.name = '花椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.1, 'TFDA:P0102201 花椒粒'
FROM food f
WHERE f.name = '花椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 11.5, 'TFDA:P0102201 花椒粒'
FROM food f
WHERE f.name = '花椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 7.19, 'TFDA:P0102201 花椒粒'
FROM food f
WHERE f.name = '花椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 998, 'TFDA:P0102201 花椒粒'
FROM food f
WHERE f.name = '花椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 598, 'USDA_FDC:174266 Peanut butter, smooth style, with salt'
FROM food f
WHERE f.name = '花生酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花生酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 22.21, 'USDA_FDC:174266 Peanut butter, smooth style, with salt'
FROM food f
WHERE f.name = '花生酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花生酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 22.31, 'USDA_FDC:174266 Peanut butter, smooth style, with salt'
FROM food f
WHERE f.name = '花生酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花生酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 51.36, 'USDA_FDC:174266 Peanut butter, smooth style, with salt'
FROM food f
WHERE f.name = '花生酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花生酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 5, 'USDA_FDC:174266 Peanut butter, smooth style, with salt'
FROM food f
WHERE f.name = '花生酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花生酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 426, 'USDA_FDC:174266 Peanut butter, smooth style, with salt'
FROM food f
WHERE f.name = '花生酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花生酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 558, 'USDA_FDC:174266 Peanut butter, smooth style, with salt'
FROM food f
WHERE f.name = '花生酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花生酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 335, 'USDA_FDC:174266 Peanut butter, smooth style, with salt'
FROM food f
WHERE f.name = '花生酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花生酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:174266 Peanut butter, smooth style, with salt'
FROM food f
WHERE f.name = '花生酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花生酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 10.325, 'USDA_FDC:174266 Peanut butter, smooth style, with salt'
FROM food f
WHERE f.name = '花生酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '花生酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 0, 'USDA_FDC:174842 Beverages, carbonated, club soda'
FROM food f
WHERE f.name = '苏打水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苏打水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'USDA_FDC:174842 Beverages, carbonated, club soda'
FROM food f
WHERE f.name = '苏打水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苏打水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:174842 Beverages, carbonated, club soda'
FROM food f
WHERE f.name = '苏打水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苏打水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0, 'USDA_FDC:174842 Beverages, carbonated, club soda'
FROM food f
WHERE f.name = '苏打水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苏打水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:174842 Beverages, carbonated, club soda'
FROM food f
WHERE f.name = '苏打水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苏打水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 21, 'USDA_FDC:174842 Beverages, carbonated, club soda'
FROM food f
WHERE f.name = '苏打水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苏打水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 2, 'USDA_FDC:174842 Beverages, carbonated, club soda'
FROM food f
WHERE f.name = '苏打水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苏打水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 0, 'USDA_FDC:174842 Beverages, carbonated, club soda'
FROM food f
WHERE f.name = '苏打水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苏打水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:174842 Beverages, carbonated, club soda'
FROM food f
WHERE f.name = '苏打水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苏打水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'USDA_FDC:174842 Beverages, carbonated, club soda'
FROM food f
WHERE f.name = '苏打水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苏打水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 20, 'TFDA:E1300101 茭白筍'
FROM food f
WHERE f.name = '茭白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茭白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.3, 'TFDA:E1300101 茭白筍'
FROM food f
WHERE f.name = '茭白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茭白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 4, 'TFDA:E1300101 茭白筍'
FROM food f
WHERE f.name = '茭白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茭白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'TFDA:E1300101 茭白筍'
FROM food f
WHERE f.name = '茭白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茭白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.1, 'TFDA:E1300101 茭白筍'
FROM food f
WHERE f.name = '茭白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茭白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 5, 'TFDA:E1300101 茭白筍'
FROM food f
WHERE f.name = '茭白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茭白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 219, 'TFDA:E1300101 茭白筍'
FROM food f
WHERE f.name = '茭白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茭白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 38, 'TFDA:E1300101 茭白筍'
FROM food f
WHERE f.name = '茭白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茭白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:E1300101 茭白筍'
FROM food f
WHERE f.name = '茭白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茭白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 94, 'TFDA:E1300101 茭白筍'
FROM food f
WHERE f.name = '茭白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茭白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.4, 'TFDA:E1300101 茭白筍'
FROM food f
WHERE f.name = '茭白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茭白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 3, 'TFDA:E1300101 茭白筍'
FROM food f
WHERE f.name = '茭白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茭白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 141, 'TFDA:C2300101 蓮子'
FROM food f
WHERE f.name = '莲子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莲子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 9.3, 'TFDA:C2300101 蓮子'
FROM food f
WHERE f.name = '莲子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莲子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 25.6, 'TFDA:C2300101 蓮子'
FROM food f
WHERE f.name = '莲子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莲子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.5, 'TFDA:C2300101 蓮子'
FROM food f
WHERE f.name = '莲子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莲子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 8, 'TFDA:C2300101 蓮子'
FROM food f
WHERE f.name = '莲子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莲子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 119, 'TFDA:C2300101 蓮子'
FROM food f
WHERE f.name = '莲子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莲子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 305, 'TFDA:C2300101 蓮子'
FROM food f
WHERE f.name = '莲子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莲子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 290, 'TFDA:C2300101 蓮子'
FROM food f
WHERE f.name = '莲子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莲子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.2, 'TFDA:C2300101 蓮子'
FROM food f
WHERE f.name = '莲子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莲子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 63.2, 'TFDA:C2300101 蓮子'
FROM food f
WHERE f.name = '莲子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莲子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.59, 'TFDA:C2300101 蓮子'
FROM food f
WHERE f.name = '莲子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莲子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 69, 'TFDA:C2300101 蓮子'
FROM food f
WHERE f.name = '莲子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莲子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 73, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '菊芋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菊芋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '菊芋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菊芋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 17.44, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '菊芋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菊芋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.01, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '菊芋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菊芋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.6, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '菊芋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菊芋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 4, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '菊芋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菊芋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 429, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '菊芋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菊芋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 78, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '菊芋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菊芋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '菊芋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菊芋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'USDA_FDC:169236 Jerusalem-artichokes, raw'
FROM food f
WHERE f.name = '菊芋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菊芋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 95, 'USDA_FDC:174687 Jackfruit, raw'
FROM food f
WHERE f.name = '菠萝蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菠萝蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.72, 'USDA_FDC:174687 Jackfruit, raw'
FROM food f
WHERE f.name = '菠萝蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菠萝蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 23.25, 'USDA_FDC:174687 Jackfruit, raw'
FROM food f
WHERE f.name = '菠萝蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菠萝蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.64, 'USDA_FDC:174687 Jackfruit, raw'
FROM food f
WHERE f.name = '菠萝蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菠萝蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.5, 'USDA_FDC:174687 Jackfruit, raw'
FROM food f
WHERE f.name = '菠萝蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菠萝蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'USDA_FDC:174687 Jackfruit, raw'
FROM food f
WHERE f.name = '菠萝蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菠萝蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 448, 'USDA_FDC:174687 Jackfruit, raw'
FROM food f
WHERE f.name = '菠萝蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菠萝蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 21, 'USDA_FDC:174687 Jackfruit, raw'
FROM food f
WHERE f.name = '菠萝蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菠萝蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:174687 Jackfruit, raw'
FROM food f
WHERE f.name = '菠萝蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菠萝蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.195, 'USDA_FDC:174687 Jackfruit, raw'
FROM food f
WHERE f.name = '菠萝蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '菠萝蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 374, 'USDA_FDC:169758 Rice, white, long-grain, parboiled, unenriched, dry'
FROM food f
WHERE f.name = '蒸谷米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒸谷米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 7.51, 'USDA_FDC:169758 Rice, white, long-grain, parboiled, unenriched, dry'
FROM food f
WHERE f.name = '蒸谷米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒸谷米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 80.89, 'USDA_FDC:169758 Rice, white, long-grain, parboiled, unenriched, dry'
FROM food f
WHERE f.name = '蒸谷米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒸谷米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.03, 'USDA_FDC:169758 Rice, white, long-grain, parboiled, unenriched, dry'
FROM food f
WHERE f.name = '蒸谷米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒸谷米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.8, 'USDA_FDC:169758 Rice, white, long-grain, parboiled, unenriched, dry'
FROM food f
WHERE f.name = '蒸谷米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒸谷米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'USDA_FDC:169758 Rice, white, long-grain, parboiled, unenriched, dry'
FROM food f
WHERE f.name = '蒸谷米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒸谷米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 174, 'USDA_FDC:169758 Rice, white, long-grain, parboiled, unenriched, dry'
FROM food f
WHERE f.name = '蒸谷米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒸谷米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 153, 'USDA_FDC:169758 Rice, white, long-grain, parboiled, unenriched, dry'
FROM food f
WHERE f.name = '蒸谷米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒸谷米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169758 Rice, white, long-grain, parboiled, unenriched, dry'
FROM food f
WHERE f.name = '蒸谷米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒸谷米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.294, 'USDA_FDC:169758 Rice, white, long-grain, parboiled, unenriched, dry'
FROM food f
WHERE f.name = '蒸谷米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒸谷米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 46, 'USDA_FDC:171722 Cranberries, raw'
FROM food f
WHERE f.name = '蔓越莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蔓越莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.46, 'USDA_FDC:171722 Cranberries, raw'
FROM food f
WHERE f.name = '蔓越莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蔓越莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 11.97, 'USDA_FDC:171722 Cranberries, raw'
FROM food f
WHERE f.name = '蔓越莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蔓越莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.13, 'USDA_FDC:171722 Cranberries, raw'
FROM food f
WHERE f.name = '蔓越莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蔓越莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.6, 'USDA_FDC:171722 Cranberries, raw'
FROM food f
WHERE f.name = '蔓越莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蔓越莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'USDA_FDC:171722 Cranberries, raw'
FROM food f
WHERE f.name = '蔓越莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蔓越莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 80, 'USDA_FDC:171722 Cranberries, raw'
FROM food f
WHERE f.name = '蔓越莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蔓越莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 11, 'USDA_FDC:171722 Cranberries, raw'
FROM food f
WHERE f.name = '蔓越莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蔓越莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:171722 Cranberries, raw'
FROM food f
WHERE f.name = '蔓越莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蔓越莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.008, 'USDA_FDC:171722 Cranberries, raw'
FROM food f
WHERE f.name = '蔓越莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蔓越莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 147, 'TFDA:J0402601 麥奇鈎吻鮭(含皮)'
FROM food f
WHERE f.name = '虹鳟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '虹鳟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.1, 'TFDA:J0402601 麥奇鈎吻鮭(含皮)'
FROM food f
WHERE f.name = '虹鳟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '虹鳟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.4, 'TFDA:J0402601 麥奇鈎吻鮭(含皮)'
FROM food f
WHERE f.name = '虹鳟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '虹鳟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 6.8, 'TFDA:J0402601 麥奇鈎吻鮭(含皮)'
FROM food f
WHERE f.name = '虹鳟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '虹鳟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 23, 'TFDA:J0402601 麥奇鈎吻鮭(含皮)'
FROM food f
WHERE f.name = '虹鳟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '虹鳟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 387, 'TFDA:J0402601 麥奇鈎吻鮭(含皮)'
FROM food f
WHERE f.name = '虹鳟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '虹鳟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 267, 'TFDA:J0402601 麥奇鈎吻鮭(含皮)'
FROM food f
WHERE f.name = '虹鳟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '虹鳟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 49, 'TFDA:J0402601 麥奇鈎吻鮭(含皮)'
FROM food f
WHERE f.name = '虹鳟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '虹鳟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.2, 'TFDA:J0402601 麥奇鈎吻鮭(含皮)'
FROM food f
WHERE f.name = '虹鳟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '虹鳟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 71.3, 'TFDA:J0402601 麥奇鈎吻鮭(含皮)'
FROM food f
WHERE f.name = '虹鳟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '虹鳟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 3.15, 'TFDA:J0402601 麥奇鈎吻鮭(含皮)'
FROM food f
WHERE f.name = '虹鳟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '虹鳟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 44, 'TFDA:J0402601 麥奇鈎吻鮭(含皮)'
FROM food f
WHERE f.name = '虹鳟'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '虹鳟' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 52, 'USDA_FDC:172183 Egg, white, raw, fresh'
FROM food f
WHERE f.name = '蛋白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 10.9, 'USDA_FDC:172183 Egg, white, raw, fresh'
FROM food f
WHERE f.name = '蛋白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.73, 'USDA_FDC:172183 Egg, white, raw, fresh'
FROM food f
WHERE f.name = '蛋白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.17, 'USDA_FDC:172183 Egg, white, raw, fresh'
FROM food f
WHERE f.name = '蛋白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:172183 Egg, white, raw, fresh'
FROM food f
WHERE f.name = '蛋白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 166, 'USDA_FDC:172183 Egg, white, raw, fresh'
FROM food f
WHERE f.name = '蛋白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 163, 'USDA_FDC:172183 Egg, white, raw, fresh'
FROM food f
WHERE f.name = '蛋白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 15, 'USDA_FDC:172183 Egg, white, raw, fresh'
FROM food f
WHERE f.name = '蛋白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:172183 Egg, white, raw, fresh'
FROM food f
WHERE f.name = '蛋白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'USDA_FDC:172183 Egg, white, raw, fresh'
FROM food f
WHERE f.name = '蛋白'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋白' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 322, 'USDA_FDC:172184 Egg, yolk, raw, fresh'
FROM food f
WHERE f.name = '蛋黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 15.86, 'USDA_FDC:172184 Egg, yolk, raw, fresh'
FROM food f
WHERE f.name = '蛋黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 3.59, 'USDA_FDC:172184 Egg, yolk, raw, fresh'
FROM food f
WHERE f.name = '蛋黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 26.54, 'USDA_FDC:172184 Egg, yolk, raw, fresh'
FROM food f
WHERE f.name = '蛋黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:172184 Egg, yolk, raw, fresh'
FROM food f
WHERE f.name = '蛋黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 48, 'USDA_FDC:172184 Egg, yolk, raw, fresh'
FROM food f
WHERE f.name = '蛋黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 109, 'USDA_FDC:172184 Egg, yolk, raw, fresh'
FROM food f
WHERE f.name = '蛋黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 390, 'USDA_FDC:172184 Egg, yolk, raw, fresh'
FROM food f
WHERE f.name = '蛋黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 1085, 'USDA_FDC:172184 Egg, yolk, raw, fresh'
FROM food f
WHERE f.name = '蛋黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 9.551, 'USDA_FDC:172184 Egg, yolk, raw, fresh'
FROM food f
WHERE f.name = '蛋黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 106, 'TFDA:D4300101 蛋黃果'
FROM food f
WHERE f.name = '蛋黄果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.4, 'TFDA:D4300101 蛋黃果'
FROM food f
WHERE f.name = '蛋黄果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 27.3, 'TFDA:D4300101 蛋黃果'
FROM food f
WHERE f.name = '蛋黄果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.3, 'TFDA:D4300101 蛋黃果'
FROM food f
WHERE f.name = '蛋黄果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 6.1, 'TFDA:D4300101 蛋黃果'
FROM food f
WHERE f.name = '蛋黄果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 3, 'TFDA:D4300101 蛋黃果'
FROM food f
WHERE f.name = '蛋黄果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 289, 'TFDA:D4300101 蛋黃果'
FROM food f
WHERE f.name = '蛋黄果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 20, 'TFDA:D4300101 蛋黃果'
FROM food f
WHERE f.name = '蛋黄果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 70.3, 'TFDA:D4300101 蛋黃果'
FROM food f
WHERE f.name = '蛋黄果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 3.71, 'TFDA:D4300101 蛋黃果'
FROM food f
WHERE f.name = '蛋黄果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 20, 'TFDA:D4300101 蛋黃果'
FROM food f
WHERE f.name = '蛋黄果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 630, 'TFDA:P1100102 沙拉醬(2021年取樣)'
FROM food f
WHERE f.name = '蛋黄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.9, 'TFDA:P1100102 沙拉醬(2021年取樣)'
FROM food f
WHERE f.name = '蛋黄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 16.8, 'TFDA:P1100102 沙拉醬(2021年取樣)'
FROM food f
WHERE f.name = '蛋黄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 61.7, 'TFDA:P1100102 沙拉醬(2021年取樣)'
FROM food f
WHERE f.name = '蛋黄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'TFDA:P1100102 沙拉醬(2021年取樣)'
FROM food f
WHERE f.name = '蛋黄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 687, 'TFDA:P1100102 沙拉醬(2021年取樣)'
FROM food f
WHERE f.name = '蛋黄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 18, 'TFDA:P1100102 沙拉醬(2021年取樣)'
FROM food f
WHERE f.name = '蛋黄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 48, 'TFDA:P1100102 沙拉醬(2021年取樣)'
FROM food f
WHERE f.name = '蛋黄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 91, 'TFDA:P1100102 沙拉醬(2021年取樣)'
FROM food f
WHERE f.name = '蛋黄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 8.7, 'TFDA:P1100102 沙拉醬(2021年取樣)'
FROM food f
WHERE f.name = '蛋黄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 18, 'TFDA:P1100102 沙拉醬(2021年取樣)'
FROM food f
WHERE f.name = '蛋黄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 31.07, 'TFDA:P1100102 沙拉醬(2021年取樣)'
FROM food f
WHERE f.name = '蛋黄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 14, 'TFDA:P1100102 沙拉醬(2021年取樣)'
FROM food f
WHERE f.name = '蛋黄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蛋黄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 304, 'USDA_FDC:169640 Honey'
FROM food f
WHERE f.name = '蜂蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蜂蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.3, 'USDA_FDC:169640 Honey'
FROM food f
WHERE f.name = '蜂蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蜂蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 82.4, 'USDA_FDC:169640 Honey'
FROM food f
WHERE f.name = '蜂蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蜂蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0, 'USDA_FDC:169640 Honey'
FROM food f
WHERE f.name = '蜂蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蜂蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.2, 'USDA_FDC:169640 Honey'
FROM food f
WHERE f.name = '蜂蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蜂蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 4, 'USDA_FDC:169640 Honey'
FROM food f
WHERE f.name = '蜂蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蜂蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 52, 'USDA_FDC:169640 Honey'
FROM food f
WHERE f.name = '蜂蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蜂蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 4, 'USDA_FDC:169640 Honey'
FROM food f
WHERE f.name = '蜂蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蜂蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169640 Honey'
FROM food f
WHERE f.name = '蜂蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蜂蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'USDA_FDC:169640 Honey'
FROM food f
WHERE f.name = '蜂蜜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蜂蜜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 30, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '蟹味菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹味菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.9, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '蟹味菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹味菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 5.3, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '蟹味菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹味菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '蟹味菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹味菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.2, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '蟹味菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹味菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '蟹味菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹味菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 339, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '蟹味菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹味菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 85, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '蟹味菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹味菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '蟹味菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹味菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 90.8, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '蟹味菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹味菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '蟹味菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹味菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 2, 'TFDA:G1900101 鴻喜菇'
FROM food f
WHERE f.name = '蟹味菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹味菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 118, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 9.3, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 18.6, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.7, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 694, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 69, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 285, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.2, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 69.2, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.38, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 90, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 118, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹肉棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹肉棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 9.3, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹肉棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹肉棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 18.6, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹肉棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹肉棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.7, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹肉棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹肉棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 694, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹肉棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹肉棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 69, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹肉棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹肉棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 285, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹肉棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹肉棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.2, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹肉棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹肉棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 69.2, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹肉棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹肉棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.38, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹肉棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹肉棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 90, 'TFDA:R6700101 冷凍蟹味棒'
FROM food f
WHERE f.name = '蟹肉棒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蟹肉棒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 178, 'TFDA:P1004101 豆瓣醬'
FROM food f
WHERE f.name = '豆瓣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆瓣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 14.2, 'TFDA:P1004101 豆瓣醬'
FROM food f
WHERE f.name = '豆瓣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆瓣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 12.2, 'TFDA:P1004101 豆瓣醬'
FROM food f
WHERE f.name = '豆瓣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆瓣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 8.1, 'TFDA:P1004101 豆瓣醬'
FROM food f
WHERE f.name = '豆瓣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆瓣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 4.1, 'TFDA:P1004101 豆瓣醬'
FROM food f
WHERE f.name = '豆瓣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆瓣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 5042, 'TFDA:P1004101 豆瓣醬'
FROM food f
WHERE f.name = '豆瓣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆瓣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 689, 'TFDA:P1004101 豆瓣醬'
FROM food f
WHERE f.name = '豆瓣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆瓣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 231, 'TFDA:P1004101 豆瓣醬'
FROM food f
WHERE f.name = '豆瓣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆瓣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.3, 'TFDA:P1004101 豆瓣醬'
FROM food f
WHERE f.name = '豆瓣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆瓣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 51.8, 'TFDA:P1004101 豆瓣醬'
FROM food f
WHERE f.name = '豆瓣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆瓣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 6.12, 'TFDA:P1004101 豆瓣醬'
FROM food f
WHERE f.name = '豆瓣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆瓣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 19, 'TFDA:P1004101 豆瓣醬'
FROM food f
WHERE f.name = '豆瓣酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆瓣酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 209, 'TFDA:R4700401 豆腐皮'
FROM food f
WHERE f.name = '豆皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 25.3, 'TFDA:R4700401 豆腐皮'
FROM food f
WHERE f.name = '豆皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 2.4, 'TFDA:R4700401 豆腐皮'
FROM food f
WHERE f.name = '豆皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 11, 'TFDA:R4700401 豆腐皮'
FROM food f
WHERE f.name = '豆皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.6, 'TFDA:R4700401 豆腐皮'
FROM food f
WHERE f.name = '豆皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 23, 'TFDA:R4700401 豆腐皮'
FROM food f
WHERE f.name = '豆皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 382, 'TFDA:R4700401 豆腐皮'
FROM food f
WHERE f.name = '豆皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 391, 'TFDA:R4700401 豆腐皮'
FROM food f
WHERE f.name = '豆皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.7, 'TFDA:R4700401 豆腐皮'
FROM food f
WHERE f.name = '豆皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 59.6, 'TFDA:R4700401 豆腐皮'
FROM food f
WHERE f.name = '豆皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 8, 'TFDA:R4700401 豆腐皮'
FROM food f
WHERE f.name = '豆皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 62, 'TFDA:R4700401 豆腐皮'
FROM food f
WHERE f.name = '豆皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '豆皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 244, 'TFDA:R5400201 冷凍貢丸'
FROM food f
WHERE f.name = '贡丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贡丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 16.6, 'TFDA:R5400201 冷凍貢丸'
FROM food f
WHERE f.name = '贡丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贡丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:R5400201 冷凍貢丸'
FROM food f
WHERE f.name = '贡丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贡丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 20.3, 'TFDA:R5400201 冷凍貢丸'
FROM food f
WHERE f.name = '贡丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贡丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 580, 'TFDA:R5400201 冷凍貢丸'
FROM food f
WHERE f.name = '贡丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贡丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 195, 'TFDA:R5400201 冷凍貢丸'
FROM food f
WHERE f.name = '贡丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贡丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 190, 'TFDA:R5400201 冷凍貢丸'
FROM food f
WHERE f.name = '贡丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贡丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 42, 'TFDA:R5400201 冷凍貢丸'
FROM food f
WHERE f.name = '贡丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贡丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 7.4, 'TFDA:R5400201 冷凍貢丸'
FROM food f
WHERE f.name = '贡丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贡丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 61.6, 'TFDA:R5400201 冷凍貢丸'
FROM food f
WHERE f.name = '贡丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贡丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.22, 'TFDA:R5400201 冷凍貢丸'
FROM food f
WHERE f.name = '贡丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贡丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 6, 'TFDA:R5400201 冷凍貢丸'
FROM food f
WHERE f.name = '贡丸'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贡丸' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 328, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '赤小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '赤小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.9, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '赤小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '赤小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 61.5, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '赤小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '赤小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.6, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '赤小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '赤小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 18.5, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '赤小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '赤小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '赤小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '赤小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1203, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '赤小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '赤小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 442, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '赤小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '赤小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.2, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '赤小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '赤小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 13.9, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '赤小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '赤小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 11.14, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '赤小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '赤小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 87, 'TFDA:H0405101 紅豆'
FROM food f
WHERE f.name = '赤小豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '赤小豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 884, 'USDA_FDC:173584 Shortening, vegetable, household, composite'
FROM food f
WHERE f.name = '起酥油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '起酥油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'USDA_FDC:173584 Shortening, vegetable, household, composite'
FROM food f
WHERE f.name = '起酥油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '起酥油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:173584 Shortening, vegetable, household, composite'
FROM food f
WHERE f.name = '起酥油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '起酥油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 99.97, 'USDA_FDC:173584 Shortening, vegetable, household, composite'
FROM food f
WHERE f.name = '起酥油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '起酥油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:173584 Shortening, vegetable, household, composite'
FROM food f
WHERE f.name = '起酥油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '起酥油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 4, 'USDA_FDC:173584 Shortening, vegetable, household, composite'
FROM food f
WHERE f.name = '起酥油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '起酥油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 0, 'USDA_FDC:173584 Shortening, vegetable, household, composite'
FROM food f
WHERE f.name = '起酥油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '起酥油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 0, 'USDA_FDC:173584 Shortening, vegetable, household, composite'
FROM food f
WHERE f.name = '起酥油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '起酥油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:173584 Shortening, vegetable, household, composite'
FROM food f
WHERE f.name = '起酥油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '起酥油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 24.98, 'USDA_FDC:173584 Shortening, vegetable, household, composite'
FROM food f
WHERE f.name = '起酥油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '起酥油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 899, 'TFDA:P0900101 紅辣椒油'
FROM food f
WHERE f.name = '辣椒油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'TFDA:P0900101 紅辣椒油'
FROM food f
WHERE f.name = '辣椒油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.1, 'TFDA:P0900101 紅辣椒油'
FROM food f
WHERE f.name = '辣椒油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 99.8, 'TFDA:P0900101 紅辣椒油'
FROM food f
WHERE f.name = '辣椒油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'TFDA:P0900101 紅辣椒油'
FROM food f
WHERE f.name = '辣椒油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 0, 'TFDA:P0900101 紅辣椒油'
FROM food f
WHERE f.name = '辣椒油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 1, 'TFDA:P0900101 紅辣椒油'
FROM food f
WHERE f.name = '辣椒油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'TFDA:P0900101 紅辣椒油'
FROM food f
WHERE f.name = '辣椒油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 16.1, 'TFDA:P0900101 紅辣椒油'
FROM food f
WHERE f.name = '辣椒油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 0.1, 'TFDA:P0900101 紅辣椒油'
FROM food f
WHERE f.name = '辣椒油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 88.56, 'TFDA:P0900101 紅辣椒油'
FROM food f
WHERE f.name = '辣椒油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 1, 'TFDA:P0900101 紅辣椒油'
FROM food f
WHERE f.name = '辣椒油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 83, 'TFDA:P1003201 辣椒醬'
FROM food f
WHERE f.name = '辣椒酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.6, 'TFDA:P1003201 辣椒醬'
FROM food f
WHERE f.name = '辣椒酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 11.5, 'TFDA:P1003201 辣椒醬'
FROM food f
WHERE f.name = '辣椒酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2.9, 'TFDA:P1003201 辣椒醬'
FROM food f
WHERE f.name = '辣椒酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 4.7, 'TFDA:P1003201 辣椒醬'
FROM food f
WHERE f.name = '辣椒酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 4948, 'TFDA:P1003201 辣椒醬'
FROM food f
WHERE f.name = '辣椒酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 226, 'TFDA:P1003201 辣椒醬'
FROM food f
WHERE f.name = '辣椒酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 83, 'TFDA:P1003201 辣椒醬'
FROM food f
WHERE f.name = '辣椒酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.5, 'TFDA:P1003201 辣椒醬'
FROM food f
WHERE f.name = '辣椒酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 68.9, 'TFDA:P1003201 辣椒醬'
FROM food f
WHERE f.name = '辣椒酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 30.03, 'TFDA:P1003201 辣椒醬'
FROM food f
WHERE f.name = '辣椒酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 37, 'TFDA:P1003201 辣椒醬'
FROM food f
WHERE f.name = '辣椒酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 387, 'TFDA:P0101801 辣椒粉'
FROM food f
WHERE f.name = '辣椒面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 14.7, 'TFDA:P0101801 辣椒粉'
FROM food f
WHERE f.name = '辣椒面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 59.1, 'TFDA:P0101801 辣椒粉'
FROM food f
WHERE f.name = '辣椒面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 14.1, 'TFDA:P0101801 辣椒粉'
FROM food f
WHERE f.name = '辣椒面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 42.5, 'TFDA:P0101801 辣椒粉'
FROM food f
WHERE f.name = '辣椒面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 12, 'TFDA:P0101801 辣椒粉'
FROM food f
WHERE f.name = '辣椒面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 2179, 'TFDA:P0101801 辣椒粉'
FROM food f
WHERE f.name = '辣椒面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 384, 'TFDA:P0101801 辣椒粉'
FROM food f
WHERE f.name = '辣椒面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.9, 'TFDA:P0101801 辣椒粉'
FROM food f
WHERE f.name = '辣椒面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 5.5, 'TFDA:P0101801 辣椒粉'
FROM food f
WHERE f.name = '辣椒面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 26, 'TFDA:P0101801 辣椒粉'
FROM food f
WHERE f.name = '辣椒面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 63, 'TFDA:P0101801 辣椒粉'
FROM food f
WHERE f.name = '辣椒面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣椒面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 77, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '辣酱油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣酱油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '辣酱油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣酱油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 19.17, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '辣酱油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣酱油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '辣酱油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣酱油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '辣酱油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣酱油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1300, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '辣酱油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣酱油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 800, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '辣酱油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣酱油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 60, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '辣酱油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣酱油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '辣酱油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣酱油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'USDA_FDC:171610 Sauce, worcestershire'
FROM food f
WHERE f.name = '辣酱油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '辣酱油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 28, 'TFDA:O0703301 運動飲料'
FROM food f
WHERE f.name = '运动饮料'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '运动饮料' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.1, 'TFDA:O0703301 運動飲料'
FROM food f
WHERE f.name = '运动饮料'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '运动饮料' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 7, 'TFDA:O0703301 運動飲料'
FROM food f
WHERE f.name = '运动饮料'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '运动饮料' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'TFDA:O0703301 運動飲料'
FROM food f
WHERE f.name = '运动饮料'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '运动饮料' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 41, 'TFDA:O0703301 運動飲料'
FROM food f
WHERE f.name = '运动饮料'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '运动饮料' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 18, 'TFDA:O0703301 運動飲料'
FROM food f
WHERE f.name = '运动饮料'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '运动饮料' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 1, 'TFDA:O0703301 運動飲料'
FROM food f
WHERE f.name = '运动饮料'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '运动饮料' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 92.7, 'TFDA:O0703301 運動飲料'
FROM food f
WHERE f.name = '运动饮料'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '运动饮料' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:O0703301 運動飲料'
FROM food f
WHERE f.name = '运动饮料'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '运动饮料' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 2, 'TFDA:O0703301 運動飲料'
FROM food f
WHERE f.name = '运动饮料'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '运动饮料' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 58, 'TFDA:O0100501 烏梅汁'
FROM food f
WHERE f.name = '酸梅汤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸梅汤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.3, 'TFDA:O0100501 烏梅汁'
FROM food f
WHERE f.name = '酸梅汤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸梅汤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 13.8, 'TFDA:O0100501 烏梅汁'
FROM food f
WHERE f.name = '酸梅汤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸梅汤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'TFDA:O0100501 烏梅汁'
FROM food f
WHERE f.name = '酸梅汤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸梅汤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.2, 'TFDA:O0100501 烏梅汁'
FROM food f
WHERE f.name = '酸梅汤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸梅汤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 10, 'TFDA:O0100501 烏梅汁'
FROM food f
WHERE f.name = '酸梅汤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸梅汤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 44, 'TFDA:O0100501 烏梅汁'
FROM food f
WHERE f.name = '酸梅汤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸梅汤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 4, 'TFDA:O0100501 烏梅汁'
FROM food f
WHERE f.name = '酸梅汤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸梅汤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:O0100501 烏梅汁'
FROM food f
WHERE f.name = '酸梅汤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸梅汤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 85.6, 'TFDA:O0100501 烏梅汁'
FROM food f
WHERE f.name = '酸梅汤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸梅汤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.01, 'TFDA:O0100501 烏梅汁'
FROM food f
WHERE f.name = '酸梅汤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸梅汤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 7, 'TFDA:O0100501 烏梅汁'
FROM food f
WHERE f.name = '酸梅汤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸梅汤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 239, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '酸角'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸角' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.8, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '酸角'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸角' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 62.5, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '酸角'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸角' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.6, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '酸角'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸角' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 5.1, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '酸角'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸角' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 28, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '酸角'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸角' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 628, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '酸角'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸角' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 113, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '酸角'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸角' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '酸角'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸角' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.272, 'USDA_FDC:167763 Tamarinds, raw'
FROM food f
WHERE f.name = '酸角'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸角' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 104, 'TFDA:D1200101 釋迦'
FROM food f
WHERE f.name = '释迦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '释迦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.2, 'TFDA:D1200101 釋迦'
FROM food f
WHERE f.name = '释迦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '释迦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 26.6, 'TFDA:D1200101 釋迦'
FROM food f
WHERE f.name = '释迦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '释迦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:D1200101 釋迦'
FROM food f
WHERE f.name = '释迦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '释迦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.7, 'TFDA:D1200101 釋迦'
FROM food f
WHERE f.name = '释迦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '释迦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 7, 'TFDA:D1200101 釋迦'
FROM food f
WHERE f.name = '释迦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '释迦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 390, 'TFDA:D1200101 釋迦'
FROM food f
WHERE f.name = '释迦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '释迦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 46, 'TFDA:D1200101 釋迦'
FROM food f
WHERE f.name = '释迦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '释迦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:D1200101 釋迦'
FROM food f
WHERE f.name = '释迦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '释迦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 70, 'TFDA:D1200101 釋迦'
FROM food f
WHERE f.name = '释迦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '释迦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 18, 'TFDA:D1200101 釋迦'
FROM food f
WHERE f.name = '释迦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '释迦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 122, 'USDA_FDC:175297 Game meat, boar, wild, raw'
FROM food f
WHERE f.name = '野猪肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '野猪肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 21.51, 'USDA_FDC:175297 Game meat, boar, wild, raw'
FROM food f
WHERE f.name = '野猪肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '野猪肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:175297 Game meat, boar, wild, raw'
FROM food f
WHERE f.name = '野猪肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '野猪肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.33, 'USDA_FDC:175297 Game meat, boar, wild, raw'
FROM food f
WHERE f.name = '野猪肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '野猪肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:175297 Game meat, boar, wild, raw'
FROM food f
WHERE f.name = '野猪肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '野猪肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 120, 'USDA_FDC:175297 Game meat, boar, wild, raw'
FROM food f
WHERE f.name = '野猪肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '野猪肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.99, 'USDA_FDC:175297 Game meat, boar, wild, raw'
FROM food f
WHERE f.name = '野猪肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '野猪肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 119, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '金线鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金线鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.9, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '金线鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金线鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '金线鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金线鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.3, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '金线鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金线鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 103, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '金线鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金线鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 329, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '金线鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金线鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 205, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '金线鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金线鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 64, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '金线鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金线鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.5, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '金线鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金线鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 76.3, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '金线鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金线鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.64, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '金线鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金线鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 21, 'TFDA:J0409401 金線魚'
FROM food f
WHERE f.name = '金线鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金线鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 190, 'TFDA:J0407101 布氏鯧鰺(含皮)'
FROM food f
WHERE f.name = '金鲳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金鲳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 17.5, 'TFDA:J0407101 布氏鯧鰺(含皮)'
FROM food f
WHERE f.name = '金鲳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金鲳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0407101 布氏鯧鰺(含皮)'
FROM food f
WHERE f.name = '金鲳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金鲳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 12.8, 'TFDA:J0407101 布氏鯧鰺(含皮)'
FROM food f
WHERE f.name = '金鲳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金鲳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 36, 'TFDA:J0407101 布氏鯧鰺(含皮)'
FROM food f
WHERE f.name = '金鲳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金鲳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 305, 'TFDA:J0407101 布氏鯧鰺(含皮)'
FROM food f
WHERE f.name = '金鲳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金鲳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 234, 'TFDA:J0407101 布氏鯧鰺(含皮)'
FROM food f
WHERE f.name = '金鲳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金鲳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 69, 'TFDA:J0407101 布氏鯧鰺(含皮)'
FROM food f
WHERE f.name = '金鲳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金鲳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 5.5, 'TFDA:J0407101 布氏鯧鰺(含皮)'
FROM food f
WHERE f.name = '金鲳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金鲳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 69.6, 'TFDA:J0407101 布氏鯧鰺(含皮)'
FROM food f
WHERE f.name = '金鲳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金鲳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.92, 'TFDA:J0407101 布氏鯧鰺(含皮)'
FROM food f
WHERE f.name = '金鲳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金鲳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 20, 'TFDA:J0407101 布氏鯧鰺(含皮)'
FROM food f
WHERE f.name = '金鲳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '金鲳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 182, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '银杏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银杏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 4.32, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '银杏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银杏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 37.6, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '银杏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银杏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.68, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '银杏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银杏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 7, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '银杏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银杏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 510, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '银杏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银杏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 124, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '银杏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银杏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '银杏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银杏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.319, 'USDA_FDC:170584 Nuts, ginkgo nuts, raw'
FROM food f
WHERE f.name = '银杏'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银杏' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 69, 'TFDA:J0402101 銀魚'
FROM food f
WHERE f.name = '银鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 14.3, 'TFDA:J0402101 銀魚'
FROM food f
WHERE f.name = '银鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.9, 'TFDA:J0402101 銀魚'
FROM food f
WHERE f.name = '银鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.9, 'TFDA:J0402101 銀魚'
FROM food f
WHERE f.name = '银鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 56, 'TFDA:J0402101 銀魚'
FROM food f
WHERE f.name = '银鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 85, 'TFDA:J0402101 銀魚'
FROM food f
WHERE f.name = '银鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 217, 'TFDA:J0402101 銀魚'
FROM food f
WHERE f.name = '银鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 179, 'TFDA:J0402101 銀魚'
FROM food f
WHERE f.name = '银鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.2, 'TFDA:J0402101 銀魚'
FROM food f
WHERE f.name = '银鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 82.7, 'TFDA:J0402101 銀魚'
FROM food f
WHERE f.name = '银鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 2.1, 'TFDA:J0402101 銀魚'
FROM food f
WHERE f.name = '银鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 274, 'TFDA:J0402101 銀魚'
FROM food f
WHERE f.name = '银鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '银鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 349, 'TFDA:P0201401 陳皮'
FROM food f
WHERE f.name = '陈皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '陈皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 6.9, 'TFDA:P0201401 陳皮'
FROM food f
WHERE f.name = '陈皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '陈皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 74.8, 'TFDA:P0201401 陳皮'
FROM food f
WHERE f.name = '陈皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '陈皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2.4, 'TFDA:P0201401 陳皮'
FROM food f
WHERE f.name = '陈皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '陈皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 39.5, 'TFDA:P0201401 陳皮'
FROM food f
WHERE f.name = '陈皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '陈皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 3, 'TFDA:P0201401 陳皮'
FROM food f
WHERE f.name = '陈皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '陈皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 728, 'TFDA:P0201401 陳皮'
FROM food f
WHERE f.name = '陈皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '陈皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 63, 'TFDA:P0201401 陳皮'
FROM food f
WHERE f.name = '陈皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '陈皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'TFDA:P0201401 陳皮'
FROM food f
WHERE f.name = '陈皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '陈皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.9, 'TFDA:P0201401 陳皮'
FROM food f
WHERE f.name = '陈皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '陈皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 12.9, 'TFDA:P0201401 陳皮'
FROM food f
WHERE f.name = '陈皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '陈皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 18.72, 'TFDA:P0201401 陳皮'
FROM food f
WHERE f.name = '陈皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '陈皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 534, 'TFDA:P0201401 陳皮'
FROM food f
WHERE f.name = '陈皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '陈皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 20, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.5, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 3.8, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.7, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 14, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 322, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 27, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 93.5, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.73, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 88, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 20, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里红'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里红' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.5, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里红'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里红' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 3.8, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里红'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里红' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里红'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里红' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.7, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里红'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里红' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 14, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里红'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里红' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 322, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里红'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里红' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 27, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里红'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里红' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里红'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里红' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 93.5, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里红'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里红' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.73, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里红'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里红' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 88, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里红'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里红' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 20, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里蕻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里蕻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.5, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里蕻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里蕻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 3.8, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里蕻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里蕻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里蕻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里蕻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.7, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里蕻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里蕻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 14, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里蕻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里蕻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 322, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里蕻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里蕻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 27, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里蕻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里蕻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里蕻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里蕻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 93.5, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里蕻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里蕻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.73, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里蕻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里蕻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 88, 'TFDA:E3800402 雪裡蕻'
FROM food f
WHERE f.name = '雪里蕻'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪里蕻' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 46, 'TFDA:J3101301 環文蛤'
FROM food f
WHERE f.name = '青蛤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青蛤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 8.7, 'TFDA:J3101301 環文蛤'
FROM food f
WHERE f.name = '青蛤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青蛤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 3.7, 'TFDA:J3101301 環文蛤'
FROM food f
WHERE f.name = '青蛤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青蛤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1, 'TFDA:J3101301 環文蛤'
FROM food f
WHERE f.name = '青蛤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青蛤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 760, 'TFDA:J3101301 環文蛤'
FROM food f
WHERE f.name = '青蛤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青蛤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 154, 'TFDA:J3101301 環文蛤'
FROM food f
WHERE f.name = '青蛤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青蛤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 150, 'TFDA:J3101301 環文蛤'
FROM food f
WHERE f.name = '青蛤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青蛤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 57, 'TFDA:J3101301 環文蛤'
FROM food f
WHERE f.name = '青蛤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青蛤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.4, 'TFDA:J3101301 環文蛤'
FROM food f
WHERE f.name = '青蛤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青蛤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 84, 'TFDA:J3101301 環文蛤'
FROM food f
WHERE f.name = '青蛤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青蛤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.86, 'TFDA:J3101301 環文蛤'
FROM food f
WHERE f.name = '青蛤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青蛤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 165, 'TFDA:J3101301 環文蛤'
FROM food f
WHERE f.name = '青蛤'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青蛤' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 61, 'TFDA:E9900701 麵包果'
FROM food f
WHERE f.name = '面包果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面包果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1, 'TFDA:E9900701 麵包果'
FROM food f
WHERE f.name = '面包果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面包果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 11.2, 'TFDA:E9900701 麵包果'
FROM food f
WHERE f.name = '面包果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面包果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.8, 'TFDA:E9900701 麵包果'
FROM food f
WHERE f.name = '面包果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面包果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 4.3, 'TFDA:E9900701 麵包果'
FROM food f
WHERE f.name = '面包果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面包果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'TFDA:E9900701 麵包果'
FROM food f
WHERE f.name = '面包果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面包果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 269, 'TFDA:E9900701 麵包果'
FROM food f
WHERE f.name = '面包果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面包果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 19, 'TFDA:E9900701 麵包果'
FROM food f
WHERE f.name = '面包果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面包果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'TFDA:E9900701 麵包果'
FROM food f
WHERE f.name = '面包果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面包果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.6, 'TFDA:E9900701 麵包果'
FROM food f
WHERE f.name = '面包果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面包果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 85.4, 'TFDA:E9900701 麵包果'
FROM food f
WHERE f.name = '面包果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面包果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.76, 'TFDA:E9900701 麵包果'
FROM food f
WHERE f.name = '面包果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面包果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 51, 'TFDA:E9900701 麵包果'
FROM food f
WHERE f.name = '面包果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面包果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 349, 'TFDA:H0205101 米豆'
FROM food f
WHERE f.name = '饭豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '饭豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 21.7, 'TFDA:H0205101 米豆'
FROM food f
WHERE f.name = '饭豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '饭豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 62.2, 'TFDA:H0205101 米豆'
FROM food f
WHERE f.name = '饭豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '饭豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2.4, 'TFDA:H0205101 米豆'
FROM food f
WHERE f.name = '饭豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '饭豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 15.7, 'TFDA:H0205101 米豆'
FROM food f
WHERE f.name = '饭豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '饭豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 19, 'TFDA:H0205101 米豆'
FROM food f
WHERE f.name = '饭豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '饭豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1129, 'TFDA:H0205101 米豆'
FROM food f
WHERE f.name = '饭豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '饭豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 404, 'TFDA:H0205101 米豆'
FROM food f
WHERE f.name = '饭豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '饭豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.9, 'TFDA:H0205101 米豆'
FROM food f
WHERE f.name = '饭豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '饭豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 10.5, 'TFDA:H0205101 米豆'
FROM food f
WHERE f.name = '饭豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '饭豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 9.85, 'TFDA:H0205101 米豆'
FROM food f
WHERE f.name = '饭豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '饭豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 63, 'TFDA:H0205101 米豆'
FROM food f
WHERE f.name = '饭豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '饭豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 271, 'TFDA:R1800301 餛飩皮'
FROM food f
WHERE f.name = '馄饨皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '馄饨皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 8.3, 'TFDA:R1800301 餛飩皮'
FROM food f
WHERE f.name = '馄饨皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '馄饨皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 58.2, 'TFDA:R1800301 餛飩皮'
FROM food f
WHERE f.name = '馄饨皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '馄饨皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.5, 'TFDA:R1800301 餛飩皮'
FROM food f
WHERE f.name = '馄饨皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '馄饨皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.5, 'TFDA:R1800301 餛飩皮'
FROM food f
WHERE f.name = '馄饨皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '馄饨皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 501, 'TFDA:R1800301 餛飩皮'
FROM food f
WHERE f.name = '馄饨皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '馄饨皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 77, 'TFDA:R1800301 餛飩皮'
FROM food f
WHERE f.name = '馄饨皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '馄饨皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 61, 'TFDA:R1800301 餛飩皮'
FROM food f
WHERE f.name = '馄饨皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '馄饨皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:R1800301 餛飩皮'
FROM food f
WHERE f.name = '馄饨皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '馄饨皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 31.4, 'TFDA:R1800301 餛飩皮'
FROM food f
WHERE f.name = '馄饨皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '馄饨皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.03, 'TFDA:R1800301 餛飩皮'
FROM food f
WHERE f.name = '馄饨皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '馄饨皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 15, 'TFDA:R1800301 餛飩皮'
FROM food f
WHERE f.name = '馄饨皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '馄饨皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 313, 'USDA_FDC:170917 Spices, bay leaf'
FROM food f
WHERE f.name = '香叶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香叶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 7.61, 'USDA_FDC:170917 Spices, bay leaf'
FROM food f
WHERE f.name = '香叶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香叶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 74.97, 'USDA_FDC:170917 Spices, bay leaf'
FROM food f
WHERE f.name = '香叶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香叶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 8.36, 'USDA_FDC:170917 Spices, bay leaf'
FROM food f
WHERE f.name = '香叶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香叶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 26.3, 'USDA_FDC:170917 Spices, bay leaf'
FROM food f
WHERE f.name = '香叶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香叶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 23, 'USDA_FDC:170917 Spices, bay leaf'
FROM food f
WHERE f.name = '香叶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香叶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 529, 'USDA_FDC:170917 Spices, bay leaf'
FROM food f
WHERE f.name = '香叶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香叶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 113, 'USDA_FDC:170917 Spices, bay leaf'
FROM food f
WHERE f.name = '香叶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香叶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170917 Spices, bay leaf'
FROM food f
WHERE f.name = '香叶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香叶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.28, 'USDA_FDC:170917 Spices, bay leaf'
FROM food f
WHERE f.name = '香叶'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香叶' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 354, 'TFDA:R5300201 香腸'
FROM food f
WHERE f.name = '香肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 17, 'TFDA:R5300201 香腸'
FROM food f
WHERE f.name = '香肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 12.3, 'TFDA:R5300201 香腸'
FROM food f
WHERE f.name = '香肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 26.3, 'TFDA:R5300201 香腸'
FROM food f
WHERE f.name = '香肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1026, 'TFDA:R5300201 香腸'
FROM food f
WHERE f.name = '香肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 284, 'TFDA:R5300201 香腸'
FROM food f
WHERE f.name = '香肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 152, 'TFDA:R5300201 香腸'
FROM food f
WHERE f.name = '香肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 62, 'TFDA:R5300201 香腸'
FROM food f
WHERE f.name = '香肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 10, 'TFDA:R5300201 香腸'
FROM food f
WHERE f.name = '香肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 41.2, 'TFDA:R5300201 香腸'
FROM food f
WHERE f.name = '香肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.15, 'TFDA:R5300201 香腸'
FROM food f
WHERE f.name = '香肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 2, 'TFDA:R5300201 香腸'
FROM food f
WHERE f.name = '香肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '香肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 133, 'USDA_FDC:175086 Game meat, horse, raw'
FROM food f
WHERE f.name = '马肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 21.39, 'USDA_FDC:175086 Game meat, horse, raw'
FROM food f
WHERE f.name = '马肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:175086 Game meat, horse, raw'
FROM food f
WHERE f.name = '马肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 4.6, 'USDA_FDC:175086 Game meat, horse, raw'
FROM food f
WHERE f.name = '马肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:175086 Game meat, horse, raw'
FROM food f
WHERE f.name = '马肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 53, 'USDA_FDC:175086 Game meat, horse, raw'
FROM food f
WHERE f.name = '马肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 360, 'USDA_FDC:175086 Game meat, horse, raw'
FROM food f
WHERE f.name = '马肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 221, 'USDA_FDC:175086 Game meat, horse, raw'
FROM food f
WHERE f.name = '马肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 52, 'USDA_FDC:175086 Game meat, horse, raw'
FROM food f
WHERE f.name = '马肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.44, 'USDA_FDC:175086 Game meat, horse, raw'
FROM food f
WHERE f.name = '马肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 299, 'USDA_FDC:170845 Cheese, mozzarella, whole milk'
FROM food f
WHERE f.name = '马苏里拉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马苏里拉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 22.17, 'USDA_FDC:170845 Cheese, mozzarella, whole milk'
FROM food f
WHERE f.name = '马苏里拉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马苏里拉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 2.4, 'USDA_FDC:170845 Cheese, mozzarella, whole milk'
FROM food f
WHERE f.name = '马苏里拉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马苏里拉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 22.14, 'USDA_FDC:170845 Cheese, mozzarella, whole milk'
FROM food f
WHERE f.name = '马苏里拉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马苏里拉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:170845 Cheese, mozzarella, whole milk'
FROM food f
WHERE f.name = '马苏里拉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马苏里拉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 486, 'USDA_FDC:170845 Cheese, mozzarella, whole milk'
FROM food f
WHERE f.name = '马苏里拉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马苏里拉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 76, 'USDA_FDC:170845 Cheese, mozzarella, whole milk'
FROM food f
WHERE f.name = '马苏里拉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马苏里拉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 354, 'USDA_FDC:170845 Cheese, mozzarella, whole milk'
FROM food f
WHERE f.name = '马苏里拉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马苏里拉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 79, 'USDA_FDC:170845 Cheese, mozzarella, whole milk'
FROM food f
WHERE f.name = '马苏里拉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马苏里拉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 13.9, 'USDA_FDC:170845 Cheese, mozzarella, whole milk'
FROM food f
WHERE f.name = '马苏里拉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '马苏里拉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 362, 'TFDA:A0320404 高筋麵粉'
FROM food f
WHERE f.name = '高筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '高筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 12.9, 'TFDA:A0320404 高筋麵粉'
FROM food f
WHERE f.name = '高筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '高筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 73.1, 'TFDA:A0320404 高筋麵粉'
FROM food f
WHERE f.name = '高筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '高筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.2, 'TFDA:A0320404 高筋麵粉'
FROM food f
WHERE f.name = '高筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '高筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.9, 'TFDA:A0320404 高筋麵粉'
FROM food f
WHERE f.name = '高筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '高筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'TFDA:A0320404 高筋麵粉'
FROM food f
WHERE f.name = '高筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '高筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 108, 'TFDA:A0320404 高筋麵粉'
FROM food f
WHERE f.name = '高筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '高筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 81, 'TFDA:A0320404 高筋麵粉'
FROM food f
WHERE f.name = '高筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '高筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.3, 'TFDA:A0320404 高筋麵粉'
FROM food f
WHERE f.name = '高筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '高筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 12.3, 'TFDA:A0320404 高筋麵粉'
FROM food f
WHERE f.name = '高筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '高筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.71, 'TFDA:A0320404 高筋麵粉'
FROM food f
WHERE f.name = '高筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '高筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 11, 'TFDA:A0320404 高筋麵粉'
FROM food f
WHERE f.name = '高筋面粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '高筋面粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 104, 'TFDA:J0411101 鮸'
FROM food f
WHERE f.name = '鮸鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鮸鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 23.3, 'TFDA:J0411101 鮸'
FROM food f
WHERE f.name = '鮸鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鮸鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0411101 鮸'
FROM food f
WHERE f.name = '鮸鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鮸鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.5, 'TFDA:J0411101 鮸'
FROM food f
WHERE f.name = '鮸鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鮸鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 52, 'TFDA:J0411101 鮸'
FROM food f
WHERE f.name = '鮸鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鮸鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 406, 'TFDA:J0411101 鮸'
FROM food f
WHERE f.name = '鮸鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鮸鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 219, 'TFDA:J0411101 鮸'
FROM food f
WHERE f.name = '鮸鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鮸鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 59, 'TFDA:J0411101 鮸'
FROM food f
WHERE f.name = '鮸鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鮸鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.2, 'TFDA:J0411101 鮸'
FROM food f
WHERE f.name = '鮸鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鮸鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 76.7, 'TFDA:J0411101 鮸'
FROM food f
WHERE f.name = '鮸鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鮸鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.39, 'TFDA:J0411101 鮸'
FROM food f
WHERE f.name = '鮸鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鮸鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 11, 'TFDA:J0411101 鮸'
FROM food f
WHERE f.name = '鮸鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鮸鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 64, 'TFDA:P0800401 魚露'
FROM food f
WHERE f.name = '鱼露'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鱼露' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 10.2, 'TFDA:P0800401 魚露'
FROM food f
WHERE f.name = '鱼露'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鱼露' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 5.3, 'TFDA:P0800401 魚露'
FROM food f
WHERE f.name = '鱼露'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鱼露' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'TFDA:P0800401 魚露'
FROM food f
WHERE f.name = '鱼露'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鱼露' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 8908, 'TFDA:P0800401 魚露'
FROM food f
WHERE f.name = '鱼露'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鱼露' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 204, 'TFDA:P0800401 魚露'
FROM food f
WHERE f.name = '鱼露'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鱼露' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 24, 'TFDA:P0800401 魚露'
FROM food f
WHERE f.name = '鱼露'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鱼露' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'TFDA:P0800401 魚露'
FROM food f
WHERE f.name = '鱼露'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鱼露' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:P0800401 魚露'
FROM food f
WHERE f.name = '鱼露'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鱼露' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 62.6, 'TFDA:P0800401 魚露'
FROM food f
WHERE f.name = '鱼露'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鱼露' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:P0800401 魚露'
FROM food f
WHERE f.name = '鱼露'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鱼露' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 10, 'TFDA:P0800401 魚露'
FROM food f
WHERE f.name = '鱼露'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鱼露' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 138, 'TFDA:J0414101 花腹鯖'
FROM food f
WHERE f.name = '鲐鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲐鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 23.9, 'TFDA:J0414101 花腹鯖'
FROM food f
WHERE f.name = '鲐鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲐鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.1, 'TFDA:J0414101 花腹鯖'
FROM food f
WHERE f.name = '鲐鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲐鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 4, 'TFDA:J0414101 花腹鯖'
FROM food f
WHERE f.name = '鲐鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲐鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 36, 'TFDA:J0414101 花腹鯖'
FROM food f
WHERE f.name = '鲐鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲐鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 368, 'TFDA:J0414101 花腹鯖'
FROM food f
WHERE f.name = '鲐鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲐鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 256, 'TFDA:J0414101 花腹鯖'
FROM food f
WHERE f.name = '鲐鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲐鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 31, 'TFDA:J0414101 花腹鯖'
FROM food f
WHERE f.name = '鲐鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲐鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.5, 'TFDA:J0414101 花腹鯖'
FROM food f
WHERE f.name = '鲐鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲐鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 70.5, 'TFDA:J0414101 花腹鯖'
FROM food f
WHERE f.name = '鲐鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲐鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.13, 'TFDA:J0414101 花腹鯖'
FROM food f
WHERE f.name = '鲐鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲐鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 27, 'TFDA:J0414101 花腹鯖'
FROM food f
WHERE f.name = '鲐鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲐鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 45, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '鲜橘汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲜橘汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.7, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '鲜橘汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲜橘汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 10.4, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '鲜橘汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲜橘汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '鲜橘汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲜橘汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.2, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '鲜橘汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲜橘汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '鲜橘汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲜橘汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 200, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '鲜橘汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲜橘汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 17, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '鲜橘汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲜橘汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '鲜橘汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲜橘汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.024, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '鲜橘汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲜橘汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 105, 'USDA_FDC:173701 Fish, sturgeon, mixed species, raw'
FROM food f
WHERE f.name = '鲟鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲟鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 16.14, 'USDA_FDC:173701 Fish, sturgeon, mixed species, raw'
FROM food f
WHERE f.name = '鲟鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲟鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:173701 Fish, sturgeon, mixed species, raw'
FROM food f
WHERE f.name = '鲟鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲟鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 4.04, 'USDA_FDC:173701 Fish, sturgeon, mixed species, raw'
FROM food f
WHERE f.name = '鲟鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲟鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:173701 Fish, sturgeon, mixed species, raw'
FROM food f
WHERE f.name = '鲟鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲟鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 54, 'USDA_FDC:173701 Fish, sturgeon, mixed species, raw'
FROM food f
WHERE f.name = '鲟鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲟鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 284, 'USDA_FDC:173701 Fish, sturgeon, mixed species, raw'
FROM food f
WHERE f.name = '鲟鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲟鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 211, 'USDA_FDC:173701 Fish, sturgeon, mixed species, raw'
FROM food f
WHERE f.name = '鲟鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲟鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 60, 'USDA_FDC:173701 Fish, sturgeon, mixed species, raw'
FROM food f
WHERE f.name = '鲟鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲟鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.915, 'USDA_FDC:173701 Fish, sturgeon, mixed species, raw'
FROM food f
WHERE f.name = '鲟鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲟鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 149, 'TFDA:J0414001 正鰹'
FROM food f
WHERE f.name = '鲣鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲣鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 23.1, 'TFDA:J0414001 正鰹'
FROM food f
WHERE f.name = '鲣鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲣鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0414001 正鰹'
FROM food f
WHERE f.name = '鲣鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲣鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 5.6, 'TFDA:J0414001 正鰹'
FROM food f
WHERE f.name = '鲣鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲣鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 50, 'TFDA:J0414001 正鰹'
FROM food f
WHERE f.name = '鲣鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲣鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 408, 'TFDA:J0414001 正鰹'
FROM food f
WHERE f.name = '鲣鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲣鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 461, 'TFDA:J0414001 正鰹'
FROM food f
WHERE f.name = '鲣鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲣鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 64, 'TFDA:J0414001 正鰹'
FROM food f
WHERE f.name = '鲣鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲣鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.7, 'TFDA:J0414001 正鰹'
FROM food f
WHERE f.name = '鲣鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲣鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 70.8, 'TFDA:J0414001 正鰹'
FROM food f
WHERE f.name = '鲣鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲣鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.46, 'TFDA:J0414001 正鰹'
FROM food f
WHERE f.name = '鲣鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲣鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 8, 'TFDA:J0414001 正鰹'
FROM food f
WHERE f.name = '鲣鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲣鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 130, 'USDA_FDC:173697 Fish, shark, mixed species, raw'
FROM food f
WHERE f.name = '鲨鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲨鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.98, 'USDA_FDC:173697 Fish, shark, mixed species, raw'
FROM food f
WHERE f.name = '鲨鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲨鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:173697 Fish, shark, mixed species, raw'
FROM food f
WHERE f.name = '鲨鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲨鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 4.51, 'USDA_FDC:173697 Fish, shark, mixed species, raw'
FROM food f
WHERE f.name = '鲨鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲨鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:173697 Fish, shark, mixed species, raw'
FROM food f
WHERE f.name = '鲨鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲨鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 79, 'USDA_FDC:173697 Fish, shark, mixed species, raw'
FROM food f
WHERE f.name = '鲨鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲨鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 160, 'USDA_FDC:173697 Fish, shark, mixed species, raw'
FROM food f
WHERE f.name = '鲨鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲨鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 210, 'USDA_FDC:173697 Fish, shark, mixed species, raw'
FROM food f
WHERE f.name = '鲨鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲨鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 51, 'USDA_FDC:173697 Fish, shark, mixed species, raw'
FROM food f
WHERE f.name = '鲨鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲨鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.925, 'USDA_FDC:173697 Fish, shark, mixed species, raw'
FROM food f
WHERE f.name = '鲨鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲨鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 145, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '鳙鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鳙鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 18.7, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '鳙鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鳙鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '鳙鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鳙鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 7.2, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '鳙鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鳙鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 24, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '鳙鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鳙鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 345, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '鳙鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鳙鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 139, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '鳙鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鳙鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 53, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '鳙鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鳙鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.8, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '鳙鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鳙鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 74.2, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '鳙鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鳙鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.4, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '鳙鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鳙鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 37, 'TFDA:J0401601 鱅'
FROM food f
WHERE f.name = '鳙鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鳙鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 343, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '鸡头米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡头米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 9.9, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '鸡头米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡头米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 75.4, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '鸡头米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡头米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '鸡头米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡头米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.1, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '鸡头米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡头米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '鸡头米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡头米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 80, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '鸡头米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡头米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 91, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '鸡头米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡头米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '鸡头米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡头米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 14.1, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '鸡头米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡头米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 68.32, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '鸡头米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡头米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 7, 'TFDA:C1800101 芡實'
FROM food f
WHERE f.name = '鸡头米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡头米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 32, 'USDA_FDC:168422 Mushrooms, Chanterelle, raw'
FROM food f
WHERE f.name = '鸡油菌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡油菌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.49, 'USDA_FDC:168422 Mushrooms, Chanterelle, raw'
FROM food f
WHERE f.name = '鸡油菌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡油菌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 6.86, 'USDA_FDC:168422 Mushrooms, Chanterelle, raw'
FROM food f
WHERE f.name = '鸡油菌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡油菌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.53, 'USDA_FDC:168422 Mushrooms, Chanterelle, raw'
FROM food f
WHERE f.name = '鸡油菌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡油菌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.8, 'USDA_FDC:168422 Mushrooms, Chanterelle, raw'
FROM food f
WHERE f.name = '鸡油菌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡油菌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 9, 'USDA_FDC:168422 Mushrooms, Chanterelle, raw'
FROM food f
WHERE f.name = '鸡油菌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡油菌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 506, 'USDA_FDC:168422 Mushrooms, Chanterelle, raw'
FROM food f
WHERE f.name = '鸡油菌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡油菌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 57, 'USDA_FDC:168422 Mushrooms, Chanterelle, raw'
FROM food f
WHERE f.name = '鸡油菌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡油菌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 267, 'TFDA:P0400301 鮮雞精'
FROM food f
WHERE f.name = '鸡精'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡精' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 10.8, 'TFDA:P0400301 鮮雞精'
FROM food f
WHERE f.name = '鸡精'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡精' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 33.3, 'TFDA:P0400301 鮮雞精'
FROM food f
WHERE f.name = '鸡精'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡精' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 10.1, 'TFDA:P0400301 鮮雞精'
FROM food f
WHERE f.name = '鸡精'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡精' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.9, 'TFDA:P0400301 鮮雞精'
FROM food f
WHERE f.name = '鸡精'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡精' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 17522, 'TFDA:P0400301 鮮雞精'
FROM food f
WHERE f.name = '鸡精'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡精' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 114, 'TFDA:P0400301 鮮雞精'
FROM food f
WHERE f.name = '鸡精'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡精' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 132, 'TFDA:P0400301 鮮雞精'
FROM food f
WHERE f.name = '鸡精'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡精' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 25, 'TFDA:P0400301 鮮雞精'
FROM food f
WHERE f.name = '鸡精'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡精' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 3.6, 'TFDA:P0400301 鮮雞精'
FROM food f
WHERE f.name = '鸡精'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡精' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 1.5, 'TFDA:P0400301 鮮雞精'
FROM food f
WHERE f.name = '鸡精'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡精' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.4, 'TFDA:P0400301 鮮雞精'
FROM food f
WHERE f.name = '鸡精'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡精' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 33, 'TFDA:P0400301 鮮雞精'
FROM food f
WHERE f.name = '鸡精'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡精' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 185, 'USDA_FDC:172190 Egg, goose, whole, fresh, raw'
FROM food f
WHERE f.name = '鹅蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 13.87, 'USDA_FDC:172190 Egg, goose, whole, fresh, raw'
FROM food f
WHERE f.name = '鹅蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 1.35, 'USDA_FDC:172190 Egg, goose, whole, fresh, raw'
FROM food f
WHERE f.name = '鹅蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 13.27, 'USDA_FDC:172190 Egg, goose, whole, fresh, raw'
FROM food f
WHERE f.name = '鹅蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:172190 Egg, goose, whole, fresh, raw'
FROM food f
WHERE f.name = '鹅蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 138, 'USDA_FDC:172190 Egg, goose, whole, fresh, raw'
FROM food f
WHERE f.name = '鹅蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 210, 'USDA_FDC:172190 Egg, goose, whole, fresh, raw'
FROM food f
WHERE f.name = '鹅蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 208, 'USDA_FDC:172190 Egg, goose, whole, fresh, raw'
FROM food f
WHERE f.name = '鹅蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 852, 'USDA_FDC:172190 Egg, goose, whole, fresh, raw'
FROM food f
WHERE f.name = '鹅蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 3.595, 'USDA_FDC:172190 Egg, goose, whole, fresh, raw'
FROM food f
WHERE f.name = '鹅蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 364, 'TFDA:H1600101 鷹嘴豆'
FROM food f
WHERE f.name = '鹰嘴豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹰嘴豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 19.4, 'TFDA:H1600101 鷹嘴豆'
FROM food f
WHERE f.name = '鹰嘴豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹰嘴豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 61, 'TFDA:H1600101 鷹嘴豆'
FROM food f
WHERE f.name = '鹰嘴豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹰嘴豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 5.8, 'TFDA:H1600101 鷹嘴豆'
FROM food f
WHERE f.name = '鹰嘴豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹰嘴豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 12.4, 'TFDA:H1600101 鷹嘴豆'
FROM food f
WHERE f.name = '鹰嘴豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹰嘴豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 8, 'TFDA:H1600101 鷹嘴豆'
FROM food f
WHERE f.name = '鹰嘴豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹰嘴豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1096, 'TFDA:H1600101 鷹嘴豆'
FROM food f
WHERE f.name = '鹰嘴豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹰嘴豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 346, 'TFDA:H1600101 鷹嘴豆'
FROM food f
WHERE f.name = '鹰嘴豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹰嘴豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.1, 'TFDA:H1600101 鷹嘴豆'
FROM food f
WHERE f.name = '鹰嘴豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹰嘴豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 11, 'TFDA:H1600101 鷹嘴豆'
FROM food f
WHERE f.name = '鹰嘴豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹰嘴豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 9.12, 'TFDA:H1600101 鷹嘴豆'
FROM food f
WHERE f.name = '鹰嘴豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹰嘴豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 95, 'TFDA:H1600101 鷹嘴豆'
FROM food f
WHERE f.name = '鹰嘴豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹰嘴豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 120, 'USDA_FDC:173855 Game meat, deer, raw'
FROM food f
WHERE f.name = '鹿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 22.96, 'USDA_FDC:173855 Game meat, deer, raw'
FROM food f
WHERE f.name = '鹿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:173855 Game meat, deer, raw'
FROM food f
WHERE f.name = '鹿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2.42, 'USDA_FDC:173855 Game meat, deer, raw'
FROM food f
WHERE f.name = '鹿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:173855 Game meat, deer, raw'
FROM food f
WHERE f.name = '鹿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 51, 'USDA_FDC:173855 Game meat, deer, raw'
FROM food f
WHERE f.name = '鹿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 318, 'USDA_FDC:173855 Game meat, deer, raw'
FROM food f
WHERE f.name = '鹿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 202, 'USDA_FDC:173855 Game meat, deer, raw'
FROM food f
WHERE f.name = '鹿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 85, 'USDA_FDC:173855 Game meat, deer, raw'
FROM food f
WHERE f.name = '鹿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.95, 'USDA_FDC:173855 Game meat, deer, raw'
FROM food f
WHERE f.name = '鹿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 325, 'TFDA:N0200101 麥芽糖'
FROM food f
WHERE f.name = '麦芽糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '麦芽糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 84.1, 'TFDA:N0200101 麥芽糖'
FROM food f
WHERE f.name = '麦芽糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '麦芽糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'TFDA:N0200101 麥芽糖'
FROM food f
WHERE f.name = '麦芽糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '麦芽糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 0, 'TFDA:N0200101 麥芽糖'
FROM food f
WHERE f.name = '麦芽糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '麦芽糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 0, 'TFDA:N0200101 麥芽糖'
FROM food f
WHERE f.name = '麦芽糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '麦芽糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 15.9, 'TFDA:N0200101 麥芽糖'
FROM food f
WHERE f.name = '麦芽糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '麦芽糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:N0200101 麥芽糖'
FROM food f
WHERE f.name = '麦芽糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '麦芽糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 0, 'TFDA:N0200101 麥芽糖'
FROM food f
WHERE f.name = '麦芽糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '麦芽糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 89, 'TFDA:J0410901 黃姑魚'
FROM food f
WHERE f.name = '黄姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 19.4, 'TFDA:J0410901 黃姑魚'
FROM food f
WHERE f.name = '黄姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0410901 黃姑魚'
FROM food f
WHERE f.name = '黄姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.7, 'TFDA:J0410901 黃姑魚'
FROM food f
WHERE f.name = '黄姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 71, 'TFDA:J0410901 黃姑魚'
FROM food f
WHERE f.name = '黄姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 375, 'TFDA:J0410901 黃姑魚'
FROM food f
WHERE f.name = '黄姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 228, 'TFDA:J0410901 黃姑魚'
FROM food f
WHERE f.name = '黄姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 66, 'TFDA:J0410901 黃姑魚'
FROM food f
WHERE f.name = '黄姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.2, 'TFDA:J0410901 黃姑魚'
FROM food f
WHERE f.name = '黄姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 79.8, 'TFDA:J0410901 黃姑魚'
FROM food f
WHERE f.name = '黄姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.5, 'TFDA:J0410901 黃姑魚'
FROM food f
WHERE f.name = '黄姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 55, 'TFDA:J0410901 黃姑魚'
FROM food f
WHERE f.name = '黄姑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄姑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 717, 'USDA_FDC:173430 Butter, without salt'
FROM food f
WHERE f.name = '黄油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.85, 'USDA_FDC:173430 Butter, without salt'
FROM food f
WHERE f.name = '黄油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.06, 'USDA_FDC:173430 Butter, without salt'
FROM food f
WHERE f.name = '黄油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 81.11, 'USDA_FDC:173430 Butter, without salt'
FROM food f
WHERE f.name = '黄油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:173430 Butter, without salt'
FROM food f
WHERE f.name = '黄油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 11, 'USDA_FDC:173430 Butter, without salt'
FROM food f
WHERE f.name = '黄油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 24, 'USDA_FDC:173430 Butter, without salt'
FROM food f
WHERE f.name = '黄油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 24, 'USDA_FDC:173430 Butter, without salt'
FROM food f
WHERE f.name = '黄油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 215, 'USDA_FDC:173430 Butter, without salt'
FROM food f
WHERE f.name = '黄油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 50.489, 'USDA_FDC:173430 Butter, without salt'
FROM food f
WHERE f.name = '黄油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 88, 'TFDA:J0403801 黃鱔'
FROM food f
WHERE f.name = '黄鳝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄鳝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 17.6, 'TFDA:J0403801 黃鱔'
FROM food f
WHERE f.name = '黄鳝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄鳝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 1, 'TFDA:J0403801 黃鱔'
FROM food f
WHERE f.name = '黄鳝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄鳝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.4, 'TFDA:J0403801 黃鱔'
FROM food f
WHERE f.name = '黄鳝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄鳝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 55, 'TFDA:J0403801 黃鱔'
FROM food f
WHERE f.name = '黄鳝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄鳝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 273, 'TFDA:J0403801 黃鱔'
FROM food f
WHERE f.name = '黄鳝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄鳝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 173, 'TFDA:J0403801 黃鱔'
FROM food f
WHERE f.name = '黄鳝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄鳝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 114, 'TFDA:J0403801 黃鱔'
FROM food f
WHERE f.name = '黄鳝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄鳝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.4, 'TFDA:J0403801 黃鱔'
FROM food f
WHERE f.name = '黄鳝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄鳝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 78.7, 'TFDA:J0403801 黃鱔'
FROM food f
WHERE f.name = '黄鳝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄鳝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.14, 'TFDA:J0403801 黃鱔'
FROM food f
WHERE f.name = '黄鳝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄鳝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 39, 'TFDA:J0403801 黃鱔'
FROM food f
WHERE f.name = '黄鳝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黄鳝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 63, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑加仑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑加仑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.4, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑加仑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑加仑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 15.38, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑加仑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑加仑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.41, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑加仑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑加仑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑加仑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑加仑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 322, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑加仑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑加仑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 59, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑加仑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑加仑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑加仑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑加仑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.034, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑加仑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑加仑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 253, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑大豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑大豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.6, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑大豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑大豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 40.3, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑大豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑大豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2.1, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑大豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑大豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 23.3, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑大豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑大豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑大豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑大豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1439, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑大豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑大豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 402, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑大豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑大豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.5, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑大豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑大豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 33.5, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑大豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑大豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 3.45, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑大豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑大豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 167, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑大豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑大豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 369, 'TFDA:N0100401 黑砂糖'
FROM food f
WHERE f.name = '黑糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.5, 'TFDA:N0100401 黑砂糖'
FROM food f
WHERE f.name = '黑糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 95.3, 'TFDA:N0100401 黑砂糖'
FROM food f
WHERE f.name = '黑糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.7, 'TFDA:N0100401 黑砂糖'
FROM food f
WHERE f.name = '黑糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.2, 'TFDA:N0100401 黑砂糖'
FROM food f
WHERE f.name = '黑糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 10, 'TFDA:N0100401 黑砂糖'
FROM food f
WHERE f.name = '黑糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 292, 'TFDA:N0100401 黑砂糖'
FROM food f
WHERE f.name = '黑糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 6, 'TFDA:N0100401 黑砂糖'
FROM food f
WHERE f.name = '黑糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.3, 'TFDA:N0100401 黑砂糖'
FROM food f
WHERE f.name = '黑糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 2.4, 'TFDA:N0100401 黑砂糖'
FROM food f
WHERE f.name = '黑糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.03, 'TFDA:N0100401 黑砂糖'
FROM food f
WHERE f.name = '黑糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 104, 'TFDA:N0100401 黑砂糖'
FROM food f
WHERE f.name = '黑糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 251, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '黑胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 10.39, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '黑胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 63.95, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '黑胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.26, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '黑胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 25.3, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '黑胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 20, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '黑胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1329, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '黑胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 158, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '黑胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '黑胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.392, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '黑胡椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑胡椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.52625, 'USDA_FDC:2727581 Blackberries, raw'
FROM food f
WHERE f.name = '黑莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 5.3, 'USDA_FDC:2727581 Blackberries, raw'
FROM food f
WHERE f.name = '黑莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1.548, 'USDA_FDC:2727581 Blackberries, raw'
FROM food f
WHERE f.name = '黑莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 167.4, 'USDA_FDC:2727581 Blackberries, raw'
FROM food f
WHERE f.name = '黑莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 20.16, 'USDA_FDC:2727581 Blackberries, raw'
FROM food f
WHERE f.name = '黑莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 253, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.6, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 40.3, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2.1, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 23.3, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1439, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 402, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.5, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 33.5, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 3.45, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 167, 'TFDA:H0605201 黃仁黑豆'
FROM food f
WHERE f.name = '黑豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 63, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑醋栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑醋栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.4, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑醋栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑醋栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 15.38, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑醋栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑醋栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.41, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑醋栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑醋栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑醋栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑醋栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 322, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑醋栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑醋栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 59, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑醋栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑醋栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑醋栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑醋栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.034, 'USDA_FDC:173963 Currants, european black, raw'
FROM food f
WHERE f.name = '黑醋栗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑醋栗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 165, 'TFDA:J0410201 黑棘鯛(含皮)'
FROM food f
WHERE f.name = '黑鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 19.5, 'TFDA:J0410201 黑棘鯛(含皮)'
FROM food f
WHERE f.name = '黑鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0410201 黑棘鯛(含皮)'
FROM food f
WHERE f.name = '黑鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 9, 'TFDA:J0410201 黑棘鯛(含皮)'
FROM food f
WHERE f.name = '黑鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 66, 'TFDA:J0410201 黑棘鯛(含皮)'
FROM food f
WHERE f.name = '黑鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 367, 'TFDA:J0410201 黑棘鯛(含皮)'
FROM food f
WHERE f.name = '黑鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 208, 'TFDA:J0410201 黑棘鯛(含皮)'
FROM food f
WHERE f.name = '黑鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 93, 'TFDA:J0410201 黑棘鯛(含皮)'
FROM food f
WHERE f.name = '黑鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.5, 'TFDA:J0410201 黑棘鯛(含皮)'
FROM food f
WHERE f.name = '黑鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 70.7, 'TFDA:J0410201 黑棘鯛(含皮)'
FROM food f
WHERE f.name = '黑鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.3, 'TFDA:J0410201 黑棘鯛(含皮)'
FROM food f
WHERE f.name = '黑鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 7, 'TFDA:J0410201 黑棘鯛(含皮)'
FROM food f
WHERE f.name = '黑鲷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鲷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 195, 'USDA_FDC:175134 Fish, sablefish, raw'
FROM food f
WHERE f.name = '黑鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 13.41, 'USDA_FDC:175134 Fish, sablefish, raw'
FROM food f
WHERE f.name = '黑鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:175134 Fish, sablefish, raw'
FROM food f
WHERE f.name = '黑鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 15.3, 'USDA_FDC:175134 Fish, sablefish, raw'
FROM food f
WHERE f.name = '黑鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:175134 Fish, sablefish, raw'
FROM food f
WHERE f.name = '黑鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 56, 'USDA_FDC:175134 Fish, sablefish, raw'
FROM food f
WHERE f.name = '黑鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 358, 'USDA_FDC:175134 Fish, sablefish, raw'
FROM food f
WHERE f.name = '黑鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 168, 'USDA_FDC:175134 Fish, sablefish, raw'
FROM food f
WHERE f.name = '黑鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 49, 'USDA_FDC:175134 Fish, sablefish, raw'
FROM food f
WHERE f.name = '黑鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 3.201, 'USDA_FDC:175134 Fish, sablefish, raw'
FROM food f
WHERE f.name = '黑鳕'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鳕' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 338, 'USDA_FDC:168884 Rye grain'
FROM food f
WHERE f.name = '黑麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 10.34, 'USDA_FDC:168884 Rye grain'
FROM food f
WHERE f.name = '黑麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 75.86, 'USDA_FDC:168884 Rye grain'
FROM food f
WHERE f.name = '黑麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.63, 'USDA_FDC:168884 Rye grain'
FROM food f
WHERE f.name = '黑麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 15.1, 'USDA_FDC:168884 Rye grain'
FROM food f
WHERE f.name = '黑麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'USDA_FDC:168884 Rye grain'
FROM food f
WHERE f.name = '黑麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 510, 'USDA_FDC:168884 Rye grain'
FROM food f
WHERE f.name = '黑麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 332, 'USDA_FDC:168884 Rye grain'
FROM food f
WHERE f.name = '黑麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:168884 Rye grain'
FROM food f
WHERE f.name = '黑麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.197, 'USDA_FDC:168884 Rye grain'
FROM food f
WHERE f.name = '黑麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );
