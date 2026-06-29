package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.MatriculaDAO;
import com.ojj.academico.model.Matricula;

public class MatriculaRepository {

    private final MatriculaDAO matriculaDAO = new MatriculaDAO();

    public Matricula findById(int id) throws SQLException {
        return matriculaDAO.buscarPorId(id);
    }

    public List<Matricula> findByIdTurma(int idTurma) throws SQLException {
        return matriculaDAO.buscarPorIdTurma(idTurma);
    }

    public List<Matricula> findAll() throws SQLException {
        return matriculaDAO.listarTodos();
    }

    public List<Matricula> findByEstudante(int idEstudante) throws SQLException {
        return matriculaDAO.buscarPorIdEstudante(idEstudante);
    }

    public boolean save(Matricula matricula) throws SQLException {
        if (matricula.getIdMatricula() == 0) {
            return matriculaDAO.inserir(matricula);
        }
        return matriculaDAO.atualizar(matricula);
    }

    public boolean delete(int id) throws SQLException {
        return matriculaDAO.excluir(id);
    }
}
