package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.ProfessorDAO;
import com.ojj.academico.model.Professor;

public class ProfessorRepository {

    private final ProfessorDAO professorDAO = new ProfessorDAO();

    public Professor findById(int id) throws SQLException {
        return professorDAO.buscarPorId(id);
    }

    public List<Professor> findAll() throws SQLException {
        return professorDAO.listarTodos();
    }

    public boolean save(Professor professor) throws SQLException {
        if (professor.getIdProfessor() == 0) {
            return professorDAO.inserir(professor);
        }
        return professorDAO.atualizar(professor);
    }

    public boolean delete(int id) throws SQLException {
        return professorDAO.excluir(id);
    }
}
