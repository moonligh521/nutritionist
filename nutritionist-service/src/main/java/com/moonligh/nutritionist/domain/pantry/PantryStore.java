package com.moonligh.nutritionist.domain.pantry;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

public interface PantryStore {

    void insert(Lot lot);

    List<Lot> list(String accountId, String patientId);

    List<Lot> listByPatient(String patientId);

    Lot find(String lotId);

    void updateQuantities(Lot lot);

    void rememberReservation(String planVersionId, String lotId, BigDecimal quantity);

    List<Reservation> reservations(String planVersionId);

    void forgetReservations(String planVersionId);

    long version(String patientId);

    void recordChange(String patientId, String lotId, int changeTypeCode, BigDecimal quantity);

    /** 库存批次。可用数量等于在库数量减去预留数量。 */
    record Lot(
            /** 库存项标识。 */
            String itemId,
            /** 批次标识。预留与扣减均引用该标识。 */
            String lotId,
            /** 账号标识。 */
            String accountId,
            /** 患者标识。 */
            String patientId,
            /** 食材标识。 */
            String foodItemId,
            /** 在库数量。 */
            BigDecimal onHand,
            /** 已预留数量。 */
            BigDecimal reserved,
            /** 数量单位代码。 */
            Integer unitCode,
            /** 状态代码：生、熟或包装。 */
            Integer stateCode,
            /** 失效时间。可空。 */
            Instant expireAt,
            /** 批次代码。 */
            String lotCode) {

        public BigDecimal available() {
            return onHand.subtract(reserved);
        }

        public Lot withReserved(BigDecimal value) {
            return new Lot(itemId, lotId, accountId, patientId, foodItemId, onHand, value, unitCode, stateCode, expireAt, lotCode);
        }

        public Lot withOnHand(BigDecimal value) {
            return new Lot(itemId, lotId, accountId, patientId, foodItemId, value, reserved, unitCode, stateCode, expireAt, lotCode);
        }
    }

    /** 某个方案版本预留了某一批食材的数量。 */
    record Reservation(
            /** 方案版本标识。 */
            String planVersionId,
            /** 批次标识。 */
            String lotId,
            /** 预留数量。 */
            BigDecimal quantity) {
    }
}
