package com.ojj.academico.init;

import com.ojj.academico.model.Utilizador;
import com.ojj.academico.repository.UtilizadorRepository;
import com.ojj.academico.service.UtilizadorService;
import com.ojj.academico.exception.ValidationException;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class AppInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        UtilizadorRepository repository = new UtilizadorRepository();
        UtilizadorService usuarioService = new UtilizadorService(repository);

        seedUsuario(repository, usuarioService, "admin", "Admin@123", 1, 0);
        seedUsuario(repository, usuarioService, "funcionario", "Funcionario@123", 2, 0);
        seedUsuario(repository, usuarioService, "estudante", "Estudante@123", 3, 0);
    }

    private void seedUsuario(UtilizadorRepository repository, UtilizadorService service,
                             String email, String password, int IdPerfil, int idRef) {
        try {
            if (repository.findByUsername(email) == null) {
                Utilizador utilizador = new Utilizador();
                utilizador.setEmail(email);
                utilizador.setPasswordHash(password);
                utilizador.setIdPerfil(IdPerfil);
                
                service.save(utilizador);
            }
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        }
    }
}
