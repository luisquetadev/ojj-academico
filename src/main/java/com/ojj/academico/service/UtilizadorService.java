package com.ojj.academico.service;

import com.ojj.academico.model.Utilizador;
import com.ojj.academico.repository.UtilizadorRepository;

import java.sql.SQLException;
import java.util.List;

/**
 * Camada de Serviço para a entidade Utilizador.
 * 
 * Responsabilidades:
 * - Aplicar regras de negócio relacionadas a utilizadores.
 * - Fazer a ponte entre os Servlets (Controller) e o Repositório (Dados).
 * - Gerenciar a lógica de autenticação (login).
 */
public class UtilizadorService {

    private final UtilizadorRepository utilizadorRepository;

    /**
     * Construtor padrão que inicializa seu próprio repositório.
     */
    public UtilizadorService() {
        this(new UtilizadorRepository());
    }

    /**
     * Construtor para injeção de dependência (útil para testes unitários).
     */
    public UtilizadorService(UtilizadorRepository utilizadorRepository) {
        this.utilizadorRepository = utilizadorRepository;
    }

    /**
     * Busca um utilizador pelo seu ID único.
     */
    public Utilizador findById(int id) throws SQLException {
        return utilizadorRepository.findById(id);
    }

    /**
     * Retorna uma lista com todos os utilizadores cadastrados.
     */
    public List<Utilizador> findAll() throws SQLException {
        return utilizadorRepository.findAll();
    }

    /**
     * Salva ou atualiza um utilizador.
     * A decisão de Inserir ou Atualizar é feita no Repositório baseada no ID.
     */
    public boolean save(Utilizador utilizador) throws SQLException {
        return utilizadorRepository.save(utilizador);
    }

    /**
     * Remove um utilizador do sistema pelo ID.
     */
    public boolean delete(int id) throws SQLException {
        return utilizadorRepository.delete(id);
    }

    /**
     * Lógica principal de Login.
     * 
     * @param email O email/username fornecido no login.
     * @param password A senha em texto plano.
     * @return Objeto Utilizador se as credenciais forem válidas, null caso contrário.
     */
    public Utilizador login(String email, String password) throws SQLException {
        // Delega a busca e verificação de senha para o repositório/DAO
        return utilizadorRepository.findByUsernameAndPassword(email, password);
    }

    /**
     * Busca um utilizador especificamente pelo email.
     */
    public Utilizador findByEmail(String email) throws SQLException {
        return utilizadorRepository.findByUsername(email);
    }

}
