package com.moonligh.nutritionist.domain.pantry;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import com.moonligh.nutritionist.domain.common.EntityTable;

/**
 * 测试用的库存表。正式运行时库存写在 MySQL。
 */
public class InMemoryPantryStore implements PantryStore {

    private final EntityTable<Lot> lots = new EntityTable<>(Lot::lotId);
    private final EntityTable<ReservationGroup> reservations = new EntityTable<>(ReservationGroup::planVersionId);
    private final EntityTable<PatientPantryVersion> versions = new EntityTable<>(PatientPantryVersion::patientId);

    @Override
    public void insert(Lot lot) {
        lots.save(lot);
    }

    @Override
    public List<Lot> list(String accountId, String patientId) {
        return lots.all().stream()
                .filter(lot -> lot.accountId().equals(accountId) && lot.patientId().equals(patientId))
                .sorted(Comparator.comparing(Lot::lotId))
                .toList();
    }

    @Override
    public List<Lot> listByPatient(String patientId) {
        return lots.all().stream()
                .filter(lot -> lot.patientId().equals(patientId))
                .sorted(Comparator.comparing(Lot::lotId))
                .toList();
    }

    @Override
    public Lot find(String lotId) {
        return lots.find(lotId).orElse(null);
    }

    @Override
    public void updateQuantities(Lot lot) {
        lots.save(lot);
    }

    @Override
    public void rememberReservation(String planVersionId, String lotId, BigDecimal quantity) {
        ReservationGroup group = reservations.findOrCreate(planVersionId, () -> new ReservationGroup(planVersionId));
        group.items().add(new Reservation(planVersionId, lotId, quantity));
    }

    @Override
    public List<Reservation> reservations(String planVersionId) {
        return reservations.find(planVersionId).map(ReservationGroup::items).orElse(List.of());
    }

    @Override
    public void forgetReservations(String planVersionId) {
        reservations.remove(planVersionId);
    }

    @Override
    public long version(String patientId) {
        return versions.find(patientId).map(PatientPantryVersion::current).orElse(0L);
    }

    @Override
    public void recordChange(String patientId, String lotId, int changeTypeCode, BigDecimal quantity) {
        versions.findOrCreate(patientId, () -> new PatientPantryVersion(patientId)).next();
    }

    /** 一个方案版本预留了哪些批次。 */
    static final class ReservationGroup {
        private final String planVersionId;
        private final List<Reservation> items = new ArrayList<>();

        ReservationGroup(String planVersionId) {
            this.planVersionId = planVersionId;
        }

        String planVersionId() {
            return planVersionId;
        }

        List<Reservation> items() {
            return items;
        }
    }

    /** 某位患者的库存改了多少次。次数就是库存版本。 */
    static final class PatientPantryVersion {
        private final String patientId;
        private long version;

        PatientPantryVersion(String patientId) {
            this.patientId = patientId;
        }

        String patientId() {
            return patientId;
        }

        long current() {
            return version;
        }

        void next() {
            version++;
        }
    }
}
