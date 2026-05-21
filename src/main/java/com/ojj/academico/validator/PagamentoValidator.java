package com.ojj.academico.validator;

import com.ojj.academico.exception.ValidationException;
import com.ojj.academico.model.Pagamento;

public final class PagamentoValidator {

    private PagamentoValidator() {}

    public static void validate(Pagamento p) throws ValidationException {
        if (p == null) throw new ValidationException("Pagamento inválido.");
        if (p.getIdEstudante() <= 0) throw new ValidationException("Estudante inválido no pagamento.");
        if (p.getValorDevido() == null || p.getValorDevido().doubleValue() < 0)
            throw new ValidationException("Valor do pagamento inválido.");
    }
}
