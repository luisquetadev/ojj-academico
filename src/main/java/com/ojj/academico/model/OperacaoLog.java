package com.ojj.academico.model;

import java.time.LocalDateTime;

public class OperacaoLog {
    private int idLog;
    private int idUtilizador;
    private String tipoOperacao;
    private Integer idEstudanteAlvo;
    private String descricao;
    private String enderecoIp;
    private String userAgent;
    private String dadosAlterados; // JSON armazenado como String
    private String resultado; // SUCESSO, ERRO
    private LocalDateTime dataHora;

    public OperacaoLog() {}

    public OperacaoLog(int idUtilizador, String tipoOperacao, String descricao, String resultado) {
        this.idUtilizador = idUtilizador;
        this.tipoOperacao = tipoOperacao;
        this.descricao = descricao;
        this.resultado = resultado;
    }

    public int getIdLog() { return idLog; }
    public void setIdLog(int idLog) { this.idLog = idLog; }

    public int getIdUtilizador() { return idUtilizador; }
    public void setIdUtilizador(int idUtilizador) { this.idUtilizador = idUtilizador; }

    public String getTipoOperacao() { return tipoOperacao; }
    public void setTipoOperacao(String tipoOperacao) { this.tipoOperacao = tipoOperacao; }

    public Integer getIdEstudanteAlvo() { return idEstudanteAlvo; }
    public void setIdEstudanteAlvo(Integer idEstudanteAlvo) { this.idEstudanteAlvo = idEstudanteAlvo; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }

    public String getEnderecoIp() { return enderecoIp; }
    public void setEnderecoIp(String enderecoIp) { this.enderecoIp = enderecoIp; }

    public String getUserAgent() { return userAgent; }
    public void setUserAgent(String userAgent) { this.userAgent = userAgent; }

    public String getDadosAlterados() { return dadosAlterados; }
    public void setDadosAlterados(String dadosAlterados) { this.dadosAlterados = dadosAlterados; }

    public String getResultado() { return resultado; }
    public void setResultado(String resultado) { this.resultado = resultado; }

    public LocalDateTime getDataHora() { return dataHora; }
    public void setDataHora(LocalDateTime dataHora) { this.dataHora = dataHora; }
}