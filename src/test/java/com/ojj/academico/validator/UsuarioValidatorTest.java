package com.ojj.academico.validator;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import com.ojj.academico.dto.LoginDTO;
import com.ojj.academico.exception.ValidationException;

class UsuarioValidatorTest {

    @Test
    void validateLogin_shouldThrowWhenUsernameIsMissing() {
        LoginDTO loginDTO = new LoginDTO(null, "senha123");
        assertThrows(ValidationException.class, () -> UsuarioValidator.validateLogin(loginDTO));
    }

    @Test
    void validateLogin_shouldThrowWhenPasswordIsMissing() {
        LoginDTO loginDTO = new LoginDTO("usuario", "");
        assertThrows(ValidationException.class, () -> UsuarioValidator.validateLogin(loginDTO));
    }

    @Test
    void validateLogin_shouldPassWhenBothFieldsArePresent() {
        LoginDTO loginDTO = new LoginDTO("usuario", "senha123");
        assertDoesNotThrow(() -> UsuarioValidator.validateLogin(loginDTO));
    }
}
