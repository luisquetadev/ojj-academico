package com.ojj.academico.repository;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

import com.ojj.academico.dao.OperacaoLogDAO;
import com.ojj.academico.model.OperacaoLog;

public class OperacaoLogRepository {

    private final OperacaoLogDAO operacaoLogDAO = new OperacaoLogDAO();

    public OperacaoLog findById(int id) throws SQLException {
        return operacaoLogDAO.buscarPorId(id);
    }

    public List<OperacaoLog> findAll() throws SQLException {
        return operacaoLogDAO.listarTodos();
    }

    public List<OperacaoLog> findByFilter(Integer idUtilizador, String tipoOperacao, String resultado,
                                          LocalDateTime dataInicio, LocalDateTime dataFim) throws SQLException {
        return operacaoLogDAO.buscarPorFiltro(idUtilizador, tipoOperacao, resultado, dataInicio, dataFim);
    }

    public boolean save(OperacaoLog operacaoLog) throws SQLException {
        if (operacaoLog.getIdLog() == 0) {
            return operacaoLogDAO.inserir(operacaoLog);
        }
        return operacaoLogDAO.atualizar(operacaoLog);
    }

    public boolean delete(int id) throws SQLException {
        return operacaoLogDAO.excluir(id);
    }
}
