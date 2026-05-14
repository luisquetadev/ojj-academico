package com.ojj.academico.utils;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class PasswordUtilsTest {

    @Test
    void hashPassword_shouldReturnDifferentHashThanPlainValue() {
        String plain = "minhaSenha123";
        String hashed = PasswordUtils.hashPassword(plain);

        assertNotNull(hashed);
        assertNotEquals(plain, hashed);
        assertTrue(hashed.startsWith("$2a$") || hashed.startsWith("$2b$") || hashed.startsWith("$2y$"));
    }

    @Test
    void checkPassword_shouldReturnTrueForValidPassword() {
        String plain = "senhaSegura";
        String hashed = PasswordUtils.hashPassword(plain);

        assertTrue(PasswordUtils.checkPassword(plain, hashed));
    }

    @Test
    void checkPassword_shouldReturnFalseForInvalidPassword() {
        String hashed = PasswordUtils.hashPassword("senhaSegura");

        assertFalse(PasswordUtils.checkPassword("senhaErrada", hashed));
    }

    @Test
    void hashPassword_shouldThrowWhenPasswordIsNull() {
        assertThrows(IllegalArgumentException.class, () -> PasswordUtils.hashPassword(null));
    }
}
