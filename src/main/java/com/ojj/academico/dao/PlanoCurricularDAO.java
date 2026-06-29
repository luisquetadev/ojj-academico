package com.ojj.academico.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.PlanoCurricular;
import com.ojj.academico.utils.ConnectionFactory;

public class PlanoCurricularDAO {

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
