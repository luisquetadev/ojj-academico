package com.ojj.academico.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.ProfessorDisciplina;
import com.ojj.academico.utils.ConnectionFactory;

public class ProfessorDisciplinaDAO {

    public List<ProfessorDisciplina> listarPorProfessor(int idProfessor) throws SQLException {
        String sql = "SELECT * FROM professor_disciplina WHERE id_professor = ?";
        List<ProfessorDisciplina> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idProfessor);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapProfessorDisciplina(rs));
            }
        }
        return list;
    }

    public List<Integer> listarIdDisciplinasPorProfessor(int idProfessor) throws SQLException {
        String sql = "SELECT id_disciplina FROM professor_disciplina WHERE id_professor = ?";
        List<Integer> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idProfessor);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("id_disciplina"));
            }
        }
        return list;
    }

    public List<ProfessorDisciplina> listarTodos() throws SQLException {
        String sql = "SELECT * FROM professor_disciplina";
        List<ProfessorDisciplina> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapProfessorDisciplina(rs));
            }
        }
        return list;
    }

    public boolean inserir(ProfessorDisciplina pd) throws SQLException {
        String sql = "INSERT INTO professor_disciplina (id_professor, id_disciplina) VALUES (?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, pd.getIdProfessor());
            stmt.setInt(2, pd.getIdDisciplina());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    pd.setIdProfessorDisciplina(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    public boolean excluir(int idProfessorDisciplina) throws SQLException {
        String sql = "DELETE FROM professor_disciplina WHERE id_professor_disciplina = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idProfessorDisciplina);
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean excluirPorProfessorEDisciplina(int idProfessor, int idDisciplina) throws SQLException {
        String sql = "DELETE FROM professor_disciplina WHERE id_professor = ? AND id_disciplina = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idProfessor);
            stmt.setInt(2, idDisciplina);
            return stmt.executeUpdate() > 0;
        }
    }

    private ProfessorDisciplina mapProfessorDisciplina(ResultSet rs) throws SQLException {
        ProfessorDisciplina pd = new ProfessorDisciplina();
        pd.setIdProfessorDisciplina(rs.getInt("id_professor_disciplina"));
        pd.setIdProfessor(rs.getInt("id_professor"));
        pd.setIdDisciplina(rs.getInt("id_disciplina"));
        return pd;
    }
}
