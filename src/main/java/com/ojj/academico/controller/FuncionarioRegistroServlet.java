package com.ojj.academico.controller;

import com.ojj.academico.conf.PerfilConstants;
import com.ojj.academico.model.Departamento;
import com.ojj.academico.repository.DepartamentoRepository;
import com.ojj.academico.service.FuncionarioRegistroService;
import com.ojj.academico.service.RegistroResult;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Servlet para registar novos funcionários (Secretário, Tesoureiro, Coordenador, etc.)
 * com geração automática de credenciais.
 */
/**
 * Servlet responsavel pelo fluxo de FuncionarioRegistro.
 * Rotas atendidas: /admin/funcionario/registrar. Encaminha para: /view/admin/funcionario/registrar.jsp.
 * Centraliza a leitura da requisicao, aciona servicos/DAOs quando necessario e define o proximo destino HTTP.
 */@WebServlet("/admin/funcionario/registrar")
public class FuncionarioRegistroServlet extends HttpServlet {
    
    private FuncionarioRegistroService registroService = new FuncionarioRegistroService();
    private DepartamentoRepository departamentoRepo = new DepartamentoRepository();
    /**
     * Trata requisicoes GET: prepara dados de exibicao e encaminha ou redireciona a tela correta.
     */
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        // Verificar se o utilizador é admin
        com.ojj.academico.model.Utilizador utilizador = (com.ojj.academico.model.Utilizador) session.getAttribute(com.ojj.academico.conf.AppConfig.SESSION_USER_ATTRIBUTE);
        if (utilizador == null || !utilizador.isAdmin()) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        // Obter lista de departamentos
        try {
            List<Departamento> departamentos = departamentoRepo.findAll();
            request.setAttribute("departamentos", departamentos);
        } catch (Exception e) {
            request.setAttribute("erro", "Erro ao carregar departamentos: " + e.getMessage());
        }
        
        request.getRequestDispatcher("/view/admin/funcionario/registrar.jsp").forward(request, response);
    }
    /**
     * Trata requisicoes POST: valida dados enviados, executa a operacao do formulario e retorna o resultado ao usuario.
     */
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        // Verificar se o utilizador é admin
        com.ojj.academico.model.Utilizador utilizador = (com.ojj.academico.model.Utilizador) session.getAttribute(com.ojj.academico.conf.AppConfig.SESSION_USER_ATTRIBUTE);
        if (utilizador == null || !utilizador.isAdmin()) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        try {
            String nomeCompleto = request.getParameter("nomeCompleto");
            String email = request.getParameter("email");
            String telefone = request.getParameter("telefone");
            String numeroBi = request.getParameter("numeroBi");
            String sexo = request.getParameter("sexo");
            String dataNascimento = request.getParameter("dataNascimento");
            String morada = request.getParameter("morada");
            Double salario = Double.parseDouble(request.getParameter("salario"));
            String dataAdmissao = request.getParameter("dataAdmissao");
            Integer idDepartamento = Integer.parseInt(request.getParameter("idDepartamento"));
            Integer idPerfil_novo = Integer.parseInt(request.getParameter("idPerfil"));
            
            // Validações básicas
            if (nomeCompleto == null || nomeCompleto.isEmpty() ||
                email == null || email.isEmpty() ||
                numeroBi == null || numeroBi.isEmpty()) {
                
                request.setAttribute("erro", "Preencha todos os campos obrigatórios");
                doGet(request, response);
                return;
            }
            
            // Registar funcionário
            RegistroResult resultado = registroService.registrarFuncionario(
                    nomeCompleto,
                    email,
                    telefone,
                    numeroBi,
                    sexo,
                    dataNascimento,
                    morada,
                    salario,
                    dataAdmissao,
                    idDepartamento,
                    idPerfil_novo
            );
            
            if (resultado.isErro()) {
                request.setAttribute("erro", resultado.getMensagem());
            } else {
                // Passar resultado para a página de sucesso
                session.setAttribute("registroSucesso", resultado);
            }
            
            doGet(request, response);
            
        } catch (NumberFormatException e) {
            request.setAttribute("erro", "Dados inválidos: " + e.getMessage());
            doGet(request, response);
        }
    }
}
