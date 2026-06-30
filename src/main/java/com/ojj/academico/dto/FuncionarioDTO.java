package com.ojj.academico.dto;

import java.time.LocalDate;
import java.math.BigDecimal;

/**
 * DTO que transporta os dados de um funcionário entre camadas.
 */
public class FuncionarioDTO {
    private int idFuncionario;
    private int idUtilizador;
    private Integer idDepartamento;
    private String nomeCompleto;
    private String telefone;
    private String numeroBi;
    private String sexo;
    private LocalDate dataNascimento;
    private String morada;
    private BigDecimal salario;
    private LocalDate dataAdmissao;
    private Integer idAdminCriador;

    public FuncionarioDTO() {}

    public int getIdFuncionario() { return idFuncionario; }
    public void setIdFuncionario(int idFuncionario) { this.idFuncionario = idFuncionario; }
    public int getIdUtilizador() { return idUtilizador; }
    public void setIdUtilizador(int idUtilizador) { this.idUtilizador = idUtilizador; }
    public Integer getIdDepartamento() { return idDepartamento; }
    public void setIdDepartamento(Integer idDepartamento) { this.idDepartamento = idDepartamento; }
    public String getNomeCompleto() { return nomeCompleto; }
    public void setNomeCompleto(String nomeCompleto) { this.nomeCompleto = nomeCompleto; }
    public String getTelefone() { return telefone; }
    public void setTelefone(String telefone) { this.telefone = telefone; }
    public String getNumeroBi() { return numeroBi; }
    public void setNumeroBi(String numeroBi) { this.numeroBi = numeroBi; }
    public String getSexo() { return sexo; }
    public void setSexo(String sexo) { this.sexo = sexo; }
    public LocalDate getDataNascimento() { return dataNascimento; }
    public void setDataNascimento(LocalDate dataNascimento) { this.dataNascimento = dataNascimento; }
    public String getMorada() { return morada; }
    public void setMorada(String morada) { this.morada = morada; }
    public BigDecimal getSalario() { return salario; }
    public void setSalario(BigDecimal salario) { this.salario = salario; }
    public LocalDate getDataAdmissao() { return dataAdmissao; }
    public void setDataAdmissao(LocalDate dataAdmissao) { this.dataAdmissao = dataAdmissao; }
    public Integer getIdAdminCriador() { return idAdminCriador; }
    public void setIdAdminCriador(Integer idAdminCriador) { this.idAdminCriador = idAdminCriador; }
}
