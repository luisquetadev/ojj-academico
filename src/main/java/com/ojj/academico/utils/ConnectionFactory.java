package com.ojj.academico.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

    private static final Logger log = LoggerFactory.getLogger(ConnectionFactory.class);
    
    // Configurações de acesso ao banco de dados (usando variáveis de ambiente com fallbacks)
    private static final String HOST = getEnv("DB_HOST", "localhost");
    private static final String PORT = getEnv("DB_PORT", "3306");
    private static final String DB_NAME = getEnv("DB_NAME", "ojj_academico");
    private static final String USER = getEnv("DB_USER", "root");
    private static final String PASSWORD = getEnv("DB_PASS", "");

    private static final String URL = String.format("jdbc:mysql://%s:%s/%s?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", HOST, PORT, DB_NAME);

    /**
     * Auxiliar para ler variáveis de ambiente com valor padrão.
     */
    private static String getEnv(String name, String defaultValue) {
        String value = System.getenv(name);
        return value != null ? value : defaultValue;
    }

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
                log.error("Erro ao fechar conexao", e);
            }
        }
    }
}