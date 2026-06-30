package com.ojj.academico.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.PlanoCurricular;
import com.ojj.academico.utils.ConnectionFactory;

/**
 * DAO para a tabela {@code plano_curricular}.
 * <p>
 * Estrutura curricular dos cursos (anos, semestres, carga horária).
 * </p>
 */
public class PlanoCurricularDAO {

    /**
     * Busca um plano curricular pelo ID.
     *
     * @param idPlanoCurricular chave primária
     * @return o plano encontrado ou {@code null}
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public PlanoCurricular buscarPorId(int idPlanoCurricular) throws SQLException {
        String sql = "SELECT * FROM plano_curricular WHERE id_plano_curricular = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idPlanoCurricular);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapPlano(rs);
            }
            return null;
        }
    }

    /**
     * Lista todos os planos curriculares.
     *
     * @return lista de planos
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public List<PlanoCurricular> listarTodos() throws SQLException {
        String sql = "SELECT * FROM plano_curricular";
        List<PlanoCurricular> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapPlano(rs));
            }
        }
        return list;
    }

    /**
     * Insere um novo plano curricular.
     *
     * @param plano dados do plano
     * @return {@code true} se a inserção foi bem-sucedida
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean inserir(PlanoCurricular plano) throws SQLException {
        String sql = "INSERT INTO plano_curricular (id_curso, ano_curricular, semestre, carga_horaria) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, plano.getIdCurso());
            stmt.setInt(2, plano.getAnoCurricular());
            stmt.setInt(3, plano.getSemestre());
            if (plano.getCargaHoraria() == null) {
                stmt.setNull(4, Types.INTEGER);
            } else {
                stmt.setInt(4, plano.getCargaHoraria());
            }
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    plano.setIdPlanoCurricular(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    /**
     * Actualiza um plano curricular.
     *
     * @param plano dados actualizados
     * @return {@code true} se algum registo foi alterado
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean atualizar(PlanoCurricular plano) throws SQLException {
        String sql = "UPDATE plano_curricular SET id_curso = ?, ano_curricular = ?, semestre = ?, carga_horaria = ? WHERE id_plano_curricular = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, plano.getIdCurso());
            stmt.setInt(2, plano.getAnoCurricular());
            stmt.setInt(3, plano.getSemestre());
            if (plano.getCargaHoraria() == null) {
                stmt.setNull(4, Types.INTEGER);
            } else {
                stmt.setInt(4, plano.getCargaHoraria());
            }
            stmt.setInt(5, plano.getIdPlanoCurricular());
            return stmt.executeUpdate() > 0;
        }
    }

    /**
     * Lista os planos curriculares de um curso específico.
     *
     * @param idCurso ID do curso
     * @return planos do curso
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public List<PlanoCurricular> listarPorCurso(int idCurso) throws SQLException {
        String sql = "SELECT * FROM plano_curricular WHERE id_curso = ?";
        List<PlanoCurricular> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idCurso);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapPlano(rs));
            }
        }
        return list;
    }

    /**
     * Exclui um plano curricular.
     *
     * @param idPlanoCurricular chave primária
     * @return {@code true} se o registo foi removido
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean excluir(int idPlanoCurricular) throws SQLException {
        String sql = "DELETE FROM plano_curricular WHERE id_plano_curricular = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idPlanoCurricular);
            return stmt.executeUpdate() > 0;
        }
    }

    private PlanoCurricular mapPlano(ResultSet rs) throws SQLException {
        PlanoCurricular p = new PlanoCurricular();
        p.setIdPlanoCurricular(rs.getInt("id_plano_curricular"));
        p.setIdCurso(rs.getInt("id_curso"));
        p.setAnoCurricular(rs.getInt("ano_curricular"));
        p.setSemestre(rs.getInt("semestre"));
        int carga = rs.getInt("carga_horaria");
        p.setCargaHoraria(rs.wasNull() ? null : carga);
        return p;
    }
}
