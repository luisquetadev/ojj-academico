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
import java.sql.SQLException;
import java.util.List;

public class DeclaracaoEstudanteServlet extends HttpServlet {

    private final EstudanteService estudanteService = new EstudanteService();
    private final MatriculaService matriculaService = new MatriculaService();
    private final CursoService cursoService = new CursoService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/secretaria/declaracao/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String numeroEstudante = request.getParameter("numeroEstudante");
        
        try {
            // 1. Buscar estudante pelo número
            List<Estudante> estudantes = estudanteService.findAll(); // Idealmente ter um buscarPorNumero
            Estudante estudante = estudantes.stream()
                    .filter(e -> e.getNumeroEstudante().equals(numeroEstudante))
                    .findFirst()
                    .orElse(null);

            if (estudante == null) {
                request.setAttribute("erro", "Estudante não encontrado com o número informado.");
                request.getRequestDispatcher("/view/secretaria/declaracao/index.jsp").forward(request, response);
                return;
            }

            // 2. Buscar curso do estudante (através da matrícula mais recente)
            List<Matricula> matriculas = matriculaService.findAll();
            Matricula ultimaMatricula = matriculas.stream()
                    .filter(m -> m.getIdEstudante() == estudante.getIdEstudante())
                    .sorted((m1, m2) -> m2.getDataMatricula().compareTo(m1.getDataMatricula()))
                    .findFirst()
                    .orElse(null);

            String nomeCurso = "Não matriculado";
            if (ultimaMatricula != null) {
                nomeCurso = cursoService.findById(ultimaMatricula.getIdCurso()).getNomeCurso();
            }

            // 3. Configurar resposta para PDF
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=Declaracao_" + numeroEstudante + ".pdf");

            // 4. Gerar PDF
            PDFGenerator.gerarDeclaracaoEstudante(estudante, nomeCurso, response.getOutputStream());

        } catch (Exception e) {
            request.setAttribute("erro", "Erro ao gerar declaração: " + e.getMessage());
            request.getRequestDispatcher("/view/secretaria/declaracao/index.jsp").forward(request, response);
        }
    }
}
