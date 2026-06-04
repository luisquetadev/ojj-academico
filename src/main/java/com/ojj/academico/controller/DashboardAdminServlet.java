package com.ojj.academico.controller;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.model.Utilizador;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.ojj.academico.service.EstudanteService;
import com.ojj.academico.service.FuncionarioService;
import com.ojj.academico.service.CursoService;
import com.ojj.academico.service.TurmaService;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet que gerencia o painel principal (Dashboard) do Administrador.
 * 
 * Responsabilidades:
 * - Verificar a sessão do usuário.
 * - Coletar estatísticas globais (total de alunos, funcionários, etc.).
 * - Encaminhar para a página de visualização do dashboard.
 */
public class DashboardAdminServlet extends HttpServlet {

    // Serviços necessários para coletar dados de diferentes módulos
    private final EstudanteService estudanteService = new EstudanteService();
    private final FuncionarioService funcionarioService = new FuncionarioService();
    private final CursoService cursoService = new CursoService();
    private final TurmaService turmaService = new TurmaService();

    /**
     * Processa a requisição para exibir o dashboard.
     * 1. Verifica se existe uma sessão ativa.
     * 2. Recupera os totais de cada entidade para exibir nos cards de resumo.
     * 3. Despacha para o JSP correspondente.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtém a sessão atual, sem criar uma nova se não existir (false)
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Verifica se o objeto de usuário está presente na sessão
        Utilizador utilizador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);
        if (utilizador == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // Busca os dados no banco através dos Services e define como atributos da requisição
            // O JSP usará esses nomes para exibir os valores nos cards
            request.setAttribute("totalEstudantes", estudanteService.findAll().size());
            request.setAttribute("totalFuncionarios", funcionarioService.findAll().size());
            request.setAttribute("totalCursos", cursoService.findAll().size());
            request.setAttribute("totalTurmas", turmaService.findAll().size());
        } catch (SQLException e) {
            // Em caso de erro no SQL, apenas logamos o erro. O dashboard exibirá '0' por padrão
            e.printStackTrace();
        }

        // Encaminha a requisição e a resposta para o JSP interno
        request.getRequestDispatcher("/view/admin/dashboard.jsp").forward(request, response);
    }
}
