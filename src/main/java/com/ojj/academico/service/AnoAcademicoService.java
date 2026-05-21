package com.ojj.academico.service;

import com.ojj.academico.model.AnoAcademico;
import com.ojj.academico.repository.AnoAcademicoRepository;

import java.sql.SQLException;
import java.util.List;

public class AnoAcademicoService {

    private final AnoAcademicoRepository repository;

    public AnoAcademicoService() {
        this(new AnoAcademicoRepository());
    }

    public AnoAcademicoService(AnoAcademicoRepository repository) {
        this.repository = repository;
    }

    public AnoAcademico findById(int id) throws SQLException {
        return repository.findById(id);
    }

    public List<AnoAcademico> findAll() throws SQLException {
        return repository.findAll();
    }

    public boolean save(AnoAcademico ano) throws SQLException {
        return repository.save(ano);
    }

    public boolean delete(int id) throws SQLException {
        return repository.delete(id);
    }
}
