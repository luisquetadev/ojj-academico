package com.ojj.academico.validator;

import com.ojj.academico.exception.ValidationException;
import com.ojj.academico.model.Matricula;

public final class MatriculaValidator {

    private MatriculaValidator() {}

    public static void validate(Matricula m) throws ValidationException {
        if (m == null) throw new ValidationException("Matrícula inválida.");
        if (m.getIdEstudante() <= 0) throw new ValidationException("Estudante inválido na matrícula.");
        if (m.getIdCurso() <= 0) throw new ValidationException("Curso inválido na matrícula.");
    }
}
