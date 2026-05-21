package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.PerfilDAO;
import com.ojj.academico.model.Perfil;

public class PerfilRepository {

    private final PerfilDAO perfilDAO = new PerfilDAO();

    public Perfil findById(int id) throws SQLException {
        return perfilDAO.buscarPorId(id);
    }

    public List<Perfil> findAll() throws SQLException {
        return perfilDAO.listarTodos();
    }

    public boolean save(Perfil perfil) throws SQLException {
        if (perfil.getIdPerfil() == 0) {
            return perfilDAO.inserir(perfil);
        }
        return perfilDAO.atualizar(perfil);
    }

    public boolean delete(int id) throws SQLException {
        return perfilDAO.excluir(id);
    }
}
