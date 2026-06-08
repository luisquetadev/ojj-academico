package com.ojj.academico.service;

import com.ojj.academico.model.*;
import com.ojj.academico.dao.*;
import com.ojj.academico.util.*;
import com.ojj.academico.utils.PasswordUtils;
import org.mindrot.jbcrypt.BCrypt;
import java.time.LocalDate;
import java.sql.SQLException;
import java.math.BigDecimal;

/**
 * Serviço para registrar novos funcionários e gerar credenciais automáticas.
 */
public class FuncionarioRegistroService {
    
    private UtilizadorDAO utilizadorDAO = new UtilizadorDAO();
    private FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
    
    /**
     * Registra um novo funcionário e gera credenciais automaticamente.
     * @param nomeCompleto Nome completo do funcionário
     * @param email Email do funcionário
     * @param telefone Telefone
     * @param numeroBi Número de BI
     * @param sexo Sexo (M/F)
     * @param dataNascimento Data de nascimento
     * @param morada Morada
     * @param salario Salário
     * @param dataAdmissao Data de admissão
     * @param idDepartamento ID do departamento
     * @param idPerfil ID do perfil (2=Secretário, 3=Tesoureiro, 5=Coordenador, 8=Coordenador_Curso)
     * @return RegistroResult com os dados do novo funcionário e credenciais
     */
    public RegistroResult registrarFuncionario(
            String nomeCompleto,
            String email,
            String telefone,
            String numeroBi,
            String sexo,
            String dataNascimento,
            String morada,
            Double salario,
            String dataAdmissao,
            Integer idDepartamento,
            Integer idPerfil) {
        
        RegistroResult resultado = new RegistroResult();
        
        try {
            // Gerar senha temporária
            String senhaTemporaria = gerarSenhaTemporaria();
            
            // Gerar hash seguro usando PasswordUtils
            String senhaHash = PasswordUtils.hashPassword(senhaTemporaria);

            
            // Criar utilizador
            Utilizador utilizador = new Utilizador();
            utilizador.setIdPerfil(idPerfil);
            utilizador.setEmail(email);
            utilizador.setPasswordHash(senhaHash);
            utilizador.setStatus("ATIVO");
            utilizador.setTentativasLogin(0);
            
            boolean criadoUtilizador = utilizadorDAO.inserir(utilizador);
            
            if (!criadoUtilizador) {
                resultado.setErro(true);
                resultado.setMensagem("Erro ao criar utilizador");
                return resultado;
            }
            
            int idUtilizador = utilizador.getIdUtilizador();
            
            // Criar funcionário
            Funcionario funcionario = new Funcionario();
            funcionario.setIdUtilizador(idUtilizador);
            funcionario.setIdDepartamento(idDepartamento);
            funcionario.setNomeCompleto(nomeCompleto);
            funcionario.setTelefone(telefone);
            funcionario.setNumeroBi(numeroBi);
            funcionario.setSexo(sexo);
            funcionario.setDataNascimento(LocalDate.parse(dataNascimento));
            funcionario.setMorada(morada);
            funcionario.setSalario(BigDecimal.valueOf(salario != null ? salario : 0));
            funcionario.setDataAdmissao(LocalDate.parse(dataAdmissao));
            
            boolean criadoFuncionario = funcionarioDAO.inserir(funcionario);
            
            if (!criadoFuncionario) {
                resultado.setErro(true);
                resultado.setMensagem("Erro ao criar funcionário");
                return resultado;
            }
            
            int idFuncionario = funcionario.getIdFuncionario();
            
            // Armazenar credenciais em arquivo
            String nomePerfil = obterNomePerfil(idPerfil);
            String caminhoArquivo = CredenciaisArmazenador.armazenarCredenciais(
                    email,
                    senhaTemporaria,
                    nomeCompleto,
                    nomePerfil
            );
            
            resultado.setErro(false);
            resultado.setMensagem("Funcionário registrado com sucesso!");
            resultado.setIdFuncionario(idFuncionario);
            resultado.setIdUtilizador(idUtilizador);
            resultado.setEmail(email);
            resultado.setSenhaTemporaria(senhaTemporaria);
            resultado.setNomeFuncionario(nomeCompleto);
            resultado.setNomePerfil(nomePerfil);
            resultado.setCaminhoCredenciais(caminhoArquivo);
            
        } catch (SQLException e) {
            resultado.setErro(true);
            resultado.setMensagem("Erro ao registrar funcionário: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            resultado.setErro(true);
            resultado.setMensagem("Erro ao registrar funcionário: " + e.getMessage());
            e.printStackTrace();
        }
        
        return resultado;
    }
    
    /**
     * Gera uma senha temporária aleatória segura.
     * Formato: Inicial Maiúscula + 8 caracteres aleatórios + números + !@#
     */
    private String gerarSenhaTemporaria() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        String especiais = "!@#$%";
        StringBuilder senha = new StringBuilder();
        
        // Primeira letra maiúscula
        senha.append(chars.charAt((int) (Math.random() * 26)));
        
        // 8 caracteres aleatórios
        for (int i = 0; i < 8; i++) {
            senha.append(chars.charAt((int) (Math.random() * chars.length())));
        }
        
        // Caracter especial
        senha.append(especiais.charAt((int) (Math.random() * especiais.length())));
        
        return senha.toString();
    }
    
    /**
     * Obtém o nome do perfil baseado no ID.
     */
    private String obterNomePerfil(Integer idPerfil) {
        switch (idPerfil) {
            case 2: return "SECRETÁRIA";
            case 3: return "TESOUREIRA";
            case 5: return "COORDENADOR";
            case 8: return "COORDENADOR DO CURSO";
            default: return "FUNCIONÁRIO";
        }
    }
}
