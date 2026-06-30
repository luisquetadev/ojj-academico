package com.ojj.academico.model;

/**
 * Modelo que representa um professor da instituição.
 * <p>
 * Extende a informação de funcionário com o grau académico
 * (LICENCIADO, MESTRE, DOUTOR) e a especialidade.
 */
public class Professor {
    private int idProfessor;
    private int idFuncionario;
    private String grauAcademico; // LICENCIADO, MESTRE, DOUTOR
    private String especialidade;

    public Professor() {}

    public Professor(int idFuncionario, String grauAcademico, String especialidade) {
        this.idFuncionario = idFuncionario;
        this.grauAcademico = grauAcademico;
        this.especialidade = especialidade;
    }

    public int getIdProfessor() { return idProfessor; }
    public void setIdProfessor(int idProfessor) { this.idProfessor = idProfessor; }

    public int getIdFuncionario() { return idFuncionario; }
    public void setIdFuncionario(int idFuncionario) { this.idFuncionario = idFuncionario; }

    public String getGrauAcademico() { return grauAcademico; }
    public void setGrauAcademico(String grauAcademico) { this.grauAcademico = grauAcademico; }

    public String getEspecialidade() { return especialidade; }
    public void setEspecialidade(String especialidade) { this.especialidade = especialidade; }
}