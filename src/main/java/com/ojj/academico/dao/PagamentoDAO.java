package com.ojj.academico.dao;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

import com.ojj.academico.model.Pagamento;
import com.ojj.academico.utils.ConnectionFactory;

/**
 * DAO para a tabela {@code pagamento}.
 * <p>
 * Gestão de pagamentos de propinas e outras taxas.
 * </p>
 */
public class PagamentoDAO {

    /**
     * Busca um pagamento pelo ID.
     *
     * @param idPagamento chave primária
     * @return o pagamento encontrado ou {@code null}
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public Pagamento buscarPorId(int idPagamento) throws SQLException {
        String sql = "SELECT * FROM pagamento WHERE id_pagamento = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idPagamento);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapPagamento(rs);
            }
            return null;
        }
    }

    /**
     * Lista todos os pagamentos com o nome do estudante (LEFT JOIN).
     *
     * @return lista de pagamentos
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public List<Pagamento> listarTodos() throws SQLException {
        // LEFT JOIN com estudante para obter o nome mesmo se o estudante não existir
        String sql = "SELECT p.*, e.nome_completo AS nome_estudante FROM pagamento p LEFT JOIN estudante e ON p.id_estudante = e.id_estudante ORDER BY p.data_pagamento DESC";
        List<Pagamento> list = new ArrayList<>();
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Pagamento pag = mapPagamento(rs);
                pag.setNomeEstudante(rs.getString("nome_estudante"));
                list.add(pag);
            }
        }
        return list;
    }

    /**
     * Insere um novo pagamento.
     *
     * @param pagamento dados do pagamento
     * @return {@code true} se a inserção foi bem-sucedida
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean inserir(Pagamento pagamento) throws SQLException {
        String sql = "INSERT INTO pagamento (id_estudante, id_tesoureiro, tipo_pagamento, periodo_referencia, valor_devido, valor_pago, multa, data_pagamento, data_vencimento, metodo_pagamento, numero_recibo, referencia, comprovativo, status, observacao) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, pagamento.getIdEstudante());
            stmt.setInt(2, pagamento.getIdTesoureiro());
            stmt.setString(3, pagamento.getTipoPagamento());
            stmt.setString(4, pagamento.getPeriodoReferencia());
            stmt.setBigDecimal(5, pagamento.getValorDevido());
            stmt.setBigDecimal(6, pagamento.getValorPago());
            stmt.setBigDecimal(7, pagamento.getMulta());
            setTimestamp(stmt, 8, pagamento.getDataPagamento());
            setDate(stmt, 9, pagamento.getDataVencimento());
            stmt.setString(10, pagamento.getMetodoPagamento());
            stmt.setString(11, pagamento.getNumeroRecibo());
            stmt.setString(12, pagamento.getReferencia());
            stmt.setString(13, pagamento.getComprovativo());
            stmt.setString(14, pagamento.getStatus());
            stmt.setString(15, pagamento.getObservacao());
            int affected = stmt.executeUpdate();
            if (affected > 0) {
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    pagamento.setIdPagamento(keys.getInt(1));
                }
                return true;
            }
            return false;
        }
    }

    /**
     * Actualiza os dados de um pagamento.
     *
     * @param pagamento dados actualizados
     * @return {@code true} se algum registo foi alterado
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean atualizar(Pagamento pagamento) throws SQLException {
        String sql = "UPDATE pagamento SET id_estudante = ?, id_tesoureiro = ?, tipo_pagamento = ?, periodo_referencia = ?, valor_devido = ?, valor_pago = ?, multa = ?, data_pagamento = ?, data_vencimento = ?, metodo_pagamento = ?, numero_recibo = ?, referencia = ?, comprovativo = ?, status = ?, observacao = ? WHERE id_pagamento = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, pagamento.getIdEstudante());
            stmt.setInt(2, pagamento.getIdTesoureiro());
            stmt.setString(3, pagamento.getTipoPagamento());
            stmt.setString(4, pagamento.getPeriodoReferencia());
            stmt.setBigDecimal(5, pagamento.getValorDevido());
            stmt.setBigDecimal(6, pagamento.getValorPago());
            stmt.setBigDecimal(7, pagamento.getMulta());
            setTimestamp(stmt, 8, pagamento.getDataPagamento());
            setDate(stmt, 9, pagamento.getDataVencimento());
            stmt.setString(10, pagamento.getMetodoPagamento());
            stmt.setString(11, pagamento.getNumeroRecibo());
            stmt.setString(12, pagamento.getReferencia());
            stmt.setString(13, pagamento.getComprovativo());
            stmt.setString(14, pagamento.getStatus());
            stmt.setString(15, pagamento.getObservacao());
            stmt.setInt(16, pagamento.getIdPagamento());
            return stmt.executeUpdate() > 0;
        }
    }

    /**
     * Exclui um pagamento pelo ID.
     *
     * @param idPagamento chave primária
     * @return {@code true} se o registo foi removido
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public boolean excluir(int idPagamento) throws SQLException {
        String sql = "DELETE FROM pagamento WHERE id_pagamento = ?";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idPagamento);
            return stmt.executeUpdate() > 0;
        }
    }

    /**
     * Calcula o total de receitas (valor_pago) do dia actual.
     *
     * @return total recebido hoje ou {@link BigDecimal#ZERO}
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public BigDecimal calcularReceitaHoje() throws SQLException {
        String sql = "SELECT SUM(valor_pago) FROM pagamento WHERE DATE(data_pagamento) = CURDATE()";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                BigDecimal total = rs.getBigDecimal(1);
                return total != null ? total : BigDecimal.ZERO;
            }
            return BigDecimal.ZERO;
        }
    }

    /**
     * Conta quantos pagamentos estão com status 'PENDENTE'.
     *
     * @return total de pagamentos pendentes
     * @throws SQLException em caso de erro de acesso ao banco
     */
    public int contarPagamentosPendentes() throws SQLException {
        String sql = "SELECT COUNT(*) FROM pagamento WHERE status = 'PENDENTE'";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
            return 0;
        }
    }

    private Pagamento mapPagamento(ResultSet rs) throws SQLException {
        Pagamento p = new Pagamento();
        p.setIdPagamento(rs.getInt("id_pagamento"));
        p.setIdEstudante(rs.getInt("id_estudante"));
        p.setIdTesoureiro(rs.getInt("id_tesoureiro"));
        p.setTipoPagamento(rs.getString("tipo_pagamento"));
        p.setPeriodoReferencia(rs.getString("periodo_referencia"));
        p.setValorDevido(rs.getBigDecimal("valor_devido"));
        p.setValorPago(rs.getBigDecimal("valor_pago"));
        p.setMulta(rs.getBigDecimal("multa"));
        p.setDataPagamento(getTimestamp(rs, "data_pagamento"));
        p.setDataVencimento(getDate(rs, "data_vencimento"));
        p.setMetodoPagamento(rs.getString("metodo_pagamento"));
        p.setNumeroRecibo(rs.getString("numero_recibo"));
        p.setReferencia(rs.getString("referencia"));
        p.setComprovativo(rs.getString("comprovativo"));
        p.setStatus(rs.getString("status"));
        p.setObservacao(rs.getString("observacao"));
        return p;
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

    private void setDate(PreparedStatement stmt, int index, LocalDate value) throws SQLException {
        if (value != null) {
            stmt.setDate(index, Date.valueOf(value));
        } else {
            stmt.setNull(index, Types.DATE);
        }
    }

    private LocalDate getDate(ResultSet rs, String columnLabel) throws SQLException {
        Date date = rs.getDate(columnLabel);
        return date != null ? date.toLocalDate() : null;
    }
}
