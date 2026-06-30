package com.ojj.academico.dto;

import java.math.BigDecimal;

/**
 * DTO que transporta os dados de uma nota entre camadas.
 */
public class NotaDTO {
    private int idNota;
    private int idAvaliacao;
    private int idEstudante;
    private BigDecimal nota;
    private String observacao;

    public NotaDTO() {}

    public int getIdNota() { return idNota; }
    public void setIdNota(int idNota) { this.idNota = idNota; }
    public int getIdAvaliacao() { return idAvaliacao; }
    public void setIdAvaliacao(int idAvaliacao) { this.idAvaliacao = idAvaliacao; }
    public int getIdEstudante() { return idEstudante; }
    public void setIdEstudante(int idEstudante) { this.idEstudante = idEstudante; }
    public BigDecimal getNota() { return nota; }
    public void setNota(BigDecimal nota) { this.nota = nota; }
    public String getObservacao() { return observacao; }
    public void setObservacao(String observacao) { this.observacao = observacao; }
}
