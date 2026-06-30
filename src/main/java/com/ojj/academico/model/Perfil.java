package com.ojj.academico.model;

/**
 * Modelo que representa um perfil/papel de acesso no sistema.
 * <p>
 * Cada perfil (ADMIN, SECRETARIA, DOCENTE, ESTUDANTE, etc.)
 * define um conjunto de permissões no sistema.
 */
public class Perfil {
    private int idPerfil;
    private String nomePerfil;

    public Perfil() {
    }

    public Perfil(String nomePerfil) {
        this.nomePerfil = nomePerfil;
    }

    public int getIdPerfil() {
        return idPerfil;
    }

    public void setIdPerfil(int idPerfil) {
        this.idPerfil = idPerfil;
    }

    public String getNomePerfil() {
        return nomePerfil;
    }

    public void setNomePerfil(String nomePerfil) {
        this.nomePerfil = nomePerfil;
    }
}