package com.ojj.academico.service;

import com.ojj.academico.model.Estudante;
import com.ojj.academico.repository.EstudanteRepository;

import java.sql.SQLException;
import java.util.List;

public class EstudanteService {

    private final EstudanteRepository estudanteRepository;

    public EstudanteService() {
        this(new EstudanteRepository());
    }

    public EstudanteService(EstudanteRepository estudanteRepository) {
        this.estudanteRepository = estudanteRepository;
    }

    public Estudante findById(int id) throws SQLException {
        return estudanteRepository.findById(id);
    }

    public List<Estudante> findAll() throws SQLException {
        return estudanteRepository.findAll();
    }

    public boolean save(Estudante estudante) throws SQLException {
        return estudanteRepository.save(estudante);
    }

    public boolean delete(int id) throws SQLException {
        return estudanteRepository.delete(id);
    }
}
