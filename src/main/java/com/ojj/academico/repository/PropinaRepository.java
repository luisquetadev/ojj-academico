package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.PropinaDAO;
import com.ojj.academico.model.Propina;

public class PropinaRepository {

    private final PropinaDAO propinaDAO = new PropinaDAO();

    public Propina findById(int id) throws SQLException {
        return propinaDAO.buscarPorId(id);
    }

    public List<Propina> findAll() throws SQLException {
        return propinaDAO.listarTodos();
    }

    public boolean save(Propina propina) throws SQLException {
        if (propina.getIdPropina() == 0) {
            return propinaDAO.inserir(propina);
        }
        return propinaDAO.atualizar(propina);
    }

    public boolean delete(int id) throws SQLException {
        return propinaDAO.excluir(id);
    }
}
