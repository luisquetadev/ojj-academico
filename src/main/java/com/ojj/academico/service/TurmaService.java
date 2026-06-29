package com.ojj.academico.service;

import com.ojj.academico.model.Turma;
import com.ojj.academico.repository.TurmaRepository;

import java.sql.SQLException;
import java.util.List;

public class TurmaService {

    private final TurmaRepository turmaRepository;

    public TurmaService() {
        this(new TurmaRepository());
    }

    public TurmaService(TurmaRepository turmaRepository) {
        this.turmaRepository = turmaRepository;
    }

    public Turma findById(int id) throws SQLException {
        return turmaRepository.findById(id);
    }

    public List<Turma> findByProfessor(int idProfessor) throws SQLException {
        return turmaRepository.findByProfessor(idProfessor);
    }

    public List<Turma> findAll() throws SQLException {
        return turmaRepository.findAll();
    }

    public boolean save(Turma turma) throws SQLException {
        return turmaRepository.save(turma);
    }

    public boolean delete(int id) throws SQLException {
        return turmaRepository.delete(id);
    }
}
