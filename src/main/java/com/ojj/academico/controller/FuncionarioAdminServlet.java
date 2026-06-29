package com.ojj.academico.controller;

import com.ojj.academico.model.Funcionario;
import com.ojj.academico.service.FuncionarioService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;

/**
 * Servlet responsavel pelo fluxo de FuncionarioAdmin.
 * Rotas atendidas: /admin/funcionario/new. Encaminha para: /view/admin/funcionario/form.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */@WebServlet(name = "FuncionarioAdminServlet", urlPatterns = {"/admin/funcionario/new"})
public class FuncionarioAdminServlet extends HttpServlet {

    private final FuncionarioService funcionarioService = new FuncionarioService();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/admin/funcionario/form.jsp").forward(request, response);
    }
    /**
     * Trata requisicoes POST: valida dados enviados, executa a operacao do formulario e retorna o resultado ao usuario.
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String nomeCompleto = request.getParameter("nomeCompleto");
            String telefone = request.getParameter("telefone");
            String numeroBi = request.getParameter("numeroBi");
            String sexo = request.getParameter("sexo");
            String dataNascimentoStr = request.getParameter("dataNascimento");
            String morada = request.getParameter("morada");
            String salarioStr = request.getParameter("salario");
            String dataAdmissaoStr = request.getParameter("dataAdmissao");
            String idDepartamentoStr = request.getParameter("idDepartamento");
            String idUtilizadorStr = request.getParameter("idUtilizador");

            // Validação básica
            if (nomeCompleto == null || nomeCompleto.trim().isEmpty() || numeroBi == null || numeroBi.trim().isEmpty()) {
                request.setAttribute("erro", "Nome e BI são obrigatórios");
                request.getRequestDispatcher("/view/admin/funcionario/form.jsp").forward(request, response);
                return;
            }

            Funcionario funcionario = new Funcionario();
            funcionario.setNomeCompleto(nomeCompleto);
            funcionario.setTelefone(telefone);
            funcionario.setNumeroBi(numeroBi);
            funcionario.setSexo(sexo);
            
            if (dataNascimentoStr != null && !dataNascimentoStr.isEmpty()) {
                funcionario.setDataNascimento(LocalDate.parse(dataNascimentoStr));
            }
            
            funcionario.setMorada(morada);
            
            if (salarioStr != null && !salarioStr.isEmpty()) {
                funcionario.setSalario(new BigDecimal(salarioStr));
            }
            
            if (dataAdmissaoStr != null && !dataAdmissaoStr.isEmpty()) {
                funcionario.setDataAdmissao(LocalDate.parse(dataAdmissaoStr));
            } else {
                funcionario.setDataAdmissao(LocalDate.now());
            }
            
            if (idDepartamentoStr != null && !idDepartamentoStr.isEmpty()) {
                funcionario.setIdDepartamento(Integer.parseInt(idDepartamentoStr));
            }
            
            if (idUtilizadorStr != null && !idUtilizadorStr.isEmpty()) {
                funcionario.setIdUtilizador(Integer.parseInt(idUtilizadorStr));
            }

            boolean salvo = funcionarioService.save(funcionario);

            if (salvo) {
                response.sendRedirect(request.getContextPath() + "/admin/funcionario/list");
            } else {
                request.setAttribute("erro", "Erro ao salvar funcionário");
                request.getRequestDispatcher("/view/admin/funcionario/form.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao salvar funcionário: " + e.getMessage());
            request.getRequestDispatcher("/view/admin/funcionario/form.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("erro", "Erro no formato dos números: " + e.getMessage());
            request.getRequestDispatcher("/view/admin/funcionario/form.jsp").forward(request, response);
        }
    }
}
