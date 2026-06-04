package com.ojj.academico.utils;

import org.mindrot.jbcrypt.BCrypt;

/**
 * Utilitário para manipulação e validação de senhas.
 * 
 * ATENÇÃO: Atualmente configurado para texto plano por solicitação do usuário.
 * Em produção, deve-se reativar o uso de BCrypt.
 */
public final class PasswordUtils {

    private PasswordUtils() {
        // Privado para evitar instanciação (classe utilitária)
    }

    /**
     * Processa a senha para armazenamento.
     * 
     * @param plainPassword Senha digitada pelo usuário
     * @return No momento retorna a própria senha (texto plano).
     */
    public static String hashPassword(String plainPassword) {
        if (plainPassword == null || plainPassword.isBlank()) {
            throw new IllegalArgumentException("Senha não pode ser vazia.");
        }
        // TODO: Reativar BCrypt.hashpw(plainPassword, BCrypt.gensalt()) no futuro
        return plainPassword; 
    }

    /**
     * Valida se a senha digitada corresponde ao valor armazenado no banco.
     * 
     * @param plainPassword Senha vinda do formulário
     * @param hashedPassword Valor armazenado na tabela 'utilizador'
     * @return true se forem iguais
     */
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        if (plainPassword == null || hashedPassword == null) {
            return false;
        }
        // Comparação direta de strings (Temporário)
        return plainPassword.equals(hashedPassword);
    }

    /**
     * Gera uma senha aleatória segura de 8 caracteres.
     * Útil para criação de novas contas ou reset de senha.
     * 
     * @return String aleatória
     */
    public static String gerarSenha() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder senha = new StringBuilder();
        java.util.Random random = new java.util.Random();
        for (int i = 0; i < 8; i++) {
            senha.append(chars.charAt(random.nextInt(chars.length())));
        }
        return senha.toString();
    }
}
