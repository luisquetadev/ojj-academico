package com.ojj.academico.service;

import com.ojj.academico.model.Departamento;
import com.ojj.academico.repository.DepartamentoRepository;

import java.sql.SQLException;
import java.util.List;

public class DepartamentoService {

    private final DepartamentoRepository departamentoRepository;

    public DepartamentoService() {
        this(new DepartamentoRepository());
    }

    public DepartamentoService(DepartamentoRepository departamentoRepository) {
        this.departamentoRepository = departamentoRepository;
    }

    public Departamento findById(int id) throws SQLException {
        return departamentoRepository.findById(id);
    }

    public List<Departamento> findAll() throws SQLException {
        return departamentoRepository.findAll();
    }

    public boolean save(Departamento departamento) throws SQLException {
        return departamentoRepository.save(departamento);
    }

    public boolean delete(int id) throws SQLException {
        return departamentoRepository.delete(id);
    }
}
