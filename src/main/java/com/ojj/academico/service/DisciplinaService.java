package com.ojj.academico.service;

import com.ojj.academico.model.Disciplina;
import com.ojj.academico.repository.DisciplinaRepository;

import java.sql.SQLException;
import java.util.List;

public class DisciplinaService {

    private final DisciplinaRepository disciplinaRepository;

    public DisciplinaService() {
        this(new DisciplinaRepository());
    }

    public DisciplinaService(DisciplinaRepository disciplinaRepository) {
        this.disciplinaRepository = disciplinaRepository;
    }

    public Disciplina findById(int id) throws SQLException {
        return disciplinaRepository.findById(id);
    }

    public List<Disciplina> findAll() throws SQLException {
        return disciplinaRepository.findAll();
    }

    public boolean save(Disciplina disciplina) throws SQLException {
        return disciplinaRepository.save(disciplina);
    }

    public boolean delete(int id) throws SQLException {
        return disciplinaRepository.delete(id);
    }
}
