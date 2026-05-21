package com.ojj.academico.dao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

import com.ojj.academico.model.Avaliacao;
import com.ojj.academico.utils.ConnectionFactory;

public class AvaliacaoDAO {

    public Avaliacao buscarPorId(int idAvaliacao) throws SQLException {
        String sql = "SELECT * FROM avaliacao WHERE id_avaliacao = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idAvaliacao);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapAvaliacao(rs);
            }
            return null;
        }
    }

    public List<Avaliacao> listarTodos() throws SQLException {
        String sql = "SELECT * FROM avaliacao";
        List<Avaliacao> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapAvaliacao(rs));
            }
        }
        return list;
    }

    public boolean inserir(Avaliacao avaliacao) throws SQLException {
        String sql = "INSERT INTO avaliacao (id_disciplina, id_professor, tipo, descricao, data_avaliacao, peso) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, avaliacao.getIdDisciplina());
            stmt.setInt(2, avaliacao.getIdProfessor());
            stmt.setString(3, avaliacao.getTipo());
            stmt.setString(4, avaliacao.getDescricao());
            if (avaliacao.getDataAvaliacao() == null) {
                stmt.setNull(5, Types.DATE);
            } else {
                stmt.setDate(5, Date.valueOf(avaliacao.getDataAvaliacao()));
            }
            stmt.setBigDecimal(6, avaliacao.getPeso());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    avaliacao.setIdAvaliacao(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    public boolean atualizar(Avaliacao avaliacao) throws SQLException {
        String sql = "UPDATE avaliacao SET id_disciplina = ?, id_professor = ?, tipo = ?, descricao = ?, data_avaliacao = ?, peso = ? WHERE id_avaliacao = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, avaliacao.getIdDisciplina());
            stmt.setInt(2, avaliacao.getIdProfessor());
            stmt.setString(3, avaliacao.getTipo());
            stmt.setString(4, avaliacao.getDescricao());
            if (avaliacao.getDataAvaliacao() == null) {
                stmt.setNull(5, Types.DATE);
            } else {
                stmt.setDate(5, Date.valueOf(avaliacao.getDataAvaliacao()));
            }
            stmt.setBigDecimal(6, avaliacao.getPeso());
            stmt.setInt(7, avaliacao.getIdAvaliacao());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean excluir(int idAvaliacao) throws SQLException {
        String sql = "DELETE FROM avaliacao WHERE id_avaliacao = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idAvaliacao);
            return stmt.executeUpdate() > 0;
        }
    }

    private Avaliacao mapAvaliacao(ResultSet rs) throws SQLException {
        Avaliacao a = new Avaliacao();
        a.setIdAvaliacao(rs.getInt("id_avaliacao"));
        a.setIdDisciplina(rs.getInt("id_disciplina"));
        a.setIdProfessor(rs.getInt("id_professor"));
        a.setTipo(rs.getString("tipo"));
        a.setDescricao(rs.getString("descricao"));
        Date data = rs.getDate("data_avaliacao");
        if (data != null) {
            a.setDataAvaliacao(data.toLocalDate());
        }
        a.setPeso(rs.getBigDecimal("peso"));
        return a;
    }
}
