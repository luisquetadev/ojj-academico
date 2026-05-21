package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.AnoAcademicoDAO;
import com.ojj.academico.model.AnoAcademico;

public class AnoAcademicoRepository {

    private final AnoAcademicoDAO anoAcademicoDAO = new AnoAcademicoDAO();

    public AnoAcademico findById(int id) throws SQLException {
        return anoAcademicoDAO.buscarPorId(id);
    }

    public List<AnoAcademico> findAll() throws SQLException {
        return anoAcademicoDAO.listarTodos();
    }

    public boolean save(AnoAcademico anoAcademico) throws SQLException {
        if (anoAcademico.getIdAnoAcademico() == 0) {
            return anoAcademicoDAO.inserir(anoAcademico);
        }
        return anoAcademicoDAO.atualizar(anoAcademico);
    }

    public boolean delete(int id) throws SQLException {
        return anoAcademicoDAO.excluir(id);
    }
}
