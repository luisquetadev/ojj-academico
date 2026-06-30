package com.ojj.academico.dto;

import java.time.LocalDate;
import java.math.BigDecimal;

/**
 * DTO que transporta os dados de uma avaliação entre camadas.
 */
public class AvaliacaoDTO {
    private int idAvaliacao;
    private int idDisciplina;
    private int idProfessor;
    private String tipo;
    private String descricao;
    private LocalDate dataAvaliacao;
    private BigDecimal peso;

    public AvaliacaoDTO() {}

    public int getIdAvaliacao() { return idAvaliacao; }
    public void setIdAvaliacao(int idAvaliacao) { this.idAvaliacao = idAvaliacao; }
    public int getIdDisciplina() { return idDisciplina; }
    public void setIdDisciplina(int idDisciplina) { this.idDisciplina = idDisciplina; }
    public int getIdProfessor() { return idProfessor; }
    public void setIdProfessor(int idProfessor) { this.idProfessor = idProfessor; }
    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }
    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }
    public LocalDate getDataAvaliacao() { return dataAvaliacao; }
    public void setDataAvaliacao(LocalDate dataAvaliacao) { this.dataAvaliacao = dataAvaliacao; }
    public BigDecimal getPeso() { return peso; }
    public void setPeso(BigDecimal peso) { this.peso = peso; }
}
