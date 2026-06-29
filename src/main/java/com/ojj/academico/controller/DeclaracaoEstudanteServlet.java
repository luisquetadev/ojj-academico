package com.ojj.academico.controller;

import com.ojj.academico.dao.CursoDAO;
import com.ojj.academico.dao.EstudanteDAO;
import com.ojj.academico.dao.MatriculaDAO;
import com.ojj.academico.model.Estudante;
import com.ojj.academico.model.Matricula;
import com.ojj.academico.util.PDFGenerator;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Servlet responsavel pelo fluxo de DeclaracaoEstudante.
 * Rotas atendidas: /secretario/declaracao. Encaminha para: /view/secretaria/declaracao/index.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class DeclaracaoEstudanteServlet extends HttpServlet {

    private final EstudanteDAO estudanteDAO = new EstudanteDAO();
    private final MatriculaDAO matriculaDAO = new MatriculaDAO();
    private final CursoDAO cursoDAO = new CursoDAO();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/secretaria/declaracao/index.jsp").forward(request, response);
    }
    /**
     * Trata requisicoes POST: valida dados enviados, executa a operacao do formulario e retorna o resultado ao usuario.
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String numeroEstudante = request.getParameter("numeroEstudante");
        
        try {
            Estudante estudante = estudanteDAO.buscarPorNumeroEstudante(numeroEstudante);

            if (estudante == null) {
                request.setAttribute("erro", "Estudante não encontrado com o número informado.");
                request.getRequestDispatcher("/view/secretaria/declaracao/index.jsp").forward(request, response);
                return;
            }

            List<Matricula> matriculas = matriculaDAO.buscarPorIdEstudante(estudante.getIdEstudante());
            String nomeCurso = "Nao matriculado";
            if (matriculas != null && !matriculas.isEmpty()) {
                nomeCurso = cursoDAO.buscarPorId(matriculas.get(0).getIdCurso()).getNomeCurso();
            }

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=Declaracao_" + numeroEstudante + ".pdf");

            PDFGenerator.gerarDeclaracaoEstudante(estudante, nomeCurso, response.getOutputStream());

        } catch (Exception e) {
            request.setAttribute("erro", "Erro ao gerar declaração: " + e.getMessage());
            request.getRequestDispatcher("/view/secretaria/declaracao/index.jsp").forward(request, response);
        }
    }
}
