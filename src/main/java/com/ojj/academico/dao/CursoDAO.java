package com.ojj.academico.dao;

import java.sql.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.Curso;
import com.ojj.academico.utils.ConnectionFactory;

/**
 * DAO para a tabela {@code curso}.
 * <p>
 * Responsável pelas operações CRUD dos cursos oferecidos pela instituição.
 * </p>
 */
public class CursoDAO {

    /**
     * Busca um curso pelo seu ID.
     *
     * @param idCurso chave primária do curso
     * @return o curso encontrado ou {@code null}
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public Curso buscarPorId(int idCurso) throws SQLException {
        String sql = "SELECT * FROM curso WHERE id_curso = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idCurso);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapCurso(rs);
            }
            return null;
        }
    }

    /**
     * Lista todos os cursos.
     *
     * @return lista de cursos
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public List<Curso> listarTodos() throws SQLException {
        String sql = "SELECT * FROM curso";
        List<Curso> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapCurso(rs));
            }
        }
        return list;
    }

    /**
     * Insere um novo curso no banco.
     *
     * @param curso dados do curso
     * @return {@code true} se a inserção foi bem-sucedida
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean inserir(Curso curso) throws SQLException {
        String sql = "INSERT INTO curso (id_departamento, codigo_curso, nome_curso, grau, regime, duracao_anos, propina_mensal) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, curso.getIdDepartamento());
            stmt.setString(2, curso.getCodigoCurso());
            stmt.setString(3, curso.getNomeCurso());
            stmt.setString(4, curso.getGrau());
            stmt.setString(5, curso.getRegime());
            stmt.setInt(6, curso.getDuracaoAnos());
            stmt.setBigDecimal(7, curso.getPropinaMensal());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    curso.setIdCurso(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    /**
     * Actualiza os dados de um curso existente.
     *
     * @param curso dados actualizados
     * @return {@code true} se algum registo foi alterado
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean atualizar(Curso curso) throws SQLException {
        String sql = "UPDATE curso SET id_departamento = ?, codigo_curso = ?, nome_curso = ?, grau = ?, regime = ?, duracao_anos = ?, propina_mensal = ? WHERE id_curso = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, curso.getIdDepartamento());
            stmt.setString(2, curso.getCodigoCurso());
            stmt.setString(3, curso.getNomeCurso());
            stmt.setString(4, curso.getGrau());
            stmt.setString(5, curso.getRegime());
            stmt.setInt(6, curso.getDuracaoAnos());
            stmt.setBigDecimal(7, curso.getPropinaMensal());
            stmt.setInt(8, curso.getIdCurso());
            return stmt.executeUpdate() > 0;
        }
    }

    /**
     * Exclui um curso pelo seu ID.
     *
     * @param idCurso chave primária do curso
     * @return {@code true} se o registo foi removido
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean excluir(int idCurso) throws SQLException {
        String sql = "DELETE FROM curso WHERE id_curso = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idCurso);
            return stmt.executeUpdate() > 0;
        }
    }

    private Curso mapCurso(ResultSet rs) throws SQLException {
        Curso c = new Curso();
        c.setIdCurso(rs.getInt("id_curso"));
        c.setIdDepartamento(rs.getInt("id_departamento"));
        c.setCodigoCurso(rs.getString("codigo_curso"));
        c.setNomeCurso(rs.getString("nome_curso"));
        c.setGrau(rs.getString("grau"));
        c.setRegime(rs.getString("regime"));
        c.setDuracaoAnos(rs.getInt("duracao_anos"));
        c.setPropinaMensal(rs.getBigDecimal("propina_mensal"));
        return c;
    }
}
