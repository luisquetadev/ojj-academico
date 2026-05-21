package com.ojj.academico.service;

import com.ojj.academico.model.Semestre;
import com.ojj.academico.repository.SemestreRepository;

import java.sql.SQLException;
import java.util.List;

public class SemestreService {

    private final SemestreRepository semestreRepository;

    public SemestreService() {
        this(new SemestreRepository());
    }

    public SemestreService(SemestreRepository semestreRepository) {
        this.semestreRepository = semestreRepository;
    }

    public Semestre findById(int id) throws SQLException {
        return semestreRepository.findById(id);
    }

    public List<Semestre> findAll() throws SQLException {
        return semestreRepository.findAll();
    }

    public boolean save(Semestre semestre) throws SQLException {
        return semestreRepository.save(semestre);
    }

    public boolean delete(int id) throws SQLException {
        return semestreRepository.delete(id);
    }
}
