package com.ojj.academico.controller;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.dao.EstudanteDAO;
import com.ojj.academico.model.Estudante;
import com.ojj.academico.model.Propina;
import com.ojj.academico.model.Utilizador;
import com.ojj.academico.service.PropinaService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Servlet responsavel pela visualizacao das propinas do estudante logado.
 * Rota: /estudante/propina
 * Metodos: doGet (exibe status e historico de propinas)
 * Acesso: Estudante (autenticado por sessao)
 * Encaminha para: /view/estudante/propina.jsp
 */
public class EstudantePropinaServlet extends HttpServlet {

    private final PropinaService propinaService = new PropinaService();
    private final EstudanteDAO estudanteDAO = new EstudanteDAO();

    /**
     * Carrega as propinas do estudante autenticado.
     * Calcula o total pendente (incluindo multas) e o total pago.
     * Atributos: estudante, propinas, statusAtual, totalPendente, totalPago.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilizador utilizador = (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);

        try {
            Estudante estudante = estudanteDAO.buscarPorIdUtilizador(utilizador.getIdUtilizador());
            if (estudante == null) {
                request.setAttribute("erro", "Estudante não encontrado.");
                request.getRequestDispatcher("/view/estudante/propina.jsp").forward(request, response);
                return;
            }

            List<Propina> propinas = propinaService.findByEstudante(estudante.getIdEstudante());
            String statusAtual = propinaService.findStatusByEstudante(estudante.getIdEstudante());

            double totalPendente = 0;
            double totalPago = 0;
            for (Propina p : propinas) {
                if ("PAGO".equals(p.getStatus())) {
                    totalPago += p.getValor().doubleValue();
                } else {
                    totalPendente += p.getValor().doubleValue() + (p.getMulta() != null ? p.getMulta().doubleValue() : 0);
                }
            }

            request.setAttribute("estudante", estudante);
            request.setAttribute("propinas", propinas);
            request.setAttribute("statusAtual", statusAtual);
            request.setAttribute("totalPendente", totalPendente);
            request.setAttribute("totalPago", totalPago);
            request.getRequestDispatcher("/view/estudante/propina.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao carregar propinas: " + e.getMessage());
            request.getRequestDispatcher("/view/estudante/propina.jsp").forward(request, response);
        }
    }
}
