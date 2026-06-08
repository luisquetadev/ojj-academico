package com.ojj.academico.dao;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.Utilizador;
import com.ojj.academico.utils.ConnectionFactory;
import com.ojj.academico.utils.PasswordUtils;

/**
 * Data Access Object (DAO) para a tabela 'utilizador'.
 * 
 * Esta classe isola todo o código SQL relacionado à gestão de contas de acesso.
 * Utiliza JDBC puro para máxima performance e controle.
 */
public class UtilizadorDAO {

    /**
     * Busca um único utilizador pelo seu ID primário.
     */
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

    /**
     * Retorna todos os utilizadores do banco de dados.
     */
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

    /**
     * Insere um novo utilizador no banco.
     * Recupera o ID gerado automaticamente pelo banco de dados.
     */
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
                // Recupera a chave primária gerada (Auto-increment)
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    usuario.setIdUtilizador(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    /**
     * Atualiza os dados de um utilizador existente.
     */
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

    /**
     * Exclui um utilizador pelo ID.
     */
    public boolean excluir(int idUtilizador) throws SQLException {
        String sql = "DELETE FROM utilizador WHERE id_utilizador = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idUtilizador);
            return stmt.executeUpdate() > 0;
        }
    }

    public void atualizarUltimoAcesso(int idUtilizador, String ip) throws SQLException {
        String sql = "UPDATE utilizador SET data_ultimo_acesso = NOW(), ultimo_ip = ? WHERE id_utilizador = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, ip);
            stmt.setInt(2, idUtilizador);
            stmt.executeUpdate();
        }
    }

    /**
     * Busca o nome completo associado ao utilizador (seja ele estudante ou funcionário).
     */
    public String buscarNomeCompleto(Utilizador u) throws SQLException {
        String sql;
        if (u.getIdPerfil() == 7) { // Estudante
            sql = "SELECT nome_completo FROM estudante WHERE id_utilizador = ?";
        } else { // Funcionário
            sql = "SELECT nome_completo FROM funcionario WHERE id_utilizador = ?";
        }
        
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, u.getIdUtilizador());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("nome_completo");
            }
            return u.getEmail(); // Fallback para o email se não encontrar nome
        }
    }

    /**
     * Método auxiliar (Privado) para converter um registro do banco (ResultSet) 
     * em um objeto Java (Utilizador).
     */
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

    /**
     * Utilitário para tratar campos de data e hora (LocalDateTime) no JDBC.
     */
    private void setTimestamp(PreparedStatement stmt, int index, LocalDateTime value) throws SQLException {
        if (value != null) {
            stmt.setTimestamp(index, Timestamp.valueOf(value));
        } else {
            stmt.setNull(index, Types.TIMESTAMP);
        }
    }

    /**
     * Utilitário para recuperar campos de data e hora do banco convertendo para LocalDateTime.
     */
    private LocalDateTime getTimestamp(ResultSet rs, String columnLabel) throws SQLException {
        Timestamp ts = rs.getTimestamp(columnLabel);
        return ts != null ? ts.toLocalDateTime() : null;
    }

    /**
     * Busca um usuário pelo email e valida a senha.
     * 
     * @param username O email do usuário.
     * @param password A senha digitada (texto plano).
     * @return O objeto Utilizador se autenticado, caso contrário null.
     */
    public Utilizador buscarPorUsernameESenha(String username, String password) throws SQLException {
        // Primeiro busca apenas pelo email para pegar o hash da senha
        String sql = "SELECT * FROM utilizador WHERE email = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Utilizador usuario = mapUtilizador(rs);
                // Compara a senha digitada com a que está no banco (delegando para PasswordUtils)
                if (PasswordUtils.checkPassword(password, usuario.getPasswordHash())) {
                    return usuario;
                }
            }
            return null;
        }
    }

    /**
     * Busca um utilizador pelo seu email/username.
     */
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
