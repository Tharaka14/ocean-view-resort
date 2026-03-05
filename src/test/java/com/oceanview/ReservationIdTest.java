package com.oceanview;

import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

public class ReservationIdTest {

    private boolean isValidReservationId(String id) {
        return id != null && id.matches("RES[0-9]{3}");
    }

    @Test
    @DisplayName("TC23 - RES001 should be valid")
    void testValidId1() {
        assertTrue(isValidReservationId("RES001"));
    }

    @Test
    @DisplayName("TC24 - RES999 should be valid")
    void testValidId2() {
        assertTrue(isValidReservationId("RES999"));
    }

    @Test
    @DisplayName("TC25 - Lowercase res001 should fail")
    void testLowercaseId() {
        assertFalse(isValidReservationId("res001"));
    }

    @Test
    @DisplayName("TC26 - RES01 short format should fail")
    void testShortId() {
        assertFalse(isValidReservationId("RES01"));
    }

    @Test
    @DisplayName("TC27 - Null ID should fail")
    void testNullId() {
        assertFalse(isValidReservationId(null));
    }

    @Test
    @DisplayName("TC28 - Empty ID should fail")
    void testEmptyId() {
        assertFalse(isValidReservationId(""));
    }
}
