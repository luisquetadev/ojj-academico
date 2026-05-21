package com.ojj.academico.utils;

import org.mindrot.jbcrypt.BCrypt;

public final class PasswordUtils {

    private PasswordUtils() {
        // utilitário
    }

    public static String hashPassword(String plainPassword) {
        if (plainPassword == null || plainPassword.isBlank()) {
            throw new IllegalArgumentException("Senha não pode ser vazia.");
        }
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
    }

    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        if (plainPassword == null || hashedPassword == null || hashedPassword.isBlank()) {
            return false;
        }
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }

    public static String gerarSenha() {
        // Gera uma senha aleatória de 8 caracteres
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder senha = new StringBuilder();
        java.util.Random random = new java.util.Random();
        for (int i = 0; i < 8; i++) {
            senha.append(chars.charAt(random.nextInt(chars.length())));
        }
        return senha.toString();
    }
}
