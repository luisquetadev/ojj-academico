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
 * Servlet responsável pelo cadastro administrativo de novos estudantes.
 * 
 * Responsabilidades:
 * - Exibir o formulário de cadastro (GET).
 * - Processar a submissão do formulário, validar campos e persistir o estudante (POST).
 */
public class EstudanteAdminServlet extends HttpServlet {

    private final EstudanteService estudanteService = new EstudanteService();

    /**
     * Exibe o formulário de cadastro de novo estudante.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/admin/estudante/form.jsp").forward(request, response);
    }

    /**
     * Processa a criação de um novo estudante.
     * 1. Extrai todos os campos do formulário.
     * 2. Realiza validações básicas de campos obrigatórios.
     * 3. Monta o objeto Estudante.
     * 4. Chama o serviço para persistir no banco de dados.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Coleta de parâmetros vindos do formulário JSP
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

            // Validação simples de servidor (Server-side validation)
            if (nomeCompleto == null || nomeCompleto.trim().isEmpty() || numeroBi == null || numeroBi.trim().isEmpty()) {
                request.setAttribute("erro", "Nome e BI são obrigatórios");
                request.getRequestDispatcher("/view/admin/estudante/form.jsp").forward(request, response);
                return;
            }

            // Mapeamento dos parâmetros para o objeto Model
            Estudante estudante = new Estudante();
            estudante.setNumeroEstudante(numeroEstudante);
            estudante.setNomeCompleto(nomeCompleto);
            estudante.setSexo(sexo);
            
            // Tratamento de conversão de data
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
            
            // Associação opcional com um utilizador (conta de login)
            if (idUtilizadorStr != null && !idUtilizadorStr.isEmpty()) {
                estudante.setIdUtilizador(Integer.parseInt(idUtilizadorStr));
            }

            // Persistência através da camada de serviço
            boolean salvo = estudanteService.save(estudante);

            if (salvo) {
                // Redireciona para a lista em caso de sucesso (padrão Post-Redirect-Get)
                response.sendRedirect(request.getContextPath() + "/admin/estudante/list");
            } else {
                request.setAttribute("erro", "Erro ao salvar estudante: operação falhou no banco.");
                request.getRequestDispatcher("/view/admin/estudante/form.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            // Tratamento de erros de banco de dados (ex: BI duplicado ou violação de FK)
            request.setAttribute("erro", "Erro ao salvar estudante no banco: " + e.getMessage());
            request.getRequestDispatcher("/view/admin/estudante/form.jsp").forward(request, response);
        } catch (Exception e) {
            // Tratamento de erros inesperados (ex: parse de data inválido)
            request.setAttribute("erro", "Erro inesperado: " + e.getMessage());
            request.getRequestDispatcher("/view/admin/estudante/form.jsp").forward(request, response);
        }
    }
}
