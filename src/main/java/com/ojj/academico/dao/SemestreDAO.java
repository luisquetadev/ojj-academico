package com.ojj.academico.dao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.Semestre;
import com.ojj.academico.utils.ConnectionFactory;

public class SemestreDAO {

    public Semestre buscarPorId(int idSemestre) throws SQLException {
        String sql = "SELECT * FROM semestre WHERE id_semestre = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idSemestre);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapSemestre(rs);
            }
            return null;
        }
    }

    public List<Semestre> listarTodos() throws SQLException {
        String sql = "SELECT * FROM semestre";
        List<Semestre> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapSemestre(rs));
            }
        }
        return list;
    }

    public boolean inserir(Semestre semestre) throws SQLException {
        String sql = "INSERT INTO semestre (id_ano_academico, nome_semestre, data_inicio, data_fim) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, semestre.getIdAnoAcademico());
            stmt.setString(2, semestre.getNomeSemestre());
            setDate(stmt, 3, semestre.getDataInicio());
            setDate(stmt, 4, semestre.getDataFim());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    semestre.setIdSemestre(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    public boolean atualizar(Semestre semestre) throws SQLException {
        String sql = "UPDATE semestre SET id_ano_academico = ?, nome_semestre = ?, data_inicio = ?, data_fim = ? WHERE id_semestre = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, semestre.getIdAnoAcademico());
            stmt.setString(2, semestre.getNomeSemestre());
            setDate(stmt, 3, semestre.getDataInicio());
            setDate(stmt, 4, semestre.getDataFim());
            stmt.setInt(5, semestre.getIdSemestre());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean excluir(int idSemestre) throws SQLException {
        String sql = "DELETE FROM semestre WHERE id_semestre = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idSemestre);
            return stmt.executeUpdate() > 0;
        }
    }

    private Semestre mapSemestre(ResultSet rs) throws SQLException {
        Semestre s = new Semestre();
        s.setIdSemestre(rs.getInt("id_semestre"));
        s.setIdAnoAcademico(rs.getInt("id_ano_academico"));
        s.setNomeSemestre(rs.getString("nome_semestre"));
        s.setDataInicio(getDate(rs, "data_inicio"));
        s.setDataFim(getDate(rs, "data_fim"));
        return s;
    }

    private void setDate(PreparedStatement stmt, int index, LocalDate value) throws SQLException {
        if (value != null) {
            stmt.setDate(index, Date.valueOf(value));
        } else {
            stmt.setNull(index, Types.DATE);
        }
    }

    private LocalDate getDate(ResultSet rs, String columnLabel) throws SQLException {
        Date date = rs.getDate(columnLabel);
        return date != null ? date.toLocalDate() : null;
    }
}
