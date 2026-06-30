package com.ojj.academico.validator;

import com.ojj.academico.exception.ValidationException;
import com.ojj.academico.model.Utilizador;

/**
 * Validador para a entidade Utilizador.
 * <p>
 * Verifica se os campos obrigatórios (email, password, perfil) são válidos
 * e aplica regras de formato para email e segurança para password.
 */
public class UtilizadorValidador {

    public UtilizadorValidador() {
    }

    /**
     * Valida os dados de um utilizador.
     *
     * @param u o utilizador a validar
     * @throws ValidationException se os dados forem inválidos
     */
    public static void validate(Utilizador u) throws ValidationException {
        if (u == null)
            throw new ValidationException("Utilizador inválido.");
        if (u.getEmail() == null || u.getEmail().isBlank())
            throw new ValidationException("Email é obrigatório.");
        if (!isValidEmail(u.getEmail()))
            throw new ValidationException("Email inválido.");
        if (u.getPasswordHash() == null || u.getPasswordHash().isBlank())
            throw new ValidationException("Password é obrigatória.");
        if (u.getIdPerfil() <= 0)
            throw new ValidationException("Perfil inválido.");
    }

    /**
     * Verifica se o email tem um formato válido.
     *
     * @param email o email a validar
     * @return true se o formato do email for válido
     */
    public static boolean isValidEmail(String email) {
        return email != null && email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");
}

    /**
     * Verifica se a password cumpre os requisitos de segurança:
     * pelo menos 8 caracteres, uma maiúscula, uma minúscula, um dígito e um caractere especial.
     *
     * @param password a password a validar
     * @return true se a password for segura
     */
    public static boolean isValidPassword(String password) {
        if (password == null || password.length() < 8)
            return false;
        boolean hasUpper = false, hasLower = false, hasDigit = false, hasSpecial = false;
        for (char c : password.toCharArray()) {
            if (Character.isUpperCase(c))
                hasUpper = true;
            else if (Character.isLowerCase(c))
                hasLower = true;
            else if (Character.isDigit(c))
                hasDigit = true;
            else if ("!@#$%^&*()_+-=[]{}|;':\",.<>/?".indexOf(c) >= 0)
                hasSpecial = true;
        }
        return hasUpper && hasLower && hasDigit && hasSpecial;
    }

}
