package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.PlanoCurricularDisciplinaDAO;
import com.ojj.academico.model.PlanoCurricularDisciplina;

public class PlanoCurricularDisciplinaRepository {

    private final PlanoCurricularDisciplinaDAO dao = new PlanoCurricularDisciplinaDAO();

    public PlanoCurricularDisciplina findById(int id) throws SQLException {
        return dao.buscarPorId(id);
    }

    public List<PlanoCurricularDisciplina> findAll() throws SQLException {
        return dao.listarTodos();
    }

    public List<PlanoCurricularDisciplina> findByPlanoCurricularId(int idPlanoCurricular) throws SQLException {
        return dao.listarPorPlanoCurricular(idPlanoCurricular);
    }

    public boolean save(PlanoCurricularDisciplina item) throws SQLException {
        return dao.inserir(item);
    }

    public boolean delete(int id) throws SQLException {
        return dao.excluir(id);
    }

    public boolean deleteByPlanoCurricularEDisciplina(int idPlanoCurricular, int idDisciplina) throws SQLException {
        return dao.excluirPorPlanoCurricularEDisciplina(idPlanoCurricular, idDisciplina);
    }
}
