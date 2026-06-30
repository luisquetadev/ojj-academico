package com.ojj.academico.validator;

import com.ojj.academico.exception.ValidationException;
import com.ojj.academico.model.Estudante;

/**
 * Validador para a entidade Estudante.
 * <p>
 * Verifica se os campos obrigatórios do estudante (nome, número)
 * estão preenchidos antes de persistir os dados.
 */
public final class EstudanteValidator {

    private EstudanteValidator() {}

    /**
     * Valida os dados de um estudante.
     *
     * @param e o estudante a validar
     * @throws ValidationException se o estudante for nulo, sem nome ou sem número
     */
    public static void validate(Estudante e) throws ValidationException {
        if (e == null) throw new ValidationException("Estudante inválido.");
        if (e.getNomeCompleto() == null || e.getNomeCompleto().isBlank())
            throw new ValidationException("Nome do estudante é obrigatório.");
        if (e.getNumeroEstudante() == null || e.getNumeroEstudante().isBlank())
            throw new ValidationException("Número do estudante é obrigatório.");
    }
}
