package com.ojj.academico.service;

import com.ojj.academico.model.PlanoCurricular;
import com.ojj.academico.repository.PlanoCurricularRepository;

import java.sql.SQLException;
import java.util.List;

public class PlanoCurricularService {

    private final PlanoCurricularRepository repository;

    public PlanoCurricularService() {
        this(new PlanoCurricularRepository());
    }

    public PlanoCurricularService(PlanoCurricularRepository repository) {
        this.repository = repository;
    }

    public PlanoCurricular findById(int id) throws SQLException {
        return repository.findById(id);
    }

    public List<PlanoCurricular> findAll() throws SQLException {
        return repository.findAll();
    }

    public boolean save(PlanoCurricular plano) throws SQLException {
        return repository.save(plano);
    }

    public List<PlanoCurricular> findByCursoId(int idCurso) throws SQLException {
        return repository.findByCursoId(idCurso);
    }

    public boolean delete(int id) throws SQLException {
        return repository.delete(id);
    }
}
