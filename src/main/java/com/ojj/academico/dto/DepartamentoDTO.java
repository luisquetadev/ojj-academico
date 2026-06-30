package com.ojj.academico.dto;

/**
 * DTO que transporta os dados de um departamento entre camadas.
 */
public class DepartamentoDTO {
    private int idDepartamento;
    private String nomeDepartamento;

    public DepartamentoDTO() {}

    public int getIdDepartamento() { return idDepartamento; }
    public void setIdDepartamento(int idDepartamento) { this.idDepartamento = idDepartamento; }
    public String getNomeDepartamento() { return nomeDepartamento; }
    public void setNomeDepartamento(String nomeDepartamento) { this.nomeDepartamento = nomeDepartamento; }
}
