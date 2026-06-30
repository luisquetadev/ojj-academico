package com.ojj.academico.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.PlanoCurricularDisciplina;
import com.ojj.academico.utils.ConnectionFactory;

/**
 * DAO para a tabela {@code plano_curricular_disciplina}.
 * <p>
 * Associação entre planos curriculares e as disciplinas que os compõem.
 * </p>
 */
public class PlanoCurricularDisciplinaDAO {

    /**
     * Busca uma associação pelo ID.
     *
     * @param id chave primária
     * @return a associação encontrada ou {@code null}
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public PlanoCurricularDisciplina buscarPorId(int id) throws SQLException {
        String sql = "SELECT * FROM plano_curricular_disciplina WHERE id_plano_curricular_disciplina = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return map(rs);
            }
            return null;
        }
    }

    /**
     * Lista todas as associações plano-disciplina.
     *
     * @return lista de associações
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public List<PlanoCurricularDisciplina> listarTodos() throws SQLException {
        String sql = "SELECT * FROM plano_curricular_disciplina";
        List<PlanoCurricularDisciplina> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(map(rs));
            }
        }
        return list;
    }

    /**
     * Lista as disciplinas associadas a um determinado plano curricular.
     *
     * @param idPlanoCurricular ID do plano curricular
     * @return disciplinas do plano
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public List<PlanoCurricularDisciplina> listarPorPlanoCurricular(int idPlanoCurricular) throws SQLException {
        String sql = "SELECT * FROM plano_curricular_disciplina WHERE id_plano_curricular = ?";
        List<PlanoCurricularDisciplina> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idPlanoCurricular);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(map(rs));
            }
        }
        return list;
    }

    /**
     * Insere a associação entre um plano curricular e uma disciplina.
     *
     * @param item dados da associação
     * @return {@code true} se a inserção foi bem-sucedida
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean inserir(PlanoCurricularDisciplina item) throws SQLException {
        String sql = "INSERT INTO plano_curricular_disciplina (id_plano_curricular, id_disciplina) VALUES (?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, item.getIdPlanoCurricular());
            stmt.setInt(2, item.getIdDisciplina());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    item.setIdPlanoCurricularDisciplina(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    /**
     * Exclui uma associação pelo seu ID.
     *
     * @param id chave primária
     * @return {@code true} se o registo foi removido
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean excluir(int id) throws SQLException {
        String sql = "DELETE FROM plano_curricular_disciplina WHERE id_plano_curricular_disciplina = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        }
    }

    /**
     * Exclui a associação pelo plano curricular e disciplina.
     *
     * @param idPlanoCurricular ID do plano
     * @param idDisciplina      ID da disciplina
     * @return {@code true} se o registo foi removido
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean excluirPorPlanoCurricularEDisciplina(int idPlanoCurricular, int idDisciplina) throws SQLException {
        String sql = "DELETE FROM plano_curricular_disciplina WHERE id_plano_curricular = ? AND id_disciplina = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idPlanoCurricular);
            stmt.setInt(2, idDisciplina);
            return stmt.executeUpdate() > 0;
        }
    }

    private PlanoCurricularDisciplina map(ResultSet rs) throws SQLException {
        PlanoCurricularDisciplina p = new PlanoCurricularDisciplina();
        p.setIdPlanoCurricularDisciplina(rs.getInt("id_plano_curricular_disciplina"));
        p.setIdPlanoCurricular(rs.getInt("id_plano_curricular"));
        p.setIdDisciplina(rs.getInt("id_disciplina"));
        return p;
    }
}
