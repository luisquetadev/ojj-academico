package com.ojj.academico.model;

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