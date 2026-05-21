package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.UtilizadorDAO;
import com.ojj.academico.model.Utilizador;

public class UtilizadorRepository {

    private final UtilizadorDAO utilizadorDAO = new UtilizadorDAO();

    public Utilizador findById(int id) throws SQLException {
        return utilizadorDAO.buscarPorId(id);
    }

        public Utilizador findByUsername(String username) throws SQLException {
            return utilizadorDAO.buscarPorUsername(username);
        }

    public List<Utilizador> findAll() throws SQLException {
        return utilizadorDAO.listarTodos();
    }

    public boolean save(Utilizador utilizador) throws SQLException {
        if (utilizador.getIdUtilizador() == 0) {
            return utilizadorDAO.inserir(utilizador);
        }
        return utilizadorDAO.atualizar(utilizador);
    }

    public boolean delete(int id) throws SQLException {
        return utilizadorDAO.excluir(id);
    }

    public Utilizador findByUsernameAndPassword(String username, String password) throws SQLException {
        return utilizadorDAO.buscarPorUsernameESenha(username, password);
    }
}
