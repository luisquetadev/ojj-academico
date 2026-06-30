package com.ojj.academico.dto;

import java.time.LocalDate;
import java.math.BigDecimal;

/**
 * DTO que transporta os dados de uma propina entre camadas.
 */
public class PropinaDTO {
    private int idPropina;
    private int idEstudante;
    private String mesReferencia;
    private int anoReferencia;
    private BigDecimal valor;
    private BigDecimal multa;
    private LocalDate dataVencimento;
    private String status;

    public PropinaDTO() {}

    public int getIdPropina() { return idPropina; }
    public void setIdPropina(int idPropina) { this.idPropina = idPropina; }
    public int getIdEstudante() { return idEstudante; }
    public void setIdEstudante(int idEstudante) { this.idEstudante = idEstudante; }
    public String getMesReferencia() { return mesReferencia; }
    public void setMesReferencia(String mesReferencia) { this.mesReferencia = mesReferencia; }
    public int getAnoReferencia() { return anoReferencia; }
    public void setAnoReferencia(int anoReferencia) { this.anoReferencia = anoReferencia; }
    public BigDecimal getValor() { return valor; }
    public void setValor(BigDecimal valor) { this.valor = valor; }
    public BigDecimal getMulta() { return multa; }
    public void setMulta(BigDecimal multa) { this.multa = multa; }
    public LocalDate getDataVencimento() { return dataVencimento; }
    public void setDataVencimento(LocalDate dataVencimento) { this.dataVencimento = dataVencimento; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
