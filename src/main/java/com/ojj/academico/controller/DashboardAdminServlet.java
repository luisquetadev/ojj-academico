package com.ojj.academico.controller;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.conf.PerfilConstants;
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
import com.ojj.academico.service.OperacaoLogService;
import com.ojj.academico.model.OperacaoLog;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet que gerencia o painel principal (Dashboard) do Administrador.
 * Rota: /admin/dashboard
 * Metodos: doGet (exibe o dashboard com estatisticas)
 * Acesso: Admin
 * 
 * Responsabilidades:
 * - Verificar a sessao do usuario e perfil de admin.
 * - Coletar estatisticas globais (total de alunos, funcionarios, cursos, turmas).
 * - Buscar logs recentes (ultimas 10 acoes) para exibicao.
 * - Encaminhar para a pagina de visualizacao do dashboard.
 */
public class DashboardAdminServlet extends HttpServlet {

    private static final Logger log = LoggerFactory.getLogger(DashboardAdminServlet.class);

    // Serviços necessários para coletar dados de diferentes módulos
    private final EstudanteService estudanteService = new EstudanteService();
    private final FuncionarioService funcionarioService = new FuncionarioService();
    private final CursoService cursoService = new CursoService();
    private final TurmaService turmaService = new TurmaService();
    private final OperacaoLogService logService = new OperacaoLogService();

    /**
     * Processa o pedido GET para exibir o dashboard do administrador.
     * 1. Verifica se existe uma sessao activa e se o utilizador e admin.
     * 2. Recupera os totais de estudantes, funcionarios, cursos e turmas.
     * 3. Busca as ultimas 10 acoes registadas nos logs de auditoria.
     * Atributos: totalEstudantes, totalFuncionarios, totalCursos, totalTurmas, logsRecentes.
     * Encaminha para: /view/admin/dashboard.jsp.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Utilizador utilizador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);
        if (utilizador == null || !utilizador.isAdmin()) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            request.setAttribute("totalEstudantes", estudanteService.findAll().size());
            request.setAttribute("totalFuncionarios", funcionarioService.findAll().size());
            request.setAttribute("totalCursos", cursoService.findAll().size());
            request.setAttribute("totalTurmas", turmaService.findAll().size());

            // Busca as ultimas 10 operacoes registadas
            List<OperacaoLog> logs = logService.findAll().stream()
                    .limit(10)
                    .collect(Collectors.toList());
            request.setAttribute("logsRecentes", logs);

        } catch (SQLException e) {
            log.error("Erro ao carregar estatisticas do dashboard admin", e);
        }

        request.getRequestDispatcher("/view/admin/dashboard.jsp").forward(request, response);
    }
}
