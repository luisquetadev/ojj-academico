package com.ojj.academico.validator;

import com.ojj.academico.dto.LoginDTO;
import com.ojj.academico.exception.ValidationException;
import com.ojj.academico.model.Usuario;

public final class UsuarioValidator {

    private UsuarioValidator() {
        // utilitário
    }

    public static void validateLogin(LoginDTO loginDTO) throws ValidationException {
        if (loginDTO == null || loginDTO.getUsername() == null || loginDTO.getUsername().isBlank()
                || loginDTO.getPassword() == null || loginDTO.getPassword().isBlank()) {
            throw new ValidationException("Informe usuário e senha para acessar o sistema.");
        }
    }

    public static void validateUsuario(Usuario usuario) throws ValidationException {
        if (usuario == null) {
            throw new ValidationException("Dados de usuário inválidos.");
        }
        if (usuario.getUsername() == null || usuario.getUsername().isBlank()) {
            throw new ValidationException("O nome de usuário é obrigatório.");
        }
        if (usuario.getSenhaHash() == null || usuario.getSenhaHash().isBlank()) {
            throw new ValidationException("A senha é obrigatória.");
        }
        if (usuario.getTipoPerfil() == null || usuario.getTipoPerfil().isBlank()) {
            throw new ValidationException("O tipo de perfil é obrigatório.");
        }
    }
}
