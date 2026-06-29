package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ojj.academico.dao.NotaDAO;
import com.ojj.academico.model.Nota;

public class NotaRepository {

    private final NotaDAO notaDAO = new NotaDAO();

    public Nota findById(int id) throws SQLException {
        return notaDAO.buscarPorId(id);
    }

    public List<Nota> findAll() throws SQLException {
        return notaDAO.listarTodos();
    }

    public boolean save(Nota nota) throws SQLException {
        if (nota.getIdNota() == 0) {
            return notaDAO.inserir(nota);
        }
        return notaDAO.atualizar(nota);
    }

    public List<Nota> findByAvaliacao(int idAvaliacao) throws SQLException {
        return notaDAO.listarPorAvaliacao(idAvaliacao);
    }

    public Nota findByAvaliacaoEEstudante(int idAvaliacao, int idEstudante) throws SQLException {
        return notaDAO.buscarPorAvaliacaoEEstudante(idAvaliacao, idEstudante);
    }

    public List<Nota> findByEstudante(int idEstudante) throws SQLException {
        return notaDAO.listarPorEstudante(idEstudante);
    }

    public List<Map<String, Object>> findByEstudanteComAvaliacao(int idEstudante) throws SQLException {
        return notaDAO.listarPorEstudanteComAvaliacao(idEstudante);
    }

    public boolean delete(int id) throws SQLException {
        return notaDAO.excluir(id);
    }
}
