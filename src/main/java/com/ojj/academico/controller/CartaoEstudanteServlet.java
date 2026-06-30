package com.ojj.academico.controller;

import com.ojj.academico.model.Estudante;
import com.ojj.academico.model.Matricula;
import com.ojj.academico.service.EstudanteService;
import com.ojj.academico.service.MatriculaService;
import com.ojj.academico.service.CursoService;
import com.ojj.academico.util.PDFGenerator;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * Servlet responsavel pela geracao do cartao de estudante em PDF.
 * Rota: /secretario/cartao-estudante
 * Metodos: doGet (exibe formulario de pesquisa), doPost (gera o PDF do cartao)
 * Acesso: Secretaria
 * Encaminha para: /view/secretaria/cartao/index.jsp ou stream de PDF
 */
public class CartaoEstudanteServlet extends HttpServlet {

    private final EstudanteService estudanteService = new EstudanteService();
    private final MatriculaService matriculaService = new MatriculaService();
    private final CursoService cursoService = new CursoService();

    /**
     * Apresenta o formulario para o secretario inserir o numero do estudante e gerar o cartao.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/secretaria/cartao/index.jsp").forward(request, response);
    }

    /**
     * Processa o pedido de geracao do cartao de estudante.
     * 1. Busca o estudante pelo numero informado.
     * 2. Obtem a ultima matricula para determinar o curso atual.
     * 3. Gera o PDF do cartao e envia como resposta inline.
     * Em caso de erro, reexibe o formulario com mensagem de erro.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String numeroEstudante = request.getParameter("numeroEstudante");
        
        try {
            List<Estudante> estudantes = estudanteService.findAll();
            Estudante estudante = estudantes.stream()
                    .filter(e -> e.getNumeroEstudante().equals(numeroEstudante))
                    .findFirst()
                    .orElse(null);

            if (estudante == null) {
                request.setAttribute("erro", "Estudante não encontrado.");
                request.getRequestDispatcher("/view/secretaria/cartao/index.jsp").forward(request, response);
                return;
            }

            List<Matricula> matriculas = matriculaService.findAll();
            Matricula ultimaMatricula = matriculas.stream()
                    .filter(m -> m.getIdEstudante() == estudante.getIdEstudante())
                    .sorted((m1, m2) -> m2.getDataMatricula().compareTo(m1.getDataMatricula()))
                    .findFirst()
                    .orElse(null);

            String nomeCurso = "N/A";
            if (ultimaMatricula != null) {
                nomeCurso = cursoService.findById(ultimaMatricula.getIdCurso()).getNomeCurso();
            }

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "inline; filename=Cartao_" + numeroEstudante + ".pdf");

            PDFGenerator.gerarCartaoEstudante(estudante, nomeCurso, response.getOutputStream());

        } catch (Exception e) {
            request.setAttribute("erro", "Erro ao gerar cartão: " + e.getMessage());
            request.getRequestDispatcher("/view/secretaria/cartao/index.jsp").forward(request, response);
        }
    }
}
