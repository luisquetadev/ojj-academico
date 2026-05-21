package com.ojj.academico.service;

import com.ojj.academico.model.Avaliacao;
import com.ojj.academico.repository.AvaliacaoRepository;

import java.sql.SQLException;
import java.util.List;

public class AvaliacaoService {

    private final AvaliacaoRepository repository;

    public AvaliacaoService() {
        this(new AvaliacaoRepository());
    }

    public AvaliacaoService(AvaliacaoRepository repository) {
        this.repository = repository;
    }

    public Avaliacao findById(int id) throws SQLException {
        return repository.findById(id);
    }

    public List<Avaliacao> findAll() throws SQLException {
        return repository.findAll();
    }

    public boolean save(Avaliacao avaliacao) throws SQLException {
        return repository.save(avaliacao);
    }

    public boolean delete(int id) throws SQLException {
        return repository.delete(id);
    }
}
