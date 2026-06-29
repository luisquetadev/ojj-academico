package com.ojj.academico.dao;

import java.sql.*;
import java.math.BigDecimal;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ojj.academico.model.Nota;
import com.ojj.academico.utils.ConnectionFactory;

public class NotaDAO {

    public Nota buscarPorId(int idNota) throws SQLException {
        String sql = "SELECT * FROM nota WHERE id_nota = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idNota);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapNota(rs);
            }
            return null;
        }
    }

    public List<Nota> listarTodos() throws SQLException {
        String sql = "SELECT * FROM nota";
        List<Nota> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapNota(rs));
            }
        }
        return list;
    }

    public boolean inserir(Nota nota) throws SQLException {
        String sql = "INSERT INTO nota (id_avaliacao, id_estudante, nota, observacao) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, nota.getIdAvaliacao());
            stmt.setInt(2, nota.getIdEstudante());
            stmt.setBigDecimal(3, nota.getNota());
            stmt.setString(4, nota.getObservacao());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    nota.setIdNota(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    public boolean atualizar(Nota nota) throws SQLException {
        String sql = "UPDATE nota SET id_avaliacao = ?, id_estudante = ?, nota = ?, observacao = ? WHERE id_nota = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, nota.getIdAvaliacao());
            stmt.setInt(2, nota.getIdEstudante());
            stmt.setBigDecimal(3, nota.getNota());
            stmt.setString(4, nota.getObservacao());
            stmt.setInt(5, nota.getIdNota());
            return stmt.executeUpdate() > 0;
        }
    }

    public List<Nota> listarPorAvaliacao(int idAvaliacao) throws SQLException {
        String sql = "SELECT * FROM nota WHERE id_avaliacao = ?";
        List<Nota> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idAvaliacao);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapNota(rs));
            }
        }
        return list;
    }

    public Nota buscarPorAvaliacaoEEstudante(int idAvaliacao, int idEstudante) throws SQLException {
        String sql = "SELECT * FROM nota WHERE id_avaliacao = ? AND id_estudante = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idAvaliacao);
            stmt.setInt(2, idEstudante);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapNota(rs);
            }
        }
        return null;
    }

    public List<Nota> listarPorEstudante(int idEstudante) throws SQLException {
        String sql = "SELECT * FROM nota WHERE id_estudante = ? ORDER BY id_avaliacao";
        List<Nota> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idEstudante);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapNota(rs));
            }
        }
        return list;
    }

    public List<Map<String, Object>> listarPorEstudanteComAvaliacao(int idEstudante) throws SQLException {
        String sql = "SELECT n.*, a.tipo, a.descricao AS avaliacao_descricao, a.data_avaliacao, " +
                     "d.nome_disciplina, d.codigo_disciplina, d.id_disciplina " +
                     "FROM nota n " +
                     "JOIN avaliacao a ON n.id_avaliacao = a.id_avaliacao " +
                     "JOIN disciplina d ON a.id_disciplina = d.id_disciplina " +
                     "WHERE n.id_estudante = ? " +
                     "ORDER BY d.nome_disciplina, a.data_avaliacao";
        List<Map<String, Object>> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idEstudante);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Map<String, Object> map = new java.util.HashMap<>();
                map.put("idNota", rs.getInt("id_nota"));
                map.put("idAvaliacao", rs.getInt("id_avaliacao"));
                map.put("idEstudante", rs.getInt("id_estudante"));
                map.put("nota", rs.getBigDecimal("nota"));
                map.put("observacao", rs.getString("observacao"));
                map.put("tipo", rs.getString("tipo"));
                map.put("avaliacaoDescricao", rs.getString("avaliacao_descricao"));
                map.put("dataAvaliacao", rs.getDate("data_avaliacao"));
                map.put("nomeDisciplina", rs.getString("nome_disciplina"));
                map.put("codigoDisciplina", rs.getString("codigo_disciplina"));
                map.put("idDisciplina", rs.getInt("id_disciplina"));
                list.add(map);
            }
        }
        return list;
    }

    public boolean excluir(int idNota) throws SQLException {
        String sql = "DELETE FROM nota WHERE id_nota = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idNota);
            return stmt.executeUpdate() > 0;
        }
    }

    private Nota mapNota(ResultSet rs) throws SQLException {
        Nota n = new Nota();
        n.setIdNota(rs.getInt("id_nota"));
        n.setIdAvaliacao(rs.getInt("id_avaliacao"));
        n.setIdEstudante(rs.getInt("id_estudante"));
        n.setNota(rs.getBigDecimal("nota"));
        n.setObservacao(rs.getString("observacao"));
        return n;
    }
}
