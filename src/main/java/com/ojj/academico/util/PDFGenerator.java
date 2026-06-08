package com.ojj.academico.util;

import com.lowagie.text.*;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.ojj.academico.model.Estudante;

import java.io.OutputStream;
import java.time.format.DateTimeFormatter;

public class PDFGenerator {

    public static void gerarDeclaracaoEstudante(Estudante estudante, String curso, OutputStream out) throws Exception {
        Document document = new Document(PageSize.A4, 50, 50, 50, 50);
        PdfWriter.getInstance(document, out);
        document.open();

        // Header
        Font fontCabecalho = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14);
        Paragraph cabecalho = new Paragraph("UNIVERSIDADE OJJ ACADÉMICO\nSECRETARIA GERAL", fontCabecalho);
        cabecalho.setAlignment(Element.ALIGN_CENTER);
        document.add(cabecalho);
        document.add(new Paragraph("\n\n"));

        // Title
        Font fontTitulo = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16);
        Paragraph titulo = new Paragraph("DECLARAÇÃO", fontTitulo);
        titulo.setAlignment(Element.ALIGN_CENTER);
        document.add(titulo);
        document.add(new Paragraph("\n\n"));

        // Content
        Font fontCorpo = FontFactory.getFont(FontFactory.HELVETICA, 12);
        String texto = "Declara-se, para efeitos de fins convenientes, que " + estudante.getNomeCompleto() + 
                       ", portador(a) do BI nº " + estudante.getNumeroBi() + 
                       ", é estudante regularmente matriculado(a) nesta instituição de ensino superior, no curso de " + 
                       curso + ", sob o número de estudante " + estudante.getNumeroEstudante() + ".";
        
        Paragraph corpo = new Paragraph(texto, fontCorpo);
        corpo.setAlignment(Element.ALIGN_JUSTIFIED);
        corpo.setLeading(20f);
        document.add(corpo);
        document.add(new Paragraph("\n\n"));

        // Date and Signature
        String dataAtual = java.time.LocalDate.now().format(DateTimeFormatter.ofPattern("dd 'de' MMMM 'de' yyyy"));
        Paragraph data = new Paragraph("Maputo, aos " + dataAtual, fontCorpo);
        data.setAlignment(Element.ALIGN_RIGHT);
        document.add(data);

        document.add(new Paragraph("\n\n\n\n"));
        Paragraph assinatura = new Paragraph("__________________________________________\nA Secretaria Geral", fontCorpo);
        assinatura.setAlignment(Element.ALIGN_CENTER);
        document.add(assinatura);

        document.close();
    }

    public static void gerarCartaoEstudante(Estudante estudante, String curso, OutputStream out) throws Exception {
        // Formato ID-1 (Cartão de Crédito) em pontos: 242 x 153
        Rectangle pageSize = new Rectangle(242, 153);
        Document document = new Document(pageSize, 10, 10, 10, 10);
        PdfWriter.getInstance(document, out);
        document.open();

        // Background / Border
        PdfPTable table = new PdfPTable(1);
        table.setWidthPercentage(100);
        
        PdfPCell cell = new PdfPCell();
        cell.setBorderWidth(1);
        cell.setPadding(5);
        cell.setBackgroundColor(new java.awt.Color(245, 245, 255));

        // Header do Cartão
        Font fontInst = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10, new java.awt.Color(0, 51, 102));
        Paragraph p1 = new Paragraph("OJJ ACADÉMICO", fontInst);
        p1.setAlignment(Element.ALIGN_CENTER);
        cell.addElement(p1);

        Font fontCartao = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 8);
        Paragraph p2 = new Paragraph("CARTÃO DE ESTUDANTE", fontCartao);
        p2.setAlignment(Element.ALIGN_CENTER);
        cell.addElement(p2);
        cell.addElement(new Paragraph("\n"));

        // Info do Estudante
        Font fontDados = FontFactory.getFont(FontFactory.HELVETICA, 7);
        Font fontLabels = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 7);

        cell.addElement(new Paragraph("NOME: " + estudante.getNomeCompleto(), fontDados));
        cell.addElement(new Paragraph("CURSO: " + curso, fontDados));
        cell.addElement(new Paragraph("Nº ESTUDANTE: " + estudante.getNumeroEstudante(), fontDados));
        cell.addElement(new Paragraph("VALIDADE: 31/12/2026", fontDados));

        table.addCell(cell);
        document.add(table);

        document.close();
    }
}
