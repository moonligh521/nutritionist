-- 「玉米，甜」是甜玉米，不是甜食。玉米布丁仍留在甜食。

UPDATE food
SET category_code = 3
WHERE category_code = 17
  AND name LIKE '玉米%'
  AND name NOT LIKE '%布丁%';
