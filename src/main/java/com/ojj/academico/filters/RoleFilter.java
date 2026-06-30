package com.ojj.academico.filters;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.model.Utilizador;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Filtro de autorização baseado em perfis (roles).
 * <p>
 * Verifica se o utilizador autenticado possui um dos perfis
 * permitidos para aceder ao recurso. O parâmetro "role" é
 * configurado no web.xml e pode conter múltiplos perfis separados por vírgula.
 */
public class RoleFilter implements Filter {

    private String roleParam;

    /**
     * Lê o parâmetro "role" da configuração do filtro.
     */
    @Override
    public void init(FilterConfig filterConfig) {
        roleParam = filterConfig.getInitParameter("role");
    }

  // Verifica se o utilizador tem o perfil necessário para acessar o recurso
    public boolean hasRequiredRole(Utilizador utilizador) {
        if (utilizador == null || roleParam == null) {
            return false;
        }
        // O parâmetro "role" pode conter múltiplos perfis separados por vírgula
        String[] requiredRoles = roleParam.split(",");
        for (String requiredRole : requiredRoles) {
            if (utilizador.getIdPerfil() == Integer.parseInt(requiredRole.trim())) {
                return true;
            }
        }
        return false;
    }

    /**
     * Verifica se o utilizador tem permissão para aceder ao recurso.
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        Utilizador utilizador = session != null ? (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE) : null;

        // Verifica se o utilizador está autenticado e tem o perfil necessário para acessar o recurso
        if (utilizador == null || !hasRequiredRole(utilizador)) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/");
            return;
        }

        chain.doFilter(request, response);
    }

}
