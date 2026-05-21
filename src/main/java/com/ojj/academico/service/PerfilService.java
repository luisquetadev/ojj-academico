package com.ojj.academico.service;

import com.ojj.academico.model.Perfil;
import com.ojj.academico.repository.PerfilRepository;

import java.sql.SQLException;
import java.util.List;

public class PerfilService {

    private final PerfilRepository perfilRepository;

    public PerfilService() {
        this(new PerfilRepository());
    }

    public PerfilService(PerfilRepository perfilRepository) {
        this.perfilRepository = perfilRepository;
    }

    public Perfil findById(int id) throws SQLException {
        return perfilRepository.findById(id);
    }

    public List<Perfil> findAll() throws SQLException {
        return perfilRepository.findAll();
    }

    public boolean save(Perfil perfil) throws SQLException {
        return perfilRepository.save(perfil);
    }

    public boolean delete(int id) throws SQLException {
        return perfilRepository.delete(id);
    }
}
