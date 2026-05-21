package com.ojj.academico.service;

import com.ojj.academico.model.Professor;
import com.ojj.academico.repository.ProfessorRepository;

import java.sql.SQLException;
import java.util.List;

public class ProfessorService {

    private final ProfessorRepository professorRepository;

    public ProfessorService() {
        this(new ProfessorRepository());
    }

    public ProfessorService(ProfessorRepository professorRepository) {
        this.professorRepository = professorRepository;
    }

    public Professor findById(int id) throws SQLException {
        return professorRepository.findById(id);
    }

    public List<Professor> findAll() throws SQLException {
        return professorRepository.findAll();
    }

    public boolean save(Professor professor) throws SQLException {
        return professorRepository.save(professor);
    }

    public boolean delete(int id) throws SQLException {
        return professorRepository.delete(id);
    }
}
