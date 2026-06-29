package com.ojj.academico.controller;

import com.ojj.academico.model.Pagamento;
import com.ojj.academico.service.PagamentoService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

public class RelatorioFinanceiroServlet extends HttpServlet {

    private final PagamentoService pagamentoService = new PagamentoService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String dataInicioStr = request.getParameter("dataInicio");
        String dataFimStr = request.getParameter("dataFim");

        LocalDate dataInicio = null;
        LocalDate dataFim = null;

        try {
            if (dataInicioStr != null && !dataInicioStr.isEmpty()) {
                dataInicio = LocalDate.parse(dataInicioStr);
            }
            if (dataFimStr != null && !dataFimStr.isEmpty()) {
                dataFim = LocalDate.parse(dataFimStr);
            }
        } catch (Exception e) {
            request.setAttribute("erro", "Formato de data inválido.");
        }

        try {
            List<Pagamento> todos = pagamentoService.findAll();

            LocalDate finalDataInicio = dataInicio;
            LocalDate finalDataFim = dataFim;
            List<Pagamento> filtrados = todos.stream()
                    .filter(p -> p.getDataPagamento() != null)
                    .filter(p -> finalDataInicio == null || !p.getDataPagamento().toLocalDate().isBefore(finalDataInicio))
                    .filter(p -> finalDataFim == null || !p.getDataPagamento().toLocalDate().isAfter(finalDataFim))
                    .collect(Collectors.toList());

            BigDecimal totalReceita = BigDecimal.ZERO;
            BigDecimal totalPendente = BigDecimal.ZERO;
            int countPago = 0;
            int countPendente = 0;

            for (Pagamento p : filtrados) {
                String status = p.getStatus();
                if ("PAGO".equalsIgnoreCase(status)) {
                    BigDecimal pago = p.getValorPago() != null ? p.getValorPago() : BigDecimal.ZERO;
                    totalReceita = totalReceita.add(pago);
                    countPago++;
                } else if ("PENDENTE".equalsIgnoreCase(status) || "ATRASADO".equalsIgnoreCase(status)) {
                    BigDecimal devido = p.getValorDevido() != null ? p.getValorDevido() : BigDecimal.ZERO;
                    totalPendente = totalPendente.add(devido);
                    countPendente++;
                }
            }

            request.setAttribute("pagamentos", filtrados);
            request.setAttribute("totalReceita", totalReceita);
            request.setAttribute("totalPendente", totalPendente);
            request.setAttribute("totalPagamentos", filtrados.size());
            request.setAttribute("countPago", countPago);
            request.setAttribute("countPendente", countPendente);
            request.setAttribute("filterDataInicio", dataInicioStr);
            request.setAttribute("filterDataFim", dataFimStr);

        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao carregar dados financeiros: " + e.getMessage());
        }

        request.getRequestDispatcher("/view/relatorios/financeiro/index.jsp").forward(request, response);
    }
}
