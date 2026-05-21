package com.ojj.academico.service;

import com.ojj.academico.model.HistoricoAcademico;
import com.ojj.academico.repository.HistoricoAcademicoRepository;

import java.sql.SQLException;
import java.util.List;

public class HistoricoAcademicoService {

    private final HistoricoAcademicoRepository historicoRepository;

    public HistoricoAcademicoService() {
        this(new HistoricoAcademicoRepository());
    }

    public HistoricoAcademicoService(HistoricoAcademicoRepository historicoRepository) {
        this.historicoRepository = historicoRepository;
    }

    public HistoricoAcademico findById(int id) throws SQLException {
        return historicoRepository.findById(id);
    }

    public List<HistoricoAcademico> findAll() throws SQLException {
        return historicoRepository.findAll();
    }

    public boolean save(HistoricoAcademico historico) throws SQLException {
        return historicoRepository.save(historico);
    }

    public boolean delete(int id) throws SQLException {
        return historicoRepository.delete(id);
    }
}
