package com.ojj.academico.init;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebListener
/**
 * Inicializador da aplicação executado no arranque do servidor.
 * <p>
 * Verifica se o banco de dados está vazio e, em caso afirmativo,
 * executa automaticamente o seed de dados iniciais.
 */
public class AppInitializer implements ServletContextListener {

    private static final Logger log = LoggerFactory.getLogger(AppInitializer.class);

    /**
     * Invocado quando o contexto da aplicação é iniciado.
     * Executa o seed automático se o banco de dados estiver vazio.
     */
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        SeedService seedService = new SeedService();
        if (seedService.isDatabaseEmpty()) {
            log.info("Banco de dados vazio. A executar seed automatico...");
            seedService.seedAll();
            log.info("Seed automatico concluido com sucesso!");
            log.info("Ficheiro de credenciais gerado em: credenciais_geradas/");
        } else {
            log.info("Banco de dados ja contem dados. Seed ignorado.");
        }
    }
}
