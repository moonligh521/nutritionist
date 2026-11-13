package com.moonligh.nutritionist.infrastructure.persistence;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.moonligh.nutritionist.domain.pantry.PantryStore;

@Repository
public class PantryStoreImpl implements PantryStore {

    private final PantryMapper pantry;

    public PantryStoreImpl(PantryMapper pantry) {
        this.pantry = pantry;
    }

    @Override
    public void insert(Lot lot) {
        pantry.insertItem(
                lot.itemId(), lot.accountId(), lot.patientId(), lot.foodItemId(),
                lot.stateCode(), lot.unitCode(), Instant.now());
        pantry.insertLot(
                lot.lotId(), lot.itemId(), lot.lotCode(), lot.onHand(), lot.reserved(),
                lot.expireAt(), Instant.now());
    }

    @Override
    public List<Lot> list(String accountId, String patientId) {
        return pantry.listByAccount(accountId, patientId);
    }

    @Override
    public List<Lot> listByPatient(String patientId) {
        return pantry.listByPatient(patientId);
    }

    @Override
    public Lot find(String lotId) {
        List<Lot> lots = pantry.findForUpdate(lotId);
        return lots.isEmpty() ? null : lots.getFirst();
    }

    @Override
    public void updateQuantities(Lot lot) {
        pantry.updateQuantities(lot.onHand(), lot.reserved(), Instant.now(), lot.lotId());
    }

    @Override
    public void rememberReservation(String planVersionId, String lotId, BigDecimal quantity) {
        pantry.insertReservation(planVersionId + ":" + lotId, planVersionId, lotId, quantity, Instant.now());
    }

    @Override
    public List<Reservation> reservations(String planVersionId) {
        return pantry.reservations(planVersionId);
    }

    @Override
    public void forgetReservations(String planVersionId) {
        pantry.releaseReservations(planVersionId);
    }

    @Override
    public long version(String patientId) {
        Long count = pantry.changeCount(patientId);
        return count == null ? 0 : count;
    }

    @Override
    @Transactional
    public void recordChange(String patientId, String lotId, int changeTypeCode, BigDecimal quantity) {
        pantry.insertChange(UUID.randomUUID().toString(), patientId, lotId, changeTypeCode, quantity, Instant.now());
    }
}
