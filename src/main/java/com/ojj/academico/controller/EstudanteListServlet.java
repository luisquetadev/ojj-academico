package com.ojj.academico.controller;

import com.ojj.academico.model.Estudante;
import com.ojj.academico.dao.EstudanteDAO;
import com.ojj.academico.dao.PropinaDAO;
import com.ojj.academico.model.Utilizador;
import com.ojj.academico.conf.AppConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EstudanteListServlet extends HttpServlet {

    private final EstudanteDAO estudanteDAO = new EstudanteDAO();
    private final PropinaDAO propinaDAO = new PropinaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Utilizador user = (Utilizador) (session != null ? session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE) : null);

        // Bloquear se não for Admin, Secretaria ou Tesouraria
        if (user == null || (user.getIdPerfil() != 1 && user.getIdPerfil() != 2 && user.getIdPerfil() != 3)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String search = request.getParameter("search");
        
        try {
            List<Estudante> estudantes;
            if (search != null && !search.trim().isEmpty()) {
                estudantes = estudanteDAO.buscarComFiltro(search.trim());
            } else {
                estudantes = estudanteDAO.listarTodos();
            }

            // Buscar status da propina para cada estudante
            Map<Integer, String> statusPropinas = new HashMap<>();
            for (Estudante e : estudantes) {
                statusPropinas.put(e.getIdEstudante(), propinaDAO.buscarStatusAtual(e.getIdEstudante()));
            }

            request.setAttribute("estudantes", estudantes);
            request.setAttribute("statusPropinas", statusPropinas);
            request.setAttribute("searchTerm", search);
            
            request.getRequestDispatcher("/view/admin/estudante/list.jsp").forward(request, response);

        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao carregar lista: " + e.getMessage());
            request.getRequestDispatcher("/view/admin/estudante/list.jsp").forward(request, response);
        }
    }
}
