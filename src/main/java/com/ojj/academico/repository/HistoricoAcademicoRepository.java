package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.HistoricoAcademicoDAO;
import com.ojj.academico.model.HistoricoAcademico;

public class HistoricoAcademicoRepository {

    private final HistoricoAcademicoDAO historicoAcademicoDAO = new HistoricoAcademicoDAO();

    public HistoricoAcademico findById(int id) throws SQLException {
        return historicoAcademicoDAO.buscarPorId(id);
    }

    public List<HistoricoAcademico> findAll() throws SQLException {
        return historicoAcademicoDAO.listarTodos();
    }

    public boolean save(HistoricoAcademico historicoAcademico) throws SQLException {
        if (historicoAcademico.getIdHistorico() == 0) {
            return historicoAcademicoDAO.inserir(historicoAcademico);
        }
        return historicoAcademicoDAO.atualizar(historicoAcademico);
    }

    public boolean delete(int id) throws SQLException {
        return historicoAcademicoDAO.excluir(id);
    }
}
