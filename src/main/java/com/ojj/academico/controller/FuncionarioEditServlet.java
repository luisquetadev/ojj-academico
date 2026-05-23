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

@WebServlet(name = "FuncionarioEditServlet", urlPatterns = {"/admin/funcionario/edit"})
public class FuncionarioEditServlet extends HttpServlet {

    private final FuncionarioService funcionarioService = new FuncionarioService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/funcionario/list");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            Funcionario funcionario = funcionarioService.findById(id);
            
            if (funcionario == null) {
                request.setAttribute("erro", "Funcionário não encontrado");
                response.sendRedirect(request.getContextPath() + "/admin/funcionario/list");
                return;
            }
            
            request.setAttribute("funcionario", funcionario);
            request.getRequestDispatcher("/view/admin/funcionario/edit.jsp").forward(request, response);
            
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao buscar funcionário: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/admin/funcionario/list");
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/funcionario/list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/funcionario/list");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            Funcionario funcionario = funcionarioService.findById(id);
            
            if (funcionario == null) {
                request.setAttribute("erro", "Funcionário não encontrado");
                response.sendRedirect(request.getContextPath() + "/admin/funcionario/list");
                return;
            }

            String nomeCompleto = request.getParameter("nomeCompleto");
            String telefone = request.getParameter("telefone");
            String numeroBi = request.getParameter("numeroBi");
            String sexo = request.getParameter("sexo");
            String dataNascimentoStr = request.getParameter("dataNascimento");
            String morada = request.getParameter("morada");
            String salarioStr = request.getParameter("salario");
            String dataAdmissaoStr = request.getParameter("dataAdmissao");
            String idDepartamentoStr = request.getParameter("idDepartamento");

            // Validação básica
            if (nomeCompleto == null || nomeCompleto.trim().isEmpty() || numeroBi == null || numeroBi.trim().isEmpty()) {
                request.setAttribute("erro", "Nome e BI são obrigatórios");
                request.setAttribute("funcionario", funcionario);
                request.getRequestDispatcher("/view/admin/funcionario/edit.jsp").forward(request, response);
                return;
            }

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
            }
            
            if (idDepartamentoStr != null && !idDepartamentoStr.isEmpty()) {
                funcionario.setIdDepartamento(Integer.parseInt(idDepartamentoStr));
            }

            boolean atualizado = funcionarioService.save(funcionario);

            if (atualizado) {
                response.sendRedirect(request.getContextPath() + "/admin/funcionario/list");
            } else {
                request.setAttribute("erro", "Erro ao atualizar funcionário");
                request.setAttribute("funcionario", funcionario);
                request.getRequestDispatcher("/view/admin/funcionario/edit.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao atualizar funcionário: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/admin/funcionario/list");
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/funcionario/list");
        }
    }
}
