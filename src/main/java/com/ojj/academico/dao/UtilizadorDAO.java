package com.ojj.academico.dao;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.Utilizador;
import com.ojj.academico.utils.ConnectionFactory;

public class UtilizadorDAO {

    public Utilizador buscarPorId(int idUtilizador) throws SQLException {
        String sql = "SELECT * FROM utilizador WHERE id_utilizador = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idUtilizador);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapUtilizador(rs);
            }
            return null;
        }
    }

    public List<Utilizador> listarTodos() throws SQLException {
        String sql = "SELECT * FROM utilizador";
        List<Utilizador> usuarios = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                usuarios.add(mapUtilizador(rs));
            }
        }
        return usuarios;
    }

    public boolean inserir(Utilizador usuario) throws SQLException {
        String sql = "INSERT INTO utilizador (id_perfil, email, password_hash, status, tentativas_login, ultimo_ip, token_reset, token_expiracao, data_criacao, data_ultimo_acesso) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, usuario.getIdPerfil());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getPasswordHash());
            stmt.setString(4, usuario.getStatus());
            stmt.setInt(5, usuario.getTentativasLogin());
            stmt.setString(6, usuario.getUltimoIp());
            stmt.setString(7, usuario.getTokenReset());
            setTimestamp(stmt, 8, usuario.getTokenExpiracao());
            setTimestamp(stmt, 9, usuario.getDataCriacao());
            setTimestamp(stmt, 10, usuario.getDataUltimoAcesso());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    usuario.setIdUtilizador(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    public boolean atualizar(Utilizador usuario) throws SQLException {
        String sql = "UPDATE utilizador SET id_perfil = ?, email = ?, password_hash = ?, status = ?, tentativas_login = ?, ultimo_ip = ?, token_reset = ?, token_expiracao = ?, data_criacao = ?, data_ultimo_acesso = ? WHERE id_utilizador = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, usuario.getIdPerfil());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getPasswordHash());
            stmt.setString(4, usuario.getStatus());
            stmt.setInt(5, usuario.getTentativasLogin());
            stmt.setString(6, usuario.getUltimoIp());
            stmt.setString(7, usuario.getTokenReset());
            setTimestamp(stmt, 8, usuario.getTokenExpiracao());
            setTimestamp(stmt, 9, usuario.getDataCriacao());
            setTimestamp(stmt, 10, usuario.getDataUltimoAcesso());
            stmt.setInt(11, usuario.getIdUtilizador());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean excluir(int idUtilizador) throws SQLException {
        String sql = "DELETE FROM utilizador WHERE id_utilizador = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idUtilizador);
            return stmt.executeUpdate() > 0;
        }
    }

    private Utilizador mapUtilizador(ResultSet rs) throws SQLException {
        Utilizador u = new Utilizador();
        u.setIdUtilizador(rs.getInt("id_utilizador"));
        u.setIdPerfil(rs.getInt("id_perfil"));
        u.setEmail(rs.getString("email"));
        u.setPasswordHash(rs.getString("password_hash"));
        u.setStatus(rs.getString("status"));
        u.setTentativasLogin(rs.getInt("tentativas_login"));
        u.setUltimoIp(rs.getString("ultimo_ip"));
        u.setTokenReset(rs.getString("token_reset"));
        u.setTokenExpiracao(getTimestamp(rs, "token_expiracao"));
        u.setDataCriacao(getTimestamp(rs, "data_criacao"));
        u.setDataUltimoAcesso(getTimestamp(rs, "data_ultimo_acesso"));
        return u;
    }

    private void setTimestamp(PreparedStatement stmt, int index, LocalDateTime value) throws SQLException {
        if (value != null) {
            stmt.setTimestamp(index, Timestamp.valueOf(value));
        } else {
            stmt.setNull(index, Types.TIMESTAMP);
        }
    }

    private LocalDateTime getTimestamp(ResultSet rs, String columnLabel) throws SQLException {
        Timestamp ts = rs.getTimestamp(columnLabel);
        return ts != null ? ts.toLocalDateTime() : null;
    }

public Utilizador buscarPorUsernameESenha(String username, String password) throws SQLException {
        String sql = "SELECT * FROM utilizador WHERE email = ? AND password_hash = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapUtilizador(rs);
            }
            return null;
        }
    }

    public Utilizador buscarPorUsername(String username) throws SQLException {
        String sql = "SELECT * FROM utilizador WHERE email = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapUtilizador(rs);
            }
            return null;
        }
    }

}
