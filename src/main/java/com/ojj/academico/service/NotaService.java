package com.ojj.academico.service;

import com.ojj.academico.model.Nota;
import com.ojj.academico.repository.NotaRepository;

import java.sql.SQLException;
import java.util.List;

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

    public boolean save(Nota nota) throws SQLException {
        return notaRepository.save(nota);
    }

    public boolean delete(int id) throws SQLException {
        return notaRepository.delete(id);
    }
}
