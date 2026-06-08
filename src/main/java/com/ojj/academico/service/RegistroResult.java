package com.ojj.academico.service;

/**
 * Classe para encapsular o resultado do registo de um funcionário.
 */
public class RegistroResult {
    private boolean erro;
    private String mensagem;
    private Integer idFuncionario;
    private Integer idUtilizador;
    private String email;
    private String senhaTemporaria;
    private String nomeFuncionario;
    private String nomePerfil;
    private String caminhoCredenciais;
    
    public RegistroResult() {
    }
    
    // Getters e Setters
    public boolean isErro() {
        return erro;
    }
    
    public void setErro(boolean erro) {
        this.erro = erro;
    }
    
    public String getMensagem() {
        return mensagem;
    }
    
    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }
    
    public Integer getIdFuncionario() {
        return idFuncionario;
    }
    
    public void setIdFuncionario(Integer idFuncionario) {
        this.idFuncionario = idFuncionario;
    }
    
    public Integer getIdUtilizador() {
        return idUtilizador;
    }
    
    public void setIdUtilizador(Integer idUtilizador) {
        this.idUtilizador = idUtilizador;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getSenhaTemporaria() {
        return senhaTemporaria;
    }
    
    public void setSenhaTemporaria(String senhaTemporaria) {
        this.senhaTemporaria = senhaTemporaria;
    }
    
    public String getNomeFuncionario() {
        return nomeFuncionario;
    }
    
    public void setNomeFuncionario(String nomeFuncionario) {
        this.nomeFuncionario = nomeFuncionario;
    }
    
    public String getNomePerfil() {
        return nomePerfil;
    }
    
    public void setNomePerfil(String nomePerfil) {
        this.nomePerfil = nomePerfil;
    }
    
    public String getCaminhoCredenciais() {
        return caminhoCredenciais;
    }
    
    public void setCaminhoCredenciais(String caminhoCredenciais) {
        this.caminhoCredenciais = caminhoCredenciais;
    }
}
