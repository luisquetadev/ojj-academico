package com.ojj.academico.model;

import java.time.LocalDate;

/**
 * Modelo que representa um semestre letivo.
 * <p>
 * Associado a um ano académico, define o período de início e fim
 * e a designação (1_SEMESTRE, 2_SEMESTRE).
 */
public class Semestre {
    private int idSemestre;
    private int idAnoAcademico;
    private String nomeSemestre; // 1_SEMESTRE,2_SEMESTRE
    private LocalDate dataInicio;
    private LocalDate dataFim;

    public Semestre() {}

    public Semestre(int idAnoAcademico, String nomeSemestre, LocalDate dataInicio, LocalDate dataFim) {
        this.idAnoAcademico = idAnoAcademico;
        this.nomeSemestre = nomeSemestre;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
    }

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