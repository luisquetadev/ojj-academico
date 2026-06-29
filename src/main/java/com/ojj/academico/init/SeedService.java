package com.ojj.academico.init;

import com.ojj.academico.utils.ConnectionFactory;
import com.ojj.academico.utils.PasswordUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class SeedService {

    private static final Logger log = LoggerFactory.getLogger(SeedService.class);
    private static final String CREDENCIAIS_DIR = "credenciais_geradas";

    private static class Credencial {
        String email, senha, nome, perfil;
        Credencial(String email, String senha, String nome, String perfil) {
            this.email = email; this.senha = senha; this.nome = nome; this.perfil = perfil;
        }
    }

    private final List<Credencial> credenciais = new ArrayList<>();

    public boolean isDatabaseEmpty() {
        String sql = "SELECT COUNT(*) FROM perfil";
        try (Connection conn = ConnectionFactory.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) return rs.getInt(1) == 0;
        } catch (SQLException e) {
            log.warn("Erro ao verificar se banco esta vazio (pode ser primeira execucao): {}", e.getMessage());
        }
        return true;
    }

    public void seedAll() {
        try (Connection conn = ConnectionFactory.getConnection()) {
            conn.setAutoCommit(false);
            try {
                seedPerfil(conn);
                seedDepartamento(conn);
                seedAnoAcademico(conn);
                seedSala(conn);
                seedCurso(conn);
                seedSemestre(conn);
                seedUtilizador(conn);
                seedTurma(conn);
                seedDisciplina(conn);
                seedPlanoCurricular(conn);
                seedFuncionario(conn);
                seedProfessor(conn);
                seedEstudante(conn);
                seedPlanoCurricularDisciplina(conn);
                seedMatricula(conn);
                seedAvaliacao(conn);
                seedMatriculaDisciplina(conn);
                seedFrequencia(conn);
                seedHistoricoAcademico(conn);
                seedNota(conn);
                seedPagamento(conn);
                seedPropina(conn);
                conn.commit();
                log.info("Seed concluido com sucesso!");
            } catch (Exception e) {
                conn.rollback();
                log.error("Erro durante seed, rollback executado", e);
                throw e;
            }
        } catch (SQLException e) {
            log.error("Erro de conexao durante seed", e);
        }
        gerarArquivoCredenciais();
    }

    private int lastId(Connection conn, String table) throws SQLException {
        String sql = "SELECT COALESCE(MAX(id_" + table + "), 0) FROM " + table;
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            return rs.next() ? rs.getInt(1) : 0;
        }
    }

    private void seedPerfil(Connection conn) throws SQLException {
        if (lastId(conn, "perfil") >= 8) return;
        String[][] dados = {
            {"1", "ADMIN"}, {"2", "SECRETARIA"}, {"3", "TESOURARIA"},
            {"4", "DOCENTE"}, {"5", "COORDENADOR"}, {"6", "DIRECTOR"},
            {"7", "ESTUDANTE"}, {"8", "COORDENADOR_CURSO"}
        };
        String sql = "INSERT INTO perfil (id_perfil, nome_perfil) VALUES (?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (String[] d : dados) {
                ps.setInt(1, Integer.parseInt(d[0]));
                ps.setString(2, d[1]);
                ps.addBatch();
            }
            ps.executeBatch();
        }
        log.info("  perfil: {} registos", dados.length);
    }

    private void seedDepartamento(Connection conn) throws SQLException {
        if (lastId(conn, "departamento") >= 10) return;
        String[][] dados = {
            {"1", "Departamento de Engenharias"},
            {"2", "Departamento de Ciencias da Computacao"},
            {"3", "Departamento de Ciencias Economicas"},
            {"4", "Departamento de Ciencias Sociais"},
            {"5", "Departamento de Ciencias da Saude"},
            {"6", "Departamento de Letras e Artes"},
            {"7", "Departamento de Direito"},
            {"8", "Departamento de Matematica"},
            {"9", "Departamento de Gestao"},
            {"10", "Departamento de Educacao"},
            {"11", "Departamento de Cobrancas"},
            {"12", "Departamento da Secretaria"}
        };
        String sql = "INSERT INTO departamento (id_departamento, nome_departamento) VALUES (?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (String[] d : dados) {
                ps.setInt(1, Integer.parseInt(d[0]));
                ps.setString(2, d[1]);
                ps.addBatch();
            }
            ps.executeBatch();
        }
        log.info("  departamento: {} registos", dados.length);
    }

    private void seedAnoAcademico(Connection conn) throws SQLException {
        if (lastId(conn, "ano_academico") >= 10) return;
        Object[][] dados = {
            {1, "2019/2020", LocalDate.of(2019, 9, 1), LocalDate.of(2020, 7, 31), "ENCERRADO"},
            {2, "2020/2021", LocalDate.of(2020, 9, 1), LocalDate.of(2021, 7, 31), "ENCERRADO"},
            {3, "2021/2022", LocalDate.of(2021, 9, 1), LocalDate.of(2022, 7, 31), "ENCERRADO"},
            {4, "2022/2023", LocalDate.of(2022, 9, 1), LocalDate.of(2023, 7, 31), "ENCERRADO"},
            {5, "2023/2024", LocalDate.of(2023, 9, 1), LocalDate.of(2024, 7, 31), "ENCERRADO"},
            {6, "2024/2025", LocalDate.of(2024, 9, 1), LocalDate.of(2025, 7, 31), "ATIVO"},
            {7, "2025/2026", LocalDate.of(2025, 9, 1), LocalDate.of(2026, 7, 31), "ATIVO"},
            {8, "2026/2027", LocalDate.of(2026, 9, 1), LocalDate.of(2027, 7, 31), "ATIVO"},
            {9, "2027/2028", LocalDate.of(2027, 9, 1), LocalDate.of(2028, 7, 31), "ATIVO"},
            {10, "2028/2029", LocalDate.of(2028, 9, 1), LocalDate.of(2029, 7, 31), "ATIVO"},
            {11, "2029/2030", LocalDate.of(2029, 9, 1), LocalDate.of(2030, 7, 31), "ATIVO"}
        };
        String sql = "INSERT INTO ano_academico (id_ano_academico, descricao, data_inicio, data_fim, status) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (Object[] d : dados) {
                ps.setInt(1, (int) d[0]);
                ps.setString(2, (String) d[1]);
                ps.setDate(3, java.sql.Date.valueOf((LocalDate) d[2]));
                ps.setDate(4, java.sql.Date.valueOf((LocalDate) d[3]));
                ps.setString(5, (String) d[4]);
                ps.addBatch();
            }
            ps.executeBatch();
        }
        log.info("  ano_academico: {} registos", dados.length);
    }

    private void seedSala(Connection conn) throws SQLException {
        if (lastId(conn, "sala") >= 10) return;
        String[][] dados = {
            {"1", "A101", "Bloco A", "50"},
            {"2", "A102", "Bloco A", "45"},
            {"3", "B201", "Bloco B", "60"},
            {"4", "B202", "Bloco B", "55"},
            {"5", "C301", "Bloco C", "40"},
            {"6", "C302", "Bloco C", "35"},
            {"7", "LAB-INFO-1", "Laboratorios", "30"},
            {"8", "LAB-INFO-2", "Laboratorios", "30"},
            {"9", "AUDITORIO", "Bloco Central", "200"},
            {"10", "SALA-PROF", "Bloco A", "20"},
            {"11", "LAB-QUIM", "Laboratorios", "25"}
        };
        String sql = "INSERT INTO sala (id_sala, codigo_sala, bloco, capacidade) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (String[] d : dados) {
                ps.setInt(1, Integer.parseInt(d[0]));
                ps.setString(2, d[1]);
                ps.setString(3, d[2]);
                ps.setInt(4, Integer.parseInt(d[3]));
                ps.addBatch();
            }
            ps.executeBatch();
        }
        log.info("  sala: {} registos", dados.length);
    }

    private void seedCurso(Connection conn) throws SQLException {
        if (lastId(conn, "curso") >= 10) return;
        Object[][] dados = {
            {1, 2, "CC101", "Engenharia Informatica", "LICENCIATURA", "LABORAL", 4, 8500.00},
            {2, 2, "CC102", "Ciencia da Computacao", "LICENCIATURA", "LABORAL", 4, 8200.00},
            {3, 1, "ENG101", "Engenharia Civil", "LICENCIATURA", "LABORAL", 5, 9000.00},
            {4, 1, "ENG102", "Engenharia Electrotecnica", "LICENCIATURA", "LABORAL", 5, 8800.00},
            {5, 3, "ECO101", "Economia", "LICENCIATURA", "POS_LABORAL", 4, 7500.00},
            {6, 9, "GES101", "Gestao de Empresas", "LICENCIATURA", "LABORAL", 4, 7800.00},
            {7, 4, "SOC101", "Sociologia", "LICENCIATURA", "POS_LABORAL", 4, 6500.00},
            {8, 7, "DIR101", "Direito", "LICENCIATURA", "LABORAL", 5, 9500.00},
            {9, 5, "SAU101", "Enfermagem", "LICENCIATURA", "LABORAL", 4, 8000.00},
            {10, 10, "PED101", "Pedagogia", "LICENCIATURA", "POS_LABORAL", 4, 6000.00},
            {11, 6, "LET101", "Letras", "LICENCIATURA", "LABORAL", 4, 5500.00}
        };
        String sql = "INSERT INTO curso (id_curso, id_departamento, codigo_curso, nome_curso, grau, regime, duracao_anos, propina_mensal) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (Object[] d : dados) {
                ps.setInt(1, (int) d[0]); ps.setInt(2, (int) d[1]);
                ps.setString(3, (String) d[2]); ps.setString(4, (String) d[3]);
                ps.setString(5, (String) d[4]); ps.setString(6, (String) d[5]);
                ps.setInt(7, (int) d[6]); ps.setDouble(8, (double) d[7]);
                ps.addBatch();
            }
            ps.executeBatch();
        }
        log.info("  curso: {} registos", dados.length);
    }

    private void seedSemestre(Connection conn) throws SQLException {
        if (lastId(conn, "semestre") >= 10) return;
        Object[][] dados = {
            {1, 4, "1_SEMESTRE", LocalDate.of(2022, 9, 1), LocalDate.of(2023, 1, 31)},
            {2, 4, "2_SEMESTRE", LocalDate.of(2023, 2, 1), LocalDate.of(2023, 7, 31)},
            {3, 5, "1_SEMESTRE", LocalDate.of(2023, 9, 1), LocalDate.of(2024, 1, 31)},
            {4, 5, "2_SEMESTRE", LocalDate.of(2024, 2, 1), LocalDate.of(2024, 7, 31)},
            {5, 6, "1_SEMESTRE", LocalDate.of(2024, 9, 1), LocalDate.of(2025, 1, 31)},
            {6, 6, "2_SEMESTRE", LocalDate.of(2025, 2, 1), LocalDate.of(2025, 7, 31)},
            {7, 7, "1_SEMESTRE", LocalDate.of(2025, 9, 1), LocalDate.of(2026, 1, 31)},
            {8, 7, "2_SEMESTRE", LocalDate.of(2026, 2, 1), LocalDate.of(2026, 7, 31)},
            {9, 8, "1_SEMESTRE", LocalDate.of(2026, 9, 1), LocalDate.of(2027, 1, 31)},
            {10, 8, "2_SEMESTRE", LocalDate.of(2027, 2, 1), LocalDate.of(2027, 7, 31)},
            {11, 9, "1_SEMESTRE", LocalDate.of(2027, 9, 1), LocalDate.of(2028, 1, 31)},
            {12, 9, "2_SEMESTRE", LocalDate.of(2028, 2, 1), LocalDate.of(2028, 7, 31)}
        };
        String sql = "INSERT INTO semestre (id_semestre, id_ano_academico, nome_semestre, data_inicio, data_fim) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (Object[] d : dados) {
                ps.setInt(1, (int) d[0]); ps.setInt(2, (int) d[1]);
                ps.setString(3, (String) d[2]);
                ps.setDate(4, java.sql.Date.valueOf((LocalDate) d[3]));
                ps.setDate(5, java.sql.Date.valueOf((LocalDate) d[4]));
                ps.addBatch();
            }
            ps.executeBatch();
        }
        log.info("  semestre: {} registos", dados.length);
    }

    private void seedUtilizador(Connection conn) throws SQLException {
        if (lastId(conn, "utilizador") >= 10) return;
        String[][] dados = {
            {"1", "admin@ojj.edu", "Admin@123", "1", "Administrador do Sistema"},
            {"2", "secretaria@ojj.edu", "Secretaria@123", "2", "Secretaria Geral"},
            {"3", "tesouraria@ojj.edu", "Tesouraria@123", "3", "Tesoureiro"},
            {"4", "professor1@ojj.edu", "Professor@123", "4", "Professor Carlos Silva"},
            {"5", "professor2@ojj.edu", "Professor@123", "4", "Professora Ana Costa"},
            {"6", "coordenador@ojj.edu", "Coordenador@123", "5", "Coordenador Pedro Santos"},
            {"7", "diretor@ojj.edu", "Diretor@123", "6", "Diretor Jose Cardoso"},
            {"8", "coordenador.curso@ojj.edu", "Coordenador@123", "8", "Coordenador Curso"},
            {"9", "estudante0001@ojj.edu", "Estudante@123", "7", "Milton Caetano"},
            {"10", "estudante0002@ojj.edu", "Estudante@123", "7", "Victor Pedro"},
            {"11", "estudante0003@ojj.edu", "Estudante@123", "7", "Mariano Armando"},
            {"12", "estudante0004@ojj.edu", "Estudante@123", "7", "Fátima Costa"},
            {"13", "estudante0005@ojj.edu", "Estudante@123", "7", "Joao da Silva"},
            {"14", "estudante0006@ojj.edu", "Estudante@123", "7", "Ana Beatriz"},
            {"15", "estudante0007@ojj.edu", "Estudante@123", "7", "Pedro Henriques"},
            {"16", "estudante0008@ojj.edu", "Estudante@123", "7", "Luciana Mendes"},
            {"17", "estudante0009@ojj.edu", "Estudante@123", "7", "Rafael Costa"},
            {"18", "estudante0010@ojj.edu", "Estudante@123", "7", "Carla Souza"},
            {"19", "luis.fernando@ojj.edu", "Professor@123", "4", "Luis Fernando Gomes"},
            {"20", "sofia.martins@ojj.edu", "Professor@123", "4", "Sofia Isabel Martins"}
        };
        String sql = "INSERT INTO utilizador (id_utilizador, id_perfil, email, password_hash, status, data_criacao) VALUES (?, ?, ?, ?, 'ATIVO', NOW())";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (String[] d : dados) {
                ps.setInt(1, Integer.parseInt(d[0]));
                ps.setInt(2, Integer.parseInt(d[3]));
                ps.setString(3, d[1]);
                ps.setString(4, PasswordUtils.hashPassword(d[2]));
                ps.addBatch();
                credenciais.add(new Credencial(d[1], d[2], d[4], d[3].equals("1") ? "ADMIN" : d[3].equals("2") ? "SECRETARIA" : d[3].equals("3") ? "TESOURARIA" : d[3].equals("4") ? "DOCENTE" : d[3].equals("5") ? "COORDENADOR" : d[3].equals("6") ? "DIRECTOR" : d[3].equals("7") ? "ESTUDANTE" : "COORDENADOR_CURSO"));
            }
            ps.executeBatch();
        }
        log.info("  utilizador: {} registos", dados.length);
    }

    private void seedTurma(Connection conn) throws SQLException {
        if (lastId(conn, "turma") >= 10) return;
        Object[][] dados = {
            {1, 1, 1, "INF-1A", "MANHA", 1, 40, "Seg/Qua 08:00-10:00"},
            {2, 1, 2, "INF-1B", "TARDE", 1, 35, "Seg/Qua 14:00-16:00"},
            {3, 1, 3, "INF-2A", "MANHA", 2, 40, "Ter/Qui 08:00-10:00"},
            {4, 2, 4, "CC-1A", "MANHA", 1, 35, "Seg/Qua 10:00-12:00"},
            {5, 3, 5, "CIV-1A", "MANHA", 1, 45, "Ter/Qui 08:00-10:00"},
            {6, 5, 6, "ECO-1A", "NOITE", 1, 30, "Seg/Qua 19:00-21:00"},
            {7, 8, 7, "DIR-1A", "MANHA", 1, 40, "Ter/Qui 14:00-16:00"},
            {8, 6, 8, "GES-1A", "TARDE", 1, 35, "Seg/Qua 16:00-18:00"},
            {9, 4, 9, "ELE-1A", "MANHA", 1, 50, "Sex 08:00-12:00"},
            {10, 7, 10, "SOC-1A", "NOITE", 1, 25, "Qua/Sex 19:00-21:00"},
            {11, 9, 7, "SAU-1A", "MANHA", 1, 30, "Seg/Sex 08:00-10:00"}
        };
        String sql = "INSERT INTO turma (id_turma, id_curso, id_sala, codigo_turma, turno, ano_curricular, capacidade_maxima, horario, data_criacao) VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (Object[] d : dados) {
                ps.setInt(1, (int) d[0]); ps.setInt(2, (int) d[1]); ps.setInt(3, (int) d[2]);
                ps.setString(4, (String) d[3]); ps.setString(5, (String) d[4]);
                ps.setInt(6, (int) d[5]); ps.setInt(7, (int) d[6]); ps.setString(8, (String) d[7]);
                ps.addBatch();
            }
            ps.executeBatch();
        }
        log.info("  turma: {} registos", dados.length);
    }

    private void seedDisciplina(Connection conn) throws SQLException {
        if (lastId(conn, "disciplina") >= 10) return;
        Object[][] dados = {
            {1, "INF101", "Programacao I", 60}, {2, "INF101", "Introducao a Informatica I", 60},
            {3, "INF101", "Lingua Portuguesa", 60}, {4, "INF101", "Fisica", 60},
            {5, "INF101", "Matematica I", 60}, {6, "INF102", "Programacao II", 60},
            {7, "INF102", "Estrutura de Dados I", 60}, {8, "INF102", "Algebra Linear", 60},
            {9, "INF102", "Estatistica e Probabilidade", 60}, {10, "INF102", "Modulo MVC", 60},
            {11, "INF201", "Banco de Dados I", 75}, {12, "INF201", "Programacao III", 75},
            {13, "INF201", "Codigo Limpo I", 75}, {14, "INF201", "Estrutura de Dados II", 75},
            {15, "INF201", "Redes I", 75}, {16, "INF202", "Redes de Computadores", 60},
            {17, "MAT101", "Calculo I", 90}, {18, "MAT102", "Algebra Linear", 60},
            {19, "FIS101", "Fisica Geral", 60}, {20, "ECO101", "Microeconomia", 60},
            {21, "GES101", "Administracao Geral", 45}, {22, "DIR101", "Introducao ao Direito", 60},
            {23, "LET101", "Literatura", 60}
        };
        String sql = "INSERT INTO disciplina (id_disciplina, codigo_disciplina, nome_disciplina, carga_horaria) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (Object[] d : dados) {
                ps.setInt(1, (int) d[0]); ps.setString(2, (String) d[1]);
                ps.setString(3, (String) d[2]); ps.setInt(4, (int) d[3]);
                ps.addBatch();
            }
            ps.executeBatch();
        }
        log.info("  disciplina: {} registos", dados.length);
    }

    private void seedPlanoCurricular(Connection conn) throws SQLException {
        if (lastId(conn, "plano_curricular") >= 10) return;
        Object[][] dados = {
            {1, 1, 1, 1, 60}, {2, 1, 1, 2, 60}, {3, 2, 1, 1, 60},
            {4, 2, 1, 2, 60}, {5, 3, 1, 1, 90}, {6, 5, 1, 1, 60},
            {7, 6, 1, 1, 60}, {8, 7, 1, 1, 60}, {9, 8, 1, 1, 90},
            {10, 9, 1, 1, 60}, {11, 10, 1, 1, 60}
        };
        String sql = "INSERT INTO plano_curricular (id_plano_curricular, id_curso, ano_curricular, semestre, carga_horaria) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (Object[] d : dados) {
                ps.setInt(1, (int) d[0]); ps.setInt(2, (int) d[1]);
                ps.setInt(3, (int) d[2]); ps.setInt(4, (int) d[3]); ps.setInt(5, (int) d[4]);
                ps.addBatch();
            }
            ps.executeBatch();
        }
        log.info("  plano_curricular: {} registos", dados.length);
    }

    private void seedFuncionario(Connection conn) throws SQLException {
        if (lastId(conn, "funcionario") >= 10) return;
        Object[][] dados = {
            {1, 1, 1, "Administrador do Sistema", "923000000", "BI00001AA", "M", LocalDate.of(1990, 1, 1), "Luanda, Avenida Deolinda Rodrigues", 50000.00, LocalDate.of(2020, 1, 1)},
            {2, 2, 12, "Maria Fernanda Santos", "934567890", "BI001235ABC", "F", LocalDate.of(1985, 8, 20), "Luanda, Kilamba", 150000.00, LocalDate.of(2015, 3, 15)},
            {3, 3, 11, "Carlos Alberto Pereira", "945678901", "BI001236ABC", "M", LocalDate.of(1990, 11, 10), "Luanda, Talatona", 120000.00, LocalDate.of(2018, 7, 1)},
            {4, 4, 2, "Ana Cristina Lopes", "956789012", "BI001237ABC", "F", LocalDate.of(1975, 2, 25), "Luanda, Viana", 180000.00, LocalDate.of(2012, 9, 20)},
            {5, 5, 1, "Ricardo Jose Almeida", "967890123", "BI001238ABC", "M", LocalDate.of(1982, 7, 30), "Luanda, Benfica", 175000.00, LocalDate.of(2014, 11, 5)},
            {6, 6, 2, "Paula Sofia Mendes", "978901234", "BI001239ABC", "F", LocalDate.of(1978, 12, 12), "Luanda, Camama", 220000.00, LocalDate.of(2011, 5, 20)},
            {7, 7, 4, "Jose Manuel Cardoso", "912345678", "BI001240ABC", "M", LocalDate.of(1976, 4, 10), "Luanda, Miramar", 200000.00, LocalDate.of(2013, 6, 30)},
            {8, 8, 12, "Cristina Tavares", "998765432", "BI001241ABC", "F", LocalDate.of(1988, 3, 5), "Luanda, Maianga", 110000.00, LocalDate.of(2019, 8, 12)},
            {9, 19, 9, "Luis Fernando Gomes", "987654321", "BI001242ABC", "M", LocalDate.of(1980, 7, 22), "Luanda, Palanca", 190000.00, LocalDate.of(2010, 2, 10)},
            {10, 20, 5, "Sofia Isabel Martins", "976543210", "BI001243ABC", "F", LocalDate.of(1983, 9, 15), "Luanda, Alvalade", 210000.00, LocalDate.of(2012, 10, 1)}
        };
        String sql = "INSERT INTO funcionario (id_funcionario, id_utilizador, id_departamento, nome_completo, telefone, numero_bi, sexo, data_nascimento, morada, salario, data_admissao) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (Object[] d : dados) {
                ps.setInt(1, (int) d[0]); ps.setInt(2, (int) d[1]); ps.setInt(3, (int) d[2]);
                ps.setString(4, (String) d[3]); ps.setString(5, (String) d[4]);
                ps.setString(6, (String) d[5]); ps.setString(7, (String) d[6]);
                ps.setDate(8, java.sql.Date.valueOf((LocalDate) d[7]));
                ps.setString(9, (String) d[8]); ps.setDouble(10, (double) d[9]);
                ps.setDate(11, java.sql.Date.valueOf((LocalDate) d[10]));
                ps.addBatch();
            }
            ps.executeBatch();
        }
        log.info("  funcionario: {} registos", dados.length);
    }

    private void seedProfessor(Connection conn) throws SQLException {
        if (lastId(conn, "professor") >= 10) return;
        Object[][] dados = {
            {1, 4, "MESTRE", "Sistemas de Informacao"},
            {2, 5, "DOUTOR", "Redes e Telecomunicacoes"},
            {3, 9, "MESTRE", "Gestao Empresarial"},
            {4, 10, "DOUTOR", "Ciencias Sociais"},
            {5, 8, "LICENCIADO", "Secretariado"},
            {6, 6, "MESTRE", "Coordenacao Academica"},
            {7, 7, "DOUTOR", "Direcao Academica"},
            {8, 1, "MESTRE", "Administracao de Sistemas"},
            {9, 2, "LICENCIADO", "Atendimento"},
            {10, 3, "LICENCIADO", "Cobrancas"}
        };
        String sql = "INSERT INTO professor (id_professor, id_funcionario, grau_academico, especialidade) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (Object[] d : dados) {
                ps.setInt(1, (int) d[0]); ps.setInt(2, (int) d[1]);
                ps.setString(3, (String) d[2]); ps.setString(4, (String) d[3]);
                ps.addBatch();
            }
            ps.executeBatch();
        }
        log.info("  professor: {} registos", dados.length);
    }

    private void seedEstudante(Connection conn) throws SQLException {
        if (lastId(conn, "estudante") >= 10) return;
        Object[][] dados = {
            {1, 9, "STU000001", "Milton Caetano", "M", LocalDate.of(2007, 6, 6), "920000001", "milton@mail.ojj.edu", "Rua dos Estudantes, Bairro 01", "Benguela", "Angola", "BI0000000001", "Encarregado 0001", "920000001"},
            {2, 10, "STU000002", "Victor Pedro", "F", LocalDate.of(2006, 6, 6), "920000002", "victor@mail.ojj.edu", "Rua dos Estudantes, Bairro 01", "Benguela", "Angola", "BI0000000002", "Encarregado 0002", "920000002"},
            {3, 11, "STU000003", "Mariano Armando", "M", LocalDate.of(2005, 6, 6), "920000003", "mariano@mail.ojj.edu", "Rua dos Estudantes, Bairro 01", "Benguela", "Angola", "BI0000000003", "Encarregado 0003", "920000003"},
            {4, 12, "STU000004", "Fátima Costa", "F", LocalDate.of(2004, 6, 6), "920000004", "fatima@mail.ojj.edu", "Rua dos Estudantes, Bairro 02", "Benguela", "Angola", "BI0000000004", "Encarregado 0004", "920000004"},
            {5, 13, "STU000005", "Joao da Silva", "M", LocalDate.of(2003, 5, 10), "920000005", "joao.silva@mail.ojj.edu", "Rua A, Bairro 03", "Luanda", "Angola", "BI0000000005", "Maria Silva", "920000005"},
            {6, 14, "STU000006", "Ana Beatriz", "F", LocalDate.of(2004, 8, 15), "920000006", "ana.beatriz@mail.ojj.edu", "Rua B, Bairro 04", "Luanda", "Angola", "BI0000000006", "Carlos Santos", "920000006"},
            {7, 15, "STU000007", "Pedro Henriques", "M", LocalDate.of(2002, 3, 22), "920000007", "pedro.h@mail.ojj.edu", "Rua C, Bairro 05", "Huambo", "Angola", "BI0000000007", "Ana Henriques", "920000007"},
            {8, 16, "STU000008", "Luciana Mendes", "F", LocalDate.of(2005, 11, 30), "920000008", "luciana.m@mail.ojj.edu", "Rua D, Bairro 06", "Benguela", "Angola", "BI0000000008", "Jose Mendes", "920000008"},
            {9, 17, "STU000009", "Rafael Costa", "M", LocalDate.of(2003, 7, 5), "920000009", "rafael.c@mail.ojj.edu", "Rua E, Bairro 07", "Luanda", "Angola", "BI0000000009", "Sofia Costa", "920000009"},
            {10, 18, "STU000010", "Carla Souza", "F", LocalDate.of(2004, 1, 18), "920000010", "carla.s@mail.ojj.edu", "Rua F, Bairro 08", "Luanda", "Angola", "BI0000000010", "Paulo Souza", "920000010"}
        };
        String sql = "INSERT INTO estudante (id_estudante, id_utilizador, numero_estudante, nome_completo, sexo, data_nascimento, telefone, email_pessoal, morada, provincia, nacionalidade, numero_bi, nome_encarregado, telefone_encarregado, data_inscricao) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (Object[] d : dados) {
                ps.setInt(1, (int) d[0]); ps.setInt(2, (int) d[1]);
                ps.setString(3, (String) d[2]); ps.setString(4, (String) d[3]);
                ps.setString(5, (String) d[4]); ps.setDate(6, java.sql.Date.valueOf((LocalDate) d[5]));
                ps.setString(7, (String) d[6]); ps.setString(8, (String) d[7]);
                ps.setString(9, (String) d[8]); ps.setString(10, (String) d[9]);
                ps.setString(11, (String) d[10]); ps.setString(12, (String) d[11]);
                ps.setString(13, (String) d[12]); ps.setString(14, (String) d[13]);
                ps.addBatch();
            }
            ps.executeBatch();
        }
        log.info("  estudante: {} registos", dados.length);
    }

    private void seedPlanoCurricularDisciplina(Connection conn) throws SQLException {
        if (lastId(conn, "plano_curricular_disciplina") >= 10) return;
        Object[][] dados = {
            {1, 1, 1}, {2, 1, 3}, {3, 1, 5}, {4, 2, 6}, {5, 2, 7},
            {6, 3, 2}, {7, 3, 8}, {8, 4, 10}, {9, 5, 4}, {10, 6, 20},
            {11, 7, 21}, {12, 9, 22}
        };
        String sql = "INSERT INTO plano_curricular_disciplina (id_plano_curricular_disciplina, id_plano_curricular, id_disciplina) VALUES (?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (Object[] d : dados) {
                ps.setInt(1, (int) d[0]); ps.setInt(2, (int) d[1]); ps.setInt(3, (int) d[2]);
                ps.addBatch();
            }
            ps.executeBatch();
        }
        log.info("  plano_curricular_disciplina: {} registos", dados.length);
    }

    private void seedMatricula(Connection conn) throws SQLException {
        if (lastId(conn, "matricula") >= 10) return;
        Object[][] dados = {
            {1, 1, 1, 1, 7, 3}, {2, 2, 1, 1, 7, 3}, {3, 3, 1, 1, 7, 3},
            {4, 4, 1, 1, 7, 3},             {5, 5, 1, 1, 7, 3}, {6, 6, 1, 1, 7, 3},
            {7, 7, 1, 1, 7, 3}, {8, 8, 1, 1, 7, 3}, {9, 9, 1, 1, 7, 3},
            {10, 10, 1, 1, 7, 3}, {11, 1, 2, 4, 7, 3}
        };
        String sql = "INSERT INTO matricula (id_matricula, id_estudante, id_curso, id_turma, id_ano_academico, id_semestre, data_matricula, status) VALUES (?, ?, ?, ?, ?, ?, NOW(), 'CONFIRMADA')";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (Object[] d : dados) {
                ps.setInt(1, (int) d[0]); ps.setInt(2, (int) d[1]); ps.setInt(3, (int) d[2]);
                ps.setInt(4, (int) d[3]); ps.setInt(5, (int) d[4]); ps.setInt(6, (int) d[5]);
                ps.addBatch();
            }
            ps.executeBatch();
        }
        log.info("  matricula: {} registos", dados.length);
    }

    private void seedAvaliacao(Connection conn) throws SQLException {
        if (lastId(conn, "avaliacao") >= 10) return;
        Object[][] dados = {
            {1, 1, 1, "MAC", "Teste de Programacao I", LocalDate.of(2026, 3, 15), 40.00},
            {2, 1, 1, "NPP", "Trabalho Pratico I", LocalDate.of(2026, 4, 10), 20.00},
            {3, 1, 1, "EXAME", "Exame Final Programacao I", LocalDate.of(2026, 6, 20), 40.00},
            {4, 5, 1, "MAC", "Teste de Matematica I", LocalDate.of(2026, 3, 18), 40.00},
            {5, 5, 1, "EXAME", "Exame Final Matematica I", LocalDate.of(2026, 6, 22), 60.00},
            {6, 3, 1, "MAC", "Teste de Lingua Portuguesa", LocalDate.of(2026, 3, 20), 50.00},
            {7, 3, 1, "EXAME", "Exame Final Lingua Portuguesa", LocalDate.of(2026, 6, 25), 50.00},
            {8, 2, 2, "MAC", "Teste de Introducao a Informatica", LocalDate.of(2026, 3, 22), 40.00},
            {9, 2, 2, "EXAME", "Exame Final Informatica", LocalDate.of(2026, 6, 27), 60.00},
            {10, 4, 1, "MAC", "Teste de Fisica", LocalDate.of(2026, 4, 5), 40.00},
            {11, 4, 1, "EXAME", "Exame Final Fisica", LocalDate.of(2026, 6, 29), 60.00}
        };
        String sql = "INSERT INTO avaliacao (id_avaliacao, id_disciplina, id_professor, tipo, descricao, data_avaliacao, peso) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (Object[] d : dados) {
                ps.setInt(1, (int) d[0]); ps.setInt(2, (int) d[1]); ps.setInt(3, (int) d[2]);
                ps.setString(4, (String) d[3]); ps.setString(5, (String) d[4]);
                ps.setDate(6, java.sql.Date.valueOf((LocalDate) d[5])); ps.setDouble(7, (double) d[6]);
                ps.addBatch();
            }
            ps.executeBatch();
        }
        log.info("  avaliacao: {} registos", dados.length);
    }

    private void seedMatriculaDisciplina(Connection conn) throws SQLException {
        String sql = "INSERT INTO matricula_disciplina (id_matricula, id_disciplina) VALUES (?, ?)";
        int count = 0;
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (int m = 1; m <= 10; m++) {
                for (int d = 1; d <= 5; d++) {
                    if (count >= 10) break;
                    ps.setInt(1, m); ps.setInt(2, d);
                    ps.addBatch();
                    count++;
                }
                if (count >= 10) break;
            }
            if (count > 0) ps.executeBatch();
        }
        log.info("  matricula_disciplina: {} registos", count);
    }

    private void seedFrequencia(Connection conn) throws SQLException {
        String sql = "INSERT INTO frequencia (id_estudante, id_disciplina, data_aula, status) VALUES (?, ?, ?, ?)";
        int count = 0;
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (int e = 1; e <= 10; e++) {
                for (int d = 1; d <= 3; d++) {
                    count++;
                    ps.setInt(1, e); ps.setInt(2, d);
                    ps.setDate(3, java.sql.Date.valueOf(LocalDate.of(2026, 3, 1 + count)));
                    ps.setString(4, count % 5 == 0 ? "AUSENTE" : "PRESENTE");
                    ps.addBatch();
                }
            }
            ps.executeBatch();
        }
        log.info("  frequencia: {} registos", count);
    }

    private void seedHistoricoAcademico(Connection conn) throws SQLException {
        String sql = "INSERT INTO historico_academico (id_estudante, id_disciplina, media_final, resultado, ano_letivo) VALUES (?, ?, ?, ?, ?)";
        int count = 0;
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (int e = 1; e <= 10; e++) {
                for (int d = 1; d <= 3; d++) {
                    count++;
                    ps.setInt(1, e); ps.setInt(2, d);
                    double media = 8.0 + (count * 0.5);
                    ps.setDouble(3, media);
                    ps.setString(4, media >= 10.0 ? "APROVADO" : "REPROVADO");
                    ps.setString(5, "2024/2025");
                    ps.addBatch();
                }
            }
            ps.executeBatch();
        }
        log.info("  historico_academico: {} registos", count);
    }

    private void seedNota(Connection conn) throws SQLException {
        String sql = "INSERT INTO nota (id_avaliacao, id_estudante, nota, observacao) VALUES (?, ?, ?, ?)";
        int count = 0;
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (int a = 1; a <= 10; a++) {
                for (int e = 1; e <= 5; e++) {
                    count++;
                    ps.setInt(1, a); ps.setInt(2, e);
                    ps.setDouble(3, 7.0 + (count % 14));
                    ps.setString(4, count % 3 == 0 ? "Boa participacao" : null);
                    ps.addBatch();
                }
            }
            ps.executeBatch();
        }
        log.info("  nota: {} registos", count);
    }

    private void seedPagamento(Connection conn) throws SQLException {
        String sql = "INSERT INTO pagamento (id_estudante, id_tesoureiro, tipo_pagamento, periodo_referencia, valor_devido, valor_pago, data_pagamento, metodo_pagamento, status) VALUES (?, ?, ?, ?, ?, ?, NOW(), ?, ?)";
        int count = 0;
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            Object[][] tipos = {{"MATRICULA", "2026"}, {"PROPINA", "2026-03"}, {"PROPINA", "2026-04"}};
            for (int e = 1; e <= 10; e++) {
                for (Object[] t : tipos) {
                    count++;
                    ps.setInt(1, e); ps.setInt(2, 3);
                    ps.setString(3, (String) t[0]); ps.setString(4, (String) t[1]);
                    ps.setDouble(5, t[0].equals("MATRICULA") ? 5000.00 : 8500.00);
                    ps.setDouble(6, t[0].equals("MATRICULA") ? 5000.00 : 8500.00);
                    ps.setString(7, "MULTICAIXA"); ps.setString(8, "PAGO");
                    ps.addBatch();
                }
            }
            ps.executeBatch();
        }
        log.info("  pagamento: {} registos", count);
    }

    private void seedPropina(Connection conn) throws SQLException {
        String sql = "INSERT INTO propina (id_estudante, mes_referencia, ano_referencia, valor, multa, data_vencimento, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        int count = 0;
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            String[] meses = {"Janeiro", "Fevereiro", "Marco"};
            for (int e = 1; e <= 10; e++) {
                for (int m = 0; m < 3; m++) {
                    count++;
                    ps.setInt(1, e); ps.setString(2, meses[m]); ps.setInt(3, 2026);
                    ps.setDouble(4, 8500.00); ps.setDouble(5, 0.00);
                    ps.setDate(6, java.sql.Date.valueOf(LocalDate.of(2026, m + 1, 10)));
                    ps.setString(7, "PAGO");
                    ps.addBatch();
                }
            }
            ps.executeBatch();
        }
        log.info("  propina: {} registos", count);
    }

    private void gerarArquivoCredenciais() {
        try {
            Path dir = Paths.get(CREDENCIAIS_DIR);
            Files.createDirectories(dir);
            Path arquivo = dir.resolve("credenciais_seed_" + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss")) + ".txt");
            StringBuilder sb = new StringBuilder();
            sb.append("==================================================\n");
            sb.append("   CREDENCIAIS DE ACESSO - SEED AUTOMATICO\n");
            sb.append("   OJJ Academico\n");
            sb.append("==================================================\n\n");
            sb.append("Gerado em: ").append(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))).append("\n\n");
            sb.append("--------------------------------------------------\n");
            sb.append("           UTILIZADORES DO SISTEMA\n");
            sb.append("--------------------------------------------------\n\n");
            for (Credencial c : credenciais) {
                sb.append("Nome: ").append(c.nome).append("\n");
                sb.append("Email: ").append(c.email).append("\n");
                sb.append("Senha: ").append(c.senha).append("\n");
                sb.append("Perfil: ").append(c.perfil).append("\n");
                sb.append("--------------------------------------------------\n");
            }
            sb.append("\n==================================================\n");
            sb.append("   Todas as senhas foram hasheadas com BCrypt\n");
            sb.append("   Guarde este ficheiro num local seguro.\n");
            sb.append("==================================================\n");
            Files.write(arquivo, sb.toString().getBytes());
            log.info("Ficheiro de credenciais gerado: {}", arquivo.toAbsolutePath());
        } catch (IOException e) {
            log.error("Erro ao gerar ficheiro de credenciais", e);
        }
    }
}
