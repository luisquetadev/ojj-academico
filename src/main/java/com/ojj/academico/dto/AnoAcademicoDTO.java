package com.ojj.academico.dto;

import java.time.LocalDate;

public class AnoAcademicoDTO {
    private int idAnoAcademico;
    private String descricao;
    private LocalDate dataInicio;
    private LocalDate dataFim;
    private String status;

    public AnoAcademicoDTO() {}

    public int getIdAnoAcademico() { return idAnoAcademico; }
    public void setIdAnoAcademico(int idAnoAcademico) { this.idAnoAcademico = idAnoAcademico; }
    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }
    public LocalDate getDataInicio() { return dataInicio; }
    public void setDataInicio(LocalDate dataInicio) { this.dataInicio = dataInicio; }
    public LocalDate getDataFim() { return dataFim; }
    public void setDataFim(LocalDate dataFim) { this.dataFim = dataFim; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
