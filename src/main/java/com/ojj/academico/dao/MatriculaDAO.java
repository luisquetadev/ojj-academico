package com.ojj.academico.dao;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.Matricula;
import com.ojj.academico.utils.ConnectionFactory;

public class MatriculaDAO {

    public Matricula buscarPorId(int idMatricula) throws SQLException {
        String sql = "SELECT * FROM matricula WHERE id_matricula = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idMatricula);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapMatricula(rs);
            }
            return null;
        }
    }

    public List<Matricula> buscarPorIdTurma(int idTurma) throws SQLException {
        String sql = "SELECT * FROM matricula WHERE id_turma = ? ORDER BY data_matricula DESC";
        List<Matricula> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idTurma);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapMatricula(rs));
            }
        }
        return list;
    }

    public List<Matricula> buscarPorIdEstudante(int idEstudante) throws SQLException {
        String sql = "SELECT * FROM matricula WHERE id_estudante = ? ORDER BY data_matricula DESC";
        List<Matricula> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idEstudante);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapMatricula(rs));
            }
        }
        return list;
    }

    public List<Matricula> listarTodos() throws SQLException {
        String sql = "SELECT * FROM matricula";
        List<Matricula> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapMatricula(rs));
            }
        }
        return list;
    }

    public boolean inserir(Matricula matricula) throws SQLException {
        String sql = "INSERT INTO matricula (id_estudante, id_curso, id_turma, id_ano_academico, id_semestre, data_matricula, data_confirmacao, status, observacoes) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, matricula.getIdEstudante());
            stmt.setInt(2, matricula.getIdCurso());
            stmt.setInt(3, matricula.getIdTurma());
            stmt.setInt(4, matricula.getIdAnoAcademico());
            stmt.setInt(5, matricula.getIdSemestre());
            setTimestamp(stmt, 6, matricula.getDataMatricula());
            setTimestamp(stmt, 7, matricula.getDataConfirmacao());
            stmt.setString(8, matricula.getStatus());
            stmt.setString(9, matricula.getObservacoes());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    matricula.setIdMatricula(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    public boolean atualizar(Matricula matricula) throws SQLException {
        String sql = "UPDATE matricula SET id_estudante = ?, id_curso = ?, id_turma = ?, id_ano_academico = ?, id_semestre = ?, data_matricula = ?, data_confirmacao = ?, status = ?, observacoes = ? WHERE id_matricula = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, matricula.getIdEstudante());
            stmt.setInt(2, matricula.getIdCurso());
            stmt.setInt(3, matricula.getIdTurma());
            stmt.setInt(4, matricula.getIdAnoAcademico());
            stmt.setInt(5, matricula.getIdSemestre());
            setTimestamp(stmt, 6, matricula.getDataMatricula());
            setTimestamp(stmt, 7, matricula.getDataConfirmacao());
            stmt.setString(8, matricula.getStatus());
            stmt.setString(9, matricula.getObservacoes());
            stmt.setInt(10, matricula.getIdMatricula());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean excluir(int idMatricula) throws SQLException {
        String sql = "DELETE FROM matricula WHERE id_matricula = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idMatricula);
            return stmt.executeUpdate() > 0;
        }
    }

    public int contarAtivas() throws SQLException {
        String sql = "SELECT COUNT(*) FROM matricula WHERE status = 'ACTIVA'";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
            return 0;
        }
    }

    private Matricula mapMatricula(ResultSet rs) throws SQLException {
        Matricula m = new Matricula();
        m.setIdMatricula(rs.getInt("id_matricula"));
        m.setIdEstudante(rs.getInt("id_estudante"));
        m.setIdCurso(rs.getInt("id_curso"));
        m.setIdTurma(rs.getInt("id_turma"));
        m.setIdAnoAcademico(rs.getInt("id_ano_academico"));
        m.setIdSemestre(rs.getInt("id_semestre"));
        m.setDataMatricula(getTimestamp(rs, "data_matricula"));
        m.setDataConfirmacao(getTimestamp(rs, "data_confirmacao"));
        m.setStatus(rs.getString("status"));
        m.setObservacoes(rs.getString("observacoes"));
        return m;
    }

    private void setTimestamp(PreparedStatement stmt, int index, LocalDateTime value) throws SQLException {
        if (value != null) {
            stmt.setTimestamp(index, Timestamp.valueOf(value));
        } else {
            stmt.setNull(index, Types.TIMESTAMP);
        }
    }

    private LocalDateTime getTimestamp(ResultSet rs, String label) throws SQLException {
        Timestamp ts = rs.getTimestamp(label);
        return ts != null ? ts.toLocalDateTime() : null;
    }
}
