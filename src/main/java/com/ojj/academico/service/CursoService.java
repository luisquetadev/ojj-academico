package com.ojj.academico.service;

import com.ojj.academico.model.Curso;
import com.ojj.academico.repository.CursoRepository;

import java.sql.SQLException;
import java.util.List;

public class CursoService {

    private final CursoRepository cursoRepository;

    public CursoService() {
        this(new CursoRepository());
    }

    public CursoService(CursoRepository cursoRepository) {
        this.cursoRepository = cursoRepository;
    }

    public Curso findById(int id) throws SQLException {
        return cursoRepository.findById(id);
    }

    public List<Curso> findAll() throws SQLException {
        return cursoRepository.findAll();
    }

    public boolean save(Curso curso) throws SQLException {
        return cursoRepository.save(curso);
    }

    public boolean delete(int id) throws SQLException {
        return cursoRepository.delete(id);
    }
}
