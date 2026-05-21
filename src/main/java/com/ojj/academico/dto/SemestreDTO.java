package com.ojj.academico.dto;

import java.time.LocalDate;

public class SemestreDTO {
    private int idSemestre;
    private int idAnoAcademico;
    private String nomeSemestre;
    private LocalDate dataInicio;
    private LocalDate dataFim;

    public SemestreDTO() {}

    public int getIdSemestre() { return idSemestre; }
    public void setIdSemestre(int idSemestre) { this.idSemestre = idSemestre; }
    public int getIdAnoAcademico() { return idAnoAcademico; }
    public void setIdAnoAcademico(int idAnoAcademico) { this.idAnoAcademico = idAnoAcademico; }
    public String getNomeSemestre() { return nomeSemestre; }
    public void setNomeSemestre(String nomeSemestre) { this.nomeSemestre = nomeSemestre; }
    public LocalDate getDataInicio() { return dataInicio; }
    public void setDataInicio(LocalDate dataInicio) { this.dataInicio = dataInicio; }
    public LocalDate getDataFim() { return dataFim; }
    public void setDataFim(LocalDate dataFim) { this.dataFim = dataFim; }
}
