package com.ojj.academico.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.MatriculaDisciplina;
import com.ojj.academico.utils.ConnectionFactory;

public class MatriculaDisciplinaDAO {

    public MatriculaDisciplina buscarPorId(int idMatricula, int idDisciplina) throws SQLException {
        String sql = "SELECT * FROM matricula_disciplina WHERE id_matricula = ? AND id_disciplina = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idMatricula);
            stmt.setInt(2, idDisciplina);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapMatriculaDisciplina(rs);
            }
            return null;
        }
    }

    public List<MatriculaDisciplina> listarTodos() throws SQLException {
        String sql = "SELECT * FROM matricula_disciplina";
        List<MatriculaDisciplina> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapMatriculaDisciplina(rs));
            }
        }
        return list;
    }

    public boolean inserir(MatriculaDisciplina item) throws SQLException {
        String sql = "INSERT INTO matricula_disciplina (id_matricula, id_disciplina) VALUES (?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, item.getIdMatricula());
            stmt.setInt(2, item.getIdDisciplina());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean excluir(int idMatricula, int idDisciplina) throws SQLException {
        String sql = "DELETE FROM matricula_disciplina WHERE id_matricula = ? AND id_disciplina = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idMatricula);
            stmt.setInt(2, idDisciplina);
            return stmt.executeUpdate() > 0;
        }
    }

    private MatriculaDisciplina mapMatriculaDisciplina(ResultSet rs) throws SQLException {
        MatriculaDisciplina m = new MatriculaDisciplina();
        m.setIdMatricula(rs.getInt("id_matricula"));
        m.setIdDisciplina(rs.getInt("id_disciplina"));
        return m;
    }
}
