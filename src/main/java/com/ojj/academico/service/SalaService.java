package com.ojj.academico.service;

import com.ojj.academico.model.Sala;
import com.ojj.academico.repository.SalaRepository;

import java.sql.SQLException;
import java.util.List;

public class SalaService {

    private final SalaRepository salaRepository;

    public SalaService() {
        this(new SalaRepository());
    }

    public SalaService(SalaRepository salaRepository) {
        this.salaRepository = salaRepository;
    }

    public Sala findById(int id) throws SQLException {
        return salaRepository.findById(id);
    }

    public List<Sala> findAll() throws SQLException {
        return salaRepository.findAll();
    }

    public boolean save(Sala sala) throws SQLException {
        return salaRepository.save(sala);
    }

    public boolean delete(int id) throws SQLException {
        return salaRepository.delete(id);
    }
}
