package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.CursoDAO;
import com.ojj.academico.model.Curso;

public class CursoRepository {

    private final CursoDAO cursoDAO = new CursoDAO();

    public Curso findById(int id) throws SQLException {
        return cursoDAO.buscarPorId(id);
    }

    public List<Curso> findAll() throws SQLException {
        return cursoDAO.listarTodos();
    }

    public boolean save(Curso curso) throws SQLException {
        if (curso.getIdCurso() == 0) {
            return cursoDAO.inserir(curso);
        }
        return cursoDAO.atualizar(curso);
    }

    public boolean delete(int id) throws SQLException {
        return cursoDAO.excluir(id);
    }
}
