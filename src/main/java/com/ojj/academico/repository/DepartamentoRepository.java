package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.DepartamentoDAO;
import com.ojj.academico.model.Departamento;

public class DepartamentoRepository {

    private final DepartamentoDAO departamentoDAO = new DepartamentoDAO();

    public Departamento findById(int id) throws SQLException {
        return departamentoDAO.buscarPorId(id);
    }

    public List<Departamento> findAll() throws SQLException {
        return departamentoDAO.listarTodos();
    }

    public boolean save(Departamento departamento) throws SQLException {
        if (departamento.getIdDepartamento() == 0) {
            return departamentoDAO.inserir(departamento);
        }
        return departamentoDAO.atualizar(departamento);
    }

    public boolean delete(int id) throws SQLException {
        return departamentoDAO.excluir(id);
    }
}
