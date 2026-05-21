package com.ojj.academico.dao;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.ojj.academico.model.OperacaoLog;
import com.ojj.academico.utils.ConnectionFactory;

public class OperacaoLogDAO {

    public OperacaoLog buscarPorId(int idLog) throws SQLException {
        String sql = "SELECT * FROM operacao_log WHERE id_log = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idLog);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapOperacaoLog(rs);
            }
            return null;
        }
    }

    public List<OperacaoLog> listarTodos() throws SQLException {
        String sql = "SELECT * FROM operacao_log";
        List<OperacaoLog> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapOperacaoLog(rs));
            }
        }
        return list;
    }

    public boolean inserir(OperacaoLog log) throws SQLException {
        String sql = "INSERT INTO operacao_log (id_utilizador, tipo_operacao, id_estudante_alvo, descricao, endereco_ip, user_agent, dados_alterados, resultado, data_hora) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, log.getIdUtilizador());
            stmt.setString(2, log.getTipoOperacao());
            setInteger(stmt, 3, log.getIdEstudanteAlvo());
            stmt.setString(4, log.getDescricao());
            stmt.setString(5, log.getEnderecoIp());
            stmt.setString(6, log.getUserAgent());
            stmt.setString(7, log.getDadosAlterados());
            stmt.setString(8, log.getResultado());
            setTimestamp(stmt, 9, log.getDataHora());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    log.setIdLog(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    public boolean excluir(int idLog) throws SQLException {
        String sql = "DELETE FROM operacao_log WHERE id_log = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idLog);
            return stmt.executeUpdate() > 0;
        }
    }

    private OperacaoLog mapOperacaoLog(ResultSet rs) throws SQLException {
        OperacaoLog log = new OperacaoLog();
        log.setIdLog(rs.getInt("id_log"));
        log.setIdUtilizador(rs.getInt("id_utilizador"));
        log.setTipoOperacao(rs.getString("tipo_operacao"));
        int idEstudanteAlvo = rs.getInt("id_estudante_alvo");
        log.setIdEstudanteAlvo(rs.wasNull() ? null : idEstudanteAlvo);
        log.setDescricao(rs.getString("descricao"));
        log.setEnderecoIp(rs.getString("endereco_ip"));
        log.setUserAgent(rs.getString("user_agent"));
        log.setDadosAlterados(rs.getString("dados_alterados"));
        log.setResultado(rs.getString("resultado"));
        log.setDataHora(getTimestamp(rs, "data_hora"));
        return log;
    }

    private void setInteger(PreparedStatement stmt, int index, Integer value) throws SQLException {
        if (value != null) {
            stmt.setInt(index, value);
        } else {
            stmt.setNull(index, Types.INTEGER);
        }
    }

    private void setTimestamp(PreparedStatement stmt, int index, LocalDateTime value) throws SQLException {
        if (value != null) {
            stmt.setTimestamp(index, Timestamp.valueOf(value));
        } else {
            stmt.setNull(index, Types.TIMESTAMP);
        }
    }

    private LocalDateTime getTimestamp(ResultSet rs, String label) throws SQLException {
        Timestamp ts = rs.getTimestamp(label);
        return ts != null ? ts.toLocalDateTime() : null;
    }

        public boolean atualizar(OperacaoLog log) throws SQLException {
            String sql = "UPDATE operacao_log SET id_utilizador = ?, tipo_operacao = ?, id_estudante_alvo = ?, descricao = ?, endereco_ip = ?, user_agent = ?, dados_alterados = ?, resultado = ?, data_hora = ? WHERE id_log = ?";
            try (Connection conn = ConnectionFactory.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, log.getIdUtilizador());
                stmt.setString(2, log.getTipoOperacao());
                setInteger(stmt, 3, log.getIdEstudanteAlvo());
                stmt.setString(4, log.getDescricao());
                stmt.setString(5, log.getEnderecoIp());
                stmt.setString(6, log.getUserAgent());
                stmt.setString(7, log.getDadosAlterados());
                stmt.setString(8, log.getResultado());
                setTimestamp(stmt, 9, log.getDataHora());
                stmt.setInt(10, log.getIdLog());
                return stmt.executeUpdate() > 0;

}
}
}
