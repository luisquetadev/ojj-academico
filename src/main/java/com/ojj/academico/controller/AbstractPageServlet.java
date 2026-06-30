package com.ojj.academico.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet base abstracto para paginas modulares do sistema.
 * Nao possui rota propria; serve como classe-base para servlets que renderizam paginas do tipo "module".
 * Metodos herdados: doGet, doPost (quando nao sobrescritos).
 * Acesso: disponivel para todos os perfis que herdarem desta classe.
 * Encaminha para: /view/shared/module.jsp com atributos pageTitle, moduleName e pageDescription.
 */
abstract class AbstractPageServlet extends HttpServlet {

    /**
     * Encaminha o pedido para a pagina modular JSP, definindo os atributos de titulo, modulo e descricao.
     *
     * @param request     o pedido HTTP
     * @param response    a resposta HTTP
     * @param title       titulo da pagina (pageTitle)
     * @param module      nome do modulo (moduleName)
     * @param description descricao da pagina (pageDescription)
     */
    protected void forward(HttpServletRequest request, HttpServletResponse response, String title, String module, String description)
            throws ServletException, IOException {
        request.setAttribute("pageTitle", title);
        request.setAttribute("moduleName", module);
        request.setAttribute("pageDescription", description);
        request.getRequestDispatcher("/view/shared/module.jsp").forward(request, response);
    }

    /**
     * Similar a forward, mas adiciona uma mensagem de confirmacao automatica ao request.
     *
     * @param request     o pedido HTTP
     * @param response    a resposta HTTP
     * @param title       titulo da pagina
     * @param module      nome do modulo
     * @param description descricao da pagina
     */
    protected void confirmAndForward(HttpServletRequest request, HttpServletResponse response, String title, String module, String description)
            throws ServletException, IOException {
        request.setAttribute("mensagem", "Operacao registada com sucesso.");
        forward(request, response, title, module, description);
    }
}
