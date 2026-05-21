package com.ojj.academico.dao;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.Estudante;
import com.ojj.academico.utils.ConnectionFactory;

public class EstudanteDAO {

    public Estudante buscarPorId(int idEstudante) throws SQLException {
        String sql = "SELECT * FROM estudante WHERE id_estudante = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idEstudante);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapEstudante(rs);
            }
            return null;
        }
    }

    public List<Estudante> listarTodos() throws SQLException {
        String sql = "SELECT * FROM estudante";
        List<Estudante> lista = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                lista.add(mapEstudante(rs));
            }
        }
        return lista;
    }

    public boolean inserir(Estudante estudante) throws SQLException {
        String sql = "INSERT INTO estudante (id_utilizador, numero_estudante, nome_completo, sexo, data_nascimento, telefone, email_pessoal, morada, provincia, nacionalidade, numero_bi, nome_encarregado, telefone_encarregado, foto, data_inscricao) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, estudante.getIdUtilizador());
            stmt.setString(2, estudante.getNumeroEstudante());
            stmt.setString(3, estudante.getNomeCompleto());
            stmt.setString(4, estudante.getSexo());
            stmt.setDate(5, Date.valueOf(estudante.getDataNascimento()));
            stmt.setString(6, estudante.getTelefone());
            stmt.setString(7, estudante.getEmailPessoal());
            stmt.setString(8, estudante.getMorada());
            stmt.setString(9, estudante.getProvincia());
            stmt.setString(10, estudante.getNacionalidade());
            stmt.setString(11, estudante.getNumeroBi());
            stmt.setString(12, estudante.getNomeEncarregado());
            stmt.setString(13, estudante.getTelefoneEncarregado());
            stmt.setString(14, estudante.getFoto());
            setTimestamp(stmt, 15, estudante.getDataInscricao());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    estudante.setIdEstudante(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    public boolean atualizar(Estudante estudante) throws SQLException {
        String sql = "UPDATE estudante SET id_utilizador = ?, numero_estudante = ?, nome_completo = ?, sexo = ?, data_nascimento = ?, telefone = ?, email_pessoal = ?, morada = ?, provincia = ?, nacionalidade = ?, numero_bi = ?, nome_encarregado = ?, telefone_encarregado = ?, foto = ?, data_inscricao = ? WHERE id_estudante = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, estudante.getIdUtilizador());
            stmt.setString(2, estudante.getNumeroEstudante());
            stmt.setString(3, estudante.getNomeCompleto());
            stmt.setString(4, estudante.getSexo());
            stmt.setDate(5, Date.valueOf(estudante.getDataNascimento()));
            stmt.setString(6, estudante.getTelefone());
            stmt.setString(7, estudante.getEmailPessoal());
            stmt.setString(8, estudante.getMorada());
            stmt.setString(9, estudante.getProvincia());
            stmt.setString(10, estudante.getNacionalidade());
            stmt.setString(11, estudante.getNumeroBi());
            stmt.setString(12, estudante.getNomeEncarregado());
            stmt.setString(13, estudante.getTelefoneEncarregado());
            stmt.setString(14, estudante.getFoto());
            setTimestamp(stmt, 15, estudante.getDataInscricao());
            stmt.setInt(16, estudante.getIdEstudante());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean excluir(int idEstudante) throws SQLException {
        String sql = "DELETE FROM estudante WHERE id_estudante = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idEstudante);
            return stmt.executeUpdate() > 0;
        }
    }

    private Estudante mapEstudante(ResultSet rs) throws SQLException {
        Estudante e = new Estudante();
        e.setIdEstudante(rs.getInt("id_estudante"));
        e.setIdUtilizador(rs.getInt("id_utilizador"));
        e.setNumeroEstudante(rs.getString("numero_estudante"));
        e.setNomeCompleto(rs.getString("nome_completo"));
        e.setSexo(rs.getString("sexo"));
        e.setDataNascimento(rs.getDate("data_nascimento").toLocalDate());
        e.setTelefone(rs.getString("telefone"));
        e.setEmailPessoal(rs.getString("email_pessoal"));
        e.setMorada(rs.getString("morada"));
        e.setProvincia(rs.getString("provincia"));
        e.setNacionalidade(rs.getString("nacionalidade"));
        e.setNumeroBi(rs.getString("numero_bi"));
        e.setNomeEncarregado(rs.getString("nome_encarregado"));
        e.setTelefoneEncarregado(rs.getString("telefone_encarregado"));
        e.setFoto(rs.getString("foto"));
        e.setDataInscricao(getTimestamp(rs, "data_inscricao"));
        return e;
    }

    private void setTimestamp(PreparedStatement stmt, int index, LocalDateTime value) throws SQLException {
        if (value != null) {
            stmt.setTimestamp(index, Timestamp.valueOf(value));
        } else {
            stmt.setNull(index, Types.TIMESTAMP);
        }
    }

    private LocalDateTime getTimestamp(ResultSet rs, String columnLabel) throws SQLException {
        Timestamp ts = rs.getTimestamp(columnLabel);
        return ts != null ? ts.toLocalDateTime() : null;
    }
}
