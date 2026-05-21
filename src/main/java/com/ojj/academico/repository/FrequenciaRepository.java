package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.FrequenciaDAO;
import com.ojj.academico.model.Frequencia;

public class FrequenciaRepository {

    private final FrequenciaDAO frequenciaDAO = new FrequenciaDAO();

    public Frequencia findById(int id) throws SQLException {
        return frequenciaDAO.buscarPorId(id);
    }

    public List<Frequencia> findAll() throws SQLException {
        return frequenciaDAO.listarTodos();
    }

    public boolean save(Frequencia frequencia) throws SQLException {
        if (frequencia.getIdFrequencia() == 0) {
            return frequenciaDAO.inserir(frequencia);
        }
        return frequenciaDAO.atualizar(frequencia);
    }

    public boolean delete(int id) throws SQLException {
        return frequenciaDAO.excluir(id);
    }
}
