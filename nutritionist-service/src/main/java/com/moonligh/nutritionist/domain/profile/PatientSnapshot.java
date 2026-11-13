package com.moonligh.nutritionist.domain.profile;

/** 从挂号服务看到的患者快照。只带编号和版本，用来核对是不是同一个人。 */
public record PatientSnapshot(
        /** 患者标识。 */
        String patientId,
        /** 患者主数据当前版本。 */
        String patientVersion,
        /** 是否归属于当前账号。 */
        boolean ownedByAccount) {
}
