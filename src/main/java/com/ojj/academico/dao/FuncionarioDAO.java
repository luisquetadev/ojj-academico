package com.ojj.academico.dao;

import java.sql.*;
import java.time.LocalDate;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.Funcionario;
import com.ojj.academico.utils.ConnectionFactory;

public class FuncionarioDAO {

    public Funcionario buscarPorId(int idFuncionario) throws SQLException {
        String sql = "SELECT * FROM funcionario WHERE id_funcionario = ?";
        try (Connection conn = ConnectionFactory.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idFuncionario);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapFuncionario(rs);
            }
            return null;
        }
    }

    public Funcionario buscarPorIdUtilizador(int idUtilizador) throws SQLException {
        String sql = "SELECT * FROM funcionario WHERE id_utilizador = ?";
        try (Connection conn = ConnectionFactory.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idUtilizador);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapFuncionario(rs);
            }
            return null;
        }
    }

    public Funcionario buscarPerfilFuncionario(int idFuncionario) throws SQLException {
        String sql = "SELECT  p.nome_perfil FROM funcionario f INNER JOIN utilizador u ON f.id_utilizador = u.id_utilizador \r\n"
                + //
                "INNER JOIN perfil p ON u.id_perfil = p.id_perfil WHERE f.id_funcionario = ?;  ";
        try(Connection conn = ConnectionFactory.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql)){
            stmt.setInt(1,idFuncionario);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                return mapFuncionario(rs);
            }
            return null;
        }



    }

    public List<Funcionario> listarTodos() throws SQLException {
        String sql = "SELECT * FROM funcionario";
        List<Funcionario> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapFuncionario(rs));
            }
        }
        return list;
    }

    public boolean inserir(Funcionario funcionario) throws SQLException {
        String sql = "INSERT INTO funcionario (id_utilizador, id_departamento, nome_completo, telefone, numero_bi, sexo, data_nascimento, morada, salario, data_admissao, id_admin_criador) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, funcionario.getIdUtilizador());
            setInteger(stmt, 2, funcionario.getIdDepartamento());
            stmt.setString(3, funcionario.getNomeCompleto());
            stmt.setString(4, funcionario.getTelefone());
            stmt.setString(5, funcionario.getNumeroBi());
            stmt.setString(6, funcionario.getSexo());
            setDate(stmt, 7, funcionario.getDataNascimento());
            stmt.setString(8, funcionario.getMorada());
            setBigDecimal(stmt, 9, funcionario.getSalario());
            setDate(stmt, 10, funcionario.getDataAdmissao());
            setInteger(stmt, 11, funcionario.getIdAdminCriador());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    funcionario.setIdFuncionario(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    public boolean atualizar(Funcionario funcionario) throws SQLException {
        String sql = "UPDATE funcionario SET id_utilizador = ?, id_departamento = ?, nome_completo = ?, telefone = ?, numero_bi = ?, sexo = ?, data_nascimento = ?, morada = ?, salario = ?, data_admissao = ?, id_admin_criador = ? WHERE id_funcionario = ?";
        try (Connection conn = ConnectionFactory.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, funcionario.getIdUtilizador());
            setInteger(stmt, 2, funcionario.getIdDepartamento());
            stmt.setString(3, funcionario.getNomeCompleto());
            stmt.setString(4, funcionario.getTelefone());
            stmt.setString(5, funcionario.getNumeroBi());
            stmt.setString(6, funcionario.getSexo());
            setDate(stmt, 7, funcionario.getDataNascimento());
            stmt.setString(8, funcionario.getMorada());
            setBigDecimal(stmt, 9, funcionario.getSalario());
            setDate(stmt, 10, funcionario.getDataAdmissao());
            setInteger(stmt, 11, funcionario.getIdAdminCriador());
            stmt.setInt(12, funcionario.getIdFuncionario());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean excluir(int idFuncionario) throws SQLException {
        String sql = "DELETE FROM funcionario WHERE id_funcionario = ?";
        try (Connection conn = ConnectionFactory.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idFuncionario);
            return stmt.executeUpdate() > 0;
        }
    }

    private Funcionario mapFuncionario(ResultSet rs) throws SQLException {
        Funcionario f = new Funcionario();
        f.setIdFuncionario(rs.getInt("id_funcionario"));
        f.setIdUtilizador(rs.getInt("id_utilizador"));
        f.setIdDepartamento(getInteger(rs, "id_departamento"));
        f.setNomeCompleto(rs.getString("nome_completo"));
        f.setTelefone(rs.getString("telefone"));
        f.setNumeroBi(rs.getString("numero_bi"));
        f.setSexo(rs.getString("sexo"));
        f.setDataNascimento(getLocalDate(rs, "data_nascimento"));
        f.setMorada(rs.getString("morada"));
        f.setSalario(rs.getBigDecimal("salario"));
        f.setDataAdmissao(getLocalDate(rs, "data_admissao"));
        f.setIdAdminCriador(getInteger(rs, "id_admin_criador"));
        return f;
    }

    private void setInteger(PreparedStatement stmt, int index, Integer value) throws SQLException {
        if (value != null) {
            stmt.setInt(index, value);
        } else {
            stmt.setNull(index, Types.INTEGER);
        }
    }

    private Integer getInteger(ResultSet rs, String label) throws SQLException {
        int value = rs.getInt(label);
        return rs.wasNull() ? null : value;
    }

    private void setDate(PreparedStatement stmt, int index, LocalDate value) throws SQLException {
        if (value != null) {
            stmt.setDate(index, Date.valueOf(value));
        } else {
            stmt.setNull(index, Types.DATE);
        }
    }

    private LocalDate getLocalDate(ResultSet rs, String label) throws SQLException {
        Date date = rs.getDate(label);
        return date != null ? date.toLocalDate() : null;
    }

    private void setBigDecimal(PreparedStatement stmt, int index, BigDecimal value) throws SQLException {
        if (value != null) {
            stmt.setBigDecimal(index, value);
        } else {
            stmt.setNull(index, Types.DECIMAL);
        }
    }
}
