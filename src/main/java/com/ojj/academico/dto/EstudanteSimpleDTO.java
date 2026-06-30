package com.ojj.academico.dto;

/**
 * DTO simplificado que transporta apenas os dados essenciais de um estudante.
 */
public class EstudanteSimpleDTO {
    private int idEstudante;
    private String numeroEstudante;
    private String nomeCompleto;

    public EstudanteSimpleDTO() {
    }

    public int getIdEstudante() {
        return idEstudante;
    }

    public void setIdEstudante(int idEstudante) {
        this.idEstudante = idEstudante;
    }

    public String getNumeroEstudante() {
        return numeroEstudante;
    }

    public void setNumeroEstudante(String numeroEstudante) {
        this.numeroEstudante = numeroEstudante;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
    }
}
