package com.ojj.academico.service;

import com.ojj.academico.model.PlanoCurricularDisciplina;
import com.ojj.academico.repository.PlanoCurricularDisciplinaRepository;

import java.sql.SQLException;
import java.util.List;

public class PlanoCurricularDisciplinaService {

    private final PlanoCurricularDisciplinaRepository repository;

    public PlanoCurricularDisciplinaService() {
        this(new PlanoCurricularDisciplinaRepository());
    }

    public PlanoCurricularDisciplinaService(PlanoCurricularDisciplinaRepository repository) {
        this.repository = repository;
    }

    public PlanoCurricularDisciplina findById(int id) throws SQLException {
        return repository.findById(id);
    }

    public List<PlanoCurricularDisciplina> findAll() throws SQLException {
        return repository.findAll();
    }

    public List<PlanoCurricularDisciplina> findByPlanoCurricularId(int idPlanoCurricular) throws SQLException {
        return repository.findByPlanoCurricularId(idPlanoCurricular);
    }

    public boolean save(PlanoCurricularDisciplina item) throws SQLException {
        return repository.save(item);
    }

    public boolean delete(int id) throws SQLException {
        return repository.delete(id);
    }

    public boolean deleteByPlanoCurricularEDisciplina(int idPlanoCurricular, int idDisciplina) throws SQLException {
        return repository.deleteByPlanoCurricularEDisciplina(idPlanoCurricular, idDisciplina);
    }
}
