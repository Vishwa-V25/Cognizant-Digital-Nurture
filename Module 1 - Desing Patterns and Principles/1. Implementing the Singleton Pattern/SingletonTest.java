package DesignPattern.Singleton_Pattern;
public class SingletonTest {
    public static void main(String[] args) {
        Logger logger1=Logger.getInstance();
        logger1.log("This is the messege from logger 1 ");
        Logger logger2=Logger.getInstance();
        logger2.log("This is the messege from logger 2 ");
        if(logger1==logger2){
            System.out.println("Both logger1 and logger2 are the same instance.");
        }
        else{
            System.out.println("logger1 and logger2 are different instances.");
        }
    }
}