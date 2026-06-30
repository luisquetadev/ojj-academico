package com.ojj.academico.dao;

import java.sql.*;
import java.math.BigDecimal;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ojj.academico.model.Nota;
import com.ojj.academico.utils.ConnectionFactory;

/**
 * DAO para a tabela {@code nota}.
 * <p>
 * Registo das notas obtidas pelos estudantes nas avaliações.
 * </p>
 */
public class NotaDAO {

    /**
     * Busca uma nota pelo ID.
     *
     * @param idNota chave primária
     * @return a nota encontrada ou {@code null}
     * @throws SQLException em caso de erro de acesso ao banco
     */
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

    /**
     * Lista todas as notas registadas.
     *
     * @return lista de notas
     * @throws SQLException em caso de erro de acesso ao banco
     */
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

    /**
     * Insere uma nova nota para um estudante numa avaliação.
     *
     * @param nota dados da nota
     * @return {@code true} se a inserção foi bem-sucedida
     * @throws SQLException em caso de erro de acesso ao banco
     */
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

    /**
     * Actualiza uma nota existente.
     *
     * @param nota dados actualizados
     * @return {@code true} se algum registo foi alterado
     * @throws SQLException em caso de erro de acesso ao banco
     */
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

    /**
     * Lista as notas de uma avaliação específica.
     *
     * @param idAvaliacao ID da avaliação
     * @return notas da avaliação
     * @throws SQLException em caso de erro de acesso ao banco
     */
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

    /**
     * Busca a nota de um estudante numa avaliação específica.
     *
     * @param idAvaliacao ID da avaliação
     * @param idEstudante ID do estudante
     * @return a nota encontrada ou {@code null}
     * @throws SQLException em caso de erro de acesso ao banco
     */
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

    /**
     * Lista todas as notas de um estudante.
     *
     * @param idEstudante ID do estudante
     * @return notas do estudante
     * @throws SQLException em caso de erro de acesso ao banco
     */
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

    /**
     * Lista as notas de um estudante com dados da avaliação e disciplina
     * (join com as tabelas {@code avaliacao} e {@code disciplina}).
     *
     * @param idEstudante ID do estudante
     * @return lista de mapas com dados completos das notas
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public List<Map<String, Object>> listarPorEstudanteComAvaliacao(int idEstudante) throws SQLException {
        // Join de 3 tabelas para obter nome da disciplina e descrição da avaliação
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

    /**
     * Exclui uma nota pelo ID.
     *
     * @param idNota chave primária
     * @return {@code true} se o registo foi removido
     * @throws SQLException em caso de erro de acesso ao banco
     */
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
