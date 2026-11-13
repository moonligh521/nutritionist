-- 同一范围只保留一个进行中的任务。请求正文和冲突约束单独保存，方便失败后复现。
ALTER TABLE recommendation_task
  ADD COLUMN conflict_json JSON NULL COMMENT '求解无解时的冲突约束。有可行解时为空，不能另编一餐。';
