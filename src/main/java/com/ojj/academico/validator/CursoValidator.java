package com.ojj.academico.validator;

import com.ojj.academico.exception.ValidationException;
import com.ojj.academico.model.Curso;

/**
 * Validador para a entidade Curso.
 * <p>
 * Verifica se os campos obrigatórios do curso (nome, departamento)
 * estão preenchidos corretamente antes de persistir os dados.
 */
public final class CursoValidator {

    private CursoValidator() {
    }

    /**
     * Valida os dados de um curso.
     *
     * @param c o curso a validar
     * @throws ValidationException se o curso for nulo, sem nome ou com departamento inválido
     */
    public static void validate(Curso c) throws ValidationException {
        if (c == null)
            throw new ValidationException("Curso inválido.");
        if (c.getNomeCurso() == null || c.getNomeCurso().isBlank())
            throw new ValidationException("Nome do curso é obrigatório.");
        if (c.getIdDepartamento() <= 0)
            throw new ValidationException("Departamento inválido.");
    }
}
