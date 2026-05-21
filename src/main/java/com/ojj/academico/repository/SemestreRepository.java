package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.SemestreDAO;
import com.ojj.academico.model.Semestre;

public class SemestreRepository {

    private final SemestreDAO semestreDAO = new SemestreDAO();

    public Semestre findById(int id) throws SQLException {
        return semestreDAO.buscarPorId(id);
    }

    public List<Semestre> findAll() throws SQLException {
        return semestreDAO.listarTodos();
    }

    public boolean save(Semestre semestre) throws SQLException {
        if (semestre.getIdSemestre() == 0) {
            return semestreDAO.inserir(semestre);
        }
        return semestreDAO.atualizar(semestre);
    }

    public boolean delete(int id) throws SQLException {
        return semestreDAO.excluir(id);
    }
}
