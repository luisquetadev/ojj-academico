package com.ojj.academico.model;

import java.time.LocalDate;
import java.math.BigDecimal;

/**
 * Modelo que representa uma avaliação (prova, trabalho, exame).
 * <p>
 * Cada avaliação está associada a uma disciplina e a um professor,
 * possui um tipo (MAC, NPP, EXAME, RECURSO) e um peso percentual na nota final.
 */
public class Avaliacao {
    private int idAvaliacao;
    private int idDisciplina;
    private int idProfessor;
    private String tipo; // MAC,NPP,EXAME,RECURSO
    private String descricao;
    private LocalDate dataAvaliacao;
    private BigDecimal peso;

    public Avaliacao() {}

    public Avaliacao(int idDisciplina, int idProfessor, String tipo, String descricao, LocalDate dataAvaliacao, BigDecimal peso) {
        this.idDisciplina = idDisciplina;
        this.idProfessor = idProfessor;
        this.tipo = tipo;
        this.descricao = descricao;
        this.dataAvaliacao = dataAvaliacao;
        this.peso = peso;
    }

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