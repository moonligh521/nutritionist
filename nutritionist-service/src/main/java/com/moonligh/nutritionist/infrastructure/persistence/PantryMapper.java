package com.moonligh.nutritionist.infrastructure.persistence;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moonligh.nutritionist.domain.pantry.PantryStore.Lot;
import com.moonligh.nutritionist.domain.pantry.PantryStore.Reservation;

@Mapper
public interface PantryMapper {

    int insertItem(
            @Param("itemId") String itemId,
            @Param("accountId") String accountId,
            @Param("patientId") String patientId,
            @Param("foodItemId") String foodItemId,
            @Param("stateCode") Integer stateCode,
            @Param("unitCode") Integer unitCode,
            @Param("createdAt") Instant createdAt);

    int insertLot(
            @Param("lotId") String lotId,
            @Param("itemId") String itemId,
            @Param("lotCode") String lotCode,
            @Param("onHand") BigDecimal onHand,
            @Param("reserved") BigDecimal reserved,
            @Param("expireAt") Instant expireAt,
            @Param("updatedAt") Instant updatedAt);

    List<Lot> listByAccount(@Param("accountId") String accountId, @Param("patientId") String patientId);

    List<Lot> listByPatient(@Param("patientId") String patientId);

    List<Lot> findForUpdate(@Param("lotId") String lotId);

    int updateQuantities(
            @Param("onHand") BigDecimal onHand,
            @Param("reserved") BigDecimal reserved,
            @Param("updatedAt") Instant updatedAt,
            @Param("lotId") String lotId);

    int insertReservation(
            @Param("reservationId") String reservationId,
            @Param("planVersionId") String planVersionId,
            @Param("lotId") String lotId,
            @Param("quantity") BigDecimal quantity,
            @Param("createdAt") Instant createdAt);

    List<Reservation> reservations(@Param("planVersionId") String planVersionId);

    int releaseReservations(@Param("planVersionId") String planVersionId);

    Long changeCount(@Param("patientId") String patientId);

    int insertChange(
            @Param("eventId") String eventId,
            @Param("patientId") String patientId,
            @Param("lotId") String lotId,
            @Param("changeTypeCode") int changeTypeCode,
            @Param("quantity") BigDecimal quantity,
            @Param("createdAt") Instant createdAt);
}
