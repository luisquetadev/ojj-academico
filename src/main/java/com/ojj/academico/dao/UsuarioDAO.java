package com.ojj.academico.dao;

import java.sql.*;
import com.ojj.academico.model.Usuario;
import com.ojj.academico.util.ConnectionFactory;

public class UsuarioDAO {
    
    public Usuario buscarPorUsername(String username) throws SQLException {
        String sql = "SELECT * FROM utilizadores WHERE username = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                Usuario user = new Usuario();
                user.setIdUtilizador(rs.getInt("id_utilizador"));
                user.setUsername(rs.getString("username"));
                user.setSenhaHash(rs.getString("senha_hash"));
                user.setTipoPerfil(rs.getString("tipo_perfil"));
                user.setIdRef(rs.getInt("id_ref"));
                return user;
            }
            return null;
        }
    }
    
    public boolean inserir(Usuario usuario) throws SQLException {
        String sql = "INSERT INTO utilizadores (username, senha_hash, tipo_perfil, id_ref) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, usuario.getUsername());
            stmt.setString(2, usuario.getSenhaHash());
            stmt.setString(3, usuario.getTipoPerfil());
            stmt.setInt(4, usuario.getIdRef());
            
            return stmt.executeUpdate() > 0;
        }
    }
}