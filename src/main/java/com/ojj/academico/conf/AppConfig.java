package com.ojj.academico.conf;

public final class AppConfig {
    public static final String SESSION_USER_ATTRIBUTE = "usuario";
    public static final String ROLE_ESTUDANTE = "Estudante";
    public static final String ROLE_FUNCIONARIO = "Funcionario";
    public static final String ROLE_ADMINISTRADOR = "Administrador";
    public static final String LOGIN_PAGE = "view/auth/login.jsp";
    public static final String REGISTER_PAGE = "view/auth/register.jsp";
    public static final String STUDENT_DASHBOARD = "view/estudante/dashboard_estudante.jsp";
    public static final String STAFF_DASHBOARD = "view/funcionario/dashboard_funcionario.jsp";

    private AppConfig() {
        // utilitário
    }
}
