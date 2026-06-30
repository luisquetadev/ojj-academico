package com.ojj.academico.model;

import java.math.BigDecimal;

/**
 * Modelo que representa o histórico académico de um estudante.
 * <p>
 * Regista a média final e o resultado (APROVADO/REPROVADO) obtido
 * numa disciplina num determinado ano letivo.
 */
public class HistoricoAcademico {
    private int idHistorico;
    private int idEstudante;
    private int idDisciplina;
    private BigDecimal mediaFinal;
    private String resultado; // APROVADO, REPROVADO
    private String anoLetivo;

    public HistoricoAcademico() {
    }

    public HistoricoAcademico(int idEstudante, int idDisciplina, BigDecimal mediaFinal, String resultado,
            String anoLetivo) {
        this.idEstudante = idEstudante;
        this.idDisciplina = idDisciplina;
        this.mediaFinal = mediaFinal;
        this.resultado = resultado;
        this.anoLetivo = anoLetivo;
    }

    public int getIdHistorico() {
        return idHistorico;
    }

    public void setIdHistorico(int idHistorico) {
        this.idHistorico = idHistorico;
    }

    public int getIdEstudante() {
        return idEstudante;
    }

    public void setIdEstudante(int idEstudante) {
        this.idEstudante = idEstudante;
    }

    public int getIdDisciplina() {
        return idDisciplina;
    }

    public void setIdDisciplina(int idDisciplina) {
        this.idDisciplina = idDisciplina;
    }

    public BigDecimal getMediaFinal() {
        return mediaFinal;
    }

    public void setMediaFinal(BigDecimal mediaFinal) {
        this.mediaFinal = mediaFinal;
    }

    public String getResultado() {
        return resultado;
    }

    public void setResultado(String resultado) {
        this.resultado = resultado;
    }

    public String getAnoLetivo() {
        return anoLetivo;
    }

    public void setAnoLetivo(String anoLetivo) {
        this.anoLetivo = anoLetivo;
    }

   
}