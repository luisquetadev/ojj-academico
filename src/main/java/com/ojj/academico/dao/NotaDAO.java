package com.ojj.academico.dao;

import java.sql.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

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
