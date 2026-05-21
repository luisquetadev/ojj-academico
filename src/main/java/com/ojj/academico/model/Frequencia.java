package com.ojj.academico.model;

import java.time.LocalDate;

public class Frequencia {
    private int idFrequencia;
    private int idEstudante;
    private int idDisciplina;
    private LocalDate dataAula;
    private String status; // PRESENTE, AUSENTE

    public Frequencia() {}

    public Frequencia(int idEstudante, int idDisciplina, LocalDate dataAula, String status) {
        this.idEstudante = idEstudante;
        this.idDisciplina = idDisciplina;
        this.dataAula = dataAula;
        this.status = status;
    }

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