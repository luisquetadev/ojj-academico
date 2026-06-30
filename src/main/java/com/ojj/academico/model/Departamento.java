package com.ojj.academico.model;

/**
 * Modelo que representa um departamento académico ou administrativo.
 */
public class Departamento {
    private int idDepartamento;
    private String nomeDepartamento;

    public Departamento() {}

    public Departamento(String nomeDepartamento) {
         this.nomeDepartamento = nomeDepartamento; 
        }

    public int getIdDepartamento() {
         return idDepartamento; 
        }
    public void setIdDepartamento(int idDepartamento) { 
        this.idDepartamento = idDepartamento; 
    }

    public String getNomeDepartamento() { return nomeDepartamento; }
    public void setNomeDepartamento(String nomeDepartamento) { this.nomeDepartamento = nomeDepartamento; }
}