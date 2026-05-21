package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.AvaliacaoDAO;
import com.ojj.academico.model.Avaliacao;

public class AvaliacaoRepository {

    private final AvaliacaoDAO avaliacaoDAO = new AvaliacaoDAO();

    public Avaliacao findById(int id) throws SQLException {
        return avaliacaoDAO.buscarPorId(id);
    }

    public List<Avaliacao> findAll() throws SQLException {
        return avaliacaoDAO.listarTodos();
    }

    public boolean save(Avaliacao avaliacao) throws SQLException {
        if (avaliacao.getIdAvaliacao() == 0) {
            return avaliacaoDAO.inserir(avaliacao);
        }
        return avaliacaoDAO.atualizar(avaliacao);
    }

    public boolean delete(int id) throws SQLException {
        return avaliacaoDAO.excluir(id);
    }
}
