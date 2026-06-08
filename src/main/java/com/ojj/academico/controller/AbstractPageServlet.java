package com.ojj.academico.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

abstract class AbstractPageServlet extends HttpServlet {

    protected void forward(HttpServletRequest request, HttpServletResponse response, String title, String module, String description)
            throws ServletException, IOException {
        request.setAttribute("pageTitle", title);
        request.setAttribute("moduleName", module);
        request.setAttribute("pageDescription", description);
        request.getRequestDispatcher("/view/shared/module.jsp").forward(request, response);
    }

    protected void confirmAndForward(HttpServletRequest request, HttpServletResponse response, String title, String module, String description)
            throws ServletException, IOException {
        request.setAttribute("mensagem", "Operacao registada com sucesso.");
        forward(request, response, title, module, description);
    }
}
