package com.ojj.academico.dao;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.Turma;
import com.ojj.academico.utils.ConnectionFactory;

public class TurmaDAO {

    public Turma buscarPorId(int idTurma) throws SQLException {
        String sql = "SELECT * FROM turma WHERE id_turma = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idTurma);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapTurma(rs);
            }
            return null;
        }
    }

    public List<Turma> listarTodos() throws SQLException {
        String sql = "SELECT * FROM turma";
        List<Turma> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapTurma(rs));
            }
        }
        return list;
    }

   
    public List<Turma> listarPorProfessor(int idProfessor) throws SQLException {
        String sql = "SELECT DISTINCT t.* FROM turma t "
                + "JOIN curso c ON t.id_curso = c.id_curso "
                + "JOIN plano_curricular pc ON c.id_curso = pc.id_curso "
                + "JOIN plano_curricular_disciplina pcd ON pc.id_plano_curricular = pcd.id_plano_curricular "
                + "JOIN professor_disciplina pd ON pcd.id_disciplina = pd.id_disciplina "
                + "WHERE pd.id_professor = ? "
                + "ORDER BY t.codigo_turma";
        List<Turma> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idProfessor);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapTurma(rs));
            }
        }
        return list;
    }

     public boolean inserir(Turma turma) throws SQLException {
        String sql = "INSERT INTO turma (id_curso, id_sala, codigo_turma, turno, ano_curricular, capacidade_maxima, estudantes_inscritos, horario, data_criacao) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, turma.getIdCurso());
            setInteger(stmt, 2, turma.getIdSala());
            stmt.setString(3, turma.getCodigoTurma());
            stmt.setString(4, turma.getTurno());
            stmt.setInt(5, turma.getAnoCurricular());
            stmt.setInt(6, turma.getCapacidadeMaxima());
            stmt.setInt(7, turma.getEstudantesInscritos());
            stmt.setString(8, turma.getHorario());
            setTimestamp(stmt, 9, turma.getDataCriacao());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    turma.setIdTurma(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    public boolean atualizar(Turma turma) throws SQLException {
        String sql = "UPDATE turma SET id_curso = ?, id_sala = ?, codigo_turma = ?, turno = ?, ano_curricular = ?, capacidade_maxima = ?, estudantes_inscritos = ?, horario = ?, data_criacao = ? WHERE id_turma = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, turma.getIdCurso());
            setInteger(stmt, 2, turma.getIdSala());
            stmt.setString(3, turma.getCodigoTurma());
            stmt.setString(4, turma.getTurno());
            stmt.setInt(5, turma.getAnoCurricular());
            stmt.setInt(6, turma.getCapacidadeMaxima());
            stmt.setInt(7, turma.getEstudantesInscritos());
            stmt.setString(8, turma.getHorario());
            setTimestamp(stmt, 9, turma.getDataCriacao());
            stmt.setInt(10, turma.getIdTurma());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean excluir(int idTurma) throws SQLException {
        String sql = "DELETE FROM turma WHERE id_turma = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idTurma);
            return stmt.executeUpdate() > 0;
        }
    }

    private Turma mapTurma(ResultSet rs) throws SQLException {
        Turma t = new Turma();
        t.setIdTurma(rs.getInt("id_turma"));
        t.setIdCurso(rs.getInt("id_curso"));
        t.setIdSala(getInteger(rs, "id_sala"));
        t.setCodigoTurma(rs.getString("codigo_turma"));
        t.setTurno(rs.getString("turno"));
        t.setAnoCurricular(rs.getInt("ano_curricular"));
        t.setCapacidadeMaxima(rs.getInt("capacidade_maxima"));
        t.setEstudantesInscritos(rs.getInt("estudantes_inscritos"));
        t.setHorario(rs.getString("horario"));
        t.setDataCriacao(getTimestamp(rs, "data_criacao"));
        return t;
    }

    private void setInteger(PreparedStatement stmt, int index, Integer value) throws SQLException {
        if (value != null) {
            stmt.setInt(index, value);
        } else {
            stmt.setNull(index, Types.INTEGER);
        }
    }

    private Integer getInteger(ResultSet rs, String columnLabel) throws SQLException {
        int value = rs.getInt(columnLabel);
        return rs.wasNull() ? null : value;
    }

    private void setTimestamp(PreparedStatement stmt, int index, LocalDateTime value) throws SQLException {
        if (value != null) {
            stmt.setTimestamp(index, Timestamp.valueOf(value));
        } else {
            stmt.setNull(index, Types.TIMESTAMP);
        }
    }

    private LocalDateTime getTimestamp(ResultSet rs, String columnLabel) throws SQLException {
        Timestamp ts = rs.getTimestamp(columnLabel);
        return ts != null ? ts.toLocalDateTime() : null;
    }
}

