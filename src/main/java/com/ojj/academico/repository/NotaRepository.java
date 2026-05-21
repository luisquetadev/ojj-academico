package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

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

    public boolean delete(int id) throws SQLException {
        return notaDAO.excluir(id);
    }
}
