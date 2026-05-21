package com.ojj.academico.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.Sala;
import com.ojj.academico.utils.ConnectionFactory;

public class SalaDAO {

    public Sala buscarPorId(int idSala) throws SQLException {
        String sql = "SELECT * FROM sala WHERE id_sala = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idSala);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapSala(rs);
            }
            return null;
        }
    }

    public List<Sala> listarTodos() throws SQLException {
        String sql = "SELECT * FROM sala";
        List<Sala> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapSala(rs));
            }
        }
        return list;
    }

    public boolean inserir(Sala sala) throws SQLException {
        String sql = "INSERT INTO sala (codigo_sala, bloco, capacidade) VALUES (?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, sala.getCodigoSala());
            stmt.setString(2, sala.getBloco());
            stmt.setInt(3, sala.getCapacidade());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    sala.setIdSala(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    public boolean atualizar(Sala sala) throws SQLException {
        String sql = "UPDATE sala SET codigo_sala = ?, bloco = ?, capacidade = ? WHERE id_sala = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, sala.getCodigoSala());
            stmt.setString(2, sala.getBloco());
            stmt.setInt(3, sala.getCapacidade());
            stmt.setInt(4, sala.getIdSala());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean excluir(int idSala) throws SQLException {
        String sql = "DELETE FROM sala WHERE id_sala = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idSala);
            return stmt.executeUpdate() > 0;
        }
    }

    private Sala mapSala(ResultSet rs) throws SQLException {
        Sala s = new Sala();
        s.setIdSala(rs.getInt("id_sala"));
        s.setCodigoSala(rs.getString("codigo_sala"));
        s.setBloco(rs.getString("bloco"));
        s.setCapacidade(rs.getInt("capacidade"));
        return s;
    }
}
