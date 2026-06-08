package com.ojj.academico.filters;

import com.ojj.academico.conf.AppConfig;
import com.ojj.academico.model.OperacaoLog;
import com.ojj.academico.model.Utilizador;
import com.ojj.academico.service.OperacaoLogService;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class LoggingFilter implements Filter {

    private final OperacaoLogService logService = new OperacaoLogService();
    private static final Set<String> EXCLUDED_PATHS = new HashSet<>(Arrays.asList(
            "/assets/", "/css/", "/js/", "/images/", "/webjars/", "/favicon.ico", ".css", ".js", ".png", ".jpg", ".jpeg", ".svg", ".ico", ".woff", ".woff2", ".ttf"
    ));

    @Override
    public void init(FilterConfig filterConfig) {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest http = (HttpServletRequest) request;
        String path = http.getRequestURI();
        String contextPath = http.getContextPath();
        String relativePath = path.startsWith(contextPath) ? path.substring(contextPath.length()) : path;

        if (shouldLog(relativePath)) {
            HttpSession session = http.getSession(false);
            if (session != null) {
                Object usuarioObj = session.getAttribute(AppConfig.SESSION_USER_ATTRIBUTE);
                if (usuarioObj instanceof Utilizador) {
                    Utilizador usuario = (Utilizador) usuarioObj;
                    OperacaoLog log = new OperacaoLog();
                    log.setIdUtilizador(usuario.getIdUtilizador());
                    log.setTipoOperacao(http.getMethod() + " " + relativePath);
                    log.setDescricao("Acesso ao recurso: " + relativePath);
                    log.setEnderecoIp(request.getRemoteAddr());
                    log.setUserAgent(http.getHeader("User-Agent"));
                    log.setResultado("SUCESSO");
                    log.setDataHora(LocalDateTime.now());
                    try {
                        logService.save(log);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        chain.doFilter(request, response);
    }

    private boolean shouldLog(String path) {
        if (path == null || path.isEmpty()) {
            return false;
        }
        String normalized = path.toLowerCase();
        for (String exclude : EXCLUDED_PATHS) {
            if (normalized.contains(exclude)) {
                return false;
            }
        }
        return true;
    }

    @Override
    public void destroy() {}
}
