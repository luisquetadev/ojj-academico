package com.ojj.academico.service;

import com.ojj.academico.model.Propina;
import com.ojj.academico.repository.PropinaRepository;

import java.sql.SQLException;
import java.util.List;

public class PropinaService {

    private final PropinaRepository propinaRepository;

    public PropinaService() {
        this(new PropinaRepository());
    }

    public PropinaService(PropinaRepository propinaRepository) {
        this.propinaRepository = propinaRepository;
    }

    public Propina findById(int id) throws SQLException {
        return propinaRepository.findById(id);
    }

    public List<Propina> findAll() throws SQLException {
        return propinaRepository.findAll();
    }

    public boolean save(Propina propina) throws SQLException {
        return propinaRepository.save(propina);
    }

    public boolean delete(int id) throws SQLException {
        return propinaRepository.delete(id);
    }
}
