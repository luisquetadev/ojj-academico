package com.ojj.academico.dto;

public class PlanoCurricularDTO {
    private int idPlanoCurricular;
    private int idCurso;
    private int anoCurricular;
    private int semestre;
    private Integer cargaHoraria;

    public PlanoCurricularDTO() {}

    public int getIdPlanoCurricular() { return idPlanoCurricular; }
    public void setIdPlanoCurricular(int idPlanoCurricular) { this.idPlanoCurricular = idPlanoCurricular; }
    public int getIdCurso() { return idCurso; }
    public void setIdCurso(int idCurso) { this.idCurso = idCurso; }
    public int getAnoCurricular() { return anoCurricular; }
    public void setAnoCurricular(int anoCurricular) { this.anoCurricular = anoCurricular; }
    public int getSemestre() { return semestre; }
    public void setSemestre(int semestre) { this.semestre = semestre; }
    public Integer getCargaHoraria() { return cargaHoraria; }
    public void setCargaHoraria(Integer cargaHoraria) { this.cargaHoraria = cargaHoraria; }
}
