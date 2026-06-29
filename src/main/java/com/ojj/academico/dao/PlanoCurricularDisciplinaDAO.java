package com.ojj.academico.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.PlanoCurricularDisciplina;
import com.ojj.academico.utils.ConnectionFactory;

public class PlanoCurricularDisciplinaDAO {

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

    public boolean excluir(int id) throws SQLException {
        String sql = "DELETE FROM plano_curricular_disciplina WHERE id_plano_curricular_disciplina = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        }
    }

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
