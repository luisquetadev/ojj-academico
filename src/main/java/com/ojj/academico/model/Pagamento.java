package com.ojj.academico.model;

import java.time.LocalDateTime;
import java.time.LocalDate;
import java.math.BigDecimal;

public class Pagamento {
    private int idPagamento;
    private int idEstudante;
    private int idTesoureiro;
    private String tipoPagamento; // MATRÍCULA, PROPINA, etc.
    private String periodoReferencia;
    private BigDecimal valorDevido;
    private BigDecimal valorPago;
    private BigDecimal multa;
    private LocalDateTime dataPagamento;
    private LocalDate dataVencimento;
    private String metodoPagamento;
    private String numeroRecibo;
    private String referencia;
    private String comprovativo;
    private String status; // PENDENTE,PAGO,PARCIAL,ATRASADO
    private String observacao;

    public Pagamento() {}

    public Pagamento(int idEstudante, int idTesoureiro, String tipoPagamento, BigDecimal valorDevido) {
        this.idEstudante = idEstudante;
        this.idTesoureiro = idTesoureiro;
        this.tipoPagamento = tipoPagamento;
        this.valorDevido = valorDevido;
    }

    public int getIdPagamento() { return idPagamento; }
    public void setIdPagamento(int idPagamento) { this.idPagamento = idPagamento; }

    public int getIdEstudante() { return idEstudante; }
    public void setIdEstudante(int idEstudante) { this.idEstudante = idEstudante; }

    public int getIdTesoureiro() { return idTesoureiro; }
    public void setIdTesoureiro(int idTesoureiro) { this.idTesoureiro = idTesoureiro; }

    public String getTipoPagamento() { return tipoPagamento; }
    public void setTipoPagamento(String tipoPagamento) { this.tipoPagamento = tipoPagamento; }

    public String getPeriodoReferencia() { return periodoReferencia; }
    public void setPeriodoReferencia(String periodoReferencia) { this.periodoReferencia = periodoReferencia; }

    public BigDecimal getValorDevido() { return valorDevido; }
    public void setValorDevido(BigDecimal valorDevido) { this.valorDevido = valorDevido; }

    public BigDecimal getValorPago() { return valorPago; }
    public void setValorPago(BigDecimal valorPago) { this.valorPago = valorPago; }

    public BigDecimal getMulta() { return multa; }
    public void setMulta(BigDecimal multa) { this.multa = multa; }

    public LocalDateTime getDataPagamento() { return dataPagamento; }
    public void setDataPagamento(LocalDateTime dataPagamento) { this.dataPagamento = dataPagamento; }

    public LocalDate getDataVencimento() { return dataVencimento; }
    public void setDataVencimento(LocalDate dataVencimento) { this.dataVencimento = dataVencimento; }

    public String getMetodoPagamento() { return metodoPagamento; }
    public void setMetodoPagamento(String metodoPagamento) { this.metodoPagamento = metodoPagamento; }

    public String getNumeroRecibo() { return numeroRecibo; }
    public void setNumeroRecibo(String numeroRecibo) { this.numeroRecibo = numeroRecibo; }

    public String getReferencia() { return referencia; }
    public void setReferencia(String referencia) { this.referencia = referencia; }

    public String getComprovativo() { return comprovativo; }
    public void setComprovativo(String comprovativo) { this.comprovativo = comprovativo; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getObservacao() { return observacao; }
    public void setObservacao(String observacao) { this.observacao = observacao; }
}