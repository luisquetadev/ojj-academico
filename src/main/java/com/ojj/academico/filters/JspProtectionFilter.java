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

public class JspProtectionFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) {}

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
