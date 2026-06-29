package com.ojj.academico.controller;

import com.ojj.academico.model.OperacaoLog;
import com.ojj.academico.model.Utilizador;
import com.ojj.academico.service.OperacaoLogService;
import com.ojj.academico.conf.AppConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Servlet responsavel pelo fluxo de HistoricoAtendimento.
 * Rotas atendidas: /secretario/historico-atendimento. Encaminha para: /view/secretaria/historico/index.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class HistoricoAtendimentoServlet extends HttpServlet {

    private final OperacaoLogService logService = new OperacaoLogService();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        Utilizador utilizador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);
        
        if (utilizador == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // Buscar todos os logs e filtrar pelos do utilizador logado (Secretário)
            List<OperacaoLog> todosLogs = logService.findAll();
            List<OperacaoLog> meusLogs = todosLogs.stream()
                    .filter(log -> log.getIdUtilizador() == utilizador.getIdUtilizador())
                    .sorted((l1, l2) -> l2.getDataHora().compareTo(l1.getDataHora()))
                    .collect(Collectors.toList());

            request.setAttribute("logs", meusLogs);
            request.getRequestDispatcher("/view/secretaria/historico/index.jsp").forward(request, response);
            
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao carregar histórico: " + e.getMessage());
            request.getRequestDispatcher("/view/secretaria/historico/index.jsp").forward(request, response);
        }
    }
}
