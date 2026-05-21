package com.ojj.academico.model;

import java.math.BigDecimal;

public class Curso {
    private int idCurso;
    private int idDepartamento;
    private String codigoCurso;
    private String nomeCurso;
    private String grau; // TECNICO_MEDIO, LICENCIATURA, MESTRADO
    private String regime; // LABORAL, POS_LABORAL
    private int duracaoAnos;
    private BigDecimal propinaMensal;

    public Curso() {}

    public Curso(int idDepartamento, String codigoCurso, String nomeCurso, String grau, String regime, int duracaoAnos, BigDecimal propinaMensal) {
        this.idDepartamento = idDepartamento;
        this.codigoCurso = codigoCurso;
        this.nomeCurso = nomeCurso;
        this.grau = grau;
        this.regime = regime;
        this.duracaoAnos = duracaoAnos;
        this.propinaMensal = propinaMensal;
    }

    public int getIdCurso() { return idCurso; }
    public void setIdCurso(int idCurso) { this.idCurso = idCurso; }

    public int getIdDepartamento() { return idDepartamento; }
    public void setIdDepartamento(int idDepartamento) { this.idDepartamento = idDepartamento; }

    public String getCodigoCurso() { return codigoCurso; }
    public void setCodigoCurso(String codigoCurso) { this.codigoCurso = codigoCurso; }

    public String getNomeCurso() { return nomeCurso; }
    public void setNomeCurso(String nomeCurso) { this.nomeCurso = nomeCurso; }

    public String getGrau() { return grau; }
    public void setGrau(String grau) { this.grau = grau; }

    public String getRegime() { return regime; }
    public void setRegime(String regime) { this.regime = regime; }

    public int getDuracaoAnos() { return duracaoAnos; }
    public void setDuracaoAnos(int duracaoAnos) { this.duracaoAnos = duracaoAnos; }

    public BigDecimal getPropinaMensal() { return propinaMensal; }
    public void setPropinaMensal(BigDecimal propinaMensal) { this.propinaMensal = propinaMensal; }
}