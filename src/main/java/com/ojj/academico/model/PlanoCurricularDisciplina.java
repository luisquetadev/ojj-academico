package com.ojj.academico.model;

public class PlanoCurricularDisciplina {
    private int idPlanoCurricularDisciplina;
    private int idPlanoCurricular;
    private int idDisciplina;

    public PlanoCurricularDisciplina() {}

    public PlanoCurricularDisciplina(int idPlanoCurricular, int idDisciplina) {
        this.idPlanoCurricular = idPlanoCurricular;
        this.idDisciplina = idDisciplina;
    }

    public int getIdPlanoCurricularDisciplina() { return idPlanoCurricularDisciplina; }
    public void setIdPlanoCurricularDisciplina(int idPlanoCurricularDisciplina) { this.idPlanoCurricularDisciplina = idPlanoCurricularDisciplina; }

    public int getIdPlanoCurricular() { return idPlanoCurricular; }
    public void setIdPlanoCurricular(int idPlanoCurricular) { this.idPlanoCurricular = idPlanoCurricular; }

    public int getIdDisciplina() { return idDisciplina; }
    public void setIdDisciplina(int idDisciplina) { this.idDisciplina = idDisciplina; }
}
