package com.ojj.academico.repository;

import com.ojj.academico.dao.ProfessorDisciplinaDAO;
import com.ojj.academico.model.ProfessorDisciplina;

import java.sql.SQLException;
import java.util.List;

public class ProfessorDisciplinaRepository {

    private final ProfessorDisciplinaDAO dao = new ProfessorDisciplinaDAO();

    public List<ProfessorDisciplina> findAll() throws SQLException {
        return dao.listarTodos();
    }

    public List<ProfessorDisciplina> findByProfessorId(int idProfessor) throws SQLException {
        return dao.listarPorProfessor(idProfessor);
    }

    public List<Integer> findDisciplinaIdsByProfessorId(int idProfessor) throws SQLException {
        return dao.listarIdDisciplinasPorProfessor(idProfessor);
    }

    public boolean save(ProfessorDisciplina pd) throws SQLException {
        return dao.inserir(pd);
    }

    public boolean deleteByProfessorEDisciplina(int idProfessor, int idDisciplina) throws SQLException {
        return dao.excluirPorProfessorEDisciplina(idProfessor, idDisciplina);
    }
}
