package com.ojj.academico.service;

import com.ojj.academico.model.Frequencia;
import com.ojj.academico.repository.FrequenciaRepository;

import java.sql.SQLException;
import java.util.List;

public class FrequenciaService {

    private final FrequenciaRepository frequenciaRepository;

    public FrequenciaService() {
        this(new FrequenciaRepository());
    }

    public FrequenciaService(FrequenciaRepository frequenciaRepository) {
        this.frequenciaRepository = frequenciaRepository;
    }

    public Frequencia findById(int id) throws SQLException {
        return frequenciaRepository.findById(id);
    }

    public List<Frequencia> findAll() throws SQLException {
        return frequenciaRepository.findAll();
    }

    public boolean save(Frequencia frequencia) throws SQLException {
        return frequenciaRepository.save(frequencia);
    }

    public boolean delete(int id) throws SQLException {
        return frequenciaRepository.delete(id);
    }
}
