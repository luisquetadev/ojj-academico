package com.ojj.academico.dao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

import com.ojj.academico.model.Avaliacao;
import com.ojj.academico.utils.ConnectionFactory;

/**
 * DAO para a tabela {@code avaliacao}.
 * <p>
 * Permite criar, listar, actualizar e remover avaliações,
 * bem como filtrá-las por disciplina ou professor.
 * </p>
 */
public class AvaliacaoDAO {

    /**
     * Busca uma avaliação pelo seu ID.
     *
     * @param idAvaliacao chave primária da avaliação
     * @return a avaliação encontrada ou {@code null}
     * @throws SQLException em caso de erro de acesso ao banco
     */
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

    /**
     * Lista todas as avaliações registadas.
     *
     * @return lista de avaliações
     * @throws SQLException em caso de erro de acesso ao banco
     */
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

    /**
     * Insere uma nova avaliação no banco.
     *
     * @param avaliacao dados da avaliação
     * @return {@code true} se a inserção foi bem-sucedida
     * @throws SQLException em caso de erro de acesso ao banco
     */
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

    /**
     * Actualiza os dados de uma avaliação existente.
     *
     * @param avaliacao dados actualizados
     * @return {@code true} se algum registo foi alterado
     * @throws SQLException em caso de erro de acesso ao banco
     */
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

    /**
     * Lista as avaliações de uma disciplina, ordenadas por data.
     *
     * @param idDisciplina ID da disciplina
     * @return avaliações associadas
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public List<Avaliacao> listarPorDisciplina(int idDisciplina) throws SQLException {
        String sql = "SELECT * FROM avaliacao WHERE id_disciplina = ? ORDER BY data_avaliacao";
        List<Avaliacao> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idDisciplina);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapAvaliacao(rs));
            }
        }
        return list;
    }

    /**
     * Lista as avaliações de um professor, ordenadas por data.
     *
     * @param idProfessor ID do professor
     * @return avaliações associadas
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public List<Avaliacao> listarPorProfessor(int idProfessor) throws SQLException {
        String sql = "SELECT * FROM avaliacao WHERE id_professor = ? ORDER BY data_avaliacao";
        List<Avaliacao> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idProfessor);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapAvaliacao(rs));
            }
        }
        return list;
    }

    /**
     * Exclui uma avaliação pelo seu ID.
     *
     * @param idAvaliacao chave primária da avaliação
     * @return {@code true} se o registo foi removido
     * @throws SQLException em caso de erro de acesso ao banco
     */
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

