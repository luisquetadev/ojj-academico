package com.ojj.academico.validator;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import com.ojj.academico.validator.UtilizadorValidador;

public class UtilizadorValidatorTest {
    
@Test
    public void testValidEmail() {
        assertTrue(UtilizadorValidador.isValidEmail("user@example.com"));
    }

    @Test
    public void testInvalidEmail() {
        assertFalse(UtilizadorValidador.isValidEmail("userexample.com"));
    }

    @Test
    public void testValidPassword() {
        assertTrue(UtilizadorValidador.isValidPassword("Password123!"));
    }

    @Test
    public void testInvalidPassword() {
        assertFalse(UtilizadorValidador.isValidPassword("password"));
    }

}
