package com.oceanview;

import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

public class UserValidationTest {

    private boolean isValidUsername(String username) {
        return username != null && !username.trim().isEmpty() && username.length() >= 3;
    }

    private boolean isValidPassword(String password) {
        return password != null && password.length() >= 6;
    }

    private boolean isValidContact(String contact) {
        return contact != null && contact.matches("[0-9]{10}");
    }

    @Test
    @DisplayName("TC15 - Valid username should pass")
    void testValidUsername() {
        assertTrue(isValidUsername("admin"));
    }

    @Test
    @DisplayName("TC16 - Empty username should fail")
    void testEmptyUsername() {
        assertFalse(isValidUsername(""));
    }

    @Test
    @DisplayName("TC17 - Null username should fail")
    void testNullUsername() {
        assertFalse(isValidUsername(null));
    }

    @Test
    @DisplayName("TC18 - Valid password should pass")
    void testValidPassword() {
        assertTrue(isValidPassword("admin123"));
    }

    @Test
    @DisplayName("TC19 - Short password should fail")
    void testShortPassword() {
        assertFalse(isValidPassword("abc"));
    }

    @Test
    @DisplayName("TC20 - Valid contact number should pass")
    void testValidContact() {
        assertTrue(isValidContact("0771234567"));
    }

    @Test
    @DisplayName("TC21 - Contact with letters should fail")
    void testInvalidContact() {
        assertFalse(isValidContact("077ABC4567"));
    }

    @Test
    @DisplayName("TC22 - Contact less than 10 digits should fail")
    void testShortContact() {
        assertFalse(isValidContact("07712345"));
    }
}
