package com.ojj.academico.dto;

import java.time.LocalDate;

/**
 * DTO que transporta os dados de uma frequência entre camadas.
 */
public class FrequenciaDTO {
    private int idFrequencia;
    private int idEstudante;
    private int idDisciplina;
    private LocalDate dataAula;
    private String status;

    public FrequenciaDTO() {}

    public int getIdFrequencia() { return idFrequencia; }
    public void setIdFrequencia(int idFrequencia) { this.idFrequencia = idFrequencia; }
    public int getIdEstudante() { return idEstudante; }
    public void setIdEstudante(int idEstudante) { this.idEstudante = idEstudante; }
    public int getIdDisciplina() { return idDisciplina; }
    public void setIdDisciplina(int idDisciplina) { this.idDisciplina = idDisciplina; }
    public LocalDate getDataAula() { return dataAula; }
    public void setDataAula(LocalDate dataAula) { this.dataAula = dataAula; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
