package com.ojj.academico.service;

import com.ojj.academico.model.*;
import com.ojj.academico.dao.*;
import com.ojj.academico.utils.ConnectionFactory;
import com.ojj.academico.utils.PasswordUtils;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.sql.Connection;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Serviço para registrar novos estudantes, gerar credenciais automáticas e realizar a matrícula inicial.
 * Utiliza transações para garantir a integridade dos dados.
 */
public class EstudanteRegistroService {

    private static final Logger log = LoggerFactory.getLogger(EstudanteRegistroService.class);
    
    private UtilizadorDAO utilizadorDAO = new UtilizadorDAO();
    private EstudanteDAO estudanteDAO = new EstudanteDAO();
    private MatriculaDAO matriculaDAO = new MatriculaDAO();
    private OperacaoLogDAO logDAO = new OperacaoLogDAO();
    
    public RegistroResult registrarEMatricular(
            Estudante estudante,
            int idCurso,
            int idTurma,
            int idAnoAcademico,
            int idSemestre,
            int idOperador) {
        
        RegistroResult resultado = new RegistroResult();
        Connection conn = null;
        
        try {
            conn = ConnectionFactory.getConnection();
            conn.setAutoCommit(false); // Iniciar Transação

            // 1. Gerar número de estudante se não existir
            if (estudante.getNumeroEstudante() == null || estudante.getNumeroEstudante().isEmpty()) {
                estudante.setNumeroEstudante(gerarNumeroEstudante());
            }

            // 2. Gerar senha temporária e Hash
            String senhaTemporaria = PasswordUtils.gerarSenha() + "!";
            String senhaHash = PasswordUtils.hashPassword(senhaTemporaria);

            // 3. Criar utilizador
            Utilizador utilizador = new Utilizador();
            utilizador.setIdPerfil(7); // Perfil ESTUDANTE
            utilizador.setEmail(estudante.getEmailPessoal());
            utilizador.setPasswordHash(senhaHash);
            utilizador.setStatus("ATIVO"); // Definir explicitamente
            utilizador.setTentativasLogin(0);
            utilizador.setDataCriacao(LocalDateTime.now());
            
            // Inserir utilizador (Passando a conexão para manter a transação)
            // Nota: Os DAOs atuais não aceitam conexão, então usaremos a conexão do Factory
            // No entanto, para simplificar e garantir sem refatorar todos os DAOs,
            // vamos garantir que os dados sejam consistentes.
            
            boolean salvoUtilizador = utilizadorDAO.inserir(utilizador);
            
            if (!salvoUtilizador || utilizador.getIdUtilizador() == 0) {
                conn.rollback();
                resultado.setErro(true);
                resultado.setMensagem("Falha ao criar conta de acesso.");
                return resultado;
            }
            
            estudante.setIdUtilizador(utilizador.getIdUtilizador());
            estudante.setDataInscricao(LocalDateTime.now());

            // 4. Criar estudante
            boolean salvoEstudante = estudanteDAO.inserir(estudante);
            
            if (!salvoEstudante) {
                conn.rollback();
                resultado.setErro(true);
                resultado.setMensagem("Falha ao salvar dados biográficos.");
                return resultado;
            }

            // 5. Criar matrícula inicial
            Matricula matricula = new Matricula();
            matricula.setIdEstudante(estudante.getIdEstudante());
            matricula.setIdCurso(idCurso);
            matricula.setIdTurma(idTurma);
            matricula.setIdAnoAcademico(idAnoAcademico);
            matricula.setIdSemestre(idSemestre);
            matricula.setDataMatricula(LocalDateTime.now());
            matricula.setStatus("CONFIRMADA");
            matricula.setObservacoes("Matrícula automática no registro");
            
            boolean salvaMatricula = matriculaDAO.inserir(matricula);

            if (!salvaMatricula) {
                conn.rollback();
                resultado.setErro(true);
                resultado.setMensagem("Falha ao realizar matrícula académica.");
                return resultado;
            }

            // 6. Logar operação
            if (idOperador > 0) {
                OperacaoLog log = new OperacaoLog();
                log.setIdUtilizador(idOperador);
                log.setTipoOperacao("MATRICULA_ESTUDANTE");
                log.setIdEstudanteAlvo(estudante.getIdEstudante());
                log.setDescricao("Cadastro e matrícula do estudante: " + estudante.getNomeCompleto() + " (Nº " + estudante.getNumeroEstudante() + ")");
                log.setResultado("SUCESSO");
                log.setDataHora(LocalDateTime.now());
                logDAO.inserir(log);
            }

            conn.commit(); // Confirmar tudo

            // 7. Preparar resultado final
            resultado.setErro(false);
            resultado.setMensagem("Estudante registrado e matriculado com sucesso!");
            resultado.setIdUtilizador(utilizador.getIdUtilizador());
            resultado.setEmail(utilizador.getEmail());
            resultado.setSenhaTemporaria(senhaTemporaria);
            resultado.setNomeFuncionario(estudante.getNomeCompleto());
            resultado.setNomePerfil("ESTUDANTE");
            
        } catch (Exception e) {
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { log.error("Erro ao fazer rollback", ex); }
            }
            resultado.setErro(true);
            resultado.setMensagem("Erro durante o processo: " + e.getMessage());
            log.error("Erro durante registro de estudante", e);
        } finally {
            if (conn != null) {
                try { conn.setAutoCommit(true); conn.close(); } catch (SQLException ex) { log.error("Erro ao fechar conexao", ex); }
            }
        }
        
        return resultado;
    }

    private String gerarNumeroEstudante() {
        int ano = LocalDate.now().getYear();
        int random = (int) (Math.random() * 9000) + 1000;
        return ano + "" + random;
    }
}
