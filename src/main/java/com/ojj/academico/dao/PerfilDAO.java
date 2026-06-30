package com.ojj.academico.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.Perfil;
import com.ojj.academico.utils.ConnectionFactory;

/**
 * DAO para a tabela {@code perfil}.
 * <p>
 * Consulta dos perfis de acesso (papéis) do sistema.
 * </p>
 */
public class PerfilDAO {

    /**
     * Busca um perfil pelo ID.
     *
     * @param idPerfil chave primária
     * @return o perfil encontrado ou {@code null}
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public Perfil buscarPorId(int idPerfil) throws SQLException {
        String sql = "SELECT * FROM perfil WHERE id_perfil = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idPerfil);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Perfil p = new Perfil();
                p.setIdPerfil(rs.getInt("id_perfil"));
                p.setNomePerfil(rs.getString("nome_perfil"));
                return p;
            }
            return null;
        }
    }

    /**
     * Lista todos os perfis de acesso.
     *
     * @return lista de perfis
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public List<Perfil> listarTodos() throws SQLException {
        String sql = "SELECT * FROM perfil";
        List<Perfil> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Perfil p = new Perfil();
                p.setIdPerfil(rs.getInt("id_perfil"));
                p.setNomePerfil(rs.getString("nome_perfil"));
                list.add(p);
            }
        }
        return list;
    }

    /**
     * Insere um novo perfil de acesso.
     *
     * @param perfil dados do perfil
     * @return {@code true} se a inserção foi bem-sucedida
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean inserir(Perfil perfil) throws SQLException {
        String sql = "INSERT INTO perfil (nome_perfil) VALUES (?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, perfil.getNomePerfil());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    perfil.setIdPerfil(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    /**
     * Actualiza o nome de um perfil.
     *
     * @param perfil dados actualizados
     * @return {@code true} se algum registo foi alterado
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean atualizar(Perfil perfil) throws SQLException {
        String sql = "UPDATE perfil SET nome_perfil = ? WHERE id_perfil = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, perfil.getNomePerfil());
            stmt.setInt(2, perfil.getIdPerfil());
            return stmt.executeUpdate() > 0;
        }
    }

    /**
     * Exclui um perfil pelo ID.
     *
     * @param idPerfil chave primária
     * @return {@code true} se o registo foi removido
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean excluir(int idPerfil) throws SQLException {
        String sql = "DELETE FROM perfil WHERE id_perfil = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idPerfil);
            return stmt.executeUpdate() > 0;
        }
    }
}
