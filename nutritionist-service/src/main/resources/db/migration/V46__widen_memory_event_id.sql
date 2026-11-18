-- event_id 原 VARCHAR(64)；明细行曾用 uuid:uuid（73）截断失败。加宽并保留余量。
ALTER TABLE diet_memory_event
  MODIFY COLUMN event_id VARCHAR(128) NOT NULL COMMENT '幂等键';

ALTER TABLE diet_memory_review
  MODIFY COLUMN event_id VARCHAR(128) NOT NULL COMMENT '关联事件';

ALTER TABLE diet_preference_fact
  MODIFY COLUMN event_id VARCHAR(128) NOT NULL COMMENT '写入该事实的事件';
