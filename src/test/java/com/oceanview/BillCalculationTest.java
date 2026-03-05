package com.oceanview;

import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

public class BillCalculationTest {

    private double calculateBill(String roomType, int nights) {
        double rate = 0;
        switch (roomType) {
            case "Standard":   rate = 5000; break;
            case "Deluxe":     rate = 8000; break;
            case "Ocean View": rate = 12000; break;
            case "Suite":      rate = 15000; break;
        }
        return rate * nights;
    }

    @Test
    @DisplayName("TC09 - Standard room bill for 2 nights")
    void testStandardRoomBill() {
        assertEquals(10000.0, calculateBill("Standard", 2), 0.01);
    }

    @Test
    @DisplayName("TC10 - Deluxe room bill for 3 nights")
    void testDeluxeRoomBill() {
        assertEquals(24000.0, calculateBill("Deluxe", 3), 0.01);
    }

    @Test
    @DisplayName("TC11 - Ocean View room bill for 5 nights")
    void testOceanViewRoomBill() {
        assertEquals(60000.0, calculateBill("Ocean View", 5), 0.01);
    }

    @Test
    @DisplayName("TC12 - Suite room bill for 1 night")
    void testSuiteRoomBill() {
        assertEquals(15000.0, calculateBill("Suite", 1), 0.01);
    }

    @Test
    @DisplayName("TC13 - Bill should be zero for zero nights")
    void testZeroNightsBill() {
        assertEquals(0.0, calculateBill("Deluxe", 0), 0.01);
    }

    @Test
    @DisplayName("TC14 - Bill should be positive value")
    void testBillIsPositive() {
        double bill = calculateBill("Suite", 3);
        assertTrue(bill > 0);
    }
}
