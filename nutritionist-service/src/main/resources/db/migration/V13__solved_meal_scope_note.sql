-- 推荐展示可以换说法，但不能改食材标识和克数。单餐在没有已发布餐次比例时，不能把这一餐记成全天剩余额度。
ALTER TABLE solved_meal_dish
  ADD COLUMN represents_daily_remainder TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否代表当天剩余全部额度。单餐且没有已发布餐次比例时为 0，避免把一餐当成全天。';
