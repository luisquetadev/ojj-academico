package com.ojj.academico.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.Departamento;
import com.ojj.academico.utils.ConnectionFactory;

public class DepartamentoDAO {

    public Departamento buscarPorId(int idDepartamento) throws SQLException {
        String sql = "SELECT * FROM departamento WHERE id_departamento = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idDepartamento);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Departamento d = new Departamento();
                d.setIdDepartamento(rs.getInt("id_departamento"));
                d.setNomeDepartamento(rs.getString("nome_departamento"));
                return d;
            }
            return null;
        }
    }

    public List<Departamento> listarTodos() throws SQLException {
        String sql = "SELECT * FROM departamento";
        List<Departamento> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Departamento d = new Departamento();
                d.setIdDepartamento(rs.getInt("id_departamento"));
                d.setNomeDepartamento(rs.getString("nome_departamento"));
                list.add(d);
            }
        }
        return list;
    }

    public boolean inserir(Departamento departamento) throws SQLException {
        String sql = "INSERT INTO departamento (nome_departamento) VALUES (?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, departamento.getNomeDepartamento());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    departamento.setIdDepartamento(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    public boolean atualizar(Departamento departamento) throws SQLException {
        String sql = "UPDATE departamento SET nome_departamento = ? WHERE id_departamento = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, departamento.getNomeDepartamento());
            stmt.setInt(2, departamento.getIdDepartamento());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean excluir(int idDepartamento) throws SQLException {
        String sql = "DELETE FROM departamento WHERE id_departamento = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idDepartamento);
            return stmt.executeUpdate() > 0;
        }
    }
}
