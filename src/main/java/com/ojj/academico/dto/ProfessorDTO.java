package com.ojj.academico.dto;

/**
 * DTO que transporta os dados de um professor entre camadas.
 */
public class ProfessorDTO {
    private int idProfessor;
    private int idFuncionario;
    private String grauAcademico;
    private String especialidade;

    public ProfessorDTO() {}

    public int getIdProfessor() { return idProfessor; }
    public void setIdProfessor(int idProfessor) { this.idProfessor = idProfessor; }
    public int getIdFuncionario() { return idFuncionario; }
    public void setIdFuncionario(int idFuncionario) { this.idFuncionario = idFuncionario; }
    public String getGrauAcademico() { return grauAcademico; }
    public void setGrauAcademico(String grauAcademico) { this.grauAcademico = grauAcademico; }
    public String getEspecialidade() { return especialidade; }
    public void setEspecialidade(String especialidade) { this.especialidade = especialidade; }
}
