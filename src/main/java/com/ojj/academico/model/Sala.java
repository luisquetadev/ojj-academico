package com.ojj.academico.model;

public class Sala {
    private int idSala;
    private String codigoSala;
    private String bloco;
    private int capacidade;

    public Sala() {}

    public Sala(String codigoSala, String bloco, int capacidade) {
        this.codigoSala = codigoSala;
        this.bloco = bloco;
        this.capacidade = capacidade;
    }

    public int getIdSala() { return idSala; }
    public void setIdSala(int idSala) { this.idSala = idSala; }

    public String getCodigoSala() { return codigoSala; }
    public void setCodigoSala(String codigoSala) { this.codigoSala = codigoSala; }

    public String getBloco() { return bloco; }
    public void setBloco(String bloco) { this.bloco = bloco; }

    public int getCapacidade() { return capacidade; }
    public void setCapacidade(int capacidade) { this.capacidade = capacidade; }
}