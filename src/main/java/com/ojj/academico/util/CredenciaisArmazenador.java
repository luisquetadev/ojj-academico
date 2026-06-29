package com.ojj.academico.util;

import java.io.*;
import java.nio.file.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Utilitário para armazenar credenciais geradas no sistema de arquivos.
 * Facilita o acesso às credenciais após o cadastro de um novo funcionário.
 */
public class CredenciaisArmazenador {

    private static final Logger log = LoggerFactory.getLogger(CredenciaisArmazenador.class);
    
    private static final String CREDENCIAIS_DIR = "credenciais_geradas";
    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    
    /**
     * Armazena as credenciais de um novo funcionário em um arquivo de texto.
     * @param email Email do funcionário
     * @param senhaTemporaria Senha temporária gerada
     * @param nomeCompleto Nome do funcionário
     * @param perfil Perfil/Cargo
     * @return Path do arquivo onde foram armazenadas as credenciais
     */
    public static String armazenarCredenciais(String email, String senhaTemporaria, String nomeCompleto, String perfil) {
        try {
            // Criar diretório se não existir
            Path credenciaisPath = Paths.get(CREDENCIAIS_DIR);
            if (!Files.exists(credenciaisPath)) {
                Files.createDirectories(credenciaisPath);
            }
            
            // Gerar nome de arquivo único com timestamp
            String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss"));
            String nomeArquivo = email.replace("@", "_").replace(".", "_") + "_" + timestamp + ".txt";
            Path caminhoArquivo = credenciaisPath.resolve(nomeArquivo);
            
            // Conteúdo do arquivo com as credenciais
            StringBuilder conteudo = new StringBuilder();
            conteudo.append("═══════════════════════════════════════════════════════════\n");
            conteudo.append("        CREDENCIAIS DE ACESSO - OJJ ACADÉMICO\n");
            conteudo.append("═══════════════════════════════════════════════════════════\n\n");
            conteudo.append("Gerado em: ").append(LocalDateTime.now().format(formatter)).append("\n");
            conteudo.append("───────────────────────────────────────────────────────────\n\n");
            conteudo.append("DADOS DO FUNCIONÁRIO\n");
            conteudo.append("Nome: ").append(nomeCompleto).append("\n");
            conteudo.append("Perfil: ").append(perfil).append("\n\n");
            conteudo.append("CREDENCIAIS DE LOGIN\n");
            conteudo.append("Email/Utilizador: ").append(email).append("\n");
            conteudo.append("Senha Temporária: ").append(senhaTemporaria).append("\n\n");
            conteudo.append("───────────────────────────────────────────────────────────\n");
            conteudo.append("IMPORTANTE:\n");
            conteudo.append("• Guarde estas credenciais num local seguro.\n");
            conteudo.append("• A senha deve ser alterada no primeiro acesso.\n");
            conteudo.append("• Não partilhe esta senha com terceiros.\n");
            conteudo.append("═══════════════════════════════════════════════════════════\n");
            
            // Escrever o arquivo
            Files.write(caminhoArquivo, conteudo.toString().getBytes());
            
            return caminhoArquivo.toString();
        } catch (IOException e) {
            log.error("Erro ao armazenar credenciais para {}", email, e);
            return null;
        }
    }
    
    /**
     * Obtém o conteúdo do arquivo de credenciais para exibição.
     * @param caminhoArquivo Caminho do arquivo
     * @return Conteúdo do arquivo
     */
    public static String obterCredenciais(String caminhoArquivo) {
        try {
            Path path = Paths.get(caminhoArquivo);
            if (Files.exists(path)) {
                return new String(Files.readAllBytes(path));
            }
        } catch (IOException e) {
            log.error("Erro ao ler credenciais de {}", caminhoArquivo, e);
        }
        return null;
    }
}
