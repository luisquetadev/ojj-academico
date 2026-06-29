package com.ojj.academico.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.Professor;
import com.ojj.academico.utils.ConnectionFactory;

public class ProfessorDAO {

    public Professor buscarPorId(int idProfessor) throws SQLException {
        String sql = "SELECT * FROM professor WHERE id_professor = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idProfessor);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapProfessor(rs);
            }
            return null;
        }
    }

    public Professor buscarPorIdFuncionario(int idFuncionario) throws SQLException {
        String sql = "SELECT * FROM professor WHERE id_funcionario = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idFuncionario);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapProfessor(rs);
            }
            return null;
        }
    }

    public List<Professor> listarTodos() throws SQLException {
        String sql = "SELECT * FROM professor";
        List<Professor> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapProfessor(rs));
            }
        }
        return list;
    }

    public boolean inserir(Professor professor) throws SQLException {
        String sql = "INSERT INTO professor (id_funcionario, grau_academico, especialidade) VALUES (?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, professor.getIdFuncionario());
            stmt.setString(2, professor.getGrauAcademico());
            stmt.setString(3, professor.getEspecialidade());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    professor.setIdProfessor(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    public boolean atualizar(Professor professor) throws SQLException {
        String sql = "UPDATE professor SET id_funcionario = ?, grau_academico = ?, especialidade = ? WHERE id_professor = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, professor.getIdFuncionario());
            stmt.setString(2, professor.getGrauAcademico());
            stmt.setString(3, professor.getEspecialidade());
            stmt.setInt(4, professor.getIdProfessor());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean excluir(int idProfessor) throws SQLException {
        String sql = "DELETE FROM professor WHERE id_professor = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idProfessor);
            return stmt.executeUpdate() > 0;
        }
    }

    private Professor mapProfessor(ResultSet rs) throws SQLException {
        Professor p = new Professor();
        p.setIdProfessor(rs.getInt("id_professor"));
        p.setIdFuncionario(rs.getInt("id_funcionario"));
        p.setGrauAcademico(rs.getString("grau_academico"));
        p.setEspecialidade(rs.getString("especialidade"));
        return p;
    }
}
