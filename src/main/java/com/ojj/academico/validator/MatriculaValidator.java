package com.ojj.academico.validator;

import com.ojj.academico.exception.ValidationException;
import com.ojj.academico.model.Matricula;

/**
 * Validador para a entidade Matricula.
 * <p>
 * Verifica se os identificadores do estudante e do curso são válidos
 * antes de registar uma matrícula.
 */
public final class MatriculaValidator {

    private MatriculaValidator() {}

    /**
     * Valida os dados de uma matrícula.
     *
     * @param m a matrícula a validar
     * @throws ValidationException se a matrícula for nula ou com IDs inválidos
     */
    public static void validate(Matricula m) throws ValidationException {
        if (m == null) throw new ValidationException("Matrícula inválida.");
        if (m.getIdEstudante() <= 0) throw new ValidationException("Estudante inválido na matrícula.");
        if (m.getIdCurso() <= 0) throw new ValidationException("Curso inválido na matrícula.");
    }
}
