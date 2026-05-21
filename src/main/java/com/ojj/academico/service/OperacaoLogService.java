package com.ojj.academico.service;

import com.ojj.academico.model.OperacaoLog;
import com.ojj.academico.repository.OperacaoLogRepository;

import java.sql.SQLException;
import java.util.List;

public class OperacaoLogService {

    private final OperacaoLogRepository repository;

    public OperacaoLogService() {
        this(new OperacaoLogRepository());
    }

    public OperacaoLogService(OperacaoLogRepository repository) {
        this.repository = repository;
    }

    public OperacaoLog findById(int id) throws SQLException {
        return repository.findById(id);
    }

    public List<OperacaoLog> findAll() throws SQLException {
        return repository.findAll();
    }

    public boolean save(OperacaoLog log) throws SQLException {
        return repository.save(log);
    }

    public boolean delete(int id) throws SQLException {
        return repository.delete(id);
    }
}
