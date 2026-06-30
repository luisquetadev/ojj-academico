package com.ojj.academico.controller;

import com.ojj.academico.conf.PerfilConstants;
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

/**
 * Servlet responsavel pela listagem de estudantes com filtro e status de propina.
 * Rota: /admin/estudante/list
 * Metodos: doGet (lista estudantes com filtro opcional)
 * Acesso: Admin, Secretaria, Tesouraria
 * Encaminha para: /view/admin/estudante/list.jsp
 */
public class EstudanteListServlet extends HttpServlet {

    private final EstudanteDAO estudanteDAO = new EstudanteDAO();
    private final PropinaDAO propinaDAO = new PropinaDAO();

    /**
     * Lista todos os estudantes ou aplica filtro de pesquisa por nome/BI/numero.
     * Para cada estudante, busca tambem o status actual da propina.
     * Atributos: estudantes, statusPropinas (Map<Integer, String>), searchTerm.
     * Apenas utilizadores com perfil Admin, Secretaria ou Tesouraria podem aceder.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Utilizador user = (Utilizador) (session != null ? session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE) : null);

        if (user == null || (!user.isAdmin() && !user.isSecretaria() && !user.isTesouraria())) {
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

            // Mapa com status de propina para exibir na listagem
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
