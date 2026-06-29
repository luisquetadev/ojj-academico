package com.ojj.academico.util;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Pattern;

public class OperacaoLogFormatter {

    private static final Map<Pattern, String> PATH_PATTERNS = new LinkedHashMap<>();
    private static final Map<String, String> KNOWN_CONSTANTS = new LinkedHashMap<>();

    static {
        KNOWN_CONSTANTS.put("MATRICULA_ESTUDANTE", "Matrícula de Estudante");
        KNOWN_CONSTANTS.put("PROPINA_PAGAMENTO", "Pagamento de Propina");
        KNOWN_CONSTANTS.put("PROPINA_EMISSAO", "Emissão de Propina");
        KNOWN_CONSTANTS.put("CARTAO_EMISSAO", "Emissão de Cartão de Estudante");
        KNOWN_CONSTANTS.put("DECLARACAO_EMISSAO", "Emissão de Declaração");
        KNOWN_CONSTANTS.put("NOTA_LANCAMENTO", "Lançamento de Nota");
        KNOWN_CONSTANTS.put("NOTA_EDICAO", "Edição de Nota");
        KNOWN_CONSTANTS.put("FREQUENCIA_REGISTO", "Registo de Frequência");
        KNOWN_CONSTANTS.put("ESTUDANTE_ACTUALIZACAO", "Actualização de Dados do Estudante");

        PATH_PATTERNS.put(Pattern.compile("^GET /?(\\?.*)?$"), "acessou o sistema");
        PATH_PATTERNS.put(Pattern.compile("^GET /login.*$"), "acessou a página de login");
        PATH_PATTERNS.put(Pattern.compile("^POST /login.*$"), "autenticou-se no sistema");
        PATH_PATTERNS.put(Pattern.compile("^GET /logout.*$"), "saiu do sistema");

        PATH_PATTERNS.put(Pattern.compile("^GET /admin/dashboard.*$"), "visualizou o painel administrativo");
        PATH_PATTERNS.put(Pattern.compile("^GET /sistema/logs.*$"), "consultou o histórico de operações");

        PATH_PATTERNS.put(Pattern.compile("^GET /secretario/dashboard.*$"), "visualizou o painel da secretaria");
        PATH_PATTERNS.put(Pattern.compile("^GET /secretario/matricular.*$"), "acessou o formulário de matrícula");
        PATH_PATTERNS.put(Pattern.compile("^POST /secretario/matricular.*$"), "realizou uma matrícula de estudante");
        PATH_PATTERNS.put(Pattern.compile("^GET /secretario/cartao-estudante.*$"), "acessou a emissão de cartão de estudante");
        PATH_PATTERNS.put(Pattern.compile("^POST /secretario/cartao-estudante.*$"), "emitiu um cartão de estudante");
        PATH_PATTERNS.put(Pattern.compile("^GET /secretario/declaracao.*$"), "acessou a emissão de declaração");
        PATH_PATTERNS.put(Pattern.compile("^POST /secretario/declaracao.*$"), "emitiu uma declaração");
        PATH_PATTERNS.put(Pattern.compile("^GET /secretario/historico.*$"), "consultou o histórico de atendimento");
        PATH_PATTERNS.put(Pattern.compile("^GET /secretario/estudante.*$"), "consultou dados de estudante");
        PATH_PATTERNS.put(Pattern.compile("^POST /secretario/estudante.*$"), "registou dados de estudante");

        PATH_PATTERNS.put(Pattern.compile("^GET /estudante/dashboard.*$"), "visualizou o painel do estudante");
        PATH_PATTERNS.put(Pattern.compile("^GET /estudante/notas.*$"), "consultou as suas notas");
        PATH_PATTERNS.put(Pattern.compile("^GET /estudante/horario.*$"), "consultou o seu horário");
        PATH_PATTERNS.put(Pattern.compile("^GET /estudante/frequencia.*$"), "consultou a sua frequência");
        PATH_PATTERNS.put(Pattern.compile("^GET /estudante/propina.*$"), "consultou as suas propinas");

        PATH_PATTERNS.put(Pattern.compile("^GET /professor/dashboard.*$"), "visualizou o painel do professor");
        PATH_PATTERNS.put(Pattern.compile("^GET /professor/turmas.*$"), "consultou as suas turmas");
        PATH_PATTERNS.put(Pattern.compile("^GET /professor/avaliacoes.*$"), "consultou as avaliações");
        PATH_PATTERNS.put(Pattern.compile("^POST /professor/avaliacoes.*$"), "criou uma avaliação");
        PATH_PATTERNS.put(Pattern.compile("^GET /professor/notas.*$"), "acessou o lançamento de notas");
        PATH_PATTERNS.put(Pattern.compile("^POST /professor/notas.*$"), "lançou notas de estudantes");
        PATH_PATTERNS.put(Pattern.compile("^GET /professor/pautas.*$"), "consultou as pautas");
        PATH_PATTERNS.put(Pattern.compile("^GET /professor/frequencias.*$"), "consultou as frequências");
        PATH_PATTERNS.put(Pattern.compile("^POST /professor/frequencias.*$"), "registou frequências");

        PATH_PATTERNS.put(Pattern.compile("^GET /financeiro/dashboard.*$"), "visualizou o painel financeiro");
        PATH_PATTERNS.put(Pattern.compile("^GET /financeiro/propinas.*$"), "consultou as propinas");
        PATH_PATTERNS.put(Pattern.compile("^POST /financeiro/propinas.*$"), "registou um pagamento de propina");
    }

