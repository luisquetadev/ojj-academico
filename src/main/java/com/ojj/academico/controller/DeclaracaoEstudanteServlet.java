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
 * Servlet responsavel pela geracao de declaracoes de estudante em PDF.
 * Rota: /secretario/declaracao
 * Metodos: doGet (exibe formulario de pesquisa), doPost (gera o PDF da declaracao)
 * Acesso: Secretaria
 * Encaminha para: /view/secretaria/declaracao/index.jsp ou stream de PDF
 */
public class DeclaracaoEstudanteServlet extends HttpServlet {

    private final EstudanteDAO estudanteDAO = new EstudanteDAO();
    private final MatriculaDAO matriculaDAO = new MatriculaDAO();
    private final CursoDAO cursoDAO = new CursoDAO();

    /**
     * Apresenta o formulario para o secretario inserir o numero do estudante e gerar a declaracao.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/secretaria/declaracao/index.jsp").forward(request, response);
    }

    /**
     * Processa o pedido de geracao da declaracao de estudante.
     * 1. Busca o estudante pelo numero informado.
     * 2. Obtem a primeira matricula para determinar o curso.
     * 3. Gera o PDF da declaracao e envia como attachment.
     * Em caso de erro, reexibe o formulario com mensagem de erro.
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
