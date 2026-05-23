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

public class EstudanteAdminServlet extends HttpServlet {

    private final EstudanteService estudanteService = new EstudanteService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/admin/estudante/form.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String numeroEstudante = request.getParameter("numeroEstudante");
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
            String idUtilizadorStr = request.getParameter("idUtilizador");

            if (nomeCompleto == null || nomeCompleto.trim().isEmpty() || numeroBi == null || numeroBi.trim().isEmpty()) {
                request.setAttribute("erro", "Nome e BI são obrigatórios");
                request.getRequestDispatcher("/view/admin/estudante/form.jsp").forward(request, response);
                return;
            }

            Estudante estudante = new Estudante();
            estudante.setNumeroEstudante(numeroEstudante);
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
            
            if (idUtilizadorStr != null && !idUtilizadorStr.isEmpty()) {
                estudante.setIdUtilizador(Integer.parseInt(idUtilizadorStr));
            }

            boolean salvo = estudanteService.save(estudante);

            if (salvo) {
                response.sendRedirect(request.getContextPath() + "/admin/estudante/list");
            } else {
                request.setAttribute("erro", "Erro ao salvar estudante");
                request.getRequestDispatcher("/view/admin/estudante/form.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao salvar estudante: " + e.getMessage());
            request.getRequestDispatcher("/view/admin/estudante/form.jsp").forward(request, response);
        }
    }
}
