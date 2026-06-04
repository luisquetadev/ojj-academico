package com.ojj.academico.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Fábrica de Conexões JDBC.
 * 
 * Responsável por gerenciar o driver do banco de dados e fornecer conexões 
 * ativas para os DAOs.
 */
public class ConnectionFactory {
    
    // Configurações de acesso ao banco de dados MySQL
    private static final String URL = "jdbc:mysql://localhost:3306/ojj_academico";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    // Bloco estático: executado apenas uma vez quando a classe é carregada na memória
    static {
        try {
            // Registra o Driver JDBC do MySQL explicitamente
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Erro Fatal: Driver JDBC do MySQL não encontrado no classpath.", e);
        }
    }

    /**
     * Cria e retorna uma nova conexão com o banco de dados.
     * 
     * @return Connection ativa
     * @throws SQLException Caso ocorra erro na conexão (banco offline, senha errada, etc)
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    /**
     * Fecha uma conexão aberta de forma segura.
     * 
     * @param conn A conexão a ser fechada
     */
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                // Log do erro ao fechar, mas não interrompe a aplicação
                e.printStackTrace();
            }
        }
    }
}