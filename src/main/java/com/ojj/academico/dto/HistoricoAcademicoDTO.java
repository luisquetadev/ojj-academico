package com.ojj.academico.dto;

import java.math.BigDecimal;

public class HistoricoAcademicoDTO {
    private int idHistorico;
    private int idEstudante;
    private int idDisciplina;
    private BigDecimal mediaFinal;
    private String resultado;
    private String anoLetivo;

    public HistoricoAcademicoDTO() {}

    public int getIdHistorico() { return idHistorico; }
    public void setIdHistorico(int idHistorico) { this.idHistorico = idHistorico; }
    public int getIdEstudante() { return idEstudante; }
    public void setIdEstudante(int idEstudante) { this.idEstudante = idEstudante; }
    public int getIdDisciplina() { return idDisciplina; }
    public void setIdDisciplina(int idDisciplina) { this.idDisciplina = idDisciplina; }
    public BigDecimal getMediaFinal() { return mediaFinal; }
    public void setMediaFinal(BigDecimal mediaFinal) { this.mediaFinal = mediaFinal; }
    public String getResultado() { return resultado; }
    public void setResultado(String resultado) { this.resultado = resultado; }
    public String getAnoLetivo() { return anoLetivo; }
    public void setAnoLetivo(String anoLetivo) { this.anoLetivo = anoLetivo; }
}
