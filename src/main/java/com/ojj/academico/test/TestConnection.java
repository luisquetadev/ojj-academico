package com.ojj.academico.test;

import com.ojj.academico.util.ConnectionFactory;
import java.sql.Connection;
import java.sql.SQLException;

public class TestConnection {
    public static void main(String[] args) {
        try (Connection conn = ConnectionFactory.getConnection()) {
            System.out.println("✅ Conexão com MySQL estabelecida com sucesso!");
            System.out.println("Banco: " + conn.getCatalog());
        } catch (SQLException e) {
            System.err.println("❌ Erro ao conectar: " + e.getMessage());
            e.printStackTrace();
        }
    }
}