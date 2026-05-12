package com.ojj.academico.models;

public class Usuario {
    private int idUtilizador;
    private String username;
    private String senhaHash;
    private String tipoPerfil;
    private int idRef;

    public Usuario() {}

    public int getIdUtilizador() { return idUtilizador; }
    public void setIdUtilizador(int idUtilizador) { this.idUtilizador = idUtilizador; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getSenhaHash() { return senhaHash; }
    public void setSenhaHash(String senhaHash) { this.senhaHash = senhaHash; }
    public String getTipoPerfil() { return tipoPerfil; }
    public void setTipoPerfil(String tipoPerfil) { this.tipoPerfil = tipoPerfil; }
    public int getIdRef() { return idRef; }
    public void setIdRef(int idRef) { this.idRef = idRef; }
}