    public static String formatarOperacao(String tipoOperacao) {
        if (tipoOperacao == null || tipoOperacao.trim().isEmpty()) {
            return "-";
        }

        String trimmed = tipoOperacao.trim();

        if (KNOWN_CONSTANTS.containsKey(trimmed)) {
            return KNOWN_CONSTANTS.get(trimmed);
        }

        int spaceIdx = trimmed.indexOf(' ');
        if (spaceIdx > 0) {
            String method = trimmed.substring(0, spaceIdx).toUpperCase();
            String path = trimmed.substring(spaceIdx + 1);

            if (isHttpMethod(method)) {
                for (Map.Entry<Pattern, String> entry : PATH_PATTERNS.entrySet()) {
                    if (entry.getKey().matcher(trimmed).matches()) {
                        String action = method.equals("GET") ? "" :
                                method.equals("POST") ? "envio" :
                                method.equals("PUT") ? "atualizacao" :
                                method.equals("DELETE") ? "remocao" : "";
                        if (action.isEmpty()) {
                            return entry.getValue();
                        }
                        return action + " - " + entry.getValue();
                    }
                }
                return method + " " + extrairNomeRecurso(path);
            }
        }

        return trimmed.replace("_", " ").toLowerCase();
    }

    private static boolean isHttpMethod(String method) {
        return "GET".equals(method) || "POST".equals(method) ||
                "PUT".equals(method) || "DELETE".equals(method) ||
                "PATCH".equals(method);
    }

    private static String extrairNomeRecurso(String path) {
        String clean = path.replaceAll("[?].*$", "");
        String[] parts = clean.split("/");
        if (parts.length == 0 || (parts.length == 1 && parts[0].isEmpty())) {
            return "página inicial";
        }
        StringBuilder friendly = new StringBuilder();
        for (String part : parts) {
            if (!part.isEmpty()) {
                friendly.append(" ").append(part.replace("-", " ").replace("_", " "));
            }
        }
        String result = friendly.toString().trim().toLowerCase();
        String[] words = result.split(" ");
        StringBuilder capitalized = new StringBuilder();
        for (String word : words) {
            if (!word.isEmpty()) {
                if (capitalized.length() > 0) capitalized.append(" ");
                capitalized.append(Character.toUpperCase(word.charAt(0))).append(word.substring(1));
            }
        }
        return capitalized.toString();
    }

    public static String formatarDescricao(String descricao) {
        if (descricao == null || descricao.trim().isEmpty()) {
            return "-";
        }
        String d = descricao.trim();
        if (d.startsWith("Acesso ao recurso:")) {
            String path = d.substring("Acesso ao recurso:".length()).trim();
            String friendly = formatarOperacao("GET " + path);
            return friendly.startsWith("GET ") ? friendly.substring(4) : friendly;
        }
        return d;
    }
}
