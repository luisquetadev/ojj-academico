package com.ojj.academico.utils;

import org.mindrot.jbcrypt.BCrypt;

import java.security.SecureRandom;

/**
 * Utilitário para operações de segurança com passwords.
 * <p>
 * Utiliza BCrypt para hashing e verificação de passwords,
 * e fornece um gerador de senhas temporárias aleatórias.
 */
public final class PasswordUtils {

    private static final SecureRandom RANDOM = new SecureRandom();

    private PasswordUtils() {
    }

    /**
     * Gera o hash BCrypt de uma password em texto plano.
     *
     * @param plainPassword a password em texto plano
     * @return o hash BCrypt gerado
     * @throws IllegalArgumentException se a password for vazia
     */
    public static String hashPassword(String plainPassword) {
        if (plainPassword == null || plainPassword.isBlank()) {
            throw new IllegalArgumentException("Senha nao pode ser vazia.");
        }
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt(12));
    }

    /**
     * Verifica se a password em texto plano corresponde ao hash BCrypt.
     *
     * @param plainPassword  a password em texto plano
     * @param hashedPassword o hash BCrypt armazenado
     * @return true se a password corresponder ao hash
     */
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

    /**
     * Gera uma senha temporária aleatória de 8 caracteres alfanuméricos.
     *
     * @return a senha gerada
     */
    public static String gerarSenha() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder senha = new StringBuilder();
        for (int i = 0; i < 8; i++) {
            senha.append(chars.charAt(RANDOM.nextInt(chars.length())));
        }
        return senha.toString();
    }
}
