package com.ojj.academico.dao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.AnoAcademico;
import com.ojj.academico.utils.ConnectionFactory;

public class AnoAcademicoDAO {

    public AnoAcademico buscarPorId(int idAnoAcademico) throws SQLException {
        String sql = "SELECT * FROM ano_academico WHERE id_ano_academico = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idAnoAcademico);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapAnoAcademico(rs);
            }
            return null;
        }
    }

    public List<AnoAcademico> listarTodos() throws SQLException {
        String sql = "SELECT * FROM ano_academico";
        List<AnoAcademico> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapAnoAcademico(rs));
            }
        }
        return list;
    }

    public boolean inserir(AnoAcademico anoAcademico) throws SQLException {
        String sql = "INSERT INTO ano_academico (descricao, data_inicio, data_fim, status) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, anoAcademico.getDescricao());
            stmt.setDate(2, Date.valueOf(anoAcademico.getDataInicio()));
            stmt.setDate(3, Date.valueOf(anoAcademico.getDataFim()));
            stmt.setString(4, anoAcademico.getStatus());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    anoAcademico.setIdAnoAcademico(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    public boolean atualizar(AnoAcademico anoAcademico) throws SQLException {
        String sql = "UPDATE ano_academico SET descricao = ?, data_inicio = ?, data_fim = ?, status = ? WHERE id_ano_academico = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, anoAcademico.getDescricao());
            stmt.setDate(2, Date.valueOf(anoAcademico.getDataInicio()));
            stmt.setDate(3, Date.valueOf(anoAcademico.getDataFim()));
            stmt.setString(4, anoAcademico.getStatus());
            stmt.setInt(5, anoAcademico.getIdAnoAcademico());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean excluir(int idAnoAcademico) throws SQLException {
        String sql = "DELETE FROM ano_academico WHERE id_ano_academico = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idAnoAcademico);
            return stmt.executeUpdate() > 0;
        }
    }

    private AnoAcademico mapAnoAcademico(ResultSet rs) throws SQLException {
        AnoAcademico ano = new AnoAcademico();
        ano.setIdAnoAcademico(rs.getInt("id_ano_academico"));
        ano.setDescricao(rs.getString("descricao"));
        ano.setDataInicio(rs.getDate("data_inicio").toLocalDate());
        ano.setDataFim(rs.getDate("data_fim").toLocalDate());
        ano.setStatus(rs.getString("status"));
        return ano;
    }
}
