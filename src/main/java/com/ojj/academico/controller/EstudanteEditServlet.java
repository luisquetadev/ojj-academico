package com.ojj.academico.controller;

import com.ojj.academico.model.Estudante;
import com.ojj.academico.service.EstudanteService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

/**
 * Servlet responsavel pelo fluxo de EstudanteEdit.
 * Rotas atendidas: /admin/estudante/edit. Encaminha para: /view/admin/estudante/edit.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */
public class EstudanteEditServlet extends HttpServlet {

    private final EstudanteService estudanteService = new EstudanteService();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/estudante/list");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            Estudante estudante = estudanteService.findById(id);
            
            if (estudante == null) {
                request.setAttribute("erro", "Estudante não encontrado");
                response.sendRedirect(request.getContextPath() + "/admin/estudante/list");
                return;
            }
            
            request.setAttribute("estudante", estudante);
            request.getRequestDispatcher("/view/admin/estudante/edit.jsp").forward(request, response);
            
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao buscar estudante: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/admin/estudante/list");
        }
    }
    /**
     * Trata requisicoes POST: valida dados enviados, executa a operacao do formulario e retorna o resultado ao usuario.
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/estudante/list");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            Estudante estudante = estudanteService.findById(id);
            
            if (estudante == null) {
                request.setAttribute("erro", "Estudante não encontrado");
                response.sendRedirect(request.getContextPath() + "/admin/estudante/list");
                return;
            }

            String nomeCompleto = request.getParameter("nomeCompleto");
            String sexo = request.getParameter("sexo");
            String dataNascimentoStr = request.getParameter("dataNascimento");
            String telefone = request.getParameter("telefone");
            String emailPessoal = request.getParameter("emailPessoal");
            String morada = request.getParameter("morada");
            String provincia = request.getParameter("provincia");
            String nacionalidade = request.getParameter("nacionalidade");
            String numeroBi = request.getParameter("numeroBi");
            String nomeEncarregado = request.getParameter("nomeEncarregado");
            String telefoneEncarregado = request.getParameter("telefoneEncarregado");

            if (nomeCompleto == null || nomeCompleto.trim().isEmpty() || numeroBi == null || numeroBi.trim().isEmpty()) {
                request.setAttribute("erro", "Nome e BI são obrigatórios");
                request.setAttribute("estudante", estudante);
                request.getRequestDispatcher("/view/admin/estudante/edit.jsp").forward(request, response);
                return;
            }

            estudante.setNomeCompleto(nomeCompleto);
            estudante.setSexo(sexo);
            
            if (dataNascimentoStr != null && !dataNascimentoStr.isEmpty()) {
                estudante.setDataNascimento(LocalDate.parse(dataNascimentoStr));
            }
            
            estudante.setTelefone(telefone);
            estudante.setEmailPessoal(emailPessoal);
            estudante.setMorada(morada);
            estudante.setProvincia(provincia);
            estudante.setNacionalidade(nacionalidade);
            estudante.setNumeroBi(numeroBi);
            estudante.setNomeEncarregado(nomeEncarregado);
            estudante.setTelefoneEncarregado(telefoneEncarregado);

            boolean atualizado = estudanteService.save(estudante);

            if (atualizado) {
                response.sendRedirect(request.getContextPath() + "/admin/estudante/list");
            } else {
                request.setAttribute("erro", "Erro ao atualizar estudante");
                request.setAttribute("estudante", estudante);
                request.getRequestDispatcher("/view/admin/estudante/edit.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao atualizar estudante: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/admin/estudante/list");
        }
    }
}
