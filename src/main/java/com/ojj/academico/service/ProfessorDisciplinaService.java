package com.ojj.academico.service;

import com.ojj.academico.model.ProfessorDisciplina;
import com.ojj.academico.repository.ProfessorDisciplinaRepository;

import java.sql.SQLException;
import java.util.List;

public class ProfessorDisciplinaService {

    private final ProfessorDisciplinaRepository repository;

    public ProfessorDisciplinaService() {
        this(new ProfessorDisciplinaRepository());
    }

    public ProfessorDisciplinaService(ProfessorDisciplinaRepository repository) {
        this.repository = repository;
    }

    public List<ProfessorDisciplina> findAll() throws SQLException {
        return repository.findAll();
    }

    public List<ProfessorDisciplina> findByProfessorId(int idProfessor) throws SQLException {
        return repository.findByProfessorId(idProfessor);
    }

    public List<Integer> findDisciplinaIdsByProfessorId(int idProfessor) throws SQLException {
        return repository.findDisciplinaIdsByProfessorId(idProfessor);
    }

    public boolean save(ProfessorDisciplina pd) throws SQLException {
        return repository.save(pd);
    }

    public boolean deleteByProfessorEDisciplina(int idProfessor, int idDisciplina) throws SQLException {
        return repository.deleteByProfessorEDisciplina(idProfessor, idDisciplina);
    }
}
