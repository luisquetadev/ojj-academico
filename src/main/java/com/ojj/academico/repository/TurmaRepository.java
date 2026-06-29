package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.TurmaDAO;
import com.ojj.academico.model.Turma;

public class TurmaRepository {

    private final TurmaDAO turmaDAO = new TurmaDAO();

    public Turma findById(int id) throws SQLException {
        return turmaDAO.buscarPorId(id);
    }

    public List<Turma> findAll() throws SQLException {
        return turmaDAO.listarTodos();
    }

    public List<Turma> findByProfessor(int idProfessor) throws SQLException {
        return turmaDAO.listarPorProfessor(idProfessor);
    }

    public boolean save(Turma turma) throws SQLException {
        if (turma.getIdTurma() == 0) {
            return turmaDAO.inserir(turma);
        }
        return turmaDAO.atualizar(turma);
    }

    public boolean delete(int id) throws SQLException {
        return turmaDAO.excluir(id);
    }
}
