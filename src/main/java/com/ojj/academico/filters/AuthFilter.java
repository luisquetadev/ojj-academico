package com.ojj.academico.filters;

import java.io.IOException;
import com.ojj.academico.conf.AppConfig;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.ojj.academico.model.Utilizador;

/**
 * Filtro de autenticação que protege os recursos do sistema.
 * <p>
 * Verifica se o utilizador possui uma sessão ativa antes de permitir
 * o acesso a qualquer recurso protegido. Redireciona para a página
 * inicial se não estiver autenticado.
 */
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) {}

    /**
     * Intercepta o pedido e verifica se o utilizador está autenticado.
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        Utilizador utilizador = session != null ? (Utilizador) session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE) : null;

        if (utilizador == null) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/");
            return;
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {}
}
