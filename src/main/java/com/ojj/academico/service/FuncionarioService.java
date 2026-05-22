package com.ojj.academico.service;

import com.ojj.academico.model.Funcionario;
import com.ojj.academico.repository.FuncionarioRepository;

import java.sql.SQLException;
import java.util.List;

public class FuncionarioService {

    private final FuncionarioRepository funcionarioRepository;

    public FuncionarioService() {
        this(new FuncionarioRepository());
    }

    public FuncionarioService(FuncionarioRepository funcionarioRepository) {
        this.funcionarioRepository = funcionarioRepository;
    }

    public Funcionario findById(int id) throws SQLException {
        return funcionarioRepository.findById(id);
    }

    public Funcionario findByIdUtilizador(int idutilizador) throws SQLException{
        return funcionarioRepository.findByIdUtilizador(idutilizador);
    }

    public Funcionario findPerfilFuncionario(int idFuncionario) throws SQLException {
        return funcionarioRepository.findPerfilFuncionario(idFuncionario);
    }

    public List<Funcionario> findAll() throws SQLException {
        return funcionarioRepository.findAll();
    }

    public boolean save(Funcionario funcionario) throws SQLException {
        return funcionarioRepository.save(funcionario);
    }

    public boolean delete(int id) throws SQLException {
        return funcionarioRepository.delete(id);
    }
}
