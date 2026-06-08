package com.ojj.academico.dao;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.Estudante;
import com.ojj.academico.utils.ConnectionFactory;

/**
 * Data Access Object (DAO) para a tabela 'estudante'.
 * 
 * Responsável por todas as operações de persistência relacionadas aos dados biográficos
 * e académicos dos estudantes.
 */
public class EstudanteDAO {

    /**
     * Localiza um estudante específico pelo seu ID.
     */
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

    /**
     * Retorna a lista de todos os estudantes matriculados.
     */
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

    /**
     * Registra um novo estudante no sistema.
     * 
     * Nota: O campo 'id_utilizador' é tratado como opcional (setNull) para permitir
     * o cadastro de estudantes que ainda não possuem uma conta de login criada.
     */
    public boolean inserir(Estudante estudante) throws SQLException {
        String sql = "INSERT INTO estudante (id_utilizador, numero_estudante, nome_completo, sexo, data_nascimento, telefone, email_pessoal, morada, provincia, nacionalidade, numero_bi, nome_encarregado, telefone_encarregado, foto, data_inscricao) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            // Tratamento especial para Foreign Key opcional
            if (estudante.getIdUtilizador() > 0) {
                stmt.setInt(1, estudante.getIdUtilizador());
            } else {
                stmt.setNull(1, Types.INTEGER);
            }
            
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
                // Recupera o ID gerado pelo banco e atualiza o objeto Model
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    estudante.setIdEstudante(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    /**
     * Atualiza todas as informações de um estudante.
     */
    public boolean atualizar(Estudante estudante) throws SQLException {
        String sql = "UPDATE estudante SET id_utilizador = ?, numero_estudante = ?, nome_completo = ?, sexo = ?, data_nascimento = ?, telefone = ?, email_pessoal = ?, morada = ?, provincia = ?, nacionalidade = ?, numero_bi = ?, nome_encarregado = ?, telefone_encarregado = ?, foto = ?, data_inscricao = ? WHERE id_estudante = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            if (estudante.getIdUtilizador() > 0) {
                stmt.setInt(1, estudante.getIdUtilizador());
            } else {
                stmt.setNull(1, Types.INTEGER);
            }
            
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

    /**
     * Remove o registro do estudante pelo ID.
     */
    public boolean excluir(int idEstudante) throws SQLException {
        String sql = "DELETE FROM estudante WHERE id_estudante = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idEstudante);
            return stmt.executeUpdate() > 0;
        }
    }

    public int contarTodos() throws SQLException {
        String sql = "SELECT COUNT(*) FROM estudante";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
            return 0;
        }
    }

    public List<Estudante> buscarComFiltro(String termo) throws SQLException {
        String sql = "SELECT * FROM estudante WHERE nome_completo LIKE ? OR numero_estudante LIKE ? OR numero_bi LIKE ?";
        List<Estudante> lista = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            String busca = "%" + termo + "%";
            stmt.setString(1, busca);
            stmt.setString(2, busca);
            stmt.setString(3, busca);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                lista.add(mapEstudante(rs));
            }
        }
        return lista;
    }

    /**
     * Mapeia os dados do ResultSet para o objeto Estudante.
     */
    private Estudante mapEstudante(ResultSet rs) throws SQLException {
        Estudante e = new Estudante();
        e.setIdEstudante(rs.getInt("id_estudante"));
        e.setIdUtilizador(rs.getInt("id_utilizador"));
        e.setNumeroEstudante(rs.getString("numero_estudante"));
        e.setNomeCompleto(rs.getString("nome_completo"));
        e.setSexo(rs.getString("sexo"));
        // Converte java.sql.Date para java.time.LocalDate
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

    /**
     * Auxiliar para definir parâmetros de data e hora no PreparedStatement.
     */
    private void setTimestamp(PreparedStatement stmt, int index, LocalDateTime value) throws SQLException {
        if (value != null) {
            stmt.setTimestamp(index, Timestamp.valueOf(value));
        } else {
            stmt.setNull(index, Types.TIMESTAMP);
        }
    }

    /**
     * Auxiliar para ler campos de data e hora do ResultSet.
     */
    private LocalDateTime getTimestamp(ResultSet rs, String columnLabel) throws SQLException {
        Timestamp ts = rs.getTimestamp(columnLabel);
        return ts != null ? ts.toLocalDateTime() : null;
    }
}
