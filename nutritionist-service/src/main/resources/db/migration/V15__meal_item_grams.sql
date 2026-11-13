-- 份数不能代替克数。没有克数时不能把份数换算成营养。
ALTER TABLE meal_item ADD COLUMN grams DECIMAL(18, 6) NULL COMMENT '计划克数。空值表示这一项还没有换成克，不能当成 0 克。';
