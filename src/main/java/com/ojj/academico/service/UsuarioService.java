package com.ojj.academico.service;

import com.ojj.academico.dto.LoginDTO;
import com.ojj.academico.exception.ValidationException;
import com.ojj.academico.model.Usuario;
import com.ojj.academico.repository.UsuarioRepository;
import com.ojj.academico.utils.PasswordUtils;
import com.ojj.academico.validator.UsuarioValidator;

import java.sql.SQLException;

public class UsuarioService {

    private final UsuarioRepository usuarioRepository;

    public UsuarioService() {
        this(new UsuarioRepository());
    }

    public UsuarioService(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    public Usuario autenticar(LoginDTO loginDTO) throws SQLException, ValidationException {
        UsuarioValidator.validateLogin(loginDTO);

        Usuario usuario = usuarioRepository.findByUsername(loginDTO.getUsername());
        if (usuario == null || !PasswordUtils.checkPassword(loginDTO.getPassword(), usuario.getSenhaHash())) {
            throw new ValidationException("Usuário ou senha inválidos.");
        }

        return usuario;
    }

    public boolean registrar(Usuario usuario) throws SQLException, ValidationException {
        UsuarioValidator.validateUsuario(usuario);
        usuario.setSenhaHash(PasswordUtils.hashPassword(usuario.getSenhaHash()));
        return usuarioRepository.save(usuario);
    }
}
