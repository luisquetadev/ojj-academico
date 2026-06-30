package com.ojj.academico.model;

import java.time.LocalDateTime;

/**
 * Modelo que representa a matrícula de um estudante num curso.
 * <p>
 * Contém a referência ao estudante, curso, turma, ano académico e semestre,
 * bem como o estado atual (PENDENTE, CONFIRMADA, CANCELADA).
 */
public class Matricula {
    private int idMatricula;
    private int idEstudante;
    private int idCurso;
    private int idTurma;
    private int idAnoAcademico;
    private int idSemestre;
    private LocalDateTime dataMatricula;
    private LocalDateTime dataConfirmacao;
    private String status; // PENDENTE, CONFIRMADA, CANCELADA
    private String observacoes;

    public Matricula() {}

    public Matricula(int idEstudante, int idCurso, int idTurma, int idAnoAcademico, int idSemestre) {
        this.idEstudante = idEstudante;
        this.idCurso = idCurso;
        this.idTurma = idTurma;
        this.idAnoAcademico = idAnoAcademico;
        this.idSemestre = idSemestre;
    }

    public int getIdMatricula() { return idMatricula; }
    public void setIdMatricula(int idMatricula) { this.idMatricula = idMatricula; }

    public int getIdEstudante() { return idEstudante; }
    public void setIdEstudante(int idEstudante) { this.idEstudante = idEstudante; }

    public int getIdCurso() { return idCurso; }
    public void setIdCurso(int idCurso) { this.idCurso = idCurso; }

    public int getIdTurma() { return idTurma; }
    public void setIdTurma(int idTurma) { this.idTurma = idTurma; }

    public int getIdAnoAcademico() { return idAnoAcademico; }
    public void setIdAnoAcademico(int idAnoAcademico) { this.idAnoAcademico = idAnoAcademico; }

    public int getIdSemestre() { return idSemestre; }
    public void setIdSemestre(int idSemestre) { this.idSemestre = idSemestre; }

    public LocalDateTime getDataMatricula() { return dataMatricula; }
    public void setDataMatricula(LocalDateTime dataMatricula) { this.dataMatricula = dataMatricula; }

    public LocalDateTime getDataConfirmacao() { return dataConfirmacao; }
    public void setDataConfirmacao(LocalDateTime dataConfirmacao) { this.dataConfirmacao = dataConfirmacao; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getObservacoes() { return observacoes; }
    public void setObservacoes(String observacoes) { this.observacoes = observacoes; }
}