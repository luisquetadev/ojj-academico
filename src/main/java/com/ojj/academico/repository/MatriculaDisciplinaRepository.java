package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.MatriculaDisciplinaDAO;
import com.ojj.academico.model.MatriculaDisciplina;

public class MatriculaDisciplinaRepository {

    private final MatriculaDisciplinaDAO matriculaDisciplinaDAO = new MatriculaDisciplinaDAO();

    public MatriculaDisciplina findById(int idMatricula, int idDisciplina) throws SQLException {
        return matriculaDisciplinaDAO.buscarPorId(idMatricula, idDisciplina);
    }

    public List<MatriculaDisciplina> findAll() throws SQLException {
        return matriculaDisciplinaDAO.listarTodos();
    }

    public boolean save(MatriculaDisciplina matriculaDisciplina) throws SQLException {
        return matriculaDisciplinaDAO.inserir(matriculaDisciplina);
    }

    public boolean delete(int idMatricula, int idDisciplina) throws SQLException {
        return matriculaDisciplinaDAO.excluir(idMatricula, idDisciplina);
    }
}
