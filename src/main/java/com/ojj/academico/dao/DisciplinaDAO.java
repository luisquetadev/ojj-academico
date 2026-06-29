package com.ojj.academico.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.Disciplina;
import com.ojj.academico.utils.ConnectionFactory;

public class DisciplinaDAO {

    public Disciplina buscarPorId(int idDisciplina) throws SQLException {
        String sql = "SELECT * FROM disciplina WHERE id_disciplina = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idDisciplina);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapDisciplina(rs);
            }
            return null;
        }
    }

    public List<Disciplina> listarTodos() throws SQLException {
        String sql = "SELECT * FROM disciplina";
        List<Disciplina> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapDisciplina(rs));
            }
        }
        return list;
    }

   
    public List<Disciplina> listarPorProfessor(int idProfessor) throws SQLException {
        String sql = "SELECT d.* FROM disciplina d "
                + "JOIN professor_disciplina pd ON d.id_disciplina = pd.id_disciplina "
                + "WHERE pd.id_professor = ? "
                + "ORDER BY d.nome_disciplina";
        List<Disciplina> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idProfessor);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapDisciplina(rs));
            }
        }
        return list;
    }

     public boolean inserir(Disciplina disciplina) throws SQLException {
        String sql = "INSERT INTO disciplina (codigo_disciplina, nome_disciplina, carga_horaria) VALUES (?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, disciplina.getCodigoDisciplina());
            stmt.setString(2, disciplina.getNomeDisciplina());
            if (disciplina.getCargaHoraria() == null) {
                stmt.setNull(3, Types.INTEGER);
            } else {
                stmt.setInt(3, disciplina.getCargaHoraria());
            }
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    disciplina.setIdDisciplina(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    public boolean atualizar(Disciplina disciplina) throws SQLException {
        String sql = "UPDATE disciplina SET codigo_disciplina = ?, nome_disciplina = ?, carga_horaria = ? WHERE id_disciplina = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, disciplina.getCodigoDisciplina());
            stmt.setString(2, disciplina.getNomeDisciplina());
            if (disciplina.getCargaHoraria() == null) {
                stmt.setNull(3, Types.INTEGER);
            } else {
                stmt.setInt(3, disciplina.getCargaHoraria());
            }
            stmt.setInt(4, disciplina.getIdDisciplina());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean excluir(int idDisciplina) throws SQLException {
        String sql = "DELETE FROM disciplina WHERE id_disciplina = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idDisciplina);
            return stmt.executeUpdate() > 0;
        }
    }

    private Disciplina mapDisciplina(ResultSet rs) throws SQLException {
        Disciplina d = new Disciplina();
        d.setIdDisciplina(rs.getInt("id_disciplina"));
        d.setCodigoDisciplina(rs.getString("codigo_disciplina"));
        d.setNomeDisciplina(rs.getString("nome_disciplina"));
        int carga = rs.getInt("carga_horaria");
        if (rs.wasNull()) {
            d.setCargaHoraria(null);
        } else {
            d.setCargaHoraria(carga);
        }
        return d;
    }
}

