package com.ojj.academico.model;

public class ProfessorDisciplina {
    private int idProfessorDisciplina;
    private int idProfessor;
    private int idDisciplina;

    public ProfessorDisciplina() {}

    public ProfessorDisciplina(int idProfessor, int idDisciplina) {
        this.idProfessor = idProfessor;
        this.idDisciplina = idDisciplina;
    }

    public int getIdProfessorDisciplina() { return idProfessorDisciplina; }
    public void setIdProfessorDisciplina(int idProfessorDisciplina) { this.idProfessorDisciplina = idProfessorDisciplina; }

    public int getIdProfessor() { return idProfessor; }
    public void setIdProfessor(int idProfessor) { this.idProfessor = idProfessor; }

    public int getIdDisciplina() { return idDisciplina; }
    public void setIdDisciplina(int idDisciplina) { this.idDisciplina = idDisciplina; }
}
