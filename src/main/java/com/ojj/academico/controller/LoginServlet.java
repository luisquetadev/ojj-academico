package com.ojj.academico.controller;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.model.Utilizador;
import com.ojj.academico.service.UtilizadorService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet responsável por gerenciar a autenticação dos usuários no sistema.
 * 
 * Responsabilidades:
 * - Exibir a tela de login (GET)
 * - Processar as credenciais e iniciar a sessão (POST)
 * - Redirecionar o usuário para o dashboard específico conforme seu perfil
 */
public class LoginServlet extends HttpServlet {

    private final UtilizadorService utilizadorService = new UtilizadorService();

    /**
     * Exibe a página de login.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/auth/login.jsp").forward(request, response);
    }


    /**
     * Processa a tentativa de login.
     * 1. Recupera os parâmetros do formulário (username/email e password).
     * 2. Valida as credenciais através do UtilizadorService.
     * 3. Se válido e ativo, cria a sessão e redireciona.
     * 4. Se inválido, retorna para a tela de login com mensagem de erro.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtendo os parâmetros enviados pelo formulário
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Chamando a regra de negócio na camada de Service
            Utilizador utilizador = utilizadorService.login(username, password);

            // Verifica se o usuário existe e se o status é ATIVO
            if (utilizador != null && "ATIVO".equals(utilizador.getStatus())) {

                // Cria ou recupera a sessão do usuário
                HttpSession session = request.getSession();
                
                // Armazena o objeto utilizador na sessão para uso em filtros de autenticação
                session.setAttribute(AppConfig.SESSION_USER_ATTRIBUTE, utilizador);
                
                // Determina para qual URL o usuário deve ir baseado no seu nível de acesso (ID Perfil)
                String redirectUrl = getDashboardUrl(utilizador.getIdPerfil());
                
                // Redirecionamento físico (302) para o dashboard
                response.sendRedirect(request.getContextPath() + redirectUrl);
                
                // Log de depuração simples no console do servidor
                System.out.println("Usuário " + username + " logado com sucesso. Redirecionando para: " + redirectUrl);
            } else {
                // Caso falhe, define um atributo de erro para ser exibido no JSP
                request.setAttribute("erro", "Credenciais inválidas ou utilizador inativo/bloqueado");
                request.getRequestDispatcher("/view/auth/login.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            // Tratamento genérico de exceções para evitar a página de erro branca do servidor
            e.printStackTrace(); // Registra o erro completo no log do servidor para o desenvolvedor
            request.setAttribute("erro", "Erro interno ao processar login: " + e.getMessage());
            request.getRequestDispatcher("/view/auth/login.jsp").forward(request, response);
        }
    }

    /**
     * Mapeia o ID do perfil para o caminho do dashboard correspondente.
     * 
     * @param idPerfil ID numérico do perfil vindo do banco de dados
     * @return String contendo o caminho relativo da URL do dashboard
     */
    private String getDashboardUrl(int idPerfil) {
        // Mapeamento baseado nos IDs da tabela 'perfil' no banco de dados
        switch (idPerfil) {
            case 1: // ADMIN
                return "/admin/dashboard";
            case 2: // SECRETARIA
                return "/secretario/dashboard";
            case 3: // TESOURARIA
                return "/tesouraria/dashboard";
            case 4: // DOCENTE/PROFESSOR
                return "/professor/dashboard";
            case 5: // COORDENADOR
                return "/coordenador/dashboard";
            case 6: // DIRECTOR
                return "/director/dashboard";
            case 7: // ESTUDANTE
                return "/estudante/dashboard";
            default:
                // Por segurança, se o perfil não for reconhecido, manda para o admin (que é protegido pelo AuthFilter)
                return "/admin/dashboard";
        }
    }
}
