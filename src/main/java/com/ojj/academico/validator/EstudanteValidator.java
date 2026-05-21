package com.ojj.academico.validator;

import com.ojj.academico.exception.ValidationException;
import com.ojj.academico.model.Estudante;

public final class EstudanteValidator {

    private EstudanteValidator() {}

    public static void validate(Estudante e) throws ValidationException {
        if (e == null) throw new ValidationException("Estudante inválido.");
        if (e.getNomeCompleto() == null || e.getNomeCompleto().isBlank())
            throw new ValidationException("Nome do estudante é obrigatório.");
        if (e.getNumeroEstudante() == null || e.getNumeroEstudante().isBlank())
            throw new ValidationException("Número do estudante é obrigatório.");
    }
}
