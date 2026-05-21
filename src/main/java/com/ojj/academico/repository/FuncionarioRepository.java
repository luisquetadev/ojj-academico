package com.ojj.academico.repository;

import java.sql.SQLException;
import java.util.List;

import com.ojj.academico.dao.FuncionarioDAO;
import com.ojj.academico.model.Funcionario;

public class FuncionarioRepository {

    private final FuncionarioDAO funcionarioDAO = new FuncionarioDAO();

    public Funcionario findById(int id) throws SQLException {
        return funcionarioDAO.buscarPorId(id);
    }

    public List<Funcionario> findAll() throws SQLException {
        return funcionarioDAO.listarTodos();
    }

    public boolean save(Funcionario funcionario) throws SQLException {
        if (funcionario.getIdFuncionario() == 0) {
            return funcionarioDAO.inserir(funcionario);
        }
        return funcionarioDAO.atualizar(funcionario);
    }

    public boolean delete(int id) throws SQLException {
        return funcionarioDAO.excluir(id);
    }
}
