package com.ojj.academico.model;

import java.math.BigDecimal;

/**
 * Modelo que representa a nota obtida por um estudante numa avaliação.
 */
public class Nota {
    private int idNota;
    private int idAvaliacao;
    private int idEstudante;
    private BigDecimal nota;
    private String observacao;

    public Nota() {}

    public Nota(int idAvaliacao, int idEstudante, BigDecimal nota) {
        this.idAvaliacao = idAvaliacao;
        this.idEstudante = idEstudante;
        this.nota = nota;
    }

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