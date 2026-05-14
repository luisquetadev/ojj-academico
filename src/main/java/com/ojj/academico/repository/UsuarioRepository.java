package com.ojj.academico.repository;

import com.ojj.academico.dao.UsuarioDAO;
import com.ojj.academico.model.Usuario;

import java.sql.SQLException;

public class UsuarioRepository {

    private final UsuarioDAO usuarioDAO = new UsuarioDAO();

    public Usuario findByUsername(String username) throws SQLException {
        return usuarioDAO.buscarPorUsername(username);
    }

    public boolean save(Usuario usuario) throws SQLException {
        return usuarioDAO.inserir(usuario);
    }
}
