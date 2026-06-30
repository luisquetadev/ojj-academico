package com.ojj.academico.dto;

/**
 * DTO que transporta os dados de um perfil entre camadas.
 */
public class PerfilDTO {
    private int idPerfil;
    private String nomePerfil;

    public PerfilDTO() {}

    public int getIdPerfil() { return idPerfil; }
    public void setIdPerfil(int idPerfil) { this.idPerfil = idPerfil; }
    public String getNomePerfil() { return nomePerfil; }
    public void setNomePerfil(String nomePerfil) { this.nomePerfil = nomePerfil; }
}
