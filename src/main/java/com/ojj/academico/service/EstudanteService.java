package com.ojj.academico.service;

import com.ojj.academico.model.Estudante;
import com.ojj.academico.repository.EstudanteRepository;

import java.sql.SQLException;
import java.util.List;

/**
 * Camada de Serviço para a entidade Estudante.
 * 
 * Responsabilidades:
 * - Centralizar a lógica de negócio relacionada aos estudantes.
 * - Gerenciar operações de CRUD através do Repositório.
 */
public class EstudanteService {

    private final EstudanteRepository estudanteRepository;

    /**
     * Inicializa o serviço com o repositório padrão.
     */
    public EstudanteService() {
        this(new EstudanteRepository());
    }

    /**
     * Permite injeção de repositório customizado.
     */
    public EstudanteService(EstudanteRepository estudanteRepository) {
        this.estudanteRepository = estudanteRepository;
    }

    /**
     * Localiza um estudante pelo seu identificador único.
     */
    public Estudante findById(int id) throws SQLException {
        return estudanteRepository.findById(id);
    }

    /**
     * Lista todos os estudantes cadastrados na instituição.
     */
    public List<Estudante> findAll() throws SQLException {
        return estudanteRepository.findAll();
    }

    /**
     * Salva os dados de um estudante.
     * Caso o estudante já exista (ID > 0), realiza um update.
     */
    public boolean save(Estudante estudante) throws SQLException {
        // Aqui poderiam ser adicionadas regras como:
        // - Gerar número de estudante automaticamente
        // - Validar se o estudante já tem idade mínima
        return estudanteRepository.save(estudante);
    }

    /**
     * Remove o registro de um estudante permanentemente.
     */
    public boolean delete(int id) throws SQLException {
        return estudanteRepository.delete(id);
    }
}
