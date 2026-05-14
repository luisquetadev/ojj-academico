package com.ojj.academico.service;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.sql.SQLException;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.ojj.academico.dto.LoginDTO;
import com.ojj.academico.exception.ValidationException;
import com.ojj.academico.model.Usuario;
import com.ojj.academico.repository.UsuarioRepository;
import com.ojj.academico.utils.PasswordUtils;

class UsuarioServiceTest {

    @Mock
    private UsuarioRepository usuarioRepository;

    private UsuarioService usuarioService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        usuarioService = new UsuarioService(usuarioRepository);
    }

    @Test
    void autenticar_shouldReturnUserWhenCredentialsAreValid() throws SQLException, ValidationException {
        String plainPassword = "senha123";
        Usuario usuario = new Usuario();
        usuario.setUsername("usuario");
        usuario.setSenhaHash(PasswordUtils.hashPassword(plainPassword));
        usuario.setTipoPerfil("Estudante");

        when(usuarioRepository.findByUsername("usuario")).thenReturn(usuario);

        LoginDTO loginDTO = new LoginDTO("usuario", plainPassword);
        Usuario result = usuarioService.autenticar(loginDTO);

        assertNotNull(result);
        assertEquals("usuario", result.getUsername());
        verify(usuarioRepository, times(1)).findByUsername("usuario");
    }

    @Test
    void autenticar_shouldThrowWhenPasswordIsInvalid() throws SQLException {
        Usuario usuario = new Usuario();
        usuario.setUsername("usuario");
        usuario.setSenhaHash(PasswordUtils.hashPassword("senhaCorreta"));
        usuario.setTipoPerfil("Estudante");

        when(usuarioRepository.findByUsername("usuario")).thenReturn(usuario);

        LoginDTO loginDTO = new LoginDTO("usuario", "senhaErrada");

        assertThrows(ValidationException.class, () -> usuarioService.autenticar(loginDTO));
    }

    @Test
    void registrar_shouldHashPasswordBeforeSaving() throws SQLException, ValidationException {
        Usuario usuario = new Usuario();
        usuario.setUsername("usuario");
        usuario.setSenhaHash("senha123");
        usuario.setTipoPerfil("Funcionario");
        usuario.setIdRef(1);

        when(usuarioRepository.save(any(Usuario.class))).thenReturn(true);

        boolean sucesso = usuarioService.registrar(usuario);

        assertTrue(sucesso);
        assertNotEquals("senha123", usuario.getSenhaHash());
        assertTrue(PasswordUtils.checkPassword("senha123", usuario.getSenhaHash()));
        verify(usuarioRepository, times(1)).save(any(Usuario.class));
    }

    @Test
    void registrar_shouldThrowWhenUsuarioIsInvalid() throws SQLException {
        Usuario usuario = new Usuario();
        usuario.setUsername("");
        usuario.setSenhaHash("");
        usuario.setTipoPerfil("");

        assertThrows(ValidationException.class, () -> usuarioService.registrar(usuario));
        verify(usuarioRepository, never()).save(any());
    }
}
