package com.ojj.academico.dao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

import com.ojj.academico.model.Propina;
import com.ojj.academico.utils.ConnectionFactory;

public class PropinaDAO {

    public Propina buscarPorId(int idPropina) throws SQLException {
        String sql = "SELECT * FROM propina WHERE id_propina = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idPropina);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapPropina(rs);
            }
            return null;
        }
    }

    public List<Propina> listarTodos() throws SQLException {
        String sql = "SELECT * FROM propina";
        List<Propina> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapPropina(rs));
            }
        }
        return list;
    }

    public boolean inserir(Propina propina) throws SQLException {
        String sql = "INSERT INTO propina (id_estudante, mes_referencia, ano_referencia, valor, multa, data_vencimento, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, propina.getIdEstudante());
            stmt.setString(2, propina.getMesReferencia());
            stmt.setInt(3, propina.getAnoReferencia());
            stmt.setBigDecimal(4, propina.getValor());
            stmt.setBigDecimal(5, propina.getMulta());
            stmt.setDate(6, Date.valueOf(propina.getDataVencimento()));
            stmt.setString(7, propina.getStatus());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    propina.setIdPropina(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    public boolean atualizar(Propina propina) throws SQLException {
        String sql = "UPDATE propina SET id_estudante = ?, mes_referencia = ?, ano_referencia = ?, valor = ?, multa = ?, data_vencimento = ?, status = ? WHERE id_propina = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, propina.getIdEstudante());
            stmt.setString(2, propina.getMesReferencia());
            stmt.setInt(3, propina.getAnoReferencia());
            stmt.setBigDecimal(4, propina.getValor());
            stmt.setBigDecimal(5, propina.getMulta());
            stmt.setDate(6, Date.valueOf(propina.getDataVencimento()));
            stmt.setString(7, propina.getStatus());
            stmt.setInt(8, propina.getIdPropina());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean excluir(int idPropina) throws SQLException {
        String sql = "DELETE FROM propina WHERE id_propina = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idPropina);
            return stmt.executeUpdate() > 0;
        }
    }

    public List<Propina> listarPorEstudante(int idEstudante) throws SQLException {
        String sql = "SELECT * FROM propina WHERE id_estudante = ? ORDER BY ano_referencia DESC, \n" +
                     "CASE mes_referencia \n" +
                     "WHEN 'DEZEMBRO' THEN 12 WHEN 'NOVEMBRO' THEN 11 WHEN 'OUTUBRO' THEN 10 \n" +
                     "WHEN 'SETEMBRO' THEN 9 WHEN 'AGOSTO' THEN 8 WHEN 'JULHO' THEN 7 \n" +
                     "WHEN 'JUNHO' THEN 6 WHEN 'MAIO' THEN 5 WHEN 'ABRIL' THEN 4 \n" +
                     "WHEN 'MARÇO' THEN 3 WHEN 'FEVEREIRO' THEN 2 WHEN 'JANEIRO' THEN 1 END";
        List<Propina> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idEstudante);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapPropina(rs));
            }
        }
        return list;
    }

    public String buscarStatusAtual(int idEstudante) throws SQLException {
        String sql = "SELECT status FROM propina WHERE id_estudante = ? ORDER BY ano_referencia DESC, \n" +
                     "CASE mes_referencia \n" +
                     "WHEN 'DEZEMBRO' THEN 12 WHEN 'NOVEMBRO' THEN 11 WHEN 'OUTUBRO' THEN 10 \n" +
                     "WHEN 'SETEMBRO' THEN 9 WHEN 'AGOSTO' THEN 8 WHEN 'JULHO' THEN 7 \n" +
                     "WHEN 'JUNHO' THEN 6 WHEN 'MAIO' THEN 5 WHEN 'ABRIL' THEN 4 \n" +
                     "WHEN 'MARÇO' THEN 3 WHEN 'FEVEREIRO' THEN 2 WHEN 'JANEIRO' THEN 1 END DESC LIMIT 1";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idEstudante);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("status");
            }
            return "NENHUM"; // Sem registro de propina
        }
    }

    private Propina mapPropina(ResultSet rs) throws SQLException {
        Propina p = new Propina();
        p.setIdPropina(rs.getInt("id_propina"));
        p.setIdEstudante(rs.getInt("id_estudante"));
        p.setMesReferencia(rs.getString("mes_referencia"));
        p.setAnoReferencia(rs.getInt("ano_referencia"));
        p.setValor(rs.getBigDecimal("valor"));
        p.setMulta(rs.getBigDecimal("multa"));
        p.setDataVencimento(rs.getDate("data_vencimento").toLocalDate());
        p.setStatus(rs.getString("status"));
        return p;
    }
}
