package com.ojj.academico.model;

/**
 * Modelo que representa a associação entre uma matrícula e as disciplinas
 * em que o estudante está inscrito.
 */
public class MatriculaDisciplina {
    private int idMatricula;
    private int idDisciplina;

    public MatriculaDisciplina() {}

    public MatriculaDisciplina(int idMatricula, int idDisciplina) {
        this.idMatricula = idMatricula;
        this.idDisciplina = idDisciplina;
    }

    public int getIdMatricula() { return idMatricula; }
    public void setIdMatricula(int idMatricula) { this.idMatricula = idMatricula; }

    public int getIdDisciplina() { return idDisciplina; }
    public void setIdDisciplina(int idDisciplina) { this.idDisciplina = idDisciplina; }
}