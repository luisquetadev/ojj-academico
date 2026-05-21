package com.ojj.academico.validator;

import com.ojj.academico.exception.ValidationException;
import com.ojj.academico.model.Curso;

public final class CursoValidator {

    private CursoValidator() {
    }

    public static void validate(Curso c) throws ValidationException {
        if (c == null)
            throw new ValidationException("Curso inválido.");
        if (c.getNomeCurso() == null || c.getNomeCurso().isBlank())
            throw new ValidationException("Nome do curso é obrigatório.");
        if (c.getIdDepartamento() <= 0)
            throw new ValidationException("Departamento inválido.");
    }
}
