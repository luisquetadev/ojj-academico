package com.ojj.academico.filters;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Filtro de segurança que impede o acesso direto a ficheiros JSP.
 * <p>
 * Redireciona para erro 404 qualquer tentativa de acesso a URLs
 * que terminem em ".jsp", forçando o acesso apenas através dos
 * controladores Servlet.
 */
public class JspProtectionFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) {}

    /**
     * Intercepta o pedido e bloqueia acesso direto a ficheiros JSP.
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String uri = httpRequest.getRequestURI();

        if (uri.endsWith(".jsp")) {
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {}
}
