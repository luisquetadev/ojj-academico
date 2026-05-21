package com.ojj.academico.service;

import com.ojj.academico.model.MatriculaDisciplina;
import com.ojj.academico.repository.MatriculaDisciplinaRepository;

import java.sql.SQLException;
import java.util.List;

public class MatriculaDisciplinaService {

    private final MatriculaDisciplinaRepository repository;

    public MatriculaDisciplinaService() {
        this(new MatriculaDisciplinaRepository());
    }

    public MatriculaDisciplinaService(MatriculaDisciplinaRepository repository) {
        this.repository = repository;
    }

    public MatriculaDisciplina findById(int idMatricula, int idDisciplina) throws SQLException {
        return repository.findById(idMatricula, idDisciplina);
    }

    public List<MatriculaDisciplina> findAll() throws SQLException {
        return repository.findAll();
    }

    public boolean save(MatriculaDisciplina md) throws SQLException {
        return repository.save(md);
    }

    public boolean delete(int idMatricula, int idDisciplina) throws SQLException {
        return repository.delete(idMatricula, idDisciplina);
    }
}
