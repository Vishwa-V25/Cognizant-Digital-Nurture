package DesignPattern.Factory_Method_Pattern;

public class WordFactory extends DocumentFactory {
    @Override
    public Document createDocument() {
        return new WordDocument();
    }
    
}