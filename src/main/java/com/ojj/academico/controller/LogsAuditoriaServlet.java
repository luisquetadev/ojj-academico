package com.ojj.academico.controller;

import com.ojj.academico.model.OperacaoLog;
import com.ojj.academico.model.Utilizador;
import com.ojj.academico.service.OperacaoLogService;
import com.ojj.academico.service.UtilizadorService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LogsAuditoriaServlet extends HttpServlet {

    private final OperacaoLogService logService = new OperacaoLogService();
    private final UtilizadorService utilizadorService = new UtilizadorService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String userIdParam = request.getParameter("userId");
            String tipoOperacao = request.getParameter("tipoOperacao");
            String resultado = request.getParameter("resultado");
            String dataInicioParam = request.getParameter("dataInicio");
            String dataFimParam = request.getParameter("dataFim");

            Integer userId = null;
            if (userIdParam != null && !userIdParam.isBlank()) {
                try {
                    userId = Integer.parseInt(userIdParam);
                } catch (NumberFormatException ignored) {
                }
            }

            LocalDateTime dataInicio = null;
            LocalDateTime dataFim = null;
            if (dataInicioParam != null && !dataInicioParam.isBlank()) {
                try {
                    dataInicio = LocalDate.parse(dataInicioParam).atStartOfDay();
                } catch (DateTimeParseException ignored) {
                }
            }
            if (dataFimParam != null && !dataFimParam.isBlank()) {
                try {
                    dataFim = LocalDate.parse(dataFimParam).atTime(LocalTime.MAX);
                } catch (DateTimeParseException ignored) {
                }
            }

            List<OperacaoLog> logs = logService.findByFilter(userId, tipoOperacao, resultado, dataInicio, dataFim);
            List<Utilizador> users = utilizadorService.findAll();
            Map<Integer, String> userEmailById = new HashMap<>();
            for (Utilizador u : users) {
                userEmailById.put(u.getIdUtilizador(), u.getEmail());
            }

            request.setAttribute("logs", logs);
            request.setAttribute("users", users);
            request.setAttribute("userEmailById", userEmailById);
            request.setAttribute("filterUserId", userId);
            request.setAttribute("filterTipoOperacao", tipoOperacao);
            request.setAttribute("filterResultado", resultado);
            request.setAttribute("filterDataInicio", dataInicioParam);
            request.setAttribute("filterDataFim", dataFimParam);

            request.getRequestDispatcher("/view/sistema/logs/index.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao carregar logs: " + e.getMessage());
        }
    }
}
