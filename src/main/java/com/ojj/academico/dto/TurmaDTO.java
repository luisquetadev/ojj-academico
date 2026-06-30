package com.ojj.academico.dto;

import java.time.LocalDateTime;

/**
 * DTO que transporta os dados de uma turma entre camadas.
 */
public class TurmaDTO {
    private int idTurma;
    private int idCurso;
    private Integer idSala;
    private String codigoTurma;
    private String turno;
    private int anoCurricular;
    private int capacidadeMaxima;
    private int estudantesInscritos;
    private String horario;
    private LocalDateTime dataCriacao;

    public TurmaDTO() {}

    public int getIdTurma() { return idTurma; }
    public void setIdTurma(int idTurma) { this.idTurma = idTurma; }
    public int getIdCurso() { return idCurso; }
    public void setIdCurso(int idCurso) { this.idCurso = idCurso; }
    public Integer getIdSala() { return idSala; }
    public void setIdSala(Integer idSala) { this.idSala = idSala; }
    public String getCodigoTurma() { return codigoTurma; }
    public void setCodigoTurma(String codigoTurma) { this.codigoTurma = codigoTurma; }
    public String getTurno() { return turno; }
    public void setTurno(String turno) { this.turno = turno; }
    public int getAnoCurricular() { return anoCurricular; }
    public void setAnoCurricular(int anoCurricular) { this.anoCurricular = anoCurricular; }
    public int getCapacidadeMaxima() { return capacidadeMaxima; }
    public void setCapacidadeMaxima(int capacidadeMaxima) { this.capacidadeMaxima = capacidadeMaxima; }
    public int getEstudantesInscritos() { return estudantesInscritos; }
    public void setEstudantesInscritos(int estudantesInscritos) { this.estudantesInscritos = estudantesInscritos; }
    public String getHorario() { return horario; }
    public void setHorario(String horario) { this.horario = horario; }
    public LocalDateTime getDataCriacao() { return dataCriacao; }
    public void setDataCriacao(LocalDateTime dataCriacao) { this.dataCriacao = dataCriacao; }
}
