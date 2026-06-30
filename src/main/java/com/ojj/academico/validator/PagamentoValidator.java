package com.ojj.academico.validator;

import com.ojj.academico.exception.ValidationException;
import com.ojj.academico.model.Pagamento;

/**
 * Validador para a entidade Pagamento.
 * <p>
 * Verifica se os dados do pagamento (estudante, valor devido)
 * são válidos antes de processar a transação.
 */
public final class PagamentoValidator {

    private PagamentoValidator() {}

    /**
     * Valida os dados de um pagamento.
     *
     * @param p o pagamento a validar
     * @throws ValidationException se o pagamento for nulo ou com valores inválidos
     */
    public static void validate(Pagamento p) throws ValidationException {
        if (p == null) throw new ValidationException("Pagamento inválido.");
        if (p.getIdEstudante() <= 0) throw new ValidationException("Estudante inválido no pagamento.");
        if (p.getValorDevido() == null || p.getValorDevido().doubleValue() < 0)
            throw new ValidationException("Valor do pagamento inválido.");
    }
}
