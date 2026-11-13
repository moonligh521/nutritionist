-- 能量和营养目标只依赖这里的性别、年龄、身高和活动水平。画像更新后版本递增，旧方案仍引用旧版本。
CREATE TABLE user_profile (
  id                   BIGINT         NOT NULL AUTO_INCREMENT COMMENT '行号。业务上用画像标识。',
  profile_id           VARCHAR(64)    NOT NULL COMMENT '画像标识。',
  account_id           VARCHAR(64)    NOT NULL COMMENT '账号标识。',
  patient_id           VARCHAR(64)    NOT NULL COMMENT '患者标识。一名患者只有一份当前画像。',
  patient_version      VARCHAR(64)    NOT NULL COMMENT '写入时的患者主数据版本。',
  version              BIGINT         NOT NULL COMMENT '画像版本。每次更新递增，方案引用的是当时的版本。',
  sex_code             INT            NOT NULL COMMENT '性别代码。1 男，2 女。其他值不进入成年能量表。',
  birth_date           DATE           NOT NULL COMMENT '出生日期。未满 18 岁不使用成年能量表。',
  height_cm            DECIMAL(7,2)   NOT NULL COMMENT '身高，单位厘米。',
  timezone             VARCHAR(64)    NOT NULL COMMENT '患者时区。用餐日期按这个时区计算。',
  activity_level_code  INT            NULL COMMENT '活动水平。1、2、3 对应膳食营养素参考摄入量里的 PALⅠ、PALⅡ、PALⅢ。空值表示还不能计算能量。',
  goal_type_code       INT            NOT NULL COMMENT '目标类型代码。对话里说减肥不会自动写成这个字段。',
  updated_at           TIMESTAMP(3)   NOT NULL COMMENT '最后更新时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_profile_id (profile_id),
  UNIQUE KEY uk_profile_patient (patient_id)
) COMMENT='营养计算用的患者画像。姓名等主数据留在挂号系统。';

-- 画像当前行会被更新。已经生成的方案必须还能看到当时的输入。
CREATE TABLE profile_snapshot (
  id                   BIGINT         NOT NULL AUTO_INCREMENT COMMENT '行号。',
  profile_id           VARCHAR(64)    NOT NULL COMMENT '画像标识。',
  version              BIGINT         NOT NULL COMMENT '快照对应的画像版本。同一画像的同一版本只留一份。',
  snapshot_json        JSON           NOT NULL COMMENT '该版本的完整画像。写入后不修改。',
  created_at           TIMESTAMP(3)   NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '快照写入时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_profile_snapshot (profile_id, version)
) COMMENT='画像的不可变快照。方案引用版本，不跟随后来的修改。';
