package com.ojj.academico.dto;

/**
 * DTO que transporta a associação entre matrícula e disciplina entre camadas.
 */
public class MatriculaDisciplinaDTO {
    private int idMatricula;
    private int idDisciplina;

    public MatriculaDisciplinaDTO() {}

    public int getIdMatricula() { return idMatricula; }
    public void setIdMatricula(int idMatricula) { this.idMatricula = idMatricula; }
    public int getIdDisciplina() { return idDisciplina; }
    public void setIdDisciplina(int idDisciplina) { this.idDisciplina = idDisciplina; }
}
