package com.ojj.academico.controller;

import com.ojj.academico.model.Estudante;
import com.ojj.academico.model.Utilizador;
import com.ojj.academico.service.EstudanteRegistroService;
import com.ojj.academico.service.RegistroResult;
import com.ojj.academico.conf.AppConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;

/**
 * Servlet responsavel pelo fluxo de MatriculaEstudante.
 * Rotas atendidas: /secretario/matricular. Encaminha para: /view/secretaria/matricula/form.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class MatriculaEstudanteServlet extends HttpServlet {

    private final EstudanteRegistroService registroService = new EstudanteRegistroService();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/secretaria/matricula/form.jsp").forward(request, response);
    }
    /**
     * Trata requisicoes POST: valida dados enviados, executa a operacao do formulario e retorna o resultado ao usuario.
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Utilizador operador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);
        int idOperador = (operador != null) ? operador.getIdUtilizador() : 0;

        try {
            // Capturar dados do formulário
            Estudante estudante = new Estudante();
            estudante.setNomeCompleto(request.getParameter("nomeCompleto"));
            estudante.setNumeroBi(request.getParameter("numeroBi"));
            estudante.setDataNascimento(LocalDate.parse(request.getParameter("dataNascimento")));
            estudante.setSexo(request.getParameter("sexo"));
            estudante.setNacionalidade(request.getParameter("nacionalidade"));
            estudante.setEmailPessoal(request.getParameter("emailPessoal"));
            estudante.setTelefone(request.getParameter("telefone"));
            estudante.setMorada(request.getParameter("morada"));
            estudante.setProvincia(request.getParameter("provincia"));
            estudante.setNomeEncarregado(request.getParameter("nomeEncarregado"));
            estudante.setTelefoneEncarregado(request.getParameter("telefoneEncarregado"));

            int idCurso = Integer.parseInt(request.getParameter("idCurso"));
            int idTurma = Integer.parseInt(request.getParameter("idTurma"));
            int idAnoAcademico = Integer.parseInt(request.getParameter("idAnoAcademico"));
            int idSemestre = Integer.parseInt(request.getParameter("idSemestre"));

            // Executar registro e matrícula
            RegistroResult resultado = registroService.registrarEMatricular(
                    estudante, idCurso, idTurma, idAnoAcademico, idSemestre, idOperador);

            if (resultado.isErro()) {
                request.setAttribute("erro", resultado.getMensagem());
            } else {
                request.setAttribute("resultado", resultado);
            }

            request.getRequestDispatcher("/view/secretaria/matricula/form.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("erro", "Erro ao processar matrícula: " + e.getMessage());
            request.getRequestDispatcher("/view/secretaria/matricula/form.jsp").forward(request, response);
        }
    }
}
