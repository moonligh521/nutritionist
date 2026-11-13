-- 开放数据补录。每条记录保留来源；未知值不生成记录。
-- 按有效食材名称唯一匹配，并跳过已有的同食材同营养素记录。

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 111, 'TFDA:J0400901 日本銀帶鯡(加工)'
FROM food f
WHERE f.name = '丁香鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 21.5, 'TFDA:J0400901 日本銀帶鯡(加工)'
FROM food f
WHERE f.name = '丁香鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 1.2, 'TFDA:J0400901 日本銀帶鯡(加工)'
FROM food f
WHERE f.name = '丁香鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2.1, 'TFDA:J0400901 日本銀帶鯡(加工)'
FROM food f
WHERE f.name = '丁香鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 736, 'TFDA:J0400901 日本銀帶鯡(加工)'
FROM food f
WHERE f.name = '丁香鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 195, 'TFDA:J0400901 日本銀帶鯡(加工)'
FROM food f
WHERE f.name = '丁香鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 529, 'TFDA:J0400901 日本銀帶鯡(加工)'
FROM food f
WHERE f.name = '丁香鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 215, 'TFDA:J0400901 日本銀帶鯡(加工)'
FROM food f
WHERE f.name = '丁香鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.1, 'TFDA:J0400901 日本銀帶鯡(加工)'
FROM food f
WHERE f.name = '丁香鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 70.4, 'TFDA:J0400901 日本銀帶鯡(加工)'
FROM food f
WHERE f.name = '丁香鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.33, 'TFDA:J0400901 日本銀帶鯡(加工)'
FROM food f
WHERE f.name = '丁香鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 714, 'TFDA:J0400901 日本銀帶鯡(加工)'
FROM food f
WHERE f.name = '丁香鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '丁香鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 84, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '中国对虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '中国对虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 19.3, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '中国对虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '中国对虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 1, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '中国对虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '中国对虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '中国对虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '中国对虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 196, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '中国对虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '中国对虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 306, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '中国对虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '中国对虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 278, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '中国对虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '中国对虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 156, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '中国对虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '中国对虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '中国对虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '中国对虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 77.9, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '中国对虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '中国对虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.62, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '中国对虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '中国对虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 20, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '中国对虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '中国对虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 336, 'USDA_FDC:168906 Noodles, japanese, soba, dry'
FROM food f
WHERE f.name = '乌冬面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌冬面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 14.38, 'USDA_FDC:168906 Noodles, japanese, soba, dry'
FROM food f
WHERE f.name = '乌冬面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌冬面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 74.62, 'USDA_FDC:168906 Noodles, japanese, soba, dry'
FROM food f
WHERE f.name = '乌冬面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌冬面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.71, 'USDA_FDC:168906 Noodles, japanese, soba, dry'
FROM food f
WHERE f.name = '乌冬面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌冬面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 792, 'USDA_FDC:168906 Noodles, japanese, soba, dry'
FROM food f
WHERE f.name = '乌冬面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌冬面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 252, 'USDA_FDC:168906 Noodles, japanese, soba, dry'
FROM food f
WHERE f.name = '乌冬面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌冬面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 254, 'USDA_FDC:168906 Noodles, japanese, soba, dry'
FROM food f
WHERE f.name = '乌冬面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌冬面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:168906 Noodles, japanese, soba, dry'
FROM food f
WHERE f.name = '乌冬面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌冬面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.136, 'USDA_FDC:168906 Noodles, japanese, soba, dry'
FROM food f
WHERE f.name = '乌冬面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌冬面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 160, 'TFDA:K0100301 烏骨雞蛋'
FROM food f
WHERE f.name = '乌骨鸡蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌骨鸡蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 12.7, 'TFDA:K0100301 烏骨雞蛋'
FROM food f
WHERE f.name = '乌骨鸡蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌骨鸡蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 2.4, 'TFDA:K0100301 烏骨雞蛋'
FROM food f
WHERE f.name = '乌骨鸡蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌骨鸡蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 11.6, 'TFDA:K0100301 烏骨雞蛋'
FROM food f
WHERE f.name = '乌骨鸡蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌骨鸡蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 120, 'TFDA:K0100301 烏骨雞蛋'
FROM food f
WHERE f.name = '乌骨鸡蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌骨鸡蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 135, 'TFDA:K0100301 烏骨雞蛋'
FROM food f
WHERE f.name = '乌骨鸡蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌骨鸡蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 216, 'TFDA:K0100301 烏骨雞蛋'
FROM food f
WHERE f.name = '乌骨鸡蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌骨鸡蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 540, 'TFDA:K0100301 烏骨雞蛋'
FROM food f
WHERE f.name = '乌骨鸡蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌骨鸡蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 3.9, 'TFDA:K0100301 烏骨雞蛋'
FROM food f
WHERE f.name = '乌骨鸡蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌骨鸡蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 72.3, 'TFDA:K0100301 烏骨雞蛋'
FROM food f
WHERE f.name = '乌骨鸡蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌骨鸡蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 2.97, 'TFDA:K0100301 烏骨雞蛋'
FROM food f
WHERE f.name = '乌骨鸡蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌骨鸡蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 54, 'TFDA:K0100301 烏骨雞蛋'
FROM food f
WHERE f.name = '乌骨鸡蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌骨鸡蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 212, 'TFDA:I0400301 烏骨雞'
FROM food f
WHERE f.name = '乌鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 17.9, 'TFDA:I0400301 烏骨雞'
FROM food f
WHERE f.name = '乌鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.9, 'TFDA:I0400301 烏骨雞'
FROM food f
WHERE f.name = '乌鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 15.1, 'TFDA:I0400301 烏骨雞'
FROM food f
WHERE f.name = '乌鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 42, 'TFDA:I0400301 烏骨雞'
FROM food f
WHERE f.name = '乌鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 180, 'TFDA:I0400301 烏骨雞'
FROM food f
WHERE f.name = '乌鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 159, 'TFDA:I0400301 烏骨雞'
FROM food f
WHERE f.name = '乌鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 84, 'TFDA:I0400301 烏骨雞'
FROM food f
WHERE f.name = '乌鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 4.2, 'TFDA:I0400301 烏骨雞'
FROM food f
WHERE f.name = '乌鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 65.4, 'TFDA:I0400301 烏骨雞'
FROM food f
WHERE f.name = '乌鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.33, 'TFDA:I0400301 烏骨雞'
FROM food f
WHERE f.name = '乌鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 7, 'TFDA:I0400301 烏骨雞'
FROM food f
WHERE f.name = '乌鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '乌鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 27, 'TFDA:E2700101 九層塔'
FROM food f
WHERE f.name = '九层塔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '九层塔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.9, 'TFDA:E2700101 九層塔'
FROM food f
WHERE f.name = '九层塔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '九层塔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 4.4, 'TFDA:E2700101 九層塔'
FROM food f
WHERE f.name = '九层塔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '九层塔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.3, 'TFDA:E2700101 九層塔'
FROM food f
WHERE f.name = '九层塔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '九层塔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.4, 'TFDA:E2700101 九層塔'
FROM food f
WHERE f.name = '九层塔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '九层塔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'TFDA:E2700101 九層塔'
FROM food f
WHERE f.name = '九层塔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '九层塔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 347, 'TFDA:E2700101 九層塔'
FROM food f
WHERE f.name = '九层塔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '九层塔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 53, 'TFDA:E2700101 九層塔'
FROM food f
WHERE f.name = '九层塔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '九层塔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:E2700101 九層塔'
FROM food f
WHERE f.name = '九层塔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '九层塔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 91, 'TFDA:E2700101 九層塔'
FROM food f
WHERE f.name = '九层塔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '九层塔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.09, 'TFDA:E2700101 九層塔'
FROM food f
WHERE f.name = '九层塔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '九层塔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 191, 'TFDA:E2700101 九層塔'
FROM food f
WHERE f.name = '九层塔'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '九层塔' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 83, 'TFDA:D4000101 人心果'
FROM food f
WHERE f.name = '人参果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '人参果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.6, 'TFDA:D4000101 人心果'
FROM food f
WHERE f.name = '人参果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '人参果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 20.5, 'TFDA:D4000101 人心果'
FROM food f
WHERE f.name = '人参果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '人参果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.8, 'TFDA:D4000101 人心果'
FROM food f
WHERE f.name = '人参果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '人参果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 9, 'TFDA:D4000101 人心果'
FROM food f
WHERE f.name = '人参果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '人参果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 10, 'TFDA:D4000101 人心果'
FROM food f
WHERE f.name = '人参果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '人参果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 250, 'TFDA:D4000101 人心果'
FROM food f
WHERE f.name = '人参果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '人参果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 10, 'TFDA:D4000101 人心果'
FROM food f
WHERE f.name = '人参果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '人参果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 77.5, 'TFDA:D4000101 人心果'
FROM food f
WHERE f.name = '人参果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '人参果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 18, 'TFDA:D4000101 人心果'
FROM food f
WHERE f.name = '人参果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '人参果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 252, 'USDA_FDC:172688 Bread, whole-wheat, commercially prepared'
FROM food f
WHERE f.name = '全麦面包'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '全麦面包' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 12.45, 'USDA_FDC:172688 Bread, whole-wheat, commercially prepared'
FROM food f
WHERE f.name = '全麦面包'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '全麦面包' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 42.71, 'USDA_FDC:172688 Bread, whole-wheat, commercially prepared'
FROM food f
WHERE f.name = '全麦面包'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '全麦面包' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.5, 'USDA_FDC:172688 Bread, whole-wheat, commercially prepared'
FROM food f
WHERE f.name = '全麦面包'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '全麦面包' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 6, 'USDA_FDC:172688 Bread, whole-wheat, commercially prepared'
FROM food f
WHERE f.name = '全麦面包'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '全麦面包' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 455, 'USDA_FDC:172688 Bread, whole-wheat, commercially prepared'
FROM food f
WHERE f.name = '全麦面包'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '全麦面包' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 254, 'USDA_FDC:172688 Bread, whole-wheat, commercially prepared'
FROM food f
WHERE f.name = '全麦面包'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '全麦面包' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 212, 'USDA_FDC:172688 Bread, whole-wheat, commercially prepared'
FROM food f
WHERE f.name = '全麦面包'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '全麦面包' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:172688 Bread, whole-wheat, commercially prepared'
FROM food f
WHERE f.name = '全麦面包'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '全麦面包' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.722, 'USDA_FDC:172688 Bread, whole-wheat, commercially prepared'
FROM food f
WHERE f.name = '全麦面包'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '全麦面包' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 61, 'USDA_FDC:172449 Tofu, soft, prepared with calcium sulfate and magnesium chloride (nigari)'
FROM food f
WHERE f.name = '内酯豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '内酯豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 7.17, 'USDA_FDC:172449 Tofu, soft, prepared with calcium sulfate and magnesium chloride (nigari)'
FROM food f
WHERE f.name = '内酯豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '内酯豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 1.18, 'USDA_FDC:172449 Tofu, soft, prepared with calcium sulfate and magnesium chloride (nigari)'
FROM food f
WHERE f.name = '内酯豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '内酯豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.69, 'USDA_FDC:172449 Tofu, soft, prepared with calcium sulfate and magnesium chloride (nigari)'
FROM food f
WHERE f.name = '内酯豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '内酯豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.2, 'USDA_FDC:172449 Tofu, soft, prepared with calcium sulfate and magnesium chloride (nigari)'
FROM food f
WHERE f.name = '内酯豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '内酯豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 8, 'USDA_FDC:172449 Tofu, soft, prepared with calcium sulfate and magnesium chloride (nigari)'
FROM food f
WHERE f.name = '内酯豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '内酯豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 120, 'USDA_FDC:172449 Tofu, soft, prepared with calcium sulfate and magnesium chloride (nigari)'
FROM food f
WHERE f.name = '内酯豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '内酯豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 92, 'USDA_FDC:172449 Tofu, soft, prepared with calcium sulfate and magnesium chloride (nigari)'
FROM food f
WHERE f.name = '内酯豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '内酯豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:172449 Tofu, soft, prepared with calcium sulfate and magnesium chloride (nigari)'
FROM food f
WHERE f.name = '内酯豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '内酯豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.533, 'USDA_FDC:172449 Tofu, soft, prepared with calcium sulfate and magnesium chloride (nigari)'
FROM food f
WHERE f.name = '内酯豆腐'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '内酯豆腐' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 267, 'TFDA:R2000801 刀削麵'
FROM food f
WHERE f.name = '刀削面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀削面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 8.4, 'TFDA:R2000801 刀削麵'
FROM food f
WHERE f.name = '刀削面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀削面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 56.2, 'TFDA:R2000801 刀削麵'
FROM food f
WHERE f.name = '刀削面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀削面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.9, 'TFDA:R2000801 刀削麵'
FROM food f
WHERE f.name = '刀削面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀削面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1, 'TFDA:R2000801 刀削麵'
FROM food f
WHERE f.name = '刀削面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀削面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 226, 'TFDA:R2000801 刀削麵'
FROM food f
WHERE f.name = '刀削面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀削面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 73, 'TFDA:R2000801 刀削麵'
FROM food f
WHERE f.name = '刀削面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀削面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 231, 'TFDA:R2000801 刀削麵'
FROM food f
WHERE f.name = '刀削面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀削面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.4, 'TFDA:R2000801 刀削麵'
FROM food f
WHERE f.name = '刀削面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀削面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 33.5, 'TFDA:R2000801 刀削麵'
FROM food f
WHERE f.name = '刀削面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀削面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.57, 'TFDA:R2000801 刀削麵'
FROM food f
WHERE f.name = '刀削面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀削面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 2, 'TFDA:R2000801 刀削麵'
FROM food f
WHERE f.name = '刀削面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀削面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 31, 'USDA_FDC:169961 Beans, snap, green, raw'
FROM food f
WHERE f.name = '刀豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.83, 'USDA_FDC:169961 Beans, snap, green, raw'
FROM food f
WHERE f.name = '刀豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 6.97, 'USDA_FDC:169961 Beans, snap, green, raw'
FROM food f
WHERE f.name = '刀豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.22, 'USDA_FDC:169961 Beans, snap, green, raw'
FROM food f
WHERE f.name = '刀豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.7, 'USDA_FDC:169961 Beans, snap, green, raw'
FROM food f
WHERE f.name = '刀豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 6, 'USDA_FDC:169961 Beans, snap, green, raw'
FROM food f
WHERE f.name = '刀豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 211, 'USDA_FDC:169961 Beans, snap, green, raw'
FROM food f
WHERE f.name = '刀豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 38, 'USDA_FDC:169961 Beans, snap, green, raw'
FROM food f
WHERE f.name = '刀豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169961 Beans, snap, green, raw'
FROM food f
WHERE f.name = '刀豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.05, 'USDA_FDC:169961 Beans, snap, green, raw'
FROM food f
WHERE f.name = '刀豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刀豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 36, 'TFDA:J4100201 仿刺參'
FROM food f
WHERE f.name = '刺参'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刺参' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 8.2, 'TFDA:J4100201 仿刺參'
FROM food f
WHERE f.name = '刺参'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刺参' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.8, 'TFDA:J4100201 仿刺參'
FROM food f
WHERE f.name = '刺参'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刺参' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:J4100201 仿刺參'
FROM food f
WHERE f.name = '刺参'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刺参' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 53, 'TFDA:J4100201 仿刺參'
FROM food f
WHERE f.name = '刺参'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刺参' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 0, 'TFDA:J4100201 仿刺參'
FROM food f
WHERE f.name = '刺参'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刺参' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 14, 'TFDA:J4100201 仿刺參'
FROM food f
WHERE f.name = '刺参'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刺参' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'TFDA:J4100201 仿刺參'
FROM food f
WHERE f.name = '刺参'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刺参' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 90.4, 'TFDA:J4100201 仿刺參'
FROM food f
WHERE f.name = '刺参'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刺参' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.09, 'TFDA:J4100201 仿刺參'
FROM food f
WHERE f.name = '刺参'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刺参' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 69, 'TFDA:J4100201 仿刺參'
FROM food f
WHERE f.name = '刺参'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '刺参' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 200, 'TFDA:I0300101 豬下肩肉'
FROM food f
WHERE f.name = '前腿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '前腿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 18.1, 'TFDA:I0300101 豬下肩肉'
FROM food f
WHERE f.name = '前腿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '前腿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:I0300101 豬下肩肉'
FROM food f
WHERE f.name = '前腿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '前腿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 13.6, 'TFDA:I0300101 豬下肩肉'
FROM food f
WHERE f.name = '前腿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '前腿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 54, 'TFDA:I0300101 豬下肩肉'
FROM food f
WHERE f.name = '前腿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '前腿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 338, 'TFDA:I0300101 豬下肩肉'
FROM food f
WHERE f.name = '前腿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '前腿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 198, 'TFDA:I0300101 豬下肩肉'
FROM food f
WHERE f.name = '前腿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '前腿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 69, 'TFDA:I0300101 豬下肩肉'
FROM food f
WHERE f.name = '前腿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '前腿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 5, 'TFDA:I0300101 豬下肩肉'
FROM food f
WHERE f.name = '前腿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '前腿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 67.8, 'TFDA:I0300101 豬下肩肉'
FROM food f
WHERE f.name = '前腿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '前腿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.32, 'TFDA:I0300101 豬下肩肉'
FROM food f
WHERE f.name = '前腿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '前腿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 3, 'TFDA:I0300101 豬下肩肉'
FROM food f
WHERE f.name = '前腿肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '前腿肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 122, 'TFDA:J2100201 北方長額蝦(加工)'
FROM food f
WHERE f.name = '北极虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '北极虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 19.9, 'TFDA:J2100201 北方長額蝦(加工)'
FROM food f
WHERE f.name = '北极虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '北极虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 2.7, 'TFDA:J2100201 北方長額蝦(加工)'
FROM food f
WHERE f.name = '北极虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '北极虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 4.1, 'TFDA:J2100201 北方長額蝦(加工)'
FROM food f
WHERE f.name = '北极虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '北极虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 562, 'TFDA:J2100201 北方長額蝦(加工)'
FROM food f
WHERE f.name = '北极虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '北极虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 169, 'TFDA:J2100201 北方長額蝦(加工)'
FROM food f
WHERE f.name = '北极虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '北极虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 226, 'TFDA:J2100201 北方長額蝦(加工)'
FROM food f
WHERE f.name = '北极虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '北极虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 183, 'TFDA:J2100201 北方長額蝦(加工)'
FROM food f
WHERE f.name = '北极虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '北极虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.9, 'TFDA:J2100201 北方長額蝦(加工)'
FROM food f
WHERE f.name = '北极虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '北极虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 70.9, 'TFDA:J2100201 北方長額蝦(加工)'
FROM food f
WHERE f.name = '北极虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '北极虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 8.09, 'TFDA:J2100201 北方長額蝦(加工)'
FROM food f
WHERE f.name = '北极虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '北极虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 72, 'TFDA:J2100201 北方長額蝦(加工)'
FROM food f
WHERE f.name = '北极虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '北极虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 266, 'USDA_FDC:174924 Bread, white, commercially prepared (includes soft bread crumbs)'
FROM food f
WHERE f.name = '吐司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '吐司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 8.85, 'USDA_FDC:174924 Bread, white, commercially prepared (includes soft bread crumbs)'
FROM food f
WHERE f.name = '吐司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '吐司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 49.42, 'USDA_FDC:174924 Bread, white, commercially prepared (includes soft bread crumbs)'
FROM food f
WHERE f.name = '吐司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '吐司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.33, 'USDA_FDC:174924 Bread, white, commercially prepared (includes soft bread crumbs)'
FROM food f
WHERE f.name = '吐司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '吐司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.7, 'USDA_FDC:174924 Bread, white, commercially prepared (includes soft bread crumbs)'
FROM food f
WHERE f.name = '吐司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '吐司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 490, 'USDA_FDC:174924 Bread, white, commercially prepared (includes soft bread crumbs)'
FROM food f
WHERE f.name = '吐司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '吐司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 126, 'USDA_FDC:174924 Bread, white, commercially prepared (includes soft bread crumbs)'
FROM food f
WHERE f.name = '吐司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '吐司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 98, 'USDA_FDC:174924 Bread, white, commercially prepared (includes soft bread crumbs)'
FROM food f
WHERE f.name = '吐司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '吐司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:174924 Bread, white, commercially prepared (includes soft bread crumbs)'
FROM food f
WHERE f.name = '吐司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '吐司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.698, 'USDA_FDC:174924 Bread, white, commercially prepared (includes soft bread crumbs)'
FROM food f
WHERE f.name = '吐司'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '吐司' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 196, 'TFDA:I0400101 土雞'
FROM food f
WHERE f.name = '土鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '土鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 19, 'TFDA:I0400101 土雞'
FROM food f
WHERE f.name = '土鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '土鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:I0400101 土雞'
FROM food f
WHERE f.name = '土鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '土鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 12.7, 'TFDA:I0400101 土雞'
FROM food f
WHERE f.name = '土鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '土鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 70, 'TFDA:I0400101 土雞'
FROM food f
WHERE f.name = '土鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '土鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 116, 'TFDA:I0400101 土雞'
FROM food f
WHERE f.name = '土鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '土鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 193, 'TFDA:I0400101 土雞'
FROM food f
WHERE f.name = '土鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '土鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 106, 'TFDA:I0400101 土雞'
FROM food f
WHERE f.name = '土鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '土鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 3.2, 'TFDA:I0400101 土雞'
FROM food f
WHERE f.name = '土鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '土鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 69.4, 'TFDA:I0400101 土雞'
FROM food f
WHERE f.name = '土鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '土鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.36, 'TFDA:I0400101 土雞'
FROM food f
WHERE f.name = '土鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '土鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 10, 'TFDA:I0400101 土雞'
FROM food f
WHERE f.name = '土鸡'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '土鸡' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 18, 'USDA_FDC:170457 Tomatoes, red, ripe, raw, year round average'
FROM food f
WHERE f.name = '圣女果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '圣女果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.88, 'USDA_FDC:170457 Tomatoes, red, ripe, raw, year round average'
FROM food f
WHERE f.name = '圣女果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '圣女果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 3.89, 'USDA_FDC:170457 Tomatoes, red, ripe, raw, year round average'
FROM food f
WHERE f.name = '圣女果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '圣女果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'USDA_FDC:170457 Tomatoes, red, ripe, raw, year round average'
FROM food f
WHERE f.name = '圣女果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '圣女果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.2, 'USDA_FDC:170457 Tomatoes, red, ripe, raw, year round average'
FROM food f
WHERE f.name = '圣女果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '圣女果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 5, 'USDA_FDC:170457 Tomatoes, red, ripe, raw, year round average'
FROM food f
WHERE f.name = '圣女果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '圣女果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 237, 'USDA_FDC:170457 Tomatoes, red, ripe, raw, year round average'
FROM food f
WHERE f.name = '圣女果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '圣女果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 24, 'USDA_FDC:170457 Tomatoes, red, ripe, raw, year round average'
FROM food f
WHERE f.name = '圣女果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '圣女果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170457 Tomatoes, red, ripe, raw, year round average'
FROM food f
WHERE f.name = '圣女果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '圣女果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.028, 'USDA_FDC:170457 Tomatoes, red, ripe, raw, year round average'
FROM food f
WHERE f.name = '圣女果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '圣女果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 71, 'USDA_FDC:174210 Crustaceans, shrimp, mixed species, raw (may contain additives to retain moisture)'
FROM food f
WHERE f.name = '基围虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '基围虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 13.61, 'USDA_FDC:174210 Crustaceans, shrimp, mixed species, raw (may contain additives to retain moisture)'
FROM food f
WHERE f.name = '基围虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '基围虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.91, 'USDA_FDC:174210 Crustaceans, shrimp, mixed species, raw (may contain additives to retain moisture)'
FROM food f
WHERE f.name = '基围虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '基围虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.01, 'USDA_FDC:174210 Crustaceans, shrimp, mixed species, raw (may contain additives to retain moisture)'
FROM food f
WHERE f.name = '基围虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '基围虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:174210 Crustaceans, shrimp, mixed species, raw (may contain additives to retain moisture)'
FROM food f
WHERE f.name = '基围虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '基围虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 566, 'USDA_FDC:174210 Crustaceans, shrimp, mixed species, raw (may contain additives to retain moisture)'
FROM food f
WHERE f.name = '基围虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '基围虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 113, 'USDA_FDC:174210 Crustaceans, shrimp, mixed species, raw (may contain additives to retain moisture)'
FROM food f
WHERE f.name = '基围虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '基围虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 244, 'USDA_FDC:174210 Crustaceans, shrimp, mixed species, raw (may contain additives to retain moisture)'
FROM food f
WHERE f.name = '基围虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '基围虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 126, 'USDA_FDC:174210 Crustaceans, shrimp, mixed species, raw (may contain additives to retain moisture)'
FROM food f
WHERE f.name = '基围虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '基围虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.261, 'USDA_FDC:174210 Crustaceans, shrimp, mixed species, raw (may contain additives to retain moisture)'
FROM food f
WHERE f.name = '基围虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '基围虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 14, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塌棵菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塌棵菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.9, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塌棵菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塌棵菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 2.3, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塌棵菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塌棵菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塌棵菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塌棵菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.7, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塌棵菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塌棵菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 59, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塌棵菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塌棵菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 382, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塌棵菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塌棵菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 39, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塌棵菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塌棵菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塌棵菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塌棵菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 94.7, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塌棵菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塌棵菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.08, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塌棵菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塌棵菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 103, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塌棵菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塌棵菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 14, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塔菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塔菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.9, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塔菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塔菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 2.3, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塔菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塔菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塔菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塔菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.7, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塔菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塔菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 59, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塔菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塔菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 382, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塔菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塔菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 39, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塔菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塔菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塔菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塔菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 94.7, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塔菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塔菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.08, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塔菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塔菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 103, 'TFDA:E3201501 塔菇菜(有機)'
FROM food f
WHERE f.name = '塔菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '塔菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 20, 'TFDA:E0900101 球莖甘藍'
FROM food f
WHERE f.name = '大头菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大头菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.6, 'TFDA:E0900101 球莖甘藍'
FROM food f
WHERE f.name = '大头菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大头菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 3.6, 'TFDA:E0900101 球莖甘藍'
FROM food f
WHERE f.name = '大头菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大头菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'TFDA:E0900101 球莖甘藍'
FROM food f
WHERE f.name = '大头菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大头菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.9, 'TFDA:E0900101 球莖甘藍'
FROM food f
WHERE f.name = '大头菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大头菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 18, 'TFDA:E0900101 球莖甘藍'
FROM food f
WHERE f.name = '大头菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大头菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 260, 'TFDA:E0900101 球莖甘藍'
FROM food f
WHERE f.name = '大头菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大头菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 38, 'TFDA:E0900101 球莖甘藍'
FROM food f
WHERE f.name = '大头菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大头菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:E0900101 球莖甘藍'
FROM food f
WHERE f.name = '大头菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大头菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 94, 'TFDA:E0900101 球莖甘藍'
FROM food f
WHERE f.name = '大头菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大头菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.05, 'TFDA:E0900101 球莖甘藍'
FROM food f
WHERE f.name = '大头菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大头菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 23, 'TFDA:E0900101 球莖甘藍'
FROM food f
WHERE f.name = '大头菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大头菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 84, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '大虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 19.3, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '大虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 1, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '大虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '大虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 196, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '大虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 306, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '大虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 278, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '大虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 156, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '大虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '大虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 77.9, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '大虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.62, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '大虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 20, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '大虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 87, 'USDA_FDC:174204 Crustaceans, crab, blue, raw'
FROM food f
WHERE f.name = '大闸蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大闸蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 18.06, 'USDA_FDC:174204 Crustaceans, crab, blue, raw'
FROM food f
WHERE f.name = '大闸蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大闸蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.04, 'USDA_FDC:174204 Crustaceans, crab, blue, raw'
FROM food f
WHERE f.name = '大闸蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大闸蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.08, 'USDA_FDC:174204 Crustaceans, crab, blue, raw'
FROM food f
WHERE f.name = '大闸蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大闸蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:174204 Crustaceans, crab, blue, raw'
FROM food f
WHERE f.name = '大闸蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大闸蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 293, 'USDA_FDC:174204 Crustaceans, crab, blue, raw'
FROM food f
WHERE f.name = '大闸蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大闸蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 329, 'USDA_FDC:174204 Crustaceans, crab, blue, raw'
FROM food f
WHERE f.name = '大闸蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大闸蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 229, 'USDA_FDC:174204 Crustaceans, crab, blue, raw'
FROM food f
WHERE f.name = '大闸蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大闸蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 78, 'USDA_FDC:174204 Crustaceans, crab, blue, raw'
FROM food f
WHERE f.name = '大闸蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大闸蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.222, 'USDA_FDC:174204 Crustaceans, crab, blue, raw'
FROM food f
WHERE f.name = '大闸蟹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '大闸蟹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 349, 'TFDA:R4600301 寬粉'
FROM food f
WHERE f.name = '宽粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '宽粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.1, 'TFDA:R4600301 寬粉'
FROM food f
WHERE f.name = '宽粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '宽粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 86.9, 'TFDA:R4600301 寬粉'
FROM food f
WHERE f.name = '宽粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '宽粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:R4600301 寬粉'
FROM food f
WHERE f.name = '宽粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '宽粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1, 'TFDA:R4600301 寬粉'
FROM food f
WHERE f.name = '宽粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '宽粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 4, 'TFDA:R4600301 寬粉'
FROM food f
WHERE f.name = '宽粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '宽粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 45, 'TFDA:R4600301 寬粉'
FROM food f
WHERE f.name = '宽粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '宽粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 72, 'TFDA:R4600301 寬粉'
FROM food f
WHERE f.name = '宽粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '宽粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:R4600301 寬粉'
FROM food f
WHERE f.name = '宽粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '宽粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 12.3, 'TFDA:R4600301 寬粉'
FROM food f
WHERE f.name = '宽粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '宽粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:R4600301 寬粉'
FROM food f
WHERE f.name = '宽粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '宽粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 26, 'TFDA:R4600301 寬粉'
FROM food f
WHERE f.name = '宽粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '宽粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 79, 'TFDA:J2100601 相模後海螯蝦'
FROM food f
WHERE f.name = '小龙虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小龙虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 17.9, 'TFDA:J2100601 相模後海螯蝦'
FROM food f
WHERE f.name = '小龙虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小龙虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J2100601 相模後海螯蝦'
FROM food f
WHERE f.name = '小龙虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小龙虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.3, 'TFDA:J2100601 相模後海螯蝦'
FROM food f
WHERE f.name = '小龙虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小龙虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 317, 'TFDA:J2100601 相模後海螯蝦'
FROM food f
WHERE f.name = '小龙虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小龙虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 308, 'TFDA:J2100601 相模後海螯蝦'
FROM food f
WHERE f.name = '小龙虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小龙虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 229, 'TFDA:J2100601 相模後海螯蝦'
FROM food f
WHERE f.name = '小龙虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小龙虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 127, 'TFDA:J2100601 相模後海螯蝦'
FROM food f
WHERE f.name = '小龙虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小龙虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:J2100601 相模後海螯蝦'
FROM food f
WHERE f.name = '小龙虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小龙虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 81.6, 'TFDA:J2100601 相模後海螯蝦'
FROM food f
WHERE f.name = '小龙虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小龙虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.12, 'TFDA:J2100601 相模後海螯蝦'
FROM food f
WHERE f.name = '小龙虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小龙虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 81, 'TFDA:J2100601 相模後海螯蝦'
FROM food f
WHERE f.name = '小龙虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '小龙虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 310, 'TFDA:G0210101 乾銀耳'
FROM food f
WHERE f.name = '干银耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干银耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 9.3, 'TFDA:G0210101 乾銀耳'
FROM food f
WHERE f.name = '干银耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干银耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 70.8, 'TFDA:G0210101 乾銀耳'
FROM food f
WHERE f.name = '干银耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干银耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.2, 'TFDA:G0210101 乾銀耳'
FROM food f
WHERE f.name = '干银耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干银耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 64.5, 'TFDA:G0210101 乾銀耳'
FROM food f
WHERE f.name = '干银耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干银耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 27, 'TFDA:G0210101 乾銀耳'
FROM food f
WHERE f.name = '干银耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干银耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 2916, 'TFDA:G0210101 乾銀耳'
FROM food f
WHERE f.name = '干银耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干银耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 337, 'TFDA:G0210101 乾銀耳'
FROM food f
WHERE f.name = '干银耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干银耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.3, 'TFDA:G0210101 乾銀耳'
FROM food f
WHERE f.name = '干银耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干银耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 13.5, 'TFDA:G0210101 乾銀耳'
FROM food f
WHERE f.name = '干银耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干银耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:G0210101 乾銀耳'
FROM food f
WHERE f.name = '干银耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干银耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 45, 'TFDA:G0210101 乾銀耳'
FROM food f
WHERE f.name = '干银耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '干银耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 26, 'USDA_FDC:170108 Peppers, sweet, red, raw'
FROM food f
WHERE f.name = '彩椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '彩椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.99, 'USDA_FDC:170108 Peppers, sweet, red, raw'
FROM food f
WHERE f.name = '彩椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '彩椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 6.03, 'USDA_FDC:170108 Peppers, sweet, red, raw'
FROM food f
WHERE f.name = '彩椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '彩椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.3, 'USDA_FDC:170108 Peppers, sweet, red, raw'
FROM food f
WHERE f.name = '彩椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '彩椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.1, 'USDA_FDC:170108 Peppers, sweet, red, raw'
FROM food f
WHERE f.name = '彩椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '彩椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 4, 'USDA_FDC:170108 Peppers, sweet, red, raw'
FROM food f
WHERE f.name = '彩椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '彩椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 211, 'USDA_FDC:170108 Peppers, sweet, red, raw'
FROM food f
WHERE f.name = '彩椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '彩椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 26, 'USDA_FDC:170108 Peppers, sweet, red, raw'
FROM food f
WHERE f.name = '彩椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '彩椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170108 Peppers, sweet, red, raw'
FROM food f
WHERE f.name = '彩椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '彩椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.059, 'USDA_FDC:170108 Peppers, sweet, red, raw'
FROM food f
WHERE f.name = '彩椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '彩椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 46, 'USDA_FDC:169234 Hyacinth-beans, immature seeds, raw'
FROM food f
WHERE f.name = '扁豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '扁豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.1, 'USDA_FDC:169234 Hyacinth-beans, immature seeds, raw'
FROM food f
WHERE f.name = '扁豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '扁豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 9.19, 'USDA_FDC:169234 Hyacinth-beans, immature seeds, raw'
FROM food f
WHERE f.name = '扁豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '扁豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'USDA_FDC:169234 Hyacinth-beans, immature seeds, raw'
FROM food f
WHERE f.name = '扁豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '扁豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.3, 'USDA_FDC:169234 Hyacinth-beans, immature seeds, raw'
FROM food f
WHERE f.name = '扁豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '扁豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'USDA_FDC:169234 Hyacinth-beans, immature seeds, raw'
FROM food f
WHERE f.name = '扁豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '扁豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 252, 'USDA_FDC:169234 Hyacinth-beans, immature seeds, raw'
FROM food f
WHERE f.name = '扁豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '扁豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 49, 'USDA_FDC:169234 Hyacinth-beans, immature seeds, raw'
FROM food f
WHERE f.name = '扁豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '扁豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169234 Hyacinth-beans, immature seeds, raw'
FROM food f
WHERE f.name = '扁豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '扁豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.088, 'USDA_FDC:169234 Hyacinth-beans, immature seeds, raw'
FROM food f
WHERE f.name = '扁豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '扁豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 292, 'TFDA:R2000901 拉麵'
FROM food f
WHERE f.name = '拉面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '拉面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 9.1, 'TFDA:R2000901 拉麵'
FROM food f
WHERE f.name = '拉面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '拉面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 62.1, 'TFDA:R2000901 拉麵'
FROM food f
WHERE f.name = '拉面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '拉面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.8, 'TFDA:R2000901 拉麵'
FROM food f
WHERE f.name = '拉面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '拉面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.3, 'TFDA:R2000901 拉麵'
FROM food f
WHERE f.name = '拉面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '拉面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 429, 'TFDA:R2000901 拉麵'
FROM food f
WHERE f.name = '拉面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '拉面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 77, 'TFDA:R2000901 拉麵'
FROM food f
WHERE f.name = '拉面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '拉面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 106, 'TFDA:R2000901 拉麵'
FROM food f
WHERE f.name = '拉面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '拉面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 26.6, 'TFDA:R2000901 拉麵'
FROM food f
WHERE f.name = '拉面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '拉面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.29, 'TFDA:R2000901 拉麵'
FROM food f
WHERE f.name = '拉面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '拉面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 9, 'TFDA:R2000901 拉麵'
FROM food f
WHERE f.name = '拉面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '拉面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 69, 'USDA_FDC:174683 Grapes, red or green (European type, such as Thompson seedless), raw'
FROM food f
WHERE f.name = '提子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '提子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.72, 'USDA_FDC:174683 Grapes, red or green (European type, such as Thompson seedless), raw'
FROM food f
WHERE f.name = '提子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '提子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 18.1, 'USDA_FDC:174683 Grapes, red or green (European type, such as Thompson seedless), raw'
FROM food f
WHERE f.name = '提子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '提子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.16, 'USDA_FDC:174683 Grapes, red or green (European type, such as Thompson seedless), raw'
FROM food f
WHERE f.name = '提子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '提子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.9, 'USDA_FDC:174683 Grapes, red or green (European type, such as Thompson seedless), raw'
FROM food f
WHERE f.name = '提子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '提子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'USDA_FDC:174683 Grapes, red or green (European type, such as Thompson seedless), raw'
FROM food f
WHERE f.name = '提子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '提子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 191, 'USDA_FDC:174683 Grapes, red or green (European type, such as Thompson seedless), raw'
FROM food f
WHERE f.name = '提子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '提子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 20, 'USDA_FDC:174683 Grapes, red or green (European type, such as Thompson seedless), raw'
FROM food f
WHERE f.name = '提子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '提子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:174683 Grapes, red or green (European type, such as Thompson seedless), raw'
FROM food f
WHERE f.name = '提子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '提子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.054, 'USDA_FDC:174683 Grapes, red or green (European type, such as Thompson seedless), raw'
FROM food f
WHERE f.name = '提子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '提子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 50, 'USDA_FDC:169070 Alcoholic beverage, wine, cooking'
FROM food f
WHERE f.name = '料酒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '料酒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.5, 'USDA_FDC:169070 Alcoholic beverage, wine, cooking'
FROM food f
WHERE f.name = '料酒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '料酒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 6.3, 'USDA_FDC:169070 Alcoholic beverage, wine, cooking'
FROM food f
WHERE f.name = '料酒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '料酒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0, 'USDA_FDC:169070 Alcoholic beverage, wine, cooking'
FROM food f
WHERE f.name = '料酒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '料酒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:169070 Alcoholic beverage, wine, cooking'
FROM food f
WHERE f.name = '料酒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '料酒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 626, 'USDA_FDC:169070 Alcoholic beverage, wine, cooking'
FROM food f
WHERE f.name = '料酒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '料酒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 88, 'USDA_FDC:169070 Alcoholic beverage, wine, cooking'
FROM food f
WHERE f.name = '料酒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '料酒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 15, 'USDA_FDC:169070 Alcoholic beverage, wine, cooking'
FROM food f
WHERE f.name = '料酒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '料酒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169070 Alcoholic beverage, wine, cooking'
FROM food f
WHERE f.name = '料酒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '料酒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'USDA_FDC:169070 Alcoholic beverage, wine, cooking'
FROM food f
WHERE f.name = '料酒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '料酒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 440, 'USDA_FDC:171177 Soup, ramen noodle, any flavor, dry'
FROM food f
WHERE f.name = '方便面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '方便面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 10.17, 'USDA_FDC:171177 Soup, ramen noodle, any flavor, dry'
FROM food f
WHERE f.name = '方便面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '方便面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 60.26, 'USDA_FDC:171177 Soup, ramen noodle, any flavor, dry'
FROM food f
WHERE f.name = '方便面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '方便面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 17.59, 'USDA_FDC:171177 Soup, ramen noodle, any flavor, dry'
FROM food f
WHERE f.name = '方便面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '方便面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.9, 'USDA_FDC:171177 Soup, ramen noodle, any flavor, dry'
FROM food f
WHERE f.name = '方便面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '方便面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1855, 'USDA_FDC:171177 Soup, ramen noodle, any flavor, dry'
FROM food f
WHERE f.name = '方便面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '方便面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 181, 'USDA_FDC:171177 Soup, ramen noodle, any flavor, dry'
FROM food f
WHERE f.name = '方便面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '方便面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 115, 'USDA_FDC:171177 Soup, ramen noodle, any flavor, dry'
FROM food f
WHERE f.name = '方便面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '方便面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:171177 Soup, ramen noodle, any flavor, dry'
FROM food f
WHERE f.name = '方便面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '方便面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 8.117, 'USDA_FDC:171177 Soup, ramen noodle, any flavor, dry'
FROM food f
WHERE f.name = '方便面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '方便面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 40, 'USDA_FDC:170106 Peppers, hot chili, red, raw'
FROM food f
WHERE f.name = '朝天椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝天椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.87, 'USDA_FDC:170106 Peppers, hot chili, red, raw'
FROM food f
WHERE f.name = '朝天椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝天椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 8.81, 'USDA_FDC:170106 Peppers, hot chili, red, raw'
FROM food f
WHERE f.name = '朝天椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝天椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.44, 'USDA_FDC:170106 Peppers, hot chili, red, raw'
FROM food f
WHERE f.name = '朝天椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝天椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.5, 'USDA_FDC:170106 Peppers, hot chili, red, raw'
FROM food f
WHERE f.name = '朝天椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝天椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 9, 'USDA_FDC:170106 Peppers, hot chili, red, raw'
FROM food f
WHERE f.name = '朝天椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝天椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 322, 'USDA_FDC:170106 Peppers, hot chili, red, raw'
FROM food f
WHERE f.name = '朝天椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝天椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 43, 'USDA_FDC:170106 Peppers, hot chili, red, raw'
FROM food f
WHERE f.name = '朝天椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝天椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170106 Peppers, hot chili, red, raw'
FROM food f
WHERE f.name = '朝天椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝天椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.042, 'USDA_FDC:170106 Peppers, hot chili, red, raw'
FROM food f
WHERE f.name = '朝天椒'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '朝天椒' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 33, 'USDA_FDC:168580 Mushrooms, oyster, raw'
FROM food f
WHERE f.name = '杏鲍菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杏鲍菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 3.31, 'USDA_FDC:168580 Mushrooms, oyster, raw'
FROM food f
WHERE f.name = '杏鲍菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杏鲍菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 6.09, 'USDA_FDC:168580 Mushrooms, oyster, raw'
FROM food f
WHERE f.name = '杏鲍菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杏鲍菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.41, 'USDA_FDC:168580 Mushrooms, oyster, raw'
FROM food f
WHERE f.name = '杏鲍菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杏鲍菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.3, 'USDA_FDC:168580 Mushrooms, oyster, raw'
FROM food f
WHERE f.name = '杏鲍菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杏鲍菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 18, 'USDA_FDC:168580 Mushrooms, oyster, raw'
FROM food f
WHERE f.name = '杏鲍菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杏鲍菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 420, 'USDA_FDC:168580 Mushrooms, oyster, raw'
FROM food f
WHERE f.name = '杏鲍菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杏鲍菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 120, 'USDA_FDC:168580 Mushrooms, oyster, raw'
FROM food f
WHERE f.name = '杏鲍菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杏鲍菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:168580 Mushrooms, oyster, raw'
FROM food f
WHERE f.name = '杏鲍菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杏鲍菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.062, 'USDA_FDC:168580 Mushrooms, oyster, raw'
FROM food f
WHERE f.name = '杏鲍菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '杏鲍菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 70, 'TFDA:J3500701 軟翅仔'
FROM food f
WHERE f.name = '柔鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柔鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 14.7, 'TFDA:J3500701 軟翅仔'
FROM food f
WHERE f.name = '柔鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柔鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.8, 'TFDA:J3500701 軟翅仔'
FROM food f
WHERE f.name = '柔鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柔鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.8, 'TFDA:J3500701 軟翅仔'
FROM food f
WHERE f.name = '柔鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柔鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 400, 'TFDA:J3500701 軟翅仔'
FROM food f
WHERE f.name = '柔鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柔鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 77, 'TFDA:J3500701 軟翅仔'
FROM food f
WHERE f.name = '柔鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柔鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 130, 'TFDA:J3500701 軟翅仔'
FROM food f
WHERE f.name = '柔鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柔鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 324, 'TFDA:J3500701 軟翅仔'
FROM food f
WHERE f.name = '柔鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柔鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.3, 'TFDA:J3500701 軟翅仔'
FROM food f
WHERE f.name = '柔鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柔鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 82.2, 'TFDA:J3500701 軟翅仔'
FROM food f
WHERE f.name = '柔鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柔鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.91, 'TFDA:J3500701 軟翅仔'
FROM food f
WHERE f.name = '柔鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柔鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 16, 'TFDA:J3500701 軟翅仔'
FROM food f
WHERE f.name = '柔鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '柔鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 52, 'USDA_FDC:167755 Raspberries, raw'
FROM food f
WHERE f.name = '树莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '树莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.2, 'USDA_FDC:167755 Raspberries, raw'
FROM food f
WHERE f.name = '树莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '树莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 11.94, 'USDA_FDC:167755 Raspberries, raw'
FROM food f
WHERE f.name = '树莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '树莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.65, 'USDA_FDC:167755 Raspberries, raw'
FROM food f
WHERE f.name = '树莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '树莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 6.5, 'USDA_FDC:167755 Raspberries, raw'
FROM food f
WHERE f.name = '树莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '树莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'USDA_FDC:167755 Raspberries, raw'
FROM food f
WHERE f.name = '树莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '树莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 151, 'USDA_FDC:167755 Raspberries, raw'
FROM food f
WHERE f.name = '树莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '树莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 29, 'USDA_FDC:167755 Raspberries, raw'
FROM food f
WHERE f.name = '树莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '树莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:167755 Raspberries, raw'
FROM food f
WHERE f.name = '树莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '树莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.019, 'USDA_FDC:167755 Raspberries, raw'
FROM food f
WHERE f.name = '树莓'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '树莓' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 72, 'TFDA:D2300101 龍眼'
FROM food f
WHERE f.name = '桂圆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂圆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.1, 'TFDA:D2300101 龍眼'
FROM food f
WHERE f.name = '桂圆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂圆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 18, 'TFDA:D2300101 龍眼'
FROM food f
WHERE f.name = '桂圆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂圆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.4, 'TFDA:D2300101 龍眼'
FROM food f
WHERE f.name = '桂圆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂圆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.8, 'TFDA:D2300101 龍眼'
FROM food f
WHERE f.name = '桂圆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂圆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 3, 'TFDA:D2300101 龍眼'
FROM food f
WHERE f.name = '桂圆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂圆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 282, 'TFDA:D2300101 龍眼'
FROM food f
WHERE f.name = '桂圆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂圆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 29, 'TFDA:D2300101 龍眼'
FROM food f
WHERE f.name = '桂圆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂圆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.2, 'TFDA:D2300101 龍眼'
FROM food f
WHERE f.name = '桂圆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂圆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 79.7, 'TFDA:D2300101 龍眼'
FROM food f
WHERE f.name = '桂圆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂圆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.09, 'TFDA:D2300101 龍眼'
FROM food f
WHERE f.name = '桂圆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂圆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 5, 'TFDA:D2300101 龍眼'
FROM food f
WHERE f.name = '桂圆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '桂圆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 116, 'TFDA:R4401201 梅乾菜'
FROM food f
WHERE f.name = '梅干菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅干菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 5.5, 'TFDA:R4401201 梅乾菜'
FROM food f
WHERE f.name = '梅干菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅干菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 20.8, 'TFDA:R4401201 梅乾菜'
FROM food f
WHERE f.name = '梅干菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅干菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.1, 'TFDA:R4401201 梅乾菜'
FROM food f
WHERE f.name = '梅干菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅干菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 12.8, 'TFDA:R4401201 梅乾菜'
FROM food f
WHERE f.name = '梅干菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅干菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 11555, 'TFDA:R4401201 梅乾菜'
FROM food f
WHERE f.name = '梅干菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅干菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 820, 'TFDA:R4401201 梅乾菜'
FROM food f
WHERE f.name = '梅干菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅干菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 70, 'TFDA:R4401201 梅乾菜'
FROM food f
WHERE f.name = '梅干菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅干菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 41.1, 'TFDA:R4401201 梅乾菜'
FROM food f
WHERE f.name = '梅干菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅干菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 4.07, 'TFDA:R4401201 梅乾菜'
FROM food f
WHERE f.name = '梅干菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅干菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 381, 'TFDA:R4401201 梅乾菜'
FROM food f
WHERE f.name = '梅干菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅干菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 207, 'TFDA:I0300301 豬上肩肉'
FROM food f
WHERE f.name = '梅花肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅花肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 18.9, 'TFDA:I0300301 豬上肩肉'
FROM food f
WHERE f.name = '梅花肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅花肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:I0300301 豬上肩肉'
FROM food f
WHERE f.name = '梅花肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅花肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 14, 'TFDA:I0300301 豬上肩肉'
FROM food f
WHERE f.name = '梅花肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅花肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 52, 'TFDA:I0300301 豬上肩肉'
FROM food f
WHERE f.name = '梅花肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅花肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 355, 'TFDA:I0300301 豬上肩肉'
FROM food f
WHERE f.name = '梅花肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅花肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 137, 'TFDA:I0300301 豬上肩肉'
FROM food f
WHERE f.name = '梅花肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅花肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 70, 'TFDA:I0300301 豬上肩肉'
FROM food f
WHERE f.name = '梅花肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅花肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 5.5, 'TFDA:I0300301 豬上肩肉'
FROM food f
WHERE f.name = '梅花肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅花肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 66.7, 'TFDA:I0300301 豬上肩肉'
FROM food f
WHERE f.name = '梅花肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅花肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.78, 'TFDA:I0300301 豬上肩肉'
FROM food f
WHERE f.name = '梅花肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅花肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 3, 'TFDA:I0300301 豬上肩肉'
FROM food f
WHERE f.name = '梅花肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '梅花肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 354, 'USDA_FDC:170169 Nuts, coconut meat, raw'
FROM food f
WHERE f.name = '椰子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 3.33, 'USDA_FDC:170169 Nuts, coconut meat, raw'
FROM food f
WHERE f.name = '椰子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 15.23, 'USDA_FDC:170169 Nuts, coconut meat, raw'
FROM food f
WHERE f.name = '椰子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 33.49, 'USDA_FDC:170169 Nuts, coconut meat, raw'
FROM food f
WHERE f.name = '椰子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 9, 'USDA_FDC:170169 Nuts, coconut meat, raw'
FROM food f
WHERE f.name = '椰子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 20, 'USDA_FDC:170169 Nuts, coconut meat, raw'
FROM food f
WHERE f.name = '椰子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 356, 'USDA_FDC:170169 Nuts, coconut meat, raw'
FROM food f
WHERE f.name = '椰子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 113, 'USDA_FDC:170169 Nuts, coconut meat, raw'
FROM food f
WHERE f.name = '椰子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170169 Nuts, coconut meat, raw'
FROM food f
WHERE f.name = '椰子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 29.698, 'USDA_FDC:170169 Nuts, coconut meat, raw'
FROM food f
WHERE f.name = '椰子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 230, 'USDA_FDC:170172 Nuts, coconut milk, raw (liquid expressed from grated meat and water)'
FROM food f
WHERE f.name = '椰汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.29, 'USDA_FDC:170172 Nuts, coconut milk, raw (liquid expressed from grated meat and water)'
FROM food f
WHERE f.name = '椰汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 5.54, 'USDA_FDC:170172 Nuts, coconut milk, raw (liquid expressed from grated meat and water)'
FROM food f
WHERE f.name = '椰汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 23.84, 'USDA_FDC:170172 Nuts, coconut milk, raw (liquid expressed from grated meat and water)'
FROM food f
WHERE f.name = '椰汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.2, 'USDA_FDC:170172 Nuts, coconut milk, raw (liquid expressed from grated meat and water)'
FROM food f
WHERE f.name = '椰汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 15, 'USDA_FDC:170172 Nuts, coconut milk, raw (liquid expressed from grated meat and water)'
FROM food f
WHERE f.name = '椰汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 263, 'USDA_FDC:170172 Nuts, coconut milk, raw (liquid expressed from grated meat and water)'
FROM food f
WHERE f.name = '椰汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 100, 'USDA_FDC:170172 Nuts, coconut milk, raw (liquid expressed from grated meat and water)'
FROM food f
WHERE f.name = '椰汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170172 Nuts, coconut milk, raw (liquid expressed from grated meat and water)'
FROM food f
WHERE f.name = '椰汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 21.14, 'USDA_FDC:170172 Nuts, coconut milk, raw (liquid expressed from grated meat and water)'
FROM food f
WHERE f.name = '椰汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '椰汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 45, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '橙汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橙汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.7, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '橙汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橙汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 10.4, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '橙汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橙汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '橙汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橙汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.2, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '橙汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橙汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '橙汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橙汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 200, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '橙汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橙汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 17, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '橙汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橙汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '橙汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橙汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.024, 'USDA_FDC:169098 Orange juice, raw (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '橙汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '橙汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 36, 'USDA_FDC:170416 Parsley, fresh'
FROM food f
WHERE f.name = '欧芹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '欧芹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.97, 'USDA_FDC:170416 Parsley, fresh'
FROM food f
WHERE f.name = '欧芹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '欧芹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 6.33, 'USDA_FDC:170416 Parsley, fresh'
FROM food f
WHERE f.name = '欧芹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '欧芹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.79, 'USDA_FDC:170416 Parsley, fresh'
FROM food f
WHERE f.name = '欧芹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '欧芹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.3, 'USDA_FDC:170416 Parsley, fresh'
FROM food f
WHERE f.name = '欧芹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '欧芹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 56, 'USDA_FDC:170416 Parsley, fresh'
FROM food f
WHERE f.name = '欧芹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '欧芹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 554, 'USDA_FDC:170416 Parsley, fresh'
FROM food f
WHERE f.name = '欧芹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '欧芹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 58, 'USDA_FDC:170416 Parsley, fresh'
FROM food f
WHERE f.name = '欧芹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '欧芹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170416 Parsley, fresh'
FROM food f
WHERE f.name = '欧芹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '欧芹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.132, 'USDA_FDC:170416 Parsley, fresh'
FROM food f
WHERE f.name = '欧芹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '欧芹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 19, 'TFDA:F07001 海帶平均值'
FROM food f
WHERE f.name = '江白菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '江白菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.7, 'TFDA:F07001 海帶平均值'
FROM food f
WHERE f.name = '江白菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '江白菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 4.2, 'TFDA:F07001 海帶平均值'
FROM food f
WHERE f.name = '江白菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '江白菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:F07001 海帶平均值'
FROM food f
WHERE f.name = '江白菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '江白菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.5, 'TFDA:F07001 海帶平均值'
FROM food f
WHERE f.name = '江白菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '江白菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 216, 'TFDA:F07001 海帶平均值'
FROM food f
WHERE f.name = '江白菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '江白菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 6, 'TFDA:F07001 海帶平均值'
FROM food f
WHERE f.name = '江白菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '江白菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 11, 'TFDA:F07001 海帶平均值'
FROM food f
WHERE f.name = '江白菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '江白菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:F07001 海帶平均值'
FROM food f
WHERE f.name = '江白菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '江白菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 94.1, 'TFDA:F07001 海帶平均值'
FROM food f
WHERE f.name = '江白菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '江白菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.13, 'TFDA:F07001 海帶平均值'
FROM food f
WHERE f.name = '江白菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '江白菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 80, 'TFDA:F07001 海帶平均值'
FROM food f
WHERE f.name = '江白菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '江白菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 645, 'TFDA:P1100101 沙拉醬'
FROM food f
WHERE f.name = '沙拉酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙拉酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.9, 'TFDA:P1100101 沙拉醬'
FROM food f
WHERE f.name = '沙拉酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙拉酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 11.4, 'TFDA:P1100101 沙拉醬'
FROM food f
WHERE f.name = '沙拉酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙拉酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 65.7, 'TFDA:P1100101 沙拉醬'
FROM food f
WHERE f.name = '沙拉酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙拉酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.1, 'TFDA:P1100101 沙拉醬'
FROM food f
WHERE f.name = '沙拉酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙拉酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 980, 'TFDA:P1100101 沙拉醬'
FROM food f
WHERE f.name = '沙拉酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙拉酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 108, 'TFDA:P1100101 沙拉醬'
FROM food f
WHERE f.name = '沙拉酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙拉酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 34, 'TFDA:P1100101 沙拉醬'
FROM food f
WHERE f.name = '沙拉酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙拉酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 34, 'TFDA:P1100101 沙拉醬'
FROM food f
WHERE f.name = '沙拉酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙拉酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 9.9, 'TFDA:P1100101 沙拉醬'
FROM food f
WHERE f.name = '沙拉酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙拉酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 19.5, 'TFDA:P1100101 沙拉醬'
FROM food f
WHERE f.name = '沙拉酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙拉酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 30.78, 'TFDA:P1100101 沙拉醬'
FROM food f
WHERE f.name = '沙拉酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙拉酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 10, 'TFDA:P1100101 沙拉醬'
FROM food f
WHERE f.name = '沙拉酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '沙拉酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 393, 'TFDA:A0810101 燕麥片'
FROM food f
WHERE f.name = '燕麦片'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '燕麦片' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 12.3, 'TFDA:A0810101 燕麥片'
FROM food f
WHERE f.name = '燕麦片'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '燕麦片' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 64.1, 'TFDA:A0810101 燕麥片'
FROM food f
WHERE f.name = '燕麦片'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '燕麦片' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 9.7, 'TFDA:A0810101 燕麥片'
FROM food f
WHERE f.name = '燕麦片'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '燕麦片' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 4.7, 'TFDA:A0810101 燕麥片'
FROM food f
WHERE f.name = '燕麦片'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '燕麦片' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 3, 'TFDA:A0810101 燕麥片'
FROM food f
WHERE f.name = '燕麦片'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '燕麦片' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 329, 'TFDA:A0810101 燕麥片'
FROM food f
WHERE f.name = '燕麦片'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '燕麦片' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 116, 'TFDA:A0810101 燕麥片'
FROM food f
WHERE f.name = '燕麦片'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '燕麦片' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 10.1, 'TFDA:A0810101 燕麥片'
FROM food f
WHERE f.name = '燕麦片'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '燕麦片' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.84, 'TFDA:A0810101 燕麥片'
FROM food f
WHERE f.name = '燕麦片'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '燕麦片' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 40, 'TFDA:A0810101 燕麥片'
FROM food f
WHERE f.name = '燕麦片'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '燕麦片' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 854, 'USDA_FDC:170193 Beef, variety meats and by-products, suet, raw'
FROM food f
WHERE f.name = '牛尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.5, 'USDA_FDC:170193 Beef, variety meats and by-products, suet, raw'
FROM food f
WHERE f.name = '牛尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:170193 Beef, variety meats and by-products, suet, raw'
FROM food f
WHERE f.name = '牛尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 94, 'USDA_FDC:170193 Beef, variety meats and by-products, suet, raw'
FROM food f
WHERE f.name = '牛尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:170193 Beef, variety meats and by-products, suet, raw'
FROM food f
WHERE f.name = '牛尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 7, 'USDA_FDC:170193 Beef, variety meats and by-products, suet, raw'
FROM food f
WHERE f.name = '牛尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 16, 'USDA_FDC:170193 Beef, variety meats and by-products, suet, raw'
FROM food f
WHERE f.name = '牛尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 15, 'USDA_FDC:170193 Beef, variety meats and by-products, suet, raw'
FROM food f
WHERE f.name = '牛尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 68, 'USDA_FDC:170193 Beef, variety meats and by-products, suet, raw'
FROM food f
WHERE f.name = '牛尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 52.3, 'USDA_FDC:170193 Beef, variety meats and by-products, suet, raw'
FROM food f
WHERE f.name = '牛尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 112, 'USDA_FDC:168625 Beef, variety meats and by-products, heart, raw'
FROM food f
WHERE f.name = '牛心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 17.72, 'USDA_FDC:168625 Beef, variety meats and by-products, heart, raw'
FROM food f
WHERE f.name = '牛心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.14, 'USDA_FDC:168625 Beef, variety meats and by-products, heart, raw'
FROM food f
WHERE f.name = '牛心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.94, 'USDA_FDC:168625 Beef, variety meats and by-products, heart, raw'
FROM food f
WHERE f.name = '牛心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:168625 Beef, variety meats and by-products, heart, raw'
FROM food f
WHERE f.name = '牛心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 98, 'USDA_FDC:168625 Beef, variety meats and by-products, heart, raw'
FROM food f
WHERE f.name = '牛心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 287, 'USDA_FDC:168625 Beef, variety meats and by-products, heart, raw'
FROM food f
WHERE f.name = '牛心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 212, 'USDA_FDC:168625 Beef, variety meats and by-products, heart, raw'
FROM food f
WHERE f.name = '牛心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 124, 'USDA_FDC:168625 Beef, variety meats and by-products, heart, raw'
FROM food f
WHERE f.name = '牛心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.383, 'USDA_FDC:168625 Beef, variety meats and by-products, heart, raw'
FROM food f
WHERE f.name = '牛心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 225, 'TFDA:I0100201 牛肋條'
FROM food f
WHERE f.name = '牛肋条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肋条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 18.6, 'TFDA:I0100201 牛肋條'
FROM food f
WHERE f.name = '牛肋条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肋条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 1.1, 'TFDA:I0100201 牛肋條'
FROM food f
WHERE f.name = '牛肋条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肋条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 16.2, 'TFDA:I0100201 牛肋條'
FROM food f
WHERE f.name = '牛肋条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肋条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 81, 'TFDA:I0100201 牛肋條'
FROM food f
WHERE f.name = '牛肋条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肋条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 347, 'TFDA:I0100201 牛肋條'
FROM food f
WHERE f.name = '牛肋条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肋条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 127, 'TFDA:I0100201 牛肋條'
FROM food f
WHERE f.name = '牛肋条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肋条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 73, 'TFDA:I0100201 牛肋條'
FROM food f
WHERE f.name = '牛肋条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肋条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 6.9, 'TFDA:I0100201 牛肋條'
FROM food f
WHERE f.name = '牛肋条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肋条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 63.3, 'TFDA:I0100201 牛肋條'
FROM food f
WHERE f.name = '牛肋条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肋条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.11, 'TFDA:I0100201 牛肋條'
FROM food f
WHERE f.name = '牛肋条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肋条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 10, 'TFDA:I0100201 牛肋條'
FROM food f
WHERE f.name = '牛肋条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛肋条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 143, 'USDA_FDC:171768 Beef, loin, tenderloin steak, boneless, separable lean only, trimmed to 0" fat, choice, raw'
FROM food f
WHERE f.name = '牛里脊'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛里脊' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 21.78, 'USDA_FDC:171768 Beef, loin, tenderloin steak, boneless, separable lean only, trimmed to 0" fat, choice, raw'
FROM food f
WHERE f.name = '牛里脊'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛里脊' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:171768 Beef, loin, tenderloin steak, boneless, separable lean only, trimmed to 0" fat, choice, raw'
FROM food f
WHERE f.name = '牛里脊'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛里脊' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 6.16, 'USDA_FDC:171768 Beef, loin, tenderloin steak, boneless, separable lean only, trimmed to 0" fat, choice, raw'
FROM food f
WHERE f.name = '牛里脊'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛里脊' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:171768 Beef, loin, tenderloin steak, boneless, separable lean only, trimmed to 0" fat, choice, raw'
FROM food f
WHERE f.name = '牛里脊'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛里脊' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 45, 'USDA_FDC:171768 Beef, loin, tenderloin steak, boneless, separable lean only, trimmed to 0" fat, choice, raw'
FROM food f
WHERE f.name = '牛里脊'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛里脊' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 284, 'USDA_FDC:171768 Beef, loin, tenderloin steak, boneless, separable lean only, trimmed to 0" fat, choice, raw'
FROM food f
WHERE f.name = '牛里脊'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛里脊' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 212, 'USDA_FDC:171768 Beef, loin, tenderloin steak, boneless, separable lean only, trimmed to 0" fat, choice, raw'
FROM food f
WHERE f.name = '牛里脊'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛里脊' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 60, 'USDA_FDC:171768 Beef, loin, tenderloin steak, boneless, separable lean only, trimmed to 0" fat, choice, raw'
FROM food f
WHERE f.name = '牛里脊'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛里脊' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.123, 'USDA_FDC:171768 Beef, loin, tenderloin steak, boneless, separable lean only, trimmed to 0" fat, choice, raw'
FROM food f
WHERE f.name = '牛里脊'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛里脊' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 153, 'TFDA:I0108201 牛後腿股肉'
FROM food f
WHERE f.name = '牛霖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛霖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.6, 'TFDA:I0108201 牛後腿股肉'
FROM food f
WHERE f.name = '牛霖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛霖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.8, 'TFDA:I0108201 牛後腿股肉'
FROM food f
WHERE f.name = '牛霖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛霖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 7.2, 'TFDA:I0108201 牛後腿股肉'
FROM food f
WHERE f.name = '牛霖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛霖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 48, 'TFDA:I0108201 牛後腿股肉'
FROM food f
WHERE f.name = '牛霖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛霖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 339, 'TFDA:I0108201 牛後腿股肉'
FROM food f
WHERE f.name = '牛霖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛霖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 228, 'TFDA:I0108201 牛後腿股肉'
FROM food f
WHERE f.name = '牛霖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛霖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 52, 'TFDA:I0108201 牛後腿股肉'
FROM food f
WHERE f.name = '牛霖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛霖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 3.5, 'TFDA:I0108201 牛後腿股肉'
FROM food f
WHERE f.name = '牛霖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛霖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 70.4, 'TFDA:I0108201 牛後腿股肉'
FROM food f
WHERE f.name = '牛霖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛霖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.49, 'TFDA:I0108201 牛後腿股肉'
FROM food f
WHERE f.name = '牛霖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛霖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 2, 'TFDA:I0108201 牛後腿股肉'
FROM food f
WHERE f.name = '牛霖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '牛霖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 198, 'TFDA:I0321801 豬大腸'
FROM food f
WHERE f.name = '猪大肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪大肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 6.6, 'TFDA:I0321801 豬大腸'
FROM food f
WHERE f.name = '猪大肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪大肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 1.9, 'TFDA:I0321801 豬大腸'
FROM food f
WHERE f.name = '猪大肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪大肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 18.9, 'TFDA:I0321801 豬大腸'
FROM food f
WHERE f.name = '猪大肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪大肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 45, 'TFDA:I0321801 豬大腸'
FROM food f
WHERE f.name = '猪大肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪大肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 17, 'TFDA:I0321801 豬大腸'
FROM food f
WHERE f.name = '猪大肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪大肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 57, 'TFDA:I0321801 豬大腸'
FROM food f
WHERE f.name = '猪大肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪大肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 125, 'TFDA:I0321801 豬大腸'
FROM food f
WHERE f.name = '猪大肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪大肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 9.9, 'TFDA:I0321801 豬大腸'
FROM food f
WHERE f.name = '猪大肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪大肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 72.2, 'TFDA:I0321801 豬大腸'
FROM food f
WHERE f.name = '猪大肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪大肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.13, 'TFDA:I0321801 豬大腸'
FROM food f
WHERE f.name = '猪大肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪大肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 15, 'TFDA:I0321801 豬大腸'
FROM food f
WHERE f.name = '猪大肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪大肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 156, 'TFDA:I0321901 豬小腸'
FROM food f
WHERE f.name = '猪小肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪小肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 12.5, 'TFDA:I0321901 豬小腸'
FROM food f
WHERE f.name = '猪小肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪小肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.6, 'TFDA:I0321901 豬小腸'
FROM food f
WHERE f.name = '猪小肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪小肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 11.4, 'TFDA:I0321901 豬小腸'
FROM food f
WHERE f.name = '猪小肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪小肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 30, 'TFDA:I0321901 豬小腸'
FROM food f
WHERE f.name = '猪小肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪小肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 42, 'TFDA:I0321901 豬小腸'
FROM food f
WHERE f.name = '猪小肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪小肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 83, 'TFDA:I0321901 豬小腸'
FROM food f
WHERE f.name = '猪小肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪小肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 184, 'TFDA:I0321901 豬小腸'
FROM food f
WHERE f.name = '猪小肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪小肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 7.2, 'TFDA:I0321901 豬小腸'
FROM food f
WHERE f.name = '猪小肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪小肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 75, 'TFDA:I0321901 豬小腸'
FROM food f
WHERE f.name = '猪小肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪小肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.12, 'TFDA:I0321901 豬小腸'
FROM food f
WHERE f.name = '猪小肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪小肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 8, 'TFDA:I0321901 豬小腸'
FROM food f
WHERE f.name = '猪小肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪小肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 295, 'TFDA:I0320701 豬尾'
FROM food f
WHERE f.name = '猪尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 16.2, 'TFDA:I0320701 豬尾'
FROM food f
WHERE f.name = '猪尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 7.1, 'TFDA:I0320701 豬尾'
FROM food f
WHERE f.name = '猪尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 25, 'TFDA:I0320701 豬尾'
FROM food f
WHERE f.name = '猪尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 92, 'TFDA:I0320701 豬尾'
FROM food f
WHERE f.name = '猪尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 61, 'TFDA:I0320701 豬尾'
FROM food f
WHERE f.name = '猪尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 97, 'TFDA:I0320701 豬尾'
FROM food f
WHERE f.name = '猪尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 80, 'TFDA:I0320701 豬尾'
FROM food f
WHERE f.name = '猪尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 8.7, 'TFDA:I0320701 豬尾'
FROM food f
WHERE f.name = '猪尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 51.1, 'TFDA:I0320701 豬尾'
FROM food f
WHERE f.name = '猪尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.28, 'TFDA:I0320701 豬尾'
FROM food f
WHERE f.name = '猪尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 9, 'TFDA:I0320701 豬尾'
FROM food f
WHERE f.name = '猪尾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪尾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 128, 'TFDA:I0320101 豬心'
FROM food f
WHERE f.name = '猪心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 13.6, 'TFDA:I0320101 豬心'
FROM food f
WHERE f.name = '猪心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 1, 'TFDA:I0320101 豬心'
FROM food f
WHERE f.name = '猪心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 7.8, 'TFDA:I0320101 豬心'
FROM food f
WHERE f.name = '猪心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 74, 'TFDA:I0320101 豬心'
FROM food f
WHERE f.name = '猪心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 199, 'TFDA:I0320101 豬心'
FROM food f
WHERE f.name = '猪心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 145, 'TFDA:I0320101 豬心'
FROM food f
WHERE f.name = '猪心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 65, 'TFDA:I0320101 豬心'
FROM food f
WHERE f.name = '猪心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 3, 'TFDA:I0320101 豬心'
FROM food f
WHERE f.name = '猪心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 76.8, 'TFDA:I0320101 豬心'
FROM food f
WHERE f.name = '猪心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.52, 'TFDA:I0320101 豬心'
FROM food f
WHERE f.name = '猪心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 3, 'TFDA:I0320101 豬心'
FROM food f
WHERE f.name = '猪心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 491, 'TFDA:I0320301 豬皮'
FROM food f
WHERE f.name = '猪皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 22.1, 'TFDA:I0320301 豬皮'
FROM food f
WHERE f.name = '猪皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:I0320301 豬皮'
FROM food f
WHERE f.name = '猪皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 44, 'TFDA:I0320301 豬皮'
FROM food f
WHERE f.name = '猪皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 109, 'TFDA:I0320301 豬皮'
FROM food f
WHERE f.name = '猪皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 38, 'TFDA:I0320301 豬皮'
FROM food f
WHERE f.name = '猪皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 29, 'TFDA:I0320301 豬皮'
FROM food f
WHERE f.name = '猪皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 70, 'TFDA:I0320301 豬皮'
FROM food f
WHERE f.name = '猪皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 14.5, 'TFDA:I0320301 豬皮'
FROM food f
WHERE f.name = '猪皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 35.5, 'TFDA:I0320301 豬皮'
FROM food f
WHERE f.name = '猪皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.48, 'TFDA:I0320301 豬皮'
FROM food f
WHERE f.name = '猪皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 8, 'TFDA:I0320301 豬皮'
FROM food f
WHERE f.name = '猪皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 219, 'TFDA:I0320401 豬耳'
FROM food f
WHERE f.name = '猪耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 24.2, 'TFDA:I0320401 豬耳'
FROM food f
WHERE f.name = '猪耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.9, 'TFDA:I0320401 豬耳'
FROM food f
WHERE f.name = '猪耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 12.8, 'TFDA:I0320401 豬耳'
FROM food f
WHERE f.name = '猪耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 175, 'TFDA:I0320401 豬耳'
FROM food f
WHERE f.name = '猪耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 42, 'TFDA:I0320401 豬耳'
FROM food f
WHERE f.name = '猪耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 79, 'TFDA:I0320401 豬耳'
FROM food f
WHERE f.name = '猪耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 97, 'TFDA:I0320401 豬耳'
FROM food f
WHERE f.name = '猪耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 4.3, 'TFDA:I0320401 豬耳'
FROM food f
WHERE f.name = '猪耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 61.5, 'TFDA:I0320401 豬耳'
FROM food f
WHERE f.name = '猪耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:I0320401 豬耳'
FROM food f
WHERE f.name = '猪耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 16, 'TFDA:I0320401 豬耳'
FROM food f
WHERE f.name = '猪耳'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪耳' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 441, 'TFDA:R5600101 豬肉脯'
FROM food f
WHERE f.name = '猪肉脯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肉脯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 33.4, 'TFDA:R5600101 豬肉脯'
FROM food f
WHERE f.name = '猪肉脯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肉脯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 20.3, 'TFDA:R5600101 豬肉脯'
FROM food f
WHERE f.name = '猪肉脯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肉脯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 25.1, 'TFDA:R5600101 豬肉脯'
FROM food f
WHERE f.name = '猪肉脯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肉脯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1518, 'TFDA:R5600101 豬肉脯'
FROM food f
WHERE f.name = '猪肉脯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肉脯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 598, 'TFDA:R5600101 豬肉脯'
FROM food f
WHERE f.name = '猪肉脯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肉脯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 269, 'TFDA:R5600101 豬肉脯'
FROM food f
WHERE f.name = '猪肉脯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肉脯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 116, 'TFDA:R5600101 豬肉脯'
FROM food f
WHERE f.name = '猪肉脯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肉脯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 9.3, 'TFDA:R5600101 豬肉脯'
FROM food f
WHERE f.name = '猪肉脯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肉脯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 16, 'TFDA:R5600101 豬肉脯'
FROM food f
WHERE f.name = '猪肉脯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肉脯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.39, 'TFDA:R5600101 豬肉脯'
FROM food f
WHERE f.name = '猪肉脯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肉脯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 15, 'TFDA:R5600101 豬肉脯'
FROM food f
WHERE f.name = '猪肉脯'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肉脯' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 152, 'TFDA:I0321101 豬肚'
FROM food f
WHERE f.name = '猪肚'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 12.4, 'TFDA:I0321101 豬肚'
FROM food f
WHERE f.name = '猪肚'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:I0321101 豬肚'
FROM food f
WHERE f.name = '猪肚'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 11, 'TFDA:I0321101 豬肚'
FROM food f
WHERE f.name = '猪肚'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 62, 'TFDA:I0321101 豬肚'
FROM food f
WHERE f.name = '猪肚'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 105, 'TFDA:I0321101 豬肚'
FROM food f
WHERE f.name = '猪肚'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 100, 'TFDA:I0321101 豬肚'
FROM food f
WHERE f.name = '猪肚'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 130, 'TFDA:I0321101 豬肚'
FROM food f
WHERE f.name = '猪肚'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 4.6, 'TFDA:I0321101 豬肚'
FROM food f
WHERE f.name = '猪肚'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 76.3, 'TFDA:I0321101 豬肚'
FROM food f
WHERE f.name = '猪肚'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.23, 'TFDA:I0321101 豬肚'
FROM food f
WHERE f.name = '猪肚'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 5, 'TFDA:I0321101 豬肚'
FROM food f
WHERE f.name = '猪肚'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 50, 'TFDA:G1100101 酒杯菇'
FROM food f
WHERE f.name = '猪肚菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 4.6, 'TFDA:G1100101 酒杯菇'
FROM food f
WHERE f.name = '猪肚菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 9, 'TFDA:G1100101 酒杯菇'
FROM food f
WHERE f.name = '猪肚菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.3, 'TFDA:G1100101 酒杯菇'
FROM food f
WHERE f.name = '猪肚菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 4, 'TFDA:G1100101 酒杯菇'
FROM food f
WHERE f.name = '猪肚菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'TFDA:G1100101 酒杯菇'
FROM food f
WHERE f.name = '猪肚菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 293, 'TFDA:G1100101 酒杯菇'
FROM food f
WHERE f.name = '猪肚菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 89, 'TFDA:G1100101 酒杯菇'
FROM food f
WHERE f.name = '猪肚菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:G1100101 酒杯菇'
FROM food f
WHERE f.name = '猪肚菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 85.3, 'TFDA:G1100101 酒杯菇'
FROM food f
WHERE f.name = '猪肚菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:G1100101 酒杯菇'
FROM food f
WHERE f.name = '猪肚菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 2, 'TFDA:G1100101 酒杯菇'
FROM food f
WHERE f.name = '猪肚菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪肚菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 125, 'TFDA:I0322601 豬腦'
FROM food f
WHERE f.name = '猪脑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪脑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 10.8, 'TFDA:I0322601 豬腦'
FROM food f
WHERE f.name = '猪脑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪脑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:I0322601 豬腦'
FROM food f
WHERE f.name = '猪脑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪脑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 8.7, 'TFDA:I0322601 豬腦'
FROM food f
WHERE f.name = '猪脑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪脑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 120, 'TFDA:I0322601 豬腦'
FROM food f
WHERE f.name = '猪脑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪脑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 294, 'TFDA:I0322601 豬腦'
FROM food f
WHERE f.name = '猪脑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪脑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 329, 'TFDA:I0322601 豬腦'
FROM food f
WHERE f.name = '猪脑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪脑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 2075, 'TFDA:I0322601 豬腦'
FROM food f
WHERE f.name = '猪脑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪脑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 3.7, 'TFDA:I0322601 豬腦'
FROM food f
WHERE f.name = '猪脑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪脑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 79.2, 'TFDA:I0322601 豬腦'
FROM food f
WHERE f.name = '猪脑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪脑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.22, 'TFDA:I0322601 豬腦'
FROM food f
WHERE f.name = '猪脑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪脑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 3, 'TFDA:I0322601 豬腦'
FROM food f
WHERE f.name = '猪脑'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪脑' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 100, 'USDA_FDC:168270 Pork, fresh, variety meats and by-products, kidneys, raw'
FROM food f
WHERE f.name = '猪腰'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪腰' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 16.46, 'USDA_FDC:168270 Pork, fresh, variety meats and by-products, kidneys, raw'
FROM food f
WHERE f.name = '猪腰'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪腰' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:168270 Pork, fresh, variety meats and by-products, kidneys, raw'
FROM food f
WHERE f.name = '猪腰'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪腰' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.25, 'USDA_FDC:168270 Pork, fresh, variety meats and by-products, kidneys, raw'
FROM food f
WHERE f.name = '猪腰'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪腰' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:168270 Pork, fresh, variety meats and by-products, kidneys, raw'
FROM food f
WHERE f.name = '猪腰'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪腰' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 121, 'USDA_FDC:168270 Pork, fresh, variety meats and by-products, kidneys, raw'
FROM food f
WHERE f.name = '猪腰'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪腰' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 229, 'USDA_FDC:168270 Pork, fresh, variety meats and by-products, kidneys, raw'
FROM food f
WHERE f.name = '猪腰'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪腰' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 204, 'USDA_FDC:168270 Pork, fresh, variety meats and by-products, kidneys, raw'
FROM food f
WHERE f.name = '猪腰'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪腰' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 319, 'USDA_FDC:168270 Pork, fresh, variety meats and by-products, kidneys, raw'
FROM food f
WHERE f.name = '猪腰'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪腰' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.04, 'USDA_FDC:168270 Pork, fresh, variety meats and by-products, kidneys, raw'
FROM food f
WHERE f.name = '猪腰'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪腰' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 185, 'TFDA:I0320501 豬舌'
FROM food f
WHERE f.name = '猪舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 18.5, 'TFDA:I0320501 豬舌'
FROM food f
WHERE f.name = '猪舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:I0320501 豬舌'
FROM food f
WHERE f.name = '猪舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 11.8, 'TFDA:I0320501 豬舌'
FROM food f
WHERE f.name = '猪舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 119, 'TFDA:I0320501 豬舌'
FROM food f
WHERE f.name = '猪舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 211, 'TFDA:I0320501 豬舌'
FROM food f
WHERE f.name = '猪舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 166, 'TFDA:I0320501 豬舌'
FROM food f
WHERE f.name = '猪舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 111, 'TFDA:I0320501 豬舌'
FROM food f
WHERE f.name = '猪舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 4.3, 'TFDA:I0320501 豬舌'
FROM food f
WHERE f.name = '猪舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 69.1, 'TFDA:I0320501 豬舌'
FROM food f
WHERE f.name = '猪舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.17, 'TFDA:I0320501 豬舌'
FROM food f
WHERE f.name = '猪舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 5, 'TFDA:I0320501 豬舌'
FROM food f
WHERE f.name = '猪舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 29, 'TFDA:I0320601 豬血'
FROM food f
WHERE f.name = '猪血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 6.3, 'TFDA:I0320601 豬血'
FROM food f
WHERE f.name = '猪血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.5, 'TFDA:I0320601 豬血'
FROM food f
WHERE f.name = '猪血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.3, 'TFDA:I0320601 豬血'
FROM food f
WHERE f.name = '猪血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 179, 'TFDA:I0320601 豬血'
FROM food f
WHERE f.name = '猪血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 30, 'TFDA:I0320601 豬血'
FROM food f
WHERE f.name = '猪血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 70, 'TFDA:I0320601 豬血'
FROM food f
WHERE f.name = '猪血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 50, 'TFDA:I0320601 豬血'
FROM food f
WHERE f.name = '猪血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:I0320601 豬血'
FROM food f
WHERE f.name = '猪血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 92.4, 'TFDA:I0320601 豬血'
FROM food f
WHERE f.name = '猪血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.03, 'TFDA:I0320601 豬血'
FROM food f
WHERE f.name = '猪血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 7, 'TFDA:I0320601 豬血'
FROM food f
WHERE f.name = '猪血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 284, 'TFDA:I0310301 豬頸肉'
FROM food f
WHERE f.name = '猪颈肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪颈肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 17.2, 'TFDA:I0310301 豬頸肉'
FROM food f
WHERE f.name = '猪颈肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪颈肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.8, 'TFDA:I0310301 豬頸肉'
FROM food f
WHERE f.name = '猪颈肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪颈肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 23.3, 'TFDA:I0310301 豬頸肉'
FROM food f
WHERE f.name = '猪颈肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪颈肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 43, 'TFDA:I0310301 豬頸肉'
FROM food f
WHERE f.name = '猪颈肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪颈肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 215, 'TFDA:I0310301 豬頸肉'
FROM food f
WHERE f.name = '猪颈肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪颈肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 130, 'TFDA:I0310301 豬頸肉'
FROM food f
WHERE f.name = '猪颈肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪颈肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 66, 'TFDA:I0310301 豬頸肉'
FROM food f
WHERE f.name = '猪颈肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪颈肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 8.4, 'TFDA:I0310301 豬頸肉'
FROM food f
WHERE f.name = '猪颈肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪颈肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 57.9, 'TFDA:I0310301 豬頸肉'
FROM food f
WHERE f.name = '猪颈肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪颈肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.13, 'TFDA:I0310301 豬頸肉'
FROM food f
WHERE f.name = '猪颈肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪颈肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 3, 'TFDA:I0310301 豬頸肉'
FROM food f
WHERE f.name = '猪颈肉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '猪颈肉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 57, 'TFDA:J3200101 干貝(冷凍)'
FROM food f
WHERE f.name = '瑶柱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '瑶柱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 12.7, 'TFDA:J3200101 干貝(冷凍)'
FROM food f
WHERE f.name = '瑶柱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '瑶柱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 1.7, 'TFDA:J3200101 干貝(冷凍)'
FROM food f
WHERE f.name = '瑶柱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '瑶柱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.4, 'TFDA:J3200101 干貝(冷凍)'
FROM food f
WHERE f.name = '瑶柱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '瑶柱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 949, 'TFDA:J3200101 干貝(冷凍)'
FROM food f
WHERE f.name = '瑶柱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '瑶柱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 51, 'TFDA:J3200101 干貝(冷凍)'
FROM food f
WHERE f.name = '瑶柱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '瑶柱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 686, 'TFDA:J3200101 干貝(冷凍)'
FROM food f
WHERE f.name = '瑶柱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '瑶柱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 38, 'TFDA:J3200101 干貝(冷凍)'
FROM food f
WHERE f.name = '瑶柱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '瑶柱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:J3200101 干貝(冷凍)'
FROM food f
WHERE f.name = '瑶柱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '瑶柱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 82.3, 'TFDA:J3200101 干貝(冷凍)'
FROM food f
WHERE f.name = '瑶柱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '瑶柱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.24, 'TFDA:J3200101 干貝(冷凍)'
FROM food f
WHERE f.name = '瑶柱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '瑶柱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 6, 'TFDA:J3200101 干貝(冷凍)'
FROM food f
WHERE f.name = '瑶柱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '瑶柱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 53, 'USDA_FDC:174277 Soy sauce made from soy and wheat (shoyu)'
FROM food f
WHERE f.name = '生抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '生抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 8.14, 'USDA_FDC:174277 Soy sauce made from soy and wheat (shoyu)'
FROM food f
WHERE f.name = '生抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '生抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 4.93, 'USDA_FDC:174277 Soy sauce made from soy and wheat (shoyu)'
FROM food f
WHERE f.name = '生抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '生抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.57, 'USDA_FDC:174277 Soy sauce made from soy and wheat (shoyu)'
FROM food f
WHERE f.name = '生抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '生抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.8, 'USDA_FDC:174277 Soy sauce made from soy and wheat (shoyu)'
FROM food f
WHERE f.name = '生抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '生抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 5493, 'USDA_FDC:174277 Soy sauce made from soy and wheat (shoyu)'
FROM food f
WHERE f.name = '生抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '生抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 435, 'USDA_FDC:174277 Soy sauce made from soy and wheat (shoyu)'
FROM food f
WHERE f.name = '生抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '生抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 166, 'USDA_FDC:174277 Soy sauce made from soy and wheat (shoyu)'
FROM food f
WHERE f.name = '生抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '生抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:174277 Soy sauce made from soy and wheat (shoyu)'
FROM food f
WHERE f.name = '生抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '生抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.073, 'USDA_FDC:174277 Soy sauce made from soy and wheat (shoyu)'
FROM food f
WHERE f.name = '生抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '生抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 101, 'USDA_FDC:168556 Catsup'
FROM food f
WHERE f.name = '番茄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.04, 'USDA_FDC:168556 Catsup'
FROM food f
WHERE f.name = '番茄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 27.4, 'USDA_FDC:168556 Catsup'
FROM food f
WHERE f.name = '番茄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'USDA_FDC:168556 Catsup'
FROM food f
WHERE f.name = '番茄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.3, 'USDA_FDC:168556 Catsup'
FROM food f
WHERE f.name = '番茄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 907, 'USDA_FDC:168556 Catsup'
FROM food f
WHERE f.name = '番茄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 281, 'USDA_FDC:168556 Catsup'
FROM food f
WHERE f.name = '番茄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 26, 'USDA_FDC:168556 Catsup'
FROM food f
WHERE f.name = '番茄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:168556 Catsup'
FROM food f
WHERE f.name = '番茄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.014, 'USDA_FDC:168556 Catsup'
FROM food f
WHERE f.name = '番茄酱'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '番茄酱' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 102, 'TFDA:J0413801 白帶魚'
FROM food f
WHERE f.name = '白鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 19.6, 'TFDA:J0413801 白帶魚'
FROM food f
WHERE f.name = '白鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:J0413801 白帶魚'
FROM food f
WHERE f.name = '白鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2, 'TFDA:J0413801 白帶魚'
FROM food f
WHERE f.name = '白鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 54, 'TFDA:J0413801 白帶魚'
FROM food f
WHERE f.name = '白鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 291, 'TFDA:J0413801 白帶魚'
FROM food f
WHERE f.name = '白鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 188, 'TFDA:J0413801 白帶魚'
FROM food f
WHERE f.name = '白鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 69, 'TFDA:J0413801 白帶魚'
FROM food f
WHERE f.name = '白鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.9, 'TFDA:J0413801 白帶魚'
FROM food f
WHERE f.name = '白鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 77.6, 'TFDA:J0413801 白帶魚'
FROM food f
WHERE f.name = '白鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.35, 'TFDA:J0413801 白帶魚'
FROM food f
WHERE f.name = '白鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 5, 'TFDA:J0413801 白帶魚'
FROM food f
WHERE f.name = '白鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '白鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 97, 'USDA_FDC:169108 Passion-fruit, (granadilla), purple, raw'
FROM food f
WHERE f.name = '百香果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百香果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.2, 'USDA_FDC:169108 Passion-fruit, (granadilla), purple, raw'
FROM food f
WHERE f.name = '百香果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百香果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 23.38, 'USDA_FDC:169108 Passion-fruit, (granadilla), purple, raw'
FROM food f
WHERE f.name = '百香果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百香果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.7, 'USDA_FDC:169108 Passion-fruit, (granadilla), purple, raw'
FROM food f
WHERE f.name = '百香果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百香果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 10.4, 'USDA_FDC:169108 Passion-fruit, (granadilla), purple, raw'
FROM food f
WHERE f.name = '百香果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百香果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 28, 'USDA_FDC:169108 Passion-fruit, (granadilla), purple, raw'
FROM food f
WHERE f.name = '百香果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百香果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 348, 'USDA_FDC:169108 Passion-fruit, (granadilla), purple, raw'
FROM food f
WHERE f.name = '百香果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百香果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 68, 'USDA_FDC:169108 Passion-fruit, (granadilla), purple, raw'
FROM food f
WHERE f.name = '百香果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百香果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169108 Passion-fruit, (granadilla), purple, raw'
FROM food f
WHERE f.name = '百香果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百香果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.059, 'USDA_FDC:169108 Passion-fruit, (granadilla), purple, raw'
FROM food f
WHERE f.name = '百香果'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '百香果' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 333, 'USDA_FDC:175193 Beans, kidney, all types, mature seeds, raw'
FROM food f
WHERE f.name = '眉豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '眉豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 23.58, 'USDA_FDC:175193 Beans, kidney, all types, mature seeds, raw'
FROM food f
WHERE f.name = '眉豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '眉豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 60.01, 'USDA_FDC:175193 Beans, kidney, all types, mature seeds, raw'
FROM food f
WHERE f.name = '眉豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '眉豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.83, 'USDA_FDC:175193 Beans, kidney, all types, mature seeds, raw'
FROM food f
WHERE f.name = '眉豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '眉豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 24.9, 'USDA_FDC:175193 Beans, kidney, all types, mature seeds, raw'
FROM food f
WHERE f.name = '眉豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '眉豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 24, 'USDA_FDC:175193 Beans, kidney, all types, mature seeds, raw'
FROM food f
WHERE f.name = '眉豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '眉豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1406, 'USDA_FDC:175193 Beans, kidney, all types, mature seeds, raw'
FROM food f
WHERE f.name = '眉豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '眉豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 407, 'USDA_FDC:175193 Beans, kidney, all types, mature seeds, raw'
FROM food f
WHERE f.name = '眉豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '眉豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:175193 Beans, kidney, all types, mature seeds, raw'
FROM food f
WHERE f.name = '眉豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '眉豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.12, 'USDA_FDC:175193 Beans, kidney, all types, mature seeds, raw'
FROM food f
WHERE f.name = '眉豆'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '眉豆' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 0, 'USDA_FDC:174158 Water, bottled, generic'
FROM food f
WHERE f.name = '矿泉水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '矿泉水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'USDA_FDC:174158 Water, bottled, generic'
FROM food f
WHERE f.name = '矿泉水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '矿泉水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:174158 Water, bottled, generic'
FROM food f
WHERE f.name = '矿泉水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '矿泉水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0, 'USDA_FDC:174158 Water, bottled, generic'
FROM food f
WHERE f.name = '矿泉水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '矿泉水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:174158 Water, bottled, generic'
FROM food f
WHERE f.name = '矿泉水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '矿泉水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'USDA_FDC:174158 Water, bottled, generic'
FROM food f
WHERE f.name = '矿泉水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '矿泉水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 0, 'USDA_FDC:174158 Water, bottled, generic'
FROM food f
WHERE f.name = '矿泉水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '矿泉水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 0, 'USDA_FDC:174158 Water, bottled, generic'
FROM food f
WHERE f.name = '矿泉水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '矿泉水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:174158 Water, bottled, generic'
FROM food f
WHERE f.name = '矿泉水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '矿泉水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'USDA_FDC:174158 Water, bottled, generic'
FROM food f
WHERE f.name = '矿泉水'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '矿泉水' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 63, 'USDA_FDC:167793 Apples, raw, fuji, with skin (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '红富士'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红富士' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.2, 'USDA_FDC:167793 Apples, raw, fuji, with skin (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '红富士'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红富士' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 15.22, 'USDA_FDC:167793 Apples, raw, fuji, with skin (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '红富士'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红富士' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.18, 'USDA_FDC:167793 Apples, raw, fuji, with skin (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '红富士'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红富士' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.1, 'USDA_FDC:167793 Apples, raw, fuji, with skin (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '红富士'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红富士' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'USDA_FDC:167793 Apples, raw, fuji, with skin (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '红富士'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红富士' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 109, 'USDA_FDC:167793 Apples, raw, fuji, with skin (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '红富士'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红富士' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 13, 'USDA_FDC:167793 Apples, raw, fuji, with skin (Includes foods for USDA''s Food Distribution Program)'
FROM food f
WHERE f.name = '红富士'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红富士' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 87, 'TFDA:D3100301 國產紅棗'
FROM food f
WHERE f.name = '红枣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红枣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.9, 'TFDA:D3100301 國產紅棗'
FROM food f
WHERE f.name = '红枣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红枣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 23.1, 'TFDA:D3100301 國產紅棗'
FROM food f
WHERE f.name = '红枣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红枣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:D3100301 國產紅棗'
FROM food f
WHERE f.name = '红枣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红枣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.9, 'TFDA:D3100301 國產紅棗'
FROM food f
WHERE f.name = '红枣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红枣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'TFDA:D3100301 國產紅棗'
FROM food f
WHERE f.name = '红枣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红枣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 324, 'TFDA:D3100301 國產紅棗'
FROM food f
WHERE f.name = '红枣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红枣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 33, 'TFDA:D3100301 國產紅棗'
FROM food f
WHERE f.name = '红枣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红枣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:D3100301 國產紅棗'
FROM food f
WHERE f.name = '红枣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红枣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 75.1, 'TFDA:D3100301 國產紅棗'
FROM food f
WHERE f.name = '红枣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红枣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.14, 'TFDA:D3100301 國產紅棗'
FROM food f
WHERE f.name = '红枣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红枣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 30, 'TFDA:D3100301 國產紅棗'
FROM food f
WHERE f.name = '红枣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红枣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 164, 'USDA_FDC:170088 Sweet potato, cooked, candied, home-prepared'
FROM food f
WHERE f.name = '红薯干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红薯干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.89, 'USDA_FDC:170088 Sweet potato, cooked, candied, home-prepared'
FROM food f
WHERE f.name = '红薯干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红薯干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 32.12, 'USDA_FDC:170088 Sweet potato, cooked, candied, home-prepared'
FROM food f
WHERE f.name = '红薯干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红薯干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.54, 'USDA_FDC:170088 Sweet potato, cooked, candied, home-prepared'
FROM food f
WHERE f.name = '红薯干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红薯干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.1, 'USDA_FDC:170088 Sweet potato, cooked, candied, home-prepared'
FROM food f
WHERE f.name = '红薯干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红薯干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 119, 'USDA_FDC:170088 Sweet potato, cooked, candied, home-prepared'
FROM food f
WHERE f.name = '红薯干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红薯干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 178, 'USDA_FDC:170088 Sweet potato, cooked, candied, home-prepared'
FROM food f
WHERE f.name = '红薯干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红薯干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 25, 'USDA_FDC:170088 Sweet potato, cooked, candied, home-prepared'
FROM food f
WHERE f.name = '红薯干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红薯干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 9, 'USDA_FDC:170088 Sweet potato, cooked, candied, home-prepared'
FROM food f
WHERE f.name = '红薯干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红薯干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.171, 'USDA_FDC:170088 Sweet potato, cooked, candied, home-prepared'
FROM food f
WHERE f.name = '红薯干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '红薯干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 387, 'USDA_FDC:169655 Sugars, granulated'
FROM food f
WHERE f.name = '绵白糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绵白糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'USDA_FDC:169655 Sugars, granulated'
FROM food f
WHERE f.name = '绵白糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绵白糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 99.98, 'USDA_FDC:169655 Sugars, granulated'
FROM food f
WHERE f.name = '绵白糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绵白糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0, 'USDA_FDC:169655 Sugars, granulated'
FROM food f
WHERE f.name = '绵白糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绵白糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:169655 Sugars, granulated'
FROM food f
WHERE f.name = '绵白糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绵白糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'USDA_FDC:169655 Sugars, granulated'
FROM food f
WHERE f.name = '绵白糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绵白糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 2, 'USDA_FDC:169655 Sugars, granulated'
FROM food f
WHERE f.name = '绵白糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绵白糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 0, 'USDA_FDC:169655 Sugars, granulated'
FROM food f
WHERE f.name = '绵白糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绵白糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169655 Sugars, granulated'
FROM food f
WHERE f.name = '绵白糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绵白糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'USDA_FDC:169655 Sugars, granulated'
FROM food f
WHERE f.name = '绵白糖'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '绵白糖' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 88, 'TFDA:J2100101 羅氏沼蝦'
FROM food f
WHERE f.name = '罗氏沼虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗氏沼虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.3, 'TFDA:J2100101 羅氏沼蝦'
FROM food f
WHERE f.name = '罗氏沼虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗氏沼虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.2, 'TFDA:J2100101 羅氏沼蝦'
FROM food f
WHERE f.name = '罗氏沼虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗氏沼虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'TFDA:J2100101 羅氏沼蝦'
FROM food f
WHERE f.name = '罗氏沼虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗氏沼虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 104, 'TFDA:J2100101 羅氏沼蝦'
FROM food f
WHERE f.name = '罗氏沼虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗氏沼虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 328, 'TFDA:J2100101 羅氏沼蝦'
FROM food f
WHERE f.name = '罗氏沼虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗氏沼虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 273, 'TFDA:J2100101 羅氏沼蝦'
FROM food f
WHERE f.name = '罗氏沼虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗氏沼虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 175, 'TFDA:J2100101 羅氏沼蝦'
FROM food f
WHERE f.name = '罗氏沼虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗氏沼虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:J2100101 羅氏沼蝦'
FROM food f
WHERE f.name = '罗氏沼虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗氏沼虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 78.1, 'TFDA:J2100101 羅氏沼蝦'
FROM food f
WHERE f.name = '罗氏沼虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗氏沼虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 2.09, 'TFDA:J2100101 羅氏沼蝦'
FROM food f
WHERE f.name = '罗氏沼虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗氏沼虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 27, 'TFDA:J2100101 羅氏沼蝦'
FROM food f
WHERE f.name = '罗氏沼虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '罗氏沼虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 147, 'USDA_FDC:174416 Lamb, Australian, imported, fresh, rib chop/rack roast, frenched, bone-in, separable lean only, trimmed to 1/8" fat, raw'
FROM food f
WHERE f.name = '羊排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 24.07, 'USDA_FDC:174416 Lamb, Australian, imported, fresh, rib chop/rack roast, frenched, bone-in, separable lean only, trimmed to 1/8" fat, raw'
FROM food f
WHERE f.name = '羊排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:174416 Lamb, Australian, imported, fresh, rib chop/rack roast, frenched, bone-in, separable lean only, trimmed to 1/8" fat, raw'
FROM food f
WHERE f.name = '羊排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 5.59, 'USDA_FDC:174416 Lamb, Australian, imported, fresh, rib chop/rack roast, frenched, bone-in, separable lean only, trimmed to 1/8" fat, raw'
FROM food f
WHERE f.name = '羊排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:174416 Lamb, Australian, imported, fresh, rib chop/rack roast, frenched, bone-in, separable lean only, trimmed to 1/8" fat, raw'
FROM food f
WHERE f.name = '羊排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 71, 'USDA_FDC:174416 Lamb, Australian, imported, fresh, rib chop/rack roast, frenched, bone-in, separable lean only, trimmed to 1/8" fat, raw'
FROM food f
WHERE f.name = '羊排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 209, 'USDA_FDC:174416 Lamb, Australian, imported, fresh, rib chop/rack roast, frenched, bone-in, separable lean only, trimmed to 1/8" fat, raw'
FROM food f
WHERE f.name = '羊排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 150, 'USDA_FDC:174416 Lamb, Australian, imported, fresh, rib chop/rack roast, frenched, bone-in, separable lean only, trimmed to 1/8" fat, raw'
FROM food f
WHERE f.name = '羊排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 66, 'USDA_FDC:174416 Lamb, Australian, imported, fresh, rib chop/rack roast, frenched, bone-in, separable lean only, trimmed to 1/8" fat, raw'
FROM food f
WHERE f.name = '羊排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.532, 'USDA_FDC:174416 Lamb, Australian, imported, fresh, rib chop/rack roast, frenched, bone-in, separable lean only, trimmed to 1/8" fat, raw'
FROM food f
WHERE f.name = '羊排'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊排' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 139, 'USDA_FDC:172531 Lamb, variety meats and by-products, liver, raw'
FROM food f
WHERE f.name = '羊肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.38, 'USDA_FDC:172531 Lamb, variety meats and by-products, liver, raw'
FROM food f
WHERE f.name = '羊肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 1.78, 'USDA_FDC:172531 Lamb, variety meats and by-products, liver, raw'
FROM food f
WHERE f.name = '羊肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 5.02, 'USDA_FDC:172531 Lamb, variety meats and by-products, liver, raw'
FROM food f
WHERE f.name = '羊肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:172531 Lamb, variety meats and by-products, liver, raw'
FROM food f
WHERE f.name = '羊肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 70, 'USDA_FDC:172531 Lamb, variety meats and by-products, liver, raw'
FROM food f
WHERE f.name = '羊肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 313, 'USDA_FDC:172531 Lamb, variety meats and by-products, liver, raw'
FROM food f
WHERE f.name = '羊肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 364, 'USDA_FDC:172531 Lamb, variety meats and by-products, liver, raw'
FROM food f
WHERE f.name = '羊肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 371, 'USDA_FDC:172531 Lamb, variety meats and by-products, liver, raw'
FROM food f
WHERE f.name = '羊肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.94, 'USDA_FDC:172531 Lamb, variety meats and by-products, liver, raw'
FROM food f
WHERE f.name = '羊肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '羊肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 60, 'USDA_FDC:174278 Soy sauce made from soy (tamari)'
FROM food f
WHERE f.name = '老抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 10.51, 'USDA_FDC:174278 Soy sauce made from soy (tamari)'
FROM food f
WHERE f.name = '老抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 5.57, 'USDA_FDC:174278 Soy sauce made from soy (tamari)'
FROM food f
WHERE f.name = '老抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'USDA_FDC:174278 Soy sauce made from soy (tamari)'
FROM food f
WHERE f.name = '老抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.8, 'USDA_FDC:174278 Soy sauce made from soy (tamari)'
FROM food f
WHERE f.name = '老抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 5586, 'USDA_FDC:174278 Soy sauce made from soy (tamari)'
FROM food f
WHERE f.name = '老抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 212, 'USDA_FDC:174278 Soy sauce made from soy (tamari)'
FROM food f
WHERE f.name = '老抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 130, 'USDA_FDC:174278 Soy sauce made from soy (tamari)'
FROM food f
WHERE f.name = '老抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:174278 Soy sauce made from soy (tamari)'
FROM food f
WHERE f.name = '老抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.011, 'USDA_FDC:174278 Soy sauce made from soy (tamari)'
FROM food f
WHERE f.name = '老抽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '老抽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 251, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '胡椒粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胡椒粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 10.39, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '胡椒粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胡椒粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 63.95, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '胡椒粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胡椒粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.26, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '胡椒粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胡椒粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 25.3, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '胡椒粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胡椒粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 20, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '胡椒粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胡椒粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1329, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '胡椒粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胡椒粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 158, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '胡椒粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胡椒粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '胡椒粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胡椒粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.392, 'USDA_FDC:170931 Spices, pepper, black'
FROM food f
WHERE f.name = '胡椒粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '胡椒粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 47, 'USDA_FDC:169097 Oranges, raw, all commercial varieties'
FROM food f
WHERE f.name = '脐橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脐橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.94, 'USDA_FDC:169097 Oranges, raw, all commercial varieties'
FROM food f
WHERE f.name = '脐橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脐橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 11.75, 'USDA_FDC:169097 Oranges, raw, all commercial varieties'
FROM food f
WHERE f.name = '脐橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脐橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.12, 'USDA_FDC:169097 Oranges, raw, all commercial varieties'
FROM food f
WHERE f.name = '脐橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脐橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.4, 'USDA_FDC:169097 Oranges, raw, all commercial varieties'
FROM food f
WHERE f.name = '脐橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脐橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'USDA_FDC:169097 Oranges, raw, all commercial varieties'
FROM food f
WHERE f.name = '脐橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脐橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 181, 'USDA_FDC:169097 Oranges, raw, all commercial varieties'
FROM food f
WHERE f.name = '脐橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脐橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 14, 'USDA_FDC:169097 Oranges, raw, all commercial varieties'
FROM food f
WHERE f.name = '脐橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脐橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169097 Oranges, raw, all commercial varieties'
FROM food f
WHERE f.name = '脐橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脐橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.015, 'USDA_FDC:169097 Oranges, raw, all commercial varieties'
FROM food f
WHERE f.name = '脐橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脐橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 361, 'TFDA:L0207101 脫脂奶粉'
FROM food f
WHERE f.name = '脱脂奶粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脱脂奶粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 36.2, 'TFDA:L0207101 脫脂奶粉'
FROM food f
WHERE f.name = '脱脂奶粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脱脂奶粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 51.2, 'TFDA:L0207101 脫脂奶粉'
FROM food f
WHERE f.name = '脱脂奶粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脱脂奶粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.9, 'TFDA:L0207101 脫脂奶粉'
FROM food f
WHERE f.name = '脱脂奶粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脱脂奶粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 338, 'TFDA:L0207101 脫脂奶粉'
FROM food f
WHERE f.name = '脱脂奶粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脱脂奶粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1758, 'TFDA:L0207101 脫脂奶粉'
FROM food f
WHERE f.name = '脱脂奶粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脱脂奶粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 1040, 'TFDA:L0207101 脫脂奶粉'
FROM food f
WHERE f.name = '脱脂奶粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脱脂奶粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 23, 'TFDA:L0207101 脫脂奶粉'
FROM food f
WHERE f.name = '脱脂奶粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脱脂奶粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.4, 'TFDA:L0207101 脫脂奶粉'
FROM food f
WHERE f.name = '脱脂奶粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脱脂奶粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 4, 'TFDA:L0207101 脫脂奶粉'
FROM food f
WHERE f.name = '脱脂奶粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脱脂奶粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:L0207101 脫脂奶粉'
FROM food f
WHERE f.name = '脱脂奶粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脱脂奶粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 1406, 'TFDA:L0207101 脫脂奶粉'
FROM food f
WHERE f.name = '脱脂奶粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '脱脂奶粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 16, 'TFDA:E4600101 茼蒿'
FROM food f
WHERE f.name = '艾菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '艾菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.7, 'TFDA:E4600101 茼蒿'
FROM food f
WHERE f.name = '艾菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '艾菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 2.2, 'TFDA:E4600101 茼蒿'
FROM food f
WHERE f.name = '艾菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '艾菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.3, 'TFDA:E4600101 茼蒿'
FROM food f
WHERE f.name = '艾菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '艾菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.6, 'TFDA:E4600101 茼蒿'
FROM food f
WHERE f.name = '艾菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '艾菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 69, 'TFDA:E4600101 茼蒿'
FROM food f
WHERE f.name = '艾菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '艾菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 362, 'TFDA:E4600101 茼蒿'
FROM food f
WHERE f.name = '艾菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '艾菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 22, 'TFDA:E4600101 茼蒿'
FROM food f
WHERE f.name = '艾菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '艾菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:E4600101 茼蒿'
FROM food f
WHERE f.name = '艾菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '艾菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 94.7, 'TFDA:E4600101 茼蒿'
FROM food f
WHERE f.name = '艾菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '艾菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.44, 'TFDA:E4600101 茼蒿'
FROM food f
WHERE f.name = '艾菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '艾菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 46, 'TFDA:E4600101 茼蒿'
FROM food f
WHERE f.name = '艾菜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '艾菜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 17, 'USDA_FDC:169291 Squash, summer, zucchini, includes skin, raw'
FROM food f
WHERE f.name = '节瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '节瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.21, 'USDA_FDC:169291 Squash, summer, zucchini, includes skin, raw'
FROM food f
WHERE f.name = '节瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '节瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 3.11, 'USDA_FDC:169291 Squash, summer, zucchini, includes skin, raw'
FROM food f
WHERE f.name = '节瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '节瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.32, 'USDA_FDC:169291 Squash, summer, zucchini, includes skin, raw'
FROM food f
WHERE f.name = '节瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '节瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1, 'USDA_FDC:169291 Squash, summer, zucchini, includes skin, raw'
FROM food f
WHERE f.name = '节瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '节瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 8, 'USDA_FDC:169291 Squash, summer, zucchini, includes skin, raw'
FROM food f
WHERE f.name = '节瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '节瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 261, 'USDA_FDC:169291 Squash, summer, zucchini, includes skin, raw'
FROM food f
WHERE f.name = '节瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '节瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 38, 'USDA_FDC:169291 Squash, summer, zucchini, includes skin, raw'
FROM food f
WHERE f.name = '节瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '节瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169291 Squash, summer, zucchini, includes skin, raw'
FROM food f
WHERE f.name = '节瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '节瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.084, 'USDA_FDC:169291 Squash, summer, zucchini, includes skin, raw'
FROM food f
WHERE f.name = '节瓜'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '节瓜' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 23, 'USDA_FDC:169992 Chicory greens, raw'
FROM food f
WHERE f.name = '苦苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.7, 'USDA_FDC:169992 Chicory greens, raw'
FROM food f
WHERE f.name = '苦苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 4.7, 'USDA_FDC:169992 Chicory greens, raw'
FROM food f
WHERE f.name = '苦苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.3, 'USDA_FDC:169992 Chicory greens, raw'
FROM food f
WHERE f.name = '苦苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 4, 'USDA_FDC:169992 Chicory greens, raw'
FROM food f
WHERE f.name = '苦苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 45, 'USDA_FDC:169992 Chicory greens, raw'
FROM food f
WHERE f.name = '苦苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 420, 'USDA_FDC:169992 Chicory greens, raw'
FROM food f
WHERE f.name = '苦苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 47, 'USDA_FDC:169992 Chicory greens, raw'
FROM food f
WHERE f.name = '苦苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169992 Chicory greens, raw'
FROM food f
WHERE f.name = '苦苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.073, 'USDA_FDC:169992 Chicory greens, raw'
FROM food f
WHERE f.name = '苦苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 343, 'USDA_FDC:170286 Buckwheat'
FROM food f
WHERE f.name = '苦荞麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦荞麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 13.25, 'USDA_FDC:170286 Buckwheat'
FROM food f
WHERE f.name = '苦荞麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦荞麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 71.5, 'USDA_FDC:170286 Buckwheat'
FROM food f
WHERE f.name = '苦荞麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦荞麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.4, 'USDA_FDC:170286 Buckwheat'
FROM food f
WHERE f.name = '苦荞麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦荞麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 10, 'USDA_FDC:170286 Buckwheat'
FROM food f
WHERE f.name = '苦荞麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦荞麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'USDA_FDC:170286 Buckwheat'
FROM food f
WHERE f.name = '苦荞麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦荞麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 460, 'USDA_FDC:170286 Buckwheat'
FROM food f
WHERE f.name = '苦荞麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦荞麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 347, 'USDA_FDC:170286 Buckwheat'
FROM food f
WHERE f.name = '苦荞麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦荞麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170286 Buckwheat'
FROM food f
WHERE f.name = '苦荞麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦荞麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.741, 'USDA_FDC:170286 Buckwheat'
FROM food f
WHERE f.name = '苦荞麦'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苦荞麦' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 46, 'USDA_FDC:173933 Apple juice, canned or bottled, unsweetened, without added ascorbic acid'
FROM food f
WHERE f.name = '苹果汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苹果汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.1, 'USDA_FDC:173933 Apple juice, canned or bottled, unsweetened, without added ascorbic acid'
FROM food f
WHERE f.name = '苹果汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苹果汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 11.3, 'USDA_FDC:173933 Apple juice, canned or bottled, unsweetened, without added ascorbic acid'
FROM food f
WHERE f.name = '苹果汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苹果汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.13, 'USDA_FDC:173933 Apple juice, canned or bottled, unsweetened, without added ascorbic acid'
FROM food f
WHERE f.name = '苹果汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苹果汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.2, 'USDA_FDC:173933 Apple juice, canned or bottled, unsweetened, without added ascorbic acid'
FROM food f
WHERE f.name = '苹果汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苹果汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 4, 'USDA_FDC:173933 Apple juice, canned or bottled, unsweetened, without added ascorbic acid'
FROM food f
WHERE f.name = '苹果汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苹果汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 101, 'USDA_FDC:173933 Apple juice, canned or bottled, unsweetened, without added ascorbic acid'
FROM food f
WHERE f.name = '苹果汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苹果汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 7, 'USDA_FDC:173933 Apple juice, canned or bottled, unsweetened, without added ascorbic acid'
FROM food f
WHERE f.name = '苹果汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苹果汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:173933 Apple juice, canned or bottled, unsweetened, without added ascorbic acid'
FROM food f
WHERE f.name = '苹果汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苹果汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.022, 'USDA_FDC:173933 Apple juice, canned or bottled, unsweetened, without added ascorbic acid'
FROM food f
WHERE f.name = '苹果汁'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '苹果汁' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 36, 'TFDA:G0700101 柳松菇'
FROM food f
WHERE f.name = '茶树菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茶树菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 3.7, 'TFDA:G0700101 柳松菇'
FROM food f
WHERE f.name = '茶树菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茶树菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 6, 'TFDA:G0700101 柳松菇'
FROM food f
WHERE f.name = '茶树菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茶树菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.3, 'TFDA:G0700101 柳松菇'
FROM food f
WHERE f.name = '茶树菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茶树菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.5, 'TFDA:G0700101 柳松菇'
FROM food f
WHERE f.name = '茶树菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茶树菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 0, 'TFDA:G0700101 柳松菇'
FROM food f
WHERE f.name = '茶树菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茶树菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 334, 'TFDA:G0700101 柳松菇'
FROM food f
WHERE f.name = '茶树菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茶树菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 112, 'TFDA:G0700101 柳松菇'
FROM food f
WHERE f.name = '茶树菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茶树菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:G0700101 柳松菇'
FROM food f
WHERE f.name = '茶树菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茶树菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 89.2, 'TFDA:G0700101 柳松菇'
FROM food f
WHERE f.name = '茶树菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茶树菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0, 'TFDA:G0700101 柳松菇'
FROM food f
WHERE f.name = '茶树菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茶树菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 1, 'TFDA:G0700101 柳松菇'
FROM food f
WHERE f.name = '茶树菇'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '茶树菇' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 100, 'TFDA:J2101101 草對蝦'
FROM food f
WHERE f.name = '草虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '草虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 22, 'TFDA:J2101101 草對蝦'
FROM food f
WHERE f.name = '草虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '草虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 1, 'TFDA:J2101101 草對蝦'
FROM food f
WHERE f.name = '草虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '草虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.7, 'TFDA:J2101101 草對蝦'
FROM food f
WHERE f.name = '草虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '草虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 150, 'TFDA:J2101101 草對蝦'
FROM food f
WHERE f.name = '草虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '草虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 87, 'TFDA:J2101101 草對蝦'
FROM food f
WHERE f.name = '草虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '草虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 244, 'TFDA:J2101101 草對蝦'
FROM food f
WHERE f.name = '草虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '草虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 157, 'TFDA:J2101101 草對蝦'
FROM food f
WHERE f.name = '草虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '草虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.3, 'TFDA:J2101101 草對蝦'
FROM food f
WHERE f.name = '草虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '草虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 75.3, 'TFDA:J2101101 草對蝦'
FROM food f
WHERE f.name = '草虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '草虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.1, 'TFDA:J2101101 草對蝦'
FROM food f
WHERE f.name = '草虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '草虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 5, 'TFDA:J2101101 草對蝦'
FROM food f
WHERE f.name = '草虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '草虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 13, 'USDA_FDC:168429 Lettuce, butterhead (includes boston and bibb types), raw'
FROM food f
WHERE f.name = '莴苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莴苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.35, 'USDA_FDC:168429 Lettuce, butterhead (includes boston and bibb types), raw'
FROM food f
WHERE f.name = '莴苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莴苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 2.23, 'USDA_FDC:168429 Lettuce, butterhead (includes boston and bibb types), raw'
FROM food f
WHERE f.name = '莴苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莴苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.22, 'USDA_FDC:168429 Lettuce, butterhead (includes boston and bibb types), raw'
FROM food f
WHERE f.name = '莴苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莴苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.1, 'USDA_FDC:168429 Lettuce, butterhead (includes boston and bibb types), raw'
FROM food f
WHERE f.name = '莴苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莴苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 5, 'USDA_FDC:168429 Lettuce, butterhead (includes boston and bibb types), raw'
FROM food f
WHERE f.name = '莴苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莴苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 238, 'USDA_FDC:168429 Lettuce, butterhead (includes boston and bibb types), raw'
FROM food f
WHERE f.name = '莴苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莴苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 33, 'USDA_FDC:168429 Lettuce, butterhead (includes boston and bibb types), raw'
FROM food f
WHERE f.name = '莴苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莴苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:168429 Lettuce, butterhead (includes boston and bibb types), raw'
FROM food f
WHERE f.name = '莴苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莴苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.029, 'USDA_FDC:168429 Lettuce, butterhead (includes boston and bibb types), raw'
FROM food f
WHERE f.name = '莴苣'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '莴苣' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 58, 'TFDA:E0420101 蘿蔔乾'
FROM food f
WHERE f.name = '萝卜干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '萝卜干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.2, 'TFDA:E0420101 蘿蔔乾'
FROM food f
WHERE f.name = '萝卜干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '萝卜干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 10.8, 'TFDA:E0420101 蘿蔔乾'
FROM food f
WHERE f.name = '萝卜干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '萝卜干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.2, 'TFDA:E0420101 蘿蔔乾'
FROM food f
WHERE f.name = '萝卜干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '萝卜干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 7.2, 'TFDA:E0420101 蘿蔔乾'
FROM food f
WHERE f.name = '萝卜干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '萝卜干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 3279, 'TFDA:E0420101 蘿蔔乾'
FROM food f
WHERE f.name = '萝卜干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '萝卜干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 400, 'TFDA:E0420101 蘿蔔乾'
FROM food f
WHERE f.name = '萝卜干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '萝卜干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 34, 'TFDA:E0420101 蘿蔔乾'
FROM food f
WHERE f.name = '萝卜干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '萝卜干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 75.8, 'TFDA:E0420101 蘿蔔乾'
FROM food f
WHERE f.name = '萝卜干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '萝卜干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 92, 'TFDA:E0420101 蘿蔔乾'
FROM food f
WHERE f.name = '萝卜干'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '萝卜干' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 357, 'USDA_FDC:170684 Arrowroot flour'
FROM food f
WHERE f.name = '葛根'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葛根' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.3, 'USDA_FDC:170684 Arrowroot flour'
FROM food f
WHERE f.name = '葛根'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葛根' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 88.15, 'USDA_FDC:170684 Arrowroot flour'
FROM food f
WHERE f.name = '葛根'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葛根' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'USDA_FDC:170684 Arrowroot flour'
FROM food f
WHERE f.name = '葛根'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葛根' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.4, 'USDA_FDC:170684 Arrowroot flour'
FROM food f
WHERE f.name = '葛根'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葛根' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'USDA_FDC:170684 Arrowroot flour'
FROM food f
WHERE f.name = '葛根'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葛根' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 11, 'USDA_FDC:170684 Arrowroot flour'
FROM food f
WHERE f.name = '葛根'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葛根' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 5, 'USDA_FDC:170684 Arrowroot flour'
FROM food f
WHERE f.name = '葛根'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葛根' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170684 Arrowroot flour'
FROM food f
WHERE f.name = '葛根'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葛根' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.019, 'USDA_FDC:170684 Arrowroot flour'
FROM food f
WHERE f.name = '葛根'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葛根' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 584, 'USDA_FDC:170562 Seeds, sunflower seed kernels, dried'
FROM food f
WHERE f.name = '葵花籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葵花籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.78, 'USDA_FDC:170562 Seeds, sunflower seed kernels, dried'
FROM food f
WHERE f.name = '葵花籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葵花籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 20, 'USDA_FDC:170562 Seeds, sunflower seed kernels, dried'
FROM food f
WHERE f.name = '葵花籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葵花籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 51.46, 'USDA_FDC:170562 Seeds, sunflower seed kernels, dried'
FROM food f
WHERE f.name = '葵花籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葵花籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 8.6, 'USDA_FDC:170562 Seeds, sunflower seed kernels, dried'
FROM food f
WHERE f.name = '葵花籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葵花籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 9, 'USDA_FDC:170562 Seeds, sunflower seed kernels, dried'
FROM food f
WHERE f.name = '葵花籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葵花籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 645, 'USDA_FDC:170562 Seeds, sunflower seed kernels, dried'
FROM food f
WHERE f.name = '葵花籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葵花籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 660, 'USDA_FDC:170562 Seeds, sunflower seed kernels, dried'
FROM food f
WHERE f.name = '葵花籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葵花籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170562 Seeds, sunflower seed kernels, dried'
FROM food f
WHERE f.name = '葵花籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葵花籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 4.455, 'USDA_FDC:170562 Seeds, sunflower seed kernels, dried'
FROM food f
WHERE f.name = '葵花籽'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '葵花籽' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 149, 'USDA_FDC:169230 Garlic, raw'
FROM food f
WHERE f.name = '蒜薹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜薹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 6.36, 'USDA_FDC:169230 Garlic, raw'
FROM food f
WHERE f.name = '蒜薹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜薹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 33.06, 'USDA_FDC:169230 Garlic, raw'
FROM food f
WHERE f.name = '蒜薹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜薹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.5, 'USDA_FDC:169230 Garlic, raw'
FROM food f
WHERE f.name = '蒜薹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜薹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.1, 'USDA_FDC:169230 Garlic, raw'
FROM food f
WHERE f.name = '蒜薹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜薹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 17, 'USDA_FDC:169230 Garlic, raw'
FROM food f
WHERE f.name = '蒜薹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜薹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 401, 'USDA_FDC:169230 Garlic, raw'
FROM food f
WHERE f.name = '蒜薹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜薹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 153, 'USDA_FDC:169230 Garlic, raw'
FROM food f
WHERE f.name = '蒜薹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜薹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169230 Garlic, raw'
FROM food f
WHERE f.name = '蒜薹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜薹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.089, 'USDA_FDC:169230 Garlic, raw'
FROM food f
WHERE f.name = '蒜薹'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜薹' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 54, 'TFDA:E2100301 蒜苗'
FROM food f
WHERE f.name = '蒜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.2, 'TFDA:E2100301 蒜苗'
FROM food f
WHERE f.name = '蒜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 12, 'TFDA:E2100301 蒜苗'
FROM food f
WHERE f.name = '蒜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:E2100301 蒜苗'
FROM food f
WHERE f.name = '蒜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.3, 'TFDA:E2100301 蒜苗'
FROM food f
WHERE f.name = '蒜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 9, 'TFDA:E2100301 蒜苗'
FROM food f
WHERE f.name = '蒜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 198, 'TFDA:E2100301 蒜苗'
FROM food f
WHERE f.name = '蒜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 52, 'TFDA:E2100301 蒜苗'
FROM food f
WHERE f.name = '蒜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 85.1, 'TFDA:E2100301 蒜苗'
FROM food f
WHERE f.name = '蒜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.22, 'TFDA:E2100301 蒜苗'
FROM food f
WHERE f.name = '蒜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 20, 'TFDA:E2100301 蒜苗'
FROM food f
WHERE f.name = '蒜黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蒜黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 378, 'TFDA:A1000101 薏仁'
FROM food f
WHERE f.name = '薏米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '薏米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 14.1, 'TFDA:A1000101 薏仁'
FROM food f
WHERE f.name = '薏米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '薏米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 66.2, 'TFDA:A1000101 薏仁'
FROM food f
WHERE f.name = '薏米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '薏米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 6.1, 'TFDA:A1000101 薏仁'
FROM food f
WHERE f.name = '薏米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '薏米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.8, 'TFDA:A1000101 薏仁'
FROM food f
WHERE f.name = '薏米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '薏米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'TFDA:A1000101 薏仁'
FROM food f
WHERE f.name = '薏米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '薏米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 251, 'TFDA:A1000101 薏仁'
FROM food f
WHERE f.name = '薏米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '薏米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 301, 'TFDA:A1000101 薏仁'
FROM food f
WHERE f.name = '薏米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '薏米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.9, 'TFDA:A1000101 薏仁'
FROM food f
WHERE f.name = '薏米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '薏米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 11.5, 'TFDA:A1000101 薏仁'
FROM food f
WHERE f.name = '薏米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '薏米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 2.86, 'TFDA:A1000101 薏仁'
FROM food f
WHERE f.name = '薏米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '薏米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 19, 'TFDA:A1000101 薏仁'
FROM food f
WHERE f.name = '薏米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '薏米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 86, 'USDA_FDC:174214 Mollusks, clam, mixed species, raw'
FROM food f
WHERE f.name = '蚬子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蚬子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 14.67, 'USDA_FDC:174214 Mollusks, clam, mixed species, raw'
FROM food f
WHERE f.name = '蚬子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蚬子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 3.57, 'USDA_FDC:174214 Mollusks, clam, mixed species, raw'
FROM food f
WHERE f.name = '蚬子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蚬子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.96, 'USDA_FDC:174214 Mollusks, clam, mixed species, raw'
FROM food f
WHERE f.name = '蚬子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蚬子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:174214 Mollusks, clam, mixed species, raw'
FROM food f
WHERE f.name = '蚬子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蚬子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 601, 'USDA_FDC:174214 Mollusks, clam, mixed species, raw'
FROM food f
WHERE f.name = '蚬子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蚬子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 46, 'USDA_FDC:174214 Mollusks, clam, mixed species, raw'
FROM food f
WHERE f.name = '蚬子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蚬子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 198, 'USDA_FDC:174214 Mollusks, clam, mixed species, raw'
FROM food f
WHERE f.name = '蚬子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蚬子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 30, 'USDA_FDC:174214 Mollusks, clam, mixed species, raw'
FROM food f
WHERE f.name = '蚬子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蚬子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.187, 'USDA_FDC:174214 Mollusks, clam, mixed species, raw'
FROM food f
WHERE f.name = '蚬子'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '蚬子' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 371, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '螺旋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '螺旋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 13.04, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '螺旋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '螺旋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 74.67, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '螺旋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '螺旋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.51, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '螺旋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '螺旋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.2, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '螺旋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '螺旋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 6, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '螺旋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '螺旋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 223, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '螺旋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '螺旋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 189, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '螺旋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '螺旋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '螺旋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '螺旋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.277, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '螺旋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '螺旋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 200, 'TFDA:I0106101 去骨紐約克牛排'
FROM food f
WHERE f.name = '西冷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西冷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 21.3, 'TFDA:I0106101 去骨紐約克牛排'
FROM food f
WHERE f.name = '西冷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西冷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:I0106101 去骨紐約克牛排'
FROM food f
WHERE f.name = '西冷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西冷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 12, 'TFDA:I0106101 去骨紐約克牛排'
FROM food f
WHERE f.name = '西冷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西冷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 49, 'TFDA:I0106101 去骨紐約克牛排'
FROM food f
WHERE f.name = '西冷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西冷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 411, 'TFDA:I0106101 去骨紐約克牛排'
FROM food f
WHERE f.name = '西冷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西冷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 199, 'TFDA:I0106101 去骨紐約克牛排'
FROM food f
WHERE f.name = '西冷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西冷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 60, 'TFDA:I0106101 去骨紐約克牛排'
FROM food f
WHERE f.name = '西冷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西冷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 5.9, 'TFDA:I0106101 去骨紐約克牛排'
FROM food f
WHERE f.name = '西冷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西冷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 69.4, 'TFDA:I0106101 去骨紐約克牛排'
FROM food f
WHERE f.name = '西冷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西冷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.25, 'TFDA:I0106101 去骨紐約克牛排'
FROM food f
WHERE f.name = '西冷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西冷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 6, 'TFDA:I0106101 去骨紐約克牛排'
FROM food f
WHERE f.name = '西冷'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西冷' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 240, 'USDA_FDC:168162 Plums, dried (prunes), uncooked'
FROM food f
WHERE f.name = '西梅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西梅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 2.18, 'USDA_FDC:168162 Plums, dried (prunes), uncooked'
FROM food f
WHERE f.name = '西梅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西梅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 63.88, 'USDA_FDC:168162 Plums, dried (prunes), uncooked'
FROM food f
WHERE f.name = '西梅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西梅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.38, 'USDA_FDC:168162 Plums, dried (prunes), uncooked'
FROM food f
WHERE f.name = '西梅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西梅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 7.1, 'USDA_FDC:168162 Plums, dried (prunes), uncooked'
FROM food f
WHERE f.name = '西梅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西梅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'USDA_FDC:168162 Plums, dried (prunes), uncooked'
FROM food f
WHERE f.name = '西梅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西梅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 732, 'USDA_FDC:168162 Plums, dried (prunes), uncooked'
FROM food f
WHERE f.name = '西梅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西梅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 69, 'USDA_FDC:168162 Plums, dried (prunes), uncooked'
FROM food f
WHERE f.name = '西梅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西梅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:168162 Plums, dried (prunes), uncooked'
FROM food f
WHERE f.name = '西梅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西梅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.088, 'USDA_FDC:168162 Plums, dried (prunes), uncooked'
FROM food f
WHERE f.name = '西梅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西梅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 358, 'USDA_FDC:169717 Tapioca, pearl, dry'
FROM food f
WHERE f.name = '西米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.19, 'USDA_FDC:169717 Tapioca, pearl, dry'
FROM food f
WHERE f.name = '西米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 88.69, 'USDA_FDC:169717 Tapioca, pearl, dry'
FROM food f
WHERE f.name = '西米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.02, 'USDA_FDC:169717 Tapioca, pearl, dry'
FROM food f
WHERE f.name = '西米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0.9, 'USDA_FDC:169717 Tapioca, pearl, dry'
FROM food f
WHERE f.name = '西米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'USDA_FDC:169717 Tapioca, pearl, dry'
FROM food f
WHERE f.name = '西米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 11, 'USDA_FDC:169717 Tapioca, pearl, dry'
FROM food f
WHERE f.name = '西米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 7, 'USDA_FDC:169717 Tapioca, pearl, dry'
FROM food f
WHERE f.name = '西米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169717 Tapioca, pearl, dry'
FROM food f
WHERE f.name = '西米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.005, 'USDA_FDC:169717 Tapioca, pearl, dry'
FROM food f
WHERE f.name = '西米'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '西米' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 371, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '贝壳面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贝壳面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 13.04, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '贝壳面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贝壳面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 74.67, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '贝壳面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贝壳面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.51, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '贝壳面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贝壳面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.2, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '贝壳面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贝壳面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 6, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '贝壳面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贝壳面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 223, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '贝壳面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贝壳面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 189, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '贝壳面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贝壳面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '贝壳面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贝壳面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.277, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '贝壳面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '贝壳面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 371, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '通心粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 13.04, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '通心粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 74.67, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '通心粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.51, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '通心粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.2, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '通心粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 6, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '通心粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 223, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '通心粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 189, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '通心粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '通心粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.277, 'USDA_FDC:168927 Pasta, dry, unenriched'
FROM food f
WHERE f.name = '通心粉'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心粉' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 359, 'TFDA:R2000401 通心麵'
FROM food f
WHERE f.name = '通心面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 13.8, 'TFDA:R2000401 通心麵'
FROM food f
WHERE f.name = '通心面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 72.6, 'TFDA:R2000401 通心麵'
FROM food f
WHERE f.name = '通心面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.4, 'TFDA:R2000401 通心麵'
FROM food f
WHERE f.name = '通心面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.8, 'TFDA:R2000401 通心麵'
FROM food f
WHERE f.name = '通心面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 25, 'TFDA:R2000401 通心麵'
FROM food f
WHERE f.name = '通心面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 171, 'TFDA:R2000401 通心麵'
FROM food f
WHERE f.name = '通心面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 136, 'TFDA:R2000401 通心麵'
FROM food f
WHERE f.name = '通心面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.3, 'TFDA:R2000401 通心麵'
FROM food f
WHERE f.name = '通心面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 11.5, 'TFDA:R2000401 通心麵'
FROM food f
WHERE f.name = '通心面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.87, 'TFDA:R2000401 通心麵'
FROM food f
WHERE f.name = '通心面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 12, 'TFDA:R2000401 通心麵'
FROM food f
WHERE f.name = '通心面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '通心面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 30, 'USDA_FDC:168155 Limes, raw'
FROM food f
WHERE f.name = '酸橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.7, 'USDA_FDC:168155 Limes, raw'
FROM food f
WHERE f.name = '酸橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 10.54, 'USDA_FDC:168155 Limes, raw'
FROM food f
WHERE f.name = '酸橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'USDA_FDC:168155 Limes, raw'
FROM food f
WHERE f.name = '酸橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.8, 'USDA_FDC:168155 Limes, raw'
FROM food f
WHERE f.name = '酸橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 2, 'USDA_FDC:168155 Limes, raw'
FROM food f
WHERE f.name = '酸橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 102, 'USDA_FDC:168155 Limes, raw'
FROM food f
WHERE f.name = '酸橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 18, 'USDA_FDC:168155 Limes, raw'
FROM food f
WHERE f.name = '酸橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:168155 Limes, raw'
FROM food f
WHERE f.name = '酸橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.022, 'USDA_FDC:168155 Limes, raw'
FROM food f
WHERE f.name = '酸橙'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '酸橙' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 57, 'USDA_FDC:169118 Pears, raw'
FROM food f
WHERE f.name = '雪梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0.36, 'USDA_FDC:169118 Pears, raw'
FROM food f
WHERE f.name = '雪梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 15.23, 'USDA_FDC:169118 Pears, raw'
FROM food f
WHERE f.name = '雪梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.14, 'USDA_FDC:169118 Pears, raw'
FROM food f
WHERE f.name = '雪梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.1, 'USDA_FDC:169118 Pears, raw'
FROM food f
WHERE f.name = '雪梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 1, 'USDA_FDC:169118 Pears, raw'
FROM food f
WHERE f.name = '雪梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 116, 'USDA_FDC:169118 Pears, raw'
FROM food f
WHERE f.name = '雪梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 12, 'USDA_FDC:169118 Pears, raw'
FROM food f
WHERE f.name = '雪梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:169118 Pears, raw'
FROM food f
WHERE f.name = '雪梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.022, 'USDA_FDC:169118 Pears, raw'
FROM food f
WHERE f.name = '雪梨'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '雪梨' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 354, 'USDA_FDC:170283 Barley, hulled'
FROM food f
WHERE f.name = '青稞'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青稞' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 12.48, 'USDA_FDC:170283 Barley, hulled'
FROM food f
WHERE f.name = '青稞'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青稞' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 73.48, 'USDA_FDC:170283 Barley, hulled'
FROM food f
WHERE f.name = '青稞'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青稞' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2.3, 'USDA_FDC:170283 Barley, hulled'
FROM food f
WHERE f.name = '青稞'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青稞' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 17.3, 'USDA_FDC:170283 Barley, hulled'
FROM food f
WHERE f.name = '青稞'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青稞' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 12, 'USDA_FDC:170283 Barley, hulled'
FROM food f
WHERE f.name = '青稞'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青稞' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 452, 'USDA_FDC:170283 Barley, hulled'
FROM food f
WHERE f.name = '青稞'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青稞' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 264, 'USDA_FDC:170283 Barley, hulled'
FROM food f
WHERE f.name = '青稞'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青稞' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'USDA_FDC:170283 Barley, hulled'
FROM food f
WHERE f.name = '青稞'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青稞' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.482, 'USDA_FDC:170283 Barley, hulled'
FROM food f
WHERE f.name = '青稞'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青稞' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 84, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '青虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 19.3, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '青虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 1, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '青虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.2, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '青虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 196, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '青虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 306, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '青虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 278, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '青虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 156, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '青虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '青虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 77.9, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '青虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.62, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '青虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 20, 'TFDA:J2100701 中國對蝦'
FROM food f
WHERE f.name = '青虾'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '青虾' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 384, 'USDA_FDC:169731 Noodles, egg, dry, enriched'
FROM food f
WHERE f.name = '面条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 14.16, 'USDA_FDC:169731 Noodles, egg, dry, enriched'
FROM food f
WHERE f.name = '面条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 71.27, 'USDA_FDC:169731 Noodles, egg, dry, enriched'
FROM food f
WHERE f.name = '面条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 4.44, 'USDA_FDC:169731 Noodles, egg, dry, enriched'
FROM food f
WHERE f.name = '面条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 3.3, 'USDA_FDC:169731 Noodles, egg, dry, enriched'
FROM food f
WHERE f.name = '面条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 21, 'USDA_FDC:169731 Noodles, egg, dry, enriched'
FROM food f
WHERE f.name = '面条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 244, 'USDA_FDC:169731 Noodles, egg, dry, enriched'
FROM food f
WHERE f.name = '面条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 241, 'USDA_FDC:169731 Noodles, egg, dry, enriched'
FROM food f
WHERE f.name = '面条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 84, 'USDA_FDC:169731 Noodles, egg, dry, enriched'
FROM food f
WHERE f.name = '面条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.18, 'USDA_FDC:169731 Noodles, egg, dry, enriched'
FROM food f
WHERE f.name = '面条'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '面条' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 16, 'TFDA:E2600301 韮黃'
FROM food f
WHERE f.name = '韭黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '韭黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 1.5, 'TFDA:E2600301 韮黃'
FROM food f
WHERE f.name = '韭黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '韭黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 2.9, 'TFDA:E2600301 韮黃'
FROM food f
WHERE f.name = '韭黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '韭黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:E2600301 韮黃'
FROM food f
WHERE f.name = '韭黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '韭黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 1.7, 'TFDA:E2600301 韮黃'
FROM food f
WHERE f.name = '韭黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '韭黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 3, 'TFDA:E2600301 韮黃'
FROM food f
WHERE f.name = '韭黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '韭黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 158, 'TFDA:E2600301 韮黃'
FROM food f
WHERE f.name = '韭黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '韭黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 26, 'TFDA:E2600301 韮黃'
FROM food f
WHERE f.name = '韭黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '韭黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 95.1, 'TFDA:E2600301 韮黃'
FROM food f
WHERE f.name = '韭黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '韭黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.12, 'TFDA:E2600301 韮黃'
FROM food f
WHERE f.name = '韭黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '韭黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 19, 'TFDA:E2600301 韮黃'
FROM food f
WHERE f.name = '韭黄'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '韭黄' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 69, 'TFDA:J3501301 鮑魚'
FROM food f
WHERE f.name = '鲍鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲍鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 15.8, 'TFDA:J3501301 鮑魚'
FROM food f
WHERE f.name = '鲍鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲍鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 9.5, 'TFDA:J3501301 鮑魚'
FROM food f
WHERE f.name = '鲍鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲍鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.1, 'TFDA:J3501301 鮑魚'
FROM food f
WHERE f.name = '鲍鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲍鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 199, 'TFDA:J3501301 鮑魚'
FROM food f
WHERE f.name = '鲍鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲍鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 243, 'TFDA:J3501301 鮑魚'
FROM food f
WHERE f.name = '鲍鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲍鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 96, 'TFDA:J3501301 鮑魚'
FROM food f
WHERE f.name = '鲍鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲍鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 53, 'TFDA:J3501301 鮑魚'
FROM food f
WHERE f.name = '鲍鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲍鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0, 'TFDA:J3501301 鮑魚'
FROM food f
WHERE f.name = '鲍鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲍鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 73.1, 'TFDA:J3501301 鮑魚'
FROM food f
WHERE f.name = '鲍鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲍鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.43, 'TFDA:J3501301 鮑魚'
FROM food f
WHERE f.name = '鲍鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲍鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 34, 'TFDA:J3501301 鮑魚'
FROM food f
WHERE f.name = '鲍鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲍鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 119, 'USDA_FDC:175165 Fish, catfish, channel, farmed, raw'
FROM food f
WHERE f.name = '鲶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 15.23, 'USDA_FDC:175165 Fish, catfish, channel, farmed, raw'
FROM food f
WHERE f.name = '鲶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:175165 Fish, catfish, channel, farmed, raw'
FROM food f
WHERE f.name = '鲶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 5.94, 'USDA_FDC:175165 Fish, catfish, channel, farmed, raw'
FROM food f
WHERE f.name = '鲶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:175165 Fish, catfish, channel, farmed, raw'
FROM food f
WHERE f.name = '鲶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 98, 'USDA_FDC:175165 Fish, catfish, channel, farmed, raw'
FROM food f
WHERE f.name = '鲶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 302, 'USDA_FDC:175165 Fish, catfish, channel, farmed, raw'
FROM food f
WHERE f.name = '鲶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 204, 'USDA_FDC:175165 Fish, catfish, channel, farmed, raw'
FROM food f
WHERE f.name = '鲶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 55, 'USDA_FDC:175165 Fish, catfish, channel, farmed, raw'
FROM food f
WHERE f.name = '鲶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.31, 'USDA_FDC:175165 Fish, catfish, channel, farmed, raw'
FROM food f
WHERE f.name = '鲶鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鲶鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 116, 'USDA_FDC:173614 Chicken, broilers or fryers, dark meat, drumstick, meat only, raw'
FROM food f
WHERE f.name = '鸡小腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡小腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 19.41, 'USDA_FDC:173614 Chicken, broilers or fryers, dark meat, drumstick, meat only, raw'
FROM food f
WHERE f.name = '鸡小腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡小腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:173614 Chicken, broilers or fryers, dark meat, drumstick, meat only, raw'
FROM food f
WHERE f.name = '鸡小腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡小腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.71, 'USDA_FDC:173614 Chicken, broilers or fryers, dark meat, drumstick, meat only, raw'
FROM food f
WHERE f.name = '鸡小腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡小腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:173614 Chicken, broilers or fryers, dark meat, drumstick, meat only, raw'
FROM food f
WHERE f.name = '鸡小腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡小腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 114, 'USDA_FDC:173614 Chicken, broilers or fryers, dark meat, drumstick, meat only, raw'
FROM food f
WHERE f.name = '鸡小腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡小腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 225, 'USDA_FDC:173614 Chicken, broilers or fryers, dark meat, drumstick, meat only, raw'
FROM food f
WHERE f.name = '鸡小腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡小腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 174, 'USDA_FDC:173614 Chicken, broilers or fryers, dark meat, drumstick, meat only, raw'
FROM food f
WHERE f.name = '鸡小腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡小腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 89, 'USDA_FDC:173614 Chicken, broilers or fryers, dark meat, drumstick, meat only, raw'
FROM food f
WHERE f.name = '鸡小腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡小腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.949, 'USDA_FDC:173614 Chicken, broilers or fryers, dark meat, drumstick, meat only, raw'
FROM food f
WHERE f.name = '鸡小腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡小腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 153, 'USDA_FDC:171458 Chicken, heart, all classes, raw'
FROM food f
WHERE f.name = '鸡心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 15.55, 'USDA_FDC:171458 Chicken, heart, all classes, raw'
FROM food f
WHERE f.name = '鸡心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.71, 'USDA_FDC:171458 Chicken, heart, all classes, raw'
FROM food f
WHERE f.name = '鸡心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 9.33, 'USDA_FDC:171458 Chicken, heart, all classes, raw'
FROM food f
WHERE f.name = '鸡心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:171458 Chicken, heart, all classes, raw'
FROM food f
WHERE f.name = '鸡心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 74, 'USDA_FDC:171458 Chicken, heart, all classes, raw'
FROM food f
WHERE f.name = '鸡心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 176, 'USDA_FDC:171458 Chicken, heart, all classes, raw'
FROM food f
WHERE f.name = '鸡心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 177, 'USDA_FDC:171458 Chicken, heart, all classes, raw'
FROM food f
WHERE f.name = '鸡心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 136, 'USDA_FDC:171458 Chicken, heart, all classes, raw'
FROM food f
WHERE f.name = '鸡心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.66, 'USDA_FDC:171458 Chicken, heart, all classes, raw'
FROM food f
WHERE f.name = '鸡心'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡心' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 891, 'TFDA:M0300101 雞油'
FROM food f
WHERE f.name = '鸡油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 0, 'TFDA:M0300101 雞油'
FROM food f
WHERE f.name = '鸡油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:M0300101 雞油'
FROM food f
WHERE f.name = '鸡油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 99.8, 'TFDA:M0300101 雞油'
FROM food f
WHERE f.name = '鸡油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 70, 'TFDA:M0300101 雞油'
FROM food f
WHERE f.name = '鸡油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 32.5, 'TFDA:M0300101 雞油'
FROM food f
WHERE f.name = '鸡油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 0.3, 'TFDA:M0300101 雞油'
FROM food f
WHERE f.name = '鸡油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.77, 'TFDA:M0300101 雞油'
FROM food f
WHERE f.name = '鸡油'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡油' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 349, 'USDA_FDC:171452 Chicken, broilers or fryers, skin only, raw'
FROM food f
WHERE f.name = '鸡皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 13.33, 'USDA_FDC:171452 Chicken, broilers or fryers, skin only, raw'
FROM food f
WHERE f.name = '鸡皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:171452 Chicken, broilers or fryers, skin only, raw'
FROM food f
WHERE f.name = '鸡皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 32.35, 'USDA_FDC:171452 Chicken, broilers or fryers, skin only, raw'
FROM food f
WHERE f.name = '鸡皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:171452 Chicken, broilers or fryers, skin only, raw'
FROM food f
WHERE f.name = '鸡皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 63, 'USDA_FDC:171452 Chicken, broilers or fryers, skin only, raw'
FROM food f
WHERE f.name = '鸡皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 103, 'USDA_FDC:171452 Chicken, broilers or fryers, skin only, raw'
FROM food f
WHERE f.name = '鸡皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 100, 'USDA_FDC:171452 Chicken, broilers or fryers, skin only, raw'
FROM food f
WHERE f.name = '鸡皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 109, 'USDA_FDC:171452 Chicken, broilers or fryers, skin only, raw'
FROM food f
WHERE f.name = '鸡皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 9.08, 'USDA_FDC:171452 Chicken, broilers or fryers, skin only, raw'
FROM food f
WHERE f.name = '鸡皮'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡皮' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 191, 'USDA_FDC:172390 Chicken, broilers or fryers, wing, meat and skin, raw'
FROM food f
WHERE f.name = '鸡翅中'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡翅中' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 17.52, 'USDA_FDC:172390 Chicken, broilers or fryers, wing, meat and skin, raw'
FROM food f
WHERE f.name = '鸡翅中'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡翅中' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:172390 Chicken, broilers or fryers, wing, meat and skin, raw'
FROM food f
WHERE f.name = '鸡翅中'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡翅中' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 12.85, 'USDA_FDC:172390 Chicken, broilers or fryers, wing, meat and skin, raw'
FROM food f
WHERE f.name = '鸡翅中'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡翅中' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:172390 Chicken, broilers or fryers, wing, meat and skin, raw'
FROM food f
WHERE f.name = '鸡翅中'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡翅中' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 84, 'USDA_FDC:172390 Chicken, broilers or fryers, wing, meat and skin, raw'
FROM food f
WHERE f.name = '鸡翅中'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡翅中' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 187, 'USDA_FDC:172390 Chicken, broilers or fryers, wing, meat and skin, raw'
FROM food f
WHERE f.name = '鸡翅中'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡翅中' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 123, 'USDA_FDC:172390 Chicken, broilers or fryers, wing, meat and skin, raw'
FROM food f
WHERE f.name = '鸡翅中'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡翅中' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 111, 'USDA_FDC:172390 Chicken, broilers or fryers, wing, meat and skin, raw'
FROM food f
WHERE f.name = '鸡翅中'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡翅中' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 3.535, 'USDA_FDC:172390 Chicken, broilers or fryers, wing, meat and skin, raw'
FROM food f
WHERE f.name = '鸡翅中'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡翅中' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 119, 'USDA_FDC:171060 Chicken, liver, all classes, raw'
FROM food f
WHERE f.name = '鸡肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 16.92, 'USDA_FDC:171060 Chicken, liver, all classes, raw'
FROM food f
WHERE f.name = '鸡肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.73, 'USDA_FDC:171060 Chicken, liver, all classes, raw'
FROM food f
WHERE f.name = '鸡肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 4.83, 'USDA_FDC:171060 Chicken, liver, all classes, raw'
FROM food f
WHERE f.name = '鸡肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:171060 Chicken, liver, all classes, raw'
FROM food f
WHERE f.name = '鸡肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 71, 'USDA_FDC:171060 Chicken, liver, all classes, raw'
FROM food f
WHERE f.name = '鸡肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 230, 'USDA_FDC:171060 Chicken, liver, all classes, raw'
FROM food f
WHERE f.name = '鸡肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 297, 'USDA_FDC:171060 Chicken, liver, all classes, raw'
FROM food f
WHERE f.name = '鸡肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 345, 'USDA_FDC:171060 Chicken, liver, all classes, raw'
FROM food f
WHERE f.name = '鸡肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.563, 'USDA_FDC:171060 Chicken, liver, all classes, raw'
FROM food f
WHERE f.name = '鸡肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 358, 'TFDA:R2000701 雞蛋麵'
FROM food f
WHERE f.name = '鸡蛋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡蛋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 12.5, 'TFDA:R2000701 雞蛋麵'
FROM food f
WHERE f.name = '鸡蛋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡蛋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 74.8, 'TFDA:R2000701 雞蛋麵'
FROM food f
WHERE f.name = '鸡蛋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡蛋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.9, 'TFDA:R2000701 雞蛋麵'
FROM food f
WHERE f.name = '鸡蛋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡蛋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 2.8, 'TFDA:R2000701 雞蛋麵'
FROM food f
WHERE f.name = '鸡蛋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡蛋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 467, 'TFDA:R2000701 雞蛋麵'
FROM food f
WHERE f.name = '鸡蛋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡蛋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 132, 'TFDA:R2000701 雞蛋麵'
FROM food f
WHERE f.name = '鸡蛋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡蛋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 127, 'TFDA:R2000701 雞蛋麵'
FROM food f
WHERE f.name = '鸡蛋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡蛋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 0, 'TFDA:R2000701 雞蛋麵'
FROM food f
WHERE f.name = '鸡蛋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡蛋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.2, 'TFDA:R2000701 雞蛋麵'
FROM food f
WHERE f.name = '鸡蛋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡蛋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 10.4, 'TFDA:R2000701 雞蛋麵'
FROM food f
WHERE f.name = '鸡蛋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡蛋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.15, 'TFDA:R2000701 雞蛋麵'
FROM food f
WHERE f.name = '鸡蛋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡蛋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 5, 'TFDA:R2000701 雞蛋麵'
FROM food f
WHERE f.name = '鸡蛋面'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸡蛋面' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 170, 'TFDA:I0520601 鴨翅'
FROM food f
WHERE f.name = '鸭翅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭翅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 22.8, 'TFDA:I0520601 鴨翅'
FROM food f
WHERE f.name = '鸭翅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭翅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:I0520601 鴨翅'
FROM food f
WHERE f.name = '鸭翅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭翅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 8.1, 'TFDA:I0520601 鴨翅'
FROM food f
WHERE f.name = '鸭翅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭翅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'TFDA:I0520601 鴨翅'
FROM food f
WHERE f.name = '鸭翅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭翅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 67, 'TFDA:I0520601 鴨翅'
FROM food f
WHERE f.name = '鸭翅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭翅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 141, 'TFDA:I0520601 鴨翅'
FROM food f
WHERE f.name = '鸭翅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭翅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 100, 'TFDA:I0520601 鴨翅'
FROM food f
WHERE f.name = '鸭翅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭翅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 132, 'TFDA:I0520601 鴨翅'
FROM food f
WHERE f.name = '鸭翅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭翅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.4, 'TFDA:I0520601 鴨翅'
FROM food f
WHERE f.name = '鸭翅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭翅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 71.7, 'TFDA:I0520601 鴨翅'
FROM food f
WHERE f.name = '鸭翅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭翅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.74, 'TFDA:I0520601 鴨翅'
FROM food f
WHERE f.name = '鸭翅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭翅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 14, 'TFDA:I0520601 鴨翅'
FROM food f
WHERE f.name = '鸭翅'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭翅' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 94, 'TFDA:I0520401 鴨腸'
FROM food f
WHERE f.name = '鸭肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 13.8, 'TFDA:I0520401 鴨腸'
FROM food f
WHERE f.name = '鸭肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:I0520401 鴨腸'
FROM food f
WHERE f.name = '鸭肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.9, 'TFDA:I0520401 鴨腸'
FROM food f
WHERE f.name = '鸭肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 53, 'TFDA:I0520401 鴨腸'
FROM food f
WHERE f.name = '鸭肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 3, 'TFDA:I0520401 鴨腸'
FROM food f
WHERE f.name = '鸭肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 93, 'TFDA:I0520401 鴨腸'
FROM food f
WHERE f.name = '鸭肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 285, 'TFDA:I0520401 鴨腸'
FROM food f
WHERE f.name = '鸭肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.5, 'TFDA:I0520401 鴨腸'
FROM food f
WHERE f.name = '鸭肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 82.8, 'TFDA:I0520401 鴨腸'
FROM food f
WHERE f.name = '鸭肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.08, 'TFDA:I0520401 鴨腸'
FROM food f
WHERE f.name = '鸭肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 27, 'TFDA:I0520401 鴨腸'
FROM food f
WHERE f.name = '鸭肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 97, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭肫'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肫' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.5, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭肫'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肫' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.3, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭肫'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肫' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.1, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭肫'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肫' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 79, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭肫'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肫' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 324, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭肫'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肫' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 112, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭肫'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肫' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 187, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭肫'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肫' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.4, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭肫'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肫' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 77.2, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭肫'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肫' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.2, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭肫'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肫' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 3, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭肫'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭肫' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 97, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.5, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.3, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 1.1, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 79, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 324, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 112, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 187, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.4, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 77.2, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.2, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 3, 'TFDA:I0520201 鴨胗'
FROM food f
WHERE f.name = '鸭胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 282, 'TFDA:I0504101 鴨腿'
FROM food f
WHERE f.name = '鸭腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 14.4, 'TFDA:I0504101 鴨腿'
FROM food f
WHERE f.name = '鸭腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 3.4, 'TFDA:I0504101 鴨腿'
FROM food f
WHERE f.name = '鸭腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 24.5, 'TFDA:I0504101 鴨腿'
FROM food f
WHERE f.name = '鸭腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 48, 'TFDA:I0504101 鴨腿'
FROM food f
WHERE f.name = '鸭腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 243, 'TFDA:I0504101 鴨腿'
FROM food f
WHERE f.name = '鸭腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 148, 'TFDA:I0504101 鴨腿'
FROM food f
WHERE f.name = '鸭腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 76, 'TFDA:I0504101 鴨腿'
FROM food f
WHERE f.name = '鸭腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 7.7, 'TFDA:I0504101 鴨腿'
FROM food f
WHERE f.name = '鸭腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 57.1, 'TFDA:I0504101 鴨腿'
FROM food f
WHERE f.name = '鸭腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.08, 'TFDA:I0504101 鴨腿'
FROM food f
WHERE f.name = '鸭腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 6, 'TFDA:I0504101 鴨腿'
FROM food f
WHERE f.name = '鸭腿'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭腿' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 187, 'TFDA:I0520801 鴨舌'
FROM food f
WHERE f.name = '鸭舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 16, 'TFDA:I0520801 鴨舌'
FROM food f
WHERE f.name = '鸭舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:I0520801 鴨舌'
FROM food f
WHERE f.name = '鸭舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 13.2, 'TFDA:I0520801 鴨舌'
FROM food f
WHERE f.name = '鸭舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'TFDA:I0520801 鴨舌'
FROM food f
WHERE f.name = '鸭舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 57, 'TFDA:I0520801 鴨舌'
FROM food f
WHERE f.name = '鸭舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 67, 'TFDA:I0520801 鴨舌'
FROM food f
WHERE f.name = '鸭舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 339, 'TFDA:I0520801 鴨舌'
FROM food f
WHERE f.name = '鸭舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 154, 'TFDA:I0520801 鴨舌'
FROM food f
WHERE f.name = '鸭舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 2.8, 'TFDA:I0520801 鴨舌'
FROM food f
WHERE f.name = '鸭舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 69.4, 'TFDA:I0520801 鴨舌'
FROM food f
WHERE f.name = '鸭舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.57, 'TFDA:I0520801 鴨舌'
FROM food f
WHERE f.name = '鸭舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 623, 'TFDA:I0520801 鴨舌'
FROM food f
WHERE f.name = '鸭舌'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭舌' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 29, 'TFDA:I0520101 鴨血'
FROM food f
WHERE f.name = '鸭血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 6, 'TFDA:I0520101 鴨血'
FROM food f
WHERE f.name = '鸭血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'TFDA:I0520101 鴨血'
FROM food f
WHERE f.name = '鸭血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.3, 'TFDA:I0520101 鴨血'
FROM food f
WHERE f.name = '鸭血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 131, 'TFDA:I0520101 鴨血'
FROM food f
WHERE f.name = '鸭血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 9, 'TFDA:I0520101 鴨血'
FROM food f
WHERE f.name = '鸭血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 32, 'TFDA:I0520101 鴨血'
FROM food f
WHERE f.name = '鸭血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 41, 'TFDA:I0520101 鴨血'
FROM food f
WHERE f.name = '鸭血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.1, 'TFDA:I0520101 鴨血'
FROM food f
WHERE f.name = '鸭血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 93.7, 'TFDA:I0520101 鴨血'
FROM food f
WHERE f.name = '鸭血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.03, 'TFDA:I0520101 鴨血'
FROM food f
WHERE f.name = '鸭血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 5, 'TFDA:I0520101 鴨血'
FROM food f
WHERE f.name = '鸭血'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸭血' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 96, 'TFDA:K0400101 鴿蛋'
FROM food f
WHERE f.name = '鸽蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸽蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 10.2, 'TFDA:K0400101 鴿蛋'
FROM food f
WHERE f.name = '鸽蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸽蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 2.5, 'TFDA:K0400101 鴿蛋'
FROM food f
WHERE f.name = '鸽蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸽蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 5.7, 'TFDA:K0400101 鴿蛋'
FROM food f
WHERE f.name = '鸽蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸽蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 143, 'TFDA:K0400101 鴿蛋'
FROM food f
WHERE f.name = '鸽蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸽蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 127, 'TFDA:K0400101 鴿蛋'
FROM food f
WHERE f.name = '鸽蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸽蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 135, 'TFDA:K0400101 鴿蛋'
FROM food f
WHERE f.name = '鸽蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸽蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 303, 'TFDA:K0400101 鴿蛋'
FROM food f
WHERE f.name = '鸽蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸽蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.5, 'TFDA:K0400101 鴿蛋'
FROM food f
WHERE f.name = '鸽蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸽蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 80.8, 'TFDA:K0400101 鴿蛋'
FROM food f
WHERE f.name = '鸽蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸽蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.83, 'TFDA:K0400101 鴿蛋'
FROM food f
WHERE f.name = '鸽蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸽蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 25, 'TFDA:K0400101 鴿蛋'
FROM food f
WHERE f.name = '鸽蛋'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鸽蛋' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 123, 'TFDA:I0620201 鵝肝'
FROM food f
WHERE f.name = '鹅肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 20.5, 'TFDA:I0620201 鵝肝'
FROM food f
WHERE f.name = '鹅肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.6, 'TFDA:I0620201 鵝肝'
FROM food f
WHERE f.name = '鹅肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 3.9, 'TFDA:I0620201 鵝肝'
FROM food f
WHERE f.name = '鹅肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 392, 'TFDA:I0620201 鵝肝'
FROM food f
WHERE f.name = '鹅肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 1237, 'TFDA:I0620201 鵝肝'
FROM food f
WHERE f.name = '鹅肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 287, 'TFDA:I0620201 鵝肝'
FROM food f
WHERE f.name = '鹅肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 383, 'TFDA:I0620201 鵝肝'
FROM food f
WHERE f.name = '鹅肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 1.8, 'TFDA:I0620201 鵝肝'
FROM food f
WHERE f.name = '鹅肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 73.5, 'TFDA:I0620201 鵝肝'
FROM food f
WHERE f.name = '鹅肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.22, 'TFDA:I0620201 鵝肝'
FROM food f
WHERE f.name = '鹅肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 7, 'TFDA:I0620201 鵝肝'
FROM food f
WHERE f.name = '鹅肝'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肝' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 63, 'TFDA:I0620401 鵝腸'
FROM food f
WHERE f.name = '鹅肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 9.2, 'TFDA:I0620401 鵝腸'
FROM food f
WHERE f.name = '鹅肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0.7, 'TFDA:I0620401 鵝腸'
FROM food f
WHERE f.name = '鹅肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2.6, 'TFDA:I0620401 鵝腸'
FROM food f
WHERE f.name = '鹅肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 110, 'TFDA:I0620401 鵝腸'
FROM food f
WHERE f.name = '鹅肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 4, 'TFDA:I0620401 鵝腸'
FROM food f
WHERE f.name = '鹅肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 55, 'TFDA:I0620401 鵝腸'
FROM food f
WHERE f.name = '鹅肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 224, 'TFDA:I0620401 鵝腸'
FROM food f
WHERE f.name = '鹅肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.9, 'TFDA:I0620401 鵝腸'
FROM food f
WHERE f.name = '鹅肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 87, 'TFDA:I0620401 鵝腸'
FROM food f
WHERE f.name = '鹅肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 1.22, 'TFDA:I0620401 鵝腸'
FROM food f
WHERE f.name = '鹅肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 42, 'TFDA:I0620401 鵝腸'
FROM food f
WHERE f.name = '鹅肠'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅肠' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 95, 'TFDA:I0620301 鵝胗'
FROM food f
WHERE f.name = '鹅胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 17.4, 'TFDA:I0620301 鵝胗'
FROM food f
WHERE f.name = '鹅胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 2.8, 'TFDA:I0620301 鵝胗'
FROM food f
WHERE f.name = '鹅胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 2.3, 'TFDA:I0620301 鵝胗'
FROM food f
WHERE f.name = '鹅胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 77, 'TFDA:I0620301 鵝胗'
FROM food f
WHERE f.name = '鹅胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 292, 'TFDA:I0620301 鵝胗'
FROM food f
WHERE f.name = '鹅胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 115, 'TFDA:I0620301 鵝胗'
FROM food f
WHERE f.name = '鹅胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 165, 'TFDA:I0620301 鵝胗'
FROM food f
WHERE f.name = '鹅胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.8, 'TFDA:I0620301 鵝胗'
FROM food f
WHERE f.name = '鹅胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 12, 76.6, 'TFDA:I0620301 鵝胗'
FROM food f
WHERE f.name = '鹅胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 12
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 13, 0.07, 'TFDA:I0620301 鵝胗'
FROM food f
WHERE f.name = '鹅胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 13
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 14, 7, 'TFDA:I0620301 鵝胗'
FROM food f
WHERE f.name = '鹅胗'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '鹅胗' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 14
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 1, 88, 'USDA_FDC:173680 Fish, pike, northern, raw'
FROM food f
WHERE f.name = '黑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 1
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 2, 19.26, 'USDA_FDC:173680 Fish, pike, northern, raw'
FROM food f
WHERE f.name = '黑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 2
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 3, 0, 'USDA_FDC:173680 Fish, pike, northern, raw'
FROM food f
WHERE f.name = '黑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 3
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 4, 0.69, 'USDA_FDC:173680 Fish, pike, northern, raw'
FROM food f
WHERE f.name = '黑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 4
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 5, 0, 'USDA_FDC:173680 Fish, pike, northern, raw'
FROM food f
WHERE f.name = '黑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 5
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 6, 39, 'USDA_FDC:173680 Fish, pike, northern, raw'
FROM food f
WHERE f.name = '黑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 6
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 7, 259, 'USDA_FDC:173680 Fish, pike, northern, raw'
FROM food f
WHERE f.name = '黑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 7
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 8, 220, 'USDA_FDC:173680 Fish, pike, northern, raw'
FROM food f
WHERE f.name = '黑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 8
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 9, 39, 'USDA_FDC:173680 Fish, pike, northern, raw'
FROM food f
WHERE f.name = '黑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 9
        AND n.is_deleted = 0
  );

INSERT INTO food_nutrient (food_id, nutrient_code, amount, remark)
SELECT f.id, 10, 0.118, 'USDA_FDC:173680 Fish, pike, northern, raw'
FROM food f
WHERE f.name = '黑鱼'
  AND f.is_deleted = 0
  AND (SELECT COUNT(*) FROM food u WHERE u.name = '黑鱼' AND u.is_deleted = 0) = 1
  AND NOT EXISTS (
      SELECT 1 FROM food_nutrient n
      WHERE n.food_id = f.id
        AND n.nutrient_code = 10
        AND n.is_deleted = 0
  );
