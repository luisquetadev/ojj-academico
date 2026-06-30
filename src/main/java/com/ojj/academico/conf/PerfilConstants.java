package com.ojj.academico.conf;

/**
 * Constantes que definem os identificadores numéricos dos perfis de utilizador.
 * <p>
 * Cada perfil (ADMIN, SECRETARIA, DOCENTE, etc.) possui um ID fixo
 * utilizado nas consultas ao banco de dados e nas regras de autorização.
 */
public final class PerfilConstants {
    public static final int ADMIN = 1;
    public static final int SECRETARIA = 2;
    public static final int TESOURARIA = 3;
    public static final int DOCENTE = 4;
    public static final int COORDENADOR = 5;
    public static final int DIRECTOR = 6;
    public static final int ESTUDANTE = 7;
    public static final int COORDENADOR_CURSO = 8;

    private PerfilConstants() {}
}
