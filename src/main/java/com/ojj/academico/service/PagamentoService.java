package com.ojj.academico.service;

import com.ojj.academico.model.Pagamento;
import com.ojj.academico.repository.PagamentoRepository;

import java.sql.SQLException;
import java.util.List;

public class PagamentoService {

    private final PagamentoRepository pagamentoRepository;

    public PagamentoService() {
        this(new PagamentoRepository());
    }

    public PagamentoService(PagamentoRepository pagamentoRepository) {
        this.pagamentoRepository = pagamentoRepository;
    }

    public Pagamento findById(int id) throws SQLException {
        return pagamentoRepository.findById(id);
    }

    public List<Pagamento> findAll() throws SQLException {
        return pagamentoRepository.findAll();
    }

    public boolean save(Pagamento pagamento) throws SQLException {
        return pagamentoRepository.save(pagamento);
    }

    public boolean delete(int id) throws SQLException {
        return pagamentoRepository.delete(id);
    }
}
