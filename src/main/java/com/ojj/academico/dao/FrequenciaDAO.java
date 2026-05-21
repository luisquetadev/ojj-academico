package com.ojj.academico.dao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.Frequencia;
import com.ojj.academico.utils.ConnectionFactory;

public class FrequenciaDAO {

    public Frequencia buscarPorId(int idFrequencia) throws SQLException {
        String sql = "SELECT * FROM frequencia WHERE id_frequencia = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idFrequencia);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapFrequencia(rs);
            }
            return null;
        }
    }

    public List<Frequencia> listarTodos() throws SQLException {
        String sql = "SELECT * FROM frequencia";
        List<Frequencia> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapFrequencia(rs));
            }
        }
        return list;
    }

    public boolean inserir(Frequencia frequencia) throws SQLException {
        String sql = "INSERT INTO frequencia (id_estudante, id_disciplina, data_aula, status) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, frequencia.getIdEstudante());
            stmt.setInt(2, frequencia.getIdDisciplina());
            stmt.setDate(3, Date.valueOf(frequencia.getDataAula()));
            stmt.setString(4, frequencia.getStatus());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    frequencia.setIdFrequencia(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    public boolean atualizar(Frequencia frequencia) throws SQLException {
        String sql = "UPDATE frequencia SET id_estudante = ?, id_disciplina = ?, data_aula = ?, status = ? WHERE id_frequencia = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, frequencia.getIdEstudante());
            stmt.setInt(2, frequencia.getIdDisciplina());
            stmt.setDate(3, Date.valueOf(frequencia.getDataAula()));
            stmt.setString(4, frequencia.getStatus());
            stmt.setInt(5, frequencia.getIdFrequencia());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean excluir(int idFrequencia) throws SQLException {
        String sql = "DELETE FROM frequencia WHERE id_frequencia = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idFrequencia);
            return stmt.executeUpdate() > 0;
        }
    }

    private Frequencia mapFrequencia(ResultSet rs) throws SQLException {
        Frequencia f = new Frequencia();
        f.setIdFrequencia(rs.getInt("id_frequencia"));
        f.setIdEstudante(rs.getInt("id_estudante"));
        f.setIdDisciplina(rs.getInt("id_disciplina"));
        f.setDataAula(rs.getDate("data_aula").toLocalDate());
        f.setStatus(rs.getString("status"));
        return f;
    }
}
