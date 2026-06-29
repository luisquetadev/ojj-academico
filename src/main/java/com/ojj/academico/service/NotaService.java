package com.ojj.academico.service;

import com.ojj.academico.model.Nota;
import com.ojj.academico.repository.NotaRepository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class NotaService {

    private final NotaRepository notaRepository;

    public NotaService() {
        this(new NotaRepository());
    }

    public NotaService(NotaRepository notaRepository) {
        this.notaRepository = notaRepository;
    }

    public Nota findById(int id) throws SQLException {
        return notaRepository.findById(id);
    }

    public List<Nota> findAll() throws SQLException {
        return notaRepository.findAll();
    }

    public List<Nota> findByAvaliacao(int idAvaliacao) throws SQLException {
        return notaRepository.findByAvaliacao(idAvaliacao);
    }

    public Nota findByAvaliacaoEEstudante(int idAvaliacao, int idEstudante) throws SQLException {
        return notaRepository.findByAvaliacaoEEstudante(idAvaliacao, idEstudante);
    }

    public List<Nota> findByEstudante(int idEstudante) throws SQLException {
        return notaRepository.findByEstudante(idEstudante);
    }

    public List<Map<String, Object>> findByEstudanteComAvaliacao(int idEstudante) throws SQLException {
        return notaRepository.findByEstudanteComAvaliacao(idEstudante);
    }

    public boolean save(Nota nota) throws SQLException {
        return notaRepository.save(nota);
    }

    public boolean delete(int id) throws SQLException {
        return notaRepository.delete(id);
    }
}
