package com.ojj.academico.exception;

import java.sql.SQLException;


/**
 * Exceção personalizada para erros de validação no sistema académico.
 * <p>
 * Lançada quando os dados fornecidos não cumprem as regras de validação
 * definidas para uma determinada entidade (utilizador, curso, matrícula, etc.).
 */
public class ValidationException extends Exception {

  

    public ValidationException(String message) {
        super(message);
    }

}
