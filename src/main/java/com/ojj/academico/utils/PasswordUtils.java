package com.ojj.academico.utils;

import org.mindrot.jbcrypt.BCrypt;

import java.security.SecureRandom;

public final class PasswordUtils {

    private static final SecureRandom RANDOM = new SecureRandom();

    private PasswordUtils() {
    }

    public static String hashPassword(String plainPassword) {
        if (plainPassword == null || plainPassword.isBlank()) {
            throw new IllegalArgumentException("Senha nao pode ser vazia.");
        }
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt(12));
    }

    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        if (plainPassword == null || hashedPassword == null) {
            return false;
        }

        try {
            return BCrypt.checkpw(plainPassword, hashedPassword);
        } catch (IllegalArgumentException e) {
            return false;
        }
    }

    public static String gerarSenha() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder senha = new StringBuilder();
        for (int i = 0; i < 8; i++) {
            senha.append(chars.charAt(RANDOM.nextInt(chars.length())));
        }
        return senha.toString();
    }
}
