package com.ojj.academico.model;

import java.time.LocalDateTime;

public class Utilizador {
    private int idUtilizador;
    private int idPerfil;
    private String email;
    private String passwordHash;
    private String status; // ATIVO, INATIVO, BLOQUEADO
    private int tentativasLogin;
    private String ultimoIp;
    private String tokenReset;
    private LocalDateTime tokenExpiracao;
    private LocalDateTime dataCriacao;
    private LocalDateTime dataUltimoAcesso;

    public Utilizador() {
    }

    public Utilizador(int idPerfil, String email, String passwordHash) {
        this.idPerfil = idPerfil;
        this.email = email;
        this.passwordHash = passwordHash;
    }

    public int getIdUtilizador() {
        return idUtilizador;
    }

    public void setIdUtilizador(int idUtilizador) {
        this.idUtilizador = idUtilizador;
    }

    public int getIdPerfil() {
        return idPerfil;
    }

    public void setIdPerfil(int idPerfil) {
        this.idPerfil = idPerfil;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTentativasLogin() {
        return tentativasLogin;
    }

    public void setTentativasLogin(int tentativasLogin) {
        this.tentativasLogin = tentativasLogin;
    }

    public String getUltimoIp() {
        return ultimoIp;
    }

    public void setUltimoIp(String ultimoIp) {
        this.ultimoIp = ultimoIp;
    }

    public String getTokenReset() {
        return tokenReset;
    }

    public void setTokenReset(String tokenReset) {
        this.tokenReset = tokenReset;
    }

    public LocalDateTime getTokenExpiracao() {
        return tokenExpiracao;
    }

    public void setTokenExpiracao(LocalDateTime tokenExpiracao) {
        this.tokenExpiracao = tokenExpiracao;
    }

    public LocalDateTime getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(LocalDateTime dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    public LocalDateTime getDataUltimoAcesso() {
        return dataUltimoAcesso;
    }

    public void setDataUltimoAcesso(LocalDateTime dataUltimoAcesso) {
        this.dataUltimoAcesso = dataUltimoAcesso;
    }
}