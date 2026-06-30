package com.ojj.academico.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.MatriculaDisciplina;
import com.ojj.academico.utils.ConnectionFactory;

/**
 * DAO para a tabela {@code matricula_disciplina}.
 * <p>
 * Associação muitos-para-muitos entre matrículas e disciplinas
 * (disciplinas em que o estudante está inscrito).
 * </p>
 */
public class MatriculaDisciplinaDAO {

    /**
     * Busca uma associação entre matrícula e disciplina.
     *
     * @param idMatricula  ID da matrícula
     * @param idDisciplina ID da disciplina
     * @return a associação encontrada ou {@code null}
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public MatriculaDisciplina buscarPorId(int idMatricula, int idDisciplina) throws SQLException {
        String sql = "SELECT * FROM matricula_disciplina WHERE id_matricula = ? AND id_disciplina = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idMatricula);
            stmt.setInt(2, idDisciplina);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapMatriculaDisciplina(rs);
            }
            return null;
        }
    }

    /**
     * Lista todas as associações matrícula-disciplina.
     *
     * @return lista de associações
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public List<MatriculaDisciplina> listarTodos() throws SQLException {
        String sql = "SELECT * FROM matricula_disciplina";
        List<MatriculaDisciplina> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapMatriculaDisciplina(rs));
            }
        }
        return list;
    }

    /**
     * Insere uma nova associação (inscreve o estudante numa disciplina).
     *
     * @param item dados da associação
     * @return {@code true} se a inserção foi bem-sucedida
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean inserir(MatriculaDisciplina item) throws SQLException {
        String sql = "INSERT INTO matricula_disciplina (id_matricula, id_disciplina) VALUES (?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, item.getIdMatricula());
            stmt.setInt(2, item.getIdDisciplina());
            return stmt.executeUpdate() > 0;
        }
    }

    /**
     * Remove a associação entre matrícula e disciplina.
     *
     * @param idMatricula  ID da matrícula
     * @param idDisciplina ID da disciplina
     * @return {@code true} se o registo foi removido
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean excluir(int idMatricula, int idDisciplina) throws SQLException {
        String sql = "DELETE FROM matricula_disciplina WHERE id_matricula = ? AND id_disciplina = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idMatricula);
            stmt.setInt(2, idDisciplina);
            return stmt.executeUpdate() > 0;
        }
    }

    private MatriculaDisciplina mapMatriculaDisciplina(ResultSet rs) throws SQLException {
        MatriculaDisciplina m = new MatriculaDisciplina();
        m.setIdMatricula(rs.getInt("id_matricula"));
        m.setIdDisciplina(rs.getInt("id_disciplina"));
        return m;
    }
}
