package com.ojj.academico.dto;

/**
 * DTO que transporta a associação entre plano curricular e disciplina entre camadas.
 */
public class PlanoCurricularDisciplinaDTO {
    private int idPlanoCurricularDisciplina;
    private int idPlanoCurricular;
    private int idDisciplina;

    public PlanoCurricularDisciplinaDTO() {}

    public int getIdPlanoCurricularDisciplina() { return idPlanoCurricularDisciplina; }
    public void setIdPlanoCurricularDisciplina(int idPlanoCurricularDisciplina) { this.idPlanoCurricularDisciplina = idPlanoCurricularDisciplina; }
    public int getIdPlanoCurricular() { return idPlanoCurricular; }
    public void setIdPlanoCurricular(int idPlanoCurricular) { this.idPlanoCurricular = idPlanoCurricular; }
    public int getIdDisciplina() { return idDisciplina; }
    public void setIdDisciplina(int idDisciplina) { this.idDisciplina = idDisciplina; }
}
