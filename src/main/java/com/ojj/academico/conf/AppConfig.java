package com.ojj.academico.conf;

/**
 * Constantes de configuração geral da aplicação OJJ Académico.
 * <p>
 * Define os nomes dos atributos de sessão, os perfis de utilizador,
 * as páginas do sistema e os tipos de funcionário disponíveis.
 */
public final class AppConfig {
    public static final String SESSION_USER_ATTRIBUTE = "usuario";
    public static final String ROLE_ESTUDANTE = "Estudante";
    public static final String ROLE_FUNCIONARIO = "Funcionario";
    public static final String ROLE_ADMINISTRADOR = "Administrador";
    
    public static final String LOGIN_PAGE = "view/auth/login.jsp";
    public static final String REGISTER_PAGE = "view/auth/register.jsp";
    public static final String STUDENT_DASHBOARD = "view/estudante/dashboard_estudante.jsp";
    public static final String STAFF_DASHBOARD = "view/funcionario/dashboard_funcionario.jsp";
    
    // Tipos de funcionário
    public static final String TIPO_PROFESSOR = "professor";
    public static final String TIPO_SECRETARIO = "secretario";
    public static final String TIPO_TESOUREIRO = "tesoureiro";
    public static final String TIPO_COORDENADOR_CURSO = "coordenador_curso";
    public static final String TIPO_COORDENADOR_DEPARTAMENTO = "coordenador_departamento";
    public static final String TIPO_RH = "rh";

    private AppConfig() {
        // utilitário
    }
}
