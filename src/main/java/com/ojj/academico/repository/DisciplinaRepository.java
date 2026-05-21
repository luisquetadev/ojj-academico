package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.DisciplinaDAO;
import com.ojj.academico.model.Disciplina;

public class DisciplinaRepository {

    private final DisciplinaDAO disciplinaDAO = new DisciplinaDAO();

    public Disciplina findById(int id) throws SQLException {
        return disciplinaDAO.buscarPorId(id);
    }

    public List<Disciplina> findAll() throws SQLException {
        return disciplinaDAO.listarTodos();
    }

    public boolean save(Disciplina disciplina) throws SQLException {
        if (disciplina.getIdDisciplina() == 0) {
            return disciplinaDAO.inserir(disciplina);
        }
        return disciplinaDAO.atualizar(disciplina);
    }

    public boolean delete(int id) throws SQLException {
        return disciplinaDAO.excluir(id);
    }
}
