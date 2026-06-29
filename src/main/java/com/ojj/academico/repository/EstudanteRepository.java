package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.EstudanteDAO;
import com.ojj.academico.model.Estudante;

public class EstudanteRepository {

    private final EstudanteDAO estudanteDAO = new EstudanteDAO();

    public Estudante findById(int id) throws SQLException {
        return estudanteDAO.buscarPorId(id);
    }

    public Estudante findByIdUtilizador(int idUtilizador) throws SQLException {
        return estudanteDAO.buscarPorIdUtilizador(idUtilizador);
    }

    public List<Estudante> findAll() throws SQLException {
        return estudanteDAO.listarTodos();
    }

    public boolean save(Estudante estudante) throws SQLException {
        if (estudante.getIdEstudante() == 0) {
            return estudanteDAO.inserir(estudante);
        }
        return estudanteDAO.atualizar(estudante);
    }

    public boolean delete(int id) throws SQLException {
        return estudanteDAO.excluir(id);
    }
}
