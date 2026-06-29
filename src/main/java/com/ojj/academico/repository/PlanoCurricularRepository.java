package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.PlanoCurricularDAO;
import com.ojj.academico.model.PlanoCurricular;

public class PlanoCurricularRepository {

    private final PlanoCurricularDAO planoCurricularDAO = new PlanoCurricularDAO();

    public PlanoCurricular findById(int id) throws SQLException {
        return planoCurricularDAO.buscarPorId(id);
    }

    public List<PlanoCurricular> findAll() throws SQLException {
        return planoCurricularDAO.listarTodos();
    }

    public boolean save(PlanoCurricular planoCurricular) throws SQLException {
        if (planoCurricular.getIdPlanoCurricular() == 0) {
            return planoCurricularDAO.inserir(planoCurricular);
        }
        return planoCurricularDAO.atualizar(planoCurricular);
    }

    public List<PlanoCurricular> findByCursoId(int idCurso) throws SQLException {
        return planoCurricularDAO.listarPorCurso(idCurso);
    }

    public boolean delete(int id) throws SQLException {
        return planoCurricularDAO.excluir(id);
    }
}
