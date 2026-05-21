package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.PagamentoDAO;
import com.ojj.academico.model.Pagamento;

public class PagamentoRepository {

    private final PagamentoDAO pagamentoDAO = new PagamentoDAO();

    public Pagamento findById(int id) throws SQLException {
        return pagamentoDAO.buscarPorId(id);
    }

    public List<Pagamento> findAll() throws SQLException {
        return pagamentoDAO.listarTodos();
    }

    public boolean save(Pagamento pagamento) throws SQLException {
        if (pagamento.getIdPagamento() == 0) {
            return pagamentoDAO.inserir(pagamento);
        }
        return pagamentoDAO.atualizar(pagamento);
    }

    public boolean delete(int id) throws SQLException {
        return pagamentoDAO.excluir(id);
    }
}
