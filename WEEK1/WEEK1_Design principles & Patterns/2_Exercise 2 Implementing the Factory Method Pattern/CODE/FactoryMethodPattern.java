public class FactoryMethodPattern {

    // Abstract Product
    abstract static class Document {
        public abstract void open();
    }

    // Concrete Products
    static class WordDocument extends Document {
        public void open() {
            System.out.println("Opening a Word document");
        }
    }

    static class PdfDocument extends Document {
        public void open() {
            System.out.println("Opening a PDF document");
        }
    }

    static class ExcelDocument extends Document {
        public void open() {
            System.out.println("Opening an Excel document");
        }
    }

    // Abstract Factory
    abstract static class DocumentFactory {
        public abstract Document createDocument();
    }

    // Concrete Factories
    static class WordDocumentFactory extends DocumentFactory {
        public Document createDocument() {
            return new WordDocument();
        }
    }

    static class PdfDocumentFactory extends DocumentFactory {
        public Document createDocument() {
            return new PdfDocument();
        }
    }

    static class ExcelDocumentFactory extends DocumentFactory {
        public Document createDocument() {
            return new ExcelDocument();
        }
    }

    // Main Method
    public static void main(String[] args) {
        DocumentFactory wordFactory = new WordDocumentFactory();
        Document wordDoc = wordFactory.createDocument();
        wordDoc.open();

        DocumentFactory pdfFactory = new PdfDocumentFactory();
        Document pdfDoc = pdfFactory.createDocument();
        pdfDoc.open();

        DocumentFactory excelFactory = new ExcelDocumentFactory();
        Document excelDoc = excelFactory.createDocument();
        excelDoc.open();
    }
}
