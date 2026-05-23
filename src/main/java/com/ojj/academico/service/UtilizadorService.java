package com.ojj.academico.service;

import com.ojj.academico.model.Utilizador;
import com.ojj.academico.repository.UtilizadorRepository;

import java.sql.SQLException;
import java.util.List;

public class UtilizadorService {

    private final UtilizadorRepository utilizadorRepository;

    public UtilizadorService() {
        this(new UtilizadorRepository());
    }

    public UtilizadorService(UtilizadorRepository utilizadorRepository) {
        this.utilizadorRepository = utilizadorRepository;
    }

    public Utilizador findById(int id) throws SQLException {
        return utilizadorRepository.findById(id);
    }

    public List<Utilizador> findAll() throws SQLException {
        return utilizadorRepository.findAll();
    }

    public boolean save(Utilizador utilizador) throws SQLException {
        return utilizadorRepository.save(utilizador);
    }

    public boolean delete(int id) throws SQLException {
        return utilizadorRepository.delete(id);
    }

    public Utilizador login(String email, String password) throws SQLException {
        return utilizadorRepository.findByUsernameAndPassword(email, password);
    }

    public Utilizador findByEmail(String email) throws SQLException {
        return utilizadorRepository.findByUsername(email);
    }

}
