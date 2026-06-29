package com.ojj.academico.service;

import com.ojj.academico.model.Matricula;
import com.ojj.academico.repository.MatriculaRepository;

import java.sql.SQLException;
import java.util.List;

public class MatriculaService {

    private final MatriculaRepository matriculaRepository;

    public MatriculaService() {
        this(new MatriculaRepository());
    }

    public MatriculaService(MatriculaRepository matriculaRepository) {
        this.matriculaRepository = matriculaRepository;
    }

    public Matricula findById(int id) throws SQLException {
        return matriculaRepository.findById(id);
    }

    public List<Matricula> findByIdTurma(int idTurma) throws SQLException {
        return matriculaRepository.findByIdTurma(idTurma);
    }

    public List<Matricula> findByEstudante(int idEstudante) throws SQLException {
        return matriculaRepository.findByEstudante(idEstudante);
    }

    public List<Matricula> findAll() throws SQLException {
        return matriculaRepository.findAll();
    }

    public boolean save(Matricula matricula) throws SQLException {
        return matriculaRepository.save(matricula);
    }

    public boolean delete(int id) throws SQLException {
        return matriculaRepository.delete(id);
    }
}
