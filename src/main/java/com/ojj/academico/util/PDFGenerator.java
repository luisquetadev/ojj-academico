package com.ojj.academico.util;

import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.ojj.academico.model.Estudante;

import java.awt.Color;
import java.io.OutputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class PDFGenerator {

    private static final Color PRIMARY = new Color(18, 50, 79);
    private static final Color TEAL = new Color(15, 118, 110);
    private static final Color ORANGE = new Color(154, 52, 18);
    private static final Color PAPER_BG = new Color(250, 252, 255);
    private static final Color LINE = new Color(214, 225, 234);
    private static final Color MUTED = new Color(102, 112, 133);
    private static final Color LIGHT_TEAL = new Color(232, 247, 245);
    private static final Color LIGHT_ORANGE = new Color(255, 244, 237);

    public static void gerarDeclaracaoEstudante(Estudante estudante, String curso, OutputStream out) throws Exception {
        Document document = new Document(PageSize.A4, 54, 54, 42, 48);
        PdfWriter.getInstance(document, out);
        document.open();

        addDeclarationHeader(document);
        addDeclarationTitle(document);
        addStudentInfoBox(document, estudante, curso);
        addDeclarationBody(document, estudante, curso);
        addDeclarationSignature(document);

        document.close();
    }

    public static void gerarCartaoEstudante(Estudante estudante, String curso, OutputStream out) throws Exception {
        Rectangle pageSize = new Rectangle(336, 214);
        Document document = new Document(pageSize, 0, 0, 0, 0);
        PdfWriter.getInstance(document, out);
        document.open();

        PdfPTable card = new PdfPTable(1);
        card.setWidthPercentage(100);

        PdfPCell wrapper = new PdfPCell();
        wrapper.setBorder(Rectangle.NO_BORDER);
        wrapper.setPadding(0);
        wrapper.setBackgroundColor(Color.WHITE);

        wrapper.addElement(createCardHeader());
        wrapper.addElement(createCardBody(estudante, curso));
        wrapper.addElement(createCardFooter(estudante));

        card.addCell(wrapper);
        document.add(card);
        document.close();
    }

    private static void addDeclarationHeader(Document document) throws Exception {
        PdfPTable header = new PdfPTable(2);
        header.setWidthPercentage(100);
        header.setWidths(new float[] { 1.15f, 4.85f });
        header.setSpacingAfter(24);

        PdfPCell seal = new PdfPCell(new Phrase("OJJ", font(18, Font.BOLD, ORANGE)));
        seal.setHorizontalAlignment(Element.ALIGN_CENTER);
        seal.setVerticalAlignment(Element.ALIGN_MIDDLE);
        seal.setFixedHeight(58);
        seal.setBackgroundColor(LIGHT_ORANGE);
        seal.setBorderColor(new Color(245, 203, 178));
        seal.setBorderWidth(1);
        seal.setPadding(8);
        header.addCell(seal);

        PdfPCell brand = new PdfPCell();
        brand.setBorder(Rectangle.NO_BORDER);
        brand.setPaddingLeft(14);
        brand.setVerticalAlignment(Element.ALIGN_MIDDLE);
        brand.addElement(new Paragraph("OJJ ACADEMICO", font(16, Font.BOLD, PRIMARY)));
        brand.addElement(new Paragraph("Secretaria Academica | Documento Oficial", font(9, Font.BOLD, ORANGE)));
        header.addCell(brand);

        document.add(header);

        PdfPTable rule = new PdfPTable(1);
        rule.setWidthPercentage(100);
        PdfPCell line = new PdfPCell();
        line.setFixedHeight(5);
        line.setBorder(Rectangle.NO_BORDER);
        line.setBackgroundColor(PRIMARY);
        rule.addCell(line);
        rule.setSpacingAfter(26);
        document.add(rule);
    }

    private static void addDeclarationTitle(Document document) throws Exception {
        Paragraph tag = new Paragraph("DECLARACAO ACADEMICA", font(18, Font.BOLD, PRIMARY));
        tag.setAlignment(Element.ALIGN_CENTER);
        tag.setSpacingAfter(8);
        document.add(tag);

        Paragraph subtitle = new Paragraph("Comprovativo de matricula e frequencia", font(10, Font.BOLD, MUTED));
        subtitle.setAlignment(Element.ALIGN_CENTER);
        subtitle.setSpacingAfter(22);
        document.add(subtitle);
    }

    private static void addStudentInfoBox(Document document, Estudante estudante, String curso) throws Exception {
        PdfPTable box = new PdfPTable(2);
        box.setWidthPercentage(100);
        box.setWidths(new float[] { 1.1f, 2.2f });
        box.setSpacingAfter(26);

        addInfoCell(box, "Estudante", value(estudante.getNomeCompleto()));
        addInfoCell(box, "Numero", value(estudante.getNumeroEstudante()));
        addInfoCell(box, "Curso", value(curso));
        addInfoCell(box, "BI", value(estudante.getNumeroBi()));

        document.add(box);
    }

    private static void addDeclarationBody(Document document, Estudante estudante, String curso) throws Exception {
        String texto = "Declara-se, para os devidos efeitos, que " + value(estudante.getNomeCompleto())
                + ", portador(a) do BI n.o " + value(estudante.getNumeroBi())
                + ", encontra-se regularmente matriculado(a) nesta instituicao de ensino no curso de "
                + value(curso) + ", sob o numero de estudante " + value(estudante.getNumeroEstudante()) + ".";

        Paragraph corpo = new Paragraph(texto, font(12, Font.NORMAL, new Color(31, 41, 55)));
        corpo.setAlignment(Element.ALIGN_JUSTIFIED);
        corpo.setLeading(22f);
        corpo.setFirstLineIndent(18);
        corpo.setSpacingAfter(28);
        document.add(corpo);

        PdfPTable note = new PdfPTable(1);
        note.setWidthPercentage(100);
        PdfPCell noteCell = new PdfPCell(new Phrase("Este documento foi emitido eletronicamente pelo Sistema de Gestao Academica OJJ.", font(9, Font.BOLD, MUTED)));
        noteCell.setBorderColor(LINE);
        noteCell.setBackgroundColor(PAPER_BG);
        noteCell.setPadding(12);
        note.addCell(noteCell);
        note.setSpacingAfter(34);
        document.add(note);
    }

    private static void addDeclarationSignature(Document document) throws Exception {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd 'de' MMMM 'de' yyyy", new Locale("pt", "PT"));
        Paragraph data = new Paragraph("Luanda, " + LocalDate.now().format(formatter), font(11, Font.NORMAL, new Color(31, 41, 55)));
        data.setAlignment(Element.ALIGN_RIGHT);
        data.setSpacingAfter(58);
        document.add(data);

        PdfPTable signature = new PdfPTable(1);
        signature.setWidthPercentage(42);
        signature.setHorizontalAlignment(Element.ALIGN_RIGHT);
        PdfPCell line = new PdfPCell(new Phrase("Secretaria Academica", font(10, Font.BOLD, MUTED)));
        line.setBorder(Rectangle.TOP);
        line.setBorderColor(new Color(159, 177, 193));
        line.setPaddingTop(8);
        line.setHorizontalAlignment(Element.ALIGN_CENTER);
        signature.addCell(line);
        document.add(signature);
    }

    private static PdfPTable createCardHeader() throws Exception {
        PdfPTable header = new PdfPTable(3);
        header.setWidthPercentage(100);
        header.setWidths(new float[] { 0.72f, 3.4f, 1.5f });

        PdfPCell mark = new PdfPCell(new Phrase("OJJ", font(12, Font.BOLD, Color.WHITE)));
        mark.setFixedHeight(56);
        mark.setHorizontalAlignment(Element.ALIGN_CENTER);
        mark.setVerticalAlignment(Element.ALIGN_MIDDLE);
        mark.setBorder(Rectangle.NO_BORDER);
        mark.setBackgroundColor(TEAL);
        header.addCell(mark);

        PdfPCell brand = new PdfPCell();
        brand.setBorder(Rectangle.NO_BORDER);
        brand.setPaddingTop(11);
        brand.setPaddingLeft(12);
        brand.setBackgroundColor(PRIMARY);
        brand.addElement(new Paragraph("OJJ ACADEMICO", font(12, Font.BOLD, Color.WHITE)));
        brand.addElement(new Paragraph("Identificacao Academica", font(7, Font.BOLD, new Color(205, 231, 238))));
        header.addCell(brand);

        PdfPCell tag = new PdfPCell(new Phrase("ESTUDANTE", font(7, Font.BOLD, Color.WHITE)));
        tag.setHorizontalAlignment(Element.ALIGN_CENTER);
        tag.setVerticalAlignment(Element.ALIGN_MIDDLE);
        tag.setBorder(Rectangle.NO_BORDER);
        tag.setBackgroundColor(PRIMARY);
        header.addCell(tag);

        return header;
    }

    private static PdfPTable createCardBody(Estudante estudante, String curso) throws Exception {
        PdfPTable body = new PdfPTable(2);
        body.setWidthPercentage(100);
        body.setWidths(new float[] { 1.1f, 3.1f });
        body.setSpacingBefore(12);
        body.setSpacingAfter(8);

        PdfPCell photo = new PdfPCell(new Phrase("FOTO", font(10, Font.BOLD, TEAL)));
        photo.setFixedHeight(92);
        photo.setHorizontalAlignment(Element.ALIGN_CENTER);
        photo.setVerticalAlignment(Element.ALIGN_MIDDLE);
        photo.setBorderColor(new Color(170, 195, 209));
        photo.setBorderWidth(1);
        photo.setBackgroundColor(LIGHT_TEAL);
        photo.setPadding(6);
        body.addCell(photo);

        PdfPCell data = new PdfPCell();
        data.setBorder(Rectangle.NO_BORDER);
        data.setPaddingLeft(12);
        data.setPaddingRight(12);
        data.addElement(new Paragraph("NOME", font(6, Font.BOLD, MUTED)));
        data.addElement(new Paragraph(value(estudante.getNomeCompleto()).toUpperCase(), font(10, Font.BOLD, PRIMARY)));
        data.addElement(new Paragraph(" "));
        data.addElement(labelValue("CURSO", curso));
        data.addElement(labelValue("N.O ESTUDANTE", estudante.getNumeroEstudante()));
        data.addElement(labelValue("BI", estudante.getNumeroBi()));
        body.addCell(data);

        return body;
    }

    private static PdfPTable createCardFooter(Estudante estudante) throws Exception {
        PdfPTable footer = new PdfPTable(2);
        footer.setWidthPercentage(100);
        footer.setWidths(new float[] { 1.5f, 1.5f });

        PdfPCell left = new PdfPCell(new Phrase("Validade: 31/12/" + LocalDate.now().getYear(), font(7, Font.BOLD, MUTED)));
        left.setBorder(Rectangle.TOP);
        left.setBorderColor(LINE);
        left.setPadding(10);
        left.setHorizontalAlignment(Element.ALIGN_LEFT);
        footer.addCell(left);

        PdfPCell right = new PdfPCell(new Phrase("ID: " + value(estudante.getNumeroEstudante()), font(7, Font.BOLD, MUTED)));
        right.setBorder(Rectangle.TOP);
        right.setBorderColor(LINE);
        right.setPadding(10);
        right.setHorizontalAlignment(Element.ALIGN_RIGHT);
        footer.addCell(right);

        return footer;
    }

    private static Paragraph labelValue(String label, String value) {
        Paragraph p = new Paragraph();
        p.setLeading(12f);
        p.add(new Chunk(label + ": ", font(6, Font.BOLD, MUTED)));
        p.add(new Chunk(value(value), font(8, Font.BOLD, new Color(31, 41, 55))));
        return p;
    }

    private static void addInfoCell(PdfPTable table, String label, String text) {
        PdfPCell labelCell = new PdfPCell(new Phrase(label.toUpperCase(), font(8, Font.BOLD, PRIMARY)));
        labelCell.setBorderColor(LINE);
        labelCell.setBackgroundColor(PAPER_BG);
        labelCell.setPadding(10);
        table.addCell(labelCell);

        PdfPCell valueCell = new PdfPCell(new Phrase(value(text), font(10, Font.BOLD, new Color(31, 41, 55))));
        valueCell.setBorderColor(LINE);
        valueCell.setPadding(10);
        table.addCell(valueCell);
    }

    private static Font font(float size, int style, Color color) {
        return FontFactory.getFont(FontFactory.HELVETICA, size, style, color);
    }

    private static String value(String text) {
        return text == null || text.trim().isEmpty() ? "N/A" : text.trim();
    }
}
