package com.ojj.academico.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

import com.ojj.academico.model.HistoricoAcademico;
import com.ojj.academico.utils.ConnectionFactory;

/**
 * DAO para a tabela {@code historico_academico}.
 * <p>
 * Registo do desempenho dos estudantes disciplina a disciplina,
 * incluindo média final e resultado (aprovado/reprovado).
 * </p>
 */
public class HistoricoAcademicoDAO {

    /**
     * Busca um registo histórico pelo ID.
     *
     * @param idHistorico chave primária
     * @return o registo encontrado ou {@code null}
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public HistoricoAcademico buscarPorId(int idHistorico) throws SQLException {
        String sql = "SELECT * FROM historico_academico WHERE id_historico = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idHistorico);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapHistorico(rs);
            }
            return null;
        }
    }

    /**
     * Lista todo o histórico académico.
     *
     * @return lista de registos históricos
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public List<HistoricoAcademico> listarTodos() throws SQLException {
        String sql = "SELECT * FROM historico_academico";
        List<HistoricoAcademico> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapHistorico(rs));
            }
        }
        return list;
    }

    /**
     * Insere um novo registo no histórico académico.
     *
     * @param historico dados do histórico
     * @return {@code true} se a inserção foi bem-sucedida
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean inserir(HistoricoAcademico historico) throws SQLException {
        String sql = "INSERT INTO historico_academico (id_estudante, id_disciplina, media_final, resultado, ano_letivo) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, historico.getIdEstudante());
            stmt.setInt(2, historico.getIdDisciplina());
            stmt.setBigDecimal(3, historico.getMediaFinal());
            stmt.setString(4, historico.getResultado());
            stmt.setString(5, historico.getAnoLetivo());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    historico.setIdHistorico(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    /**
     * Actualiza um registo do histórico.
     *
     * @param historico dados actualizados
     * @return {@code true} se algum registo foi alterado
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean atualizar(HistoricoAcademico historico) throws SQLException {
        String sql = "UPDATE historico_academico SET id_estudante = ?, id_disciplina = ?, media_final = ?, resultado = ?, ano_letivo = ? WHERE id_historico = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, historico.getIdEstudante());
            stmt.setInt(2, historico.getIdDisciplina());
            stmt.setBigDecimal(3, historico.getMediaFinal());
            stmt.setString(4, historico.getResultado());
            stmt.setString(5, historico.getAnoLetivo());
            stmt.setInt(6, historico.getIdHistorico());
            return stmt.executeUpdate() > 0;
        }
    }

    /**
     * Exclui um registo do histórico pelo ID.
     *
     * @param idHistorico chave primária
     * @return {@code true} se o registo foi removido
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean excluir(int idHistorico) throws SQLException {
        String sql = "DELETE FROM historico_academico WHERE id_historico = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idHistorico);
            return stmt.executeUpdate() > 0;
        }
    }

    private HistoricoAcademico mapHistorico(ResultSet rs) throws SQLException {
        HistoricoAcademico h = new HistoricoAcademico();
        h.setIdHistorico(rs.getInt("id_historico"));
        h.setIdEstudante(rs.getInt("id_estudante"));
        h.setIdDisciplina(rs.getInt("id_disciplina"));
        h.setMediaFinal(rs.getBigDecimal("media_final"));
        h.setResultado(rs.getString("resultado"));
        h.setAnoLetivo(rs.getString("ano_letivo"));
        return h;
    }
}
