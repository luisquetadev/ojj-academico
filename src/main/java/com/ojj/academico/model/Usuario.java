package com.ojj.academico.model;

public class Usuario {
    private int idUtilizador;
    private String username;
    private String senhaHash;
    private String tipoPerfil; // "Estudante" ou "Funcionario"
    private int idRef;
    
    // Construtores
    public Usuario() {}
    
    public Usuario(String username, String senhaHash, String tipoPerfil, int idRef) {
        this.username = username;
        this.senhaHash = senhaHash;
        this.tipoPerfil = tipoPerfil;
        this.idRef = idRef;
    }
    
    // Getters e Setters (todos)
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