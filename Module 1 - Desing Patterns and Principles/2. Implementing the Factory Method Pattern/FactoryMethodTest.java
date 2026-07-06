package DesignPattern.Factory_Method_Pattern;

public class FactoryMethodTest {
    public static void main(String[] args) {
        //creating a Word document 
        DocumentFactory wordFactory = new WordFactory();
        Document wordDoc = wordFactory.createDocument();
        wordDoc.open();

        //creating a PDF document
        DocumentFactory pdfFactory = new PdfFactory();
        Document pdfDoc=pdfFactory.createDocument();
        pdfDoc.open();
        
        //create Excel Document
        DocumentFactory excelFactory = new ExcelFactory();
        Document excelDoc=excelFactory.createDocument();
        excelDoc.open();
    }
}