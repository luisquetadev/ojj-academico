package com.ojj.academico.dto;

import java.math.BigDecimal;

public class CursoDTO {
    private int idCurso;
    private int idDepartamento;
    private String codigoCurso;
    private String nomeCurso;
    private String grau;
    private String regime;
    private int duracaoAnos;
    private BigDecimal propinaMensal;

    public CursoDTO() {}

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
