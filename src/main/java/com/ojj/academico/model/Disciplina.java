package com.ojj.academico.model;

/**
 * Modelo que representa uma disciplina/componente curricular.
 * <p>
 * Contém o código, nome e carga horária total da disciplina.
 */
public class Disciplina {
    private int idDisciplina;
    private String codigoDisciplina;
    private String nomeDisciplina;
    private Integer cargaHoraria;

    public Disciplina() {}

    public Disciplina(String codigoDisciplina, String nomeDisciplina, Integer cargaHoraria) {
        this.codigoDisciplina = codigoDisciplina;
        this.nomeDisciplina = nomeDisciplina;
        this.cargaHoraria = cargaHoraria;
    }

    public int getIdDisciplina() { return idDisciplina; }
    public void setIdDisciplina(int idDisciplina) { this.idDisciplina = idDisciplina; }

    public String getCodigoDisciplina() { return codigoDisciplina; }
    public void setCodigoDisciplina(String codigoDisciplina) { this.codigoDisciplina = codigoDisciplina; }

    public String getNomeDisciplina() { return nomeDisciplina; }
    public void setNomeDisciplina(String nomeDisciplina) { this.nomeDisciplina = nomeDisciplina; }

    public Integer getCargaHoraria() { return cargaHoraria; }
    public void setCargaHoraria(Integer cargaHoraria) { this.cargaHoraria = cargaHoraria; }
}