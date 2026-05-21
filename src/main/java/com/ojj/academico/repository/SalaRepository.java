package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.SalaDAO;
import com.ojj.academico.model.Sala;

public class SalaRepository {

    private final SalaDAO salaDAO = new SalaDAO();

    public Sala findById(int id) throws SQLException {
        return salaDAO.buscarPorId(id);
    }

    public List<Sala> findAll() throws SQLException {
        return salaDAO.listarTodos();
    }

    public boolean save(Sala sala) throws SQLException {
        if (sala.getIdSala() == 0) {
            return salaDAO.inserir(sala);
        }
        return salaDAO.atualizar(sala);
    }

    public boolean delete(int id) throws SQLException {
        return salaDAO.excluir(id);
    }
}
