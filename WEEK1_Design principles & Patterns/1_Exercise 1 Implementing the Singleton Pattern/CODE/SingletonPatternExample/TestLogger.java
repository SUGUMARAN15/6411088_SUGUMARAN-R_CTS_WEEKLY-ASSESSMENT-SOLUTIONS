package SingletonPatternExample;

/**
 * Test class to verify Singleton implementation of Logger
 */
public class TestLogger {
    
    public static void main(String[] args) {
        
        // Retrieve first instance of Logger
        Logger logger1 = Logger.getInstance();
        logger1.log("First log message");

        // Retrieve second instance of Logger
        Logger logger2 = Logger.getInstance();
        logger2.log("Second log message");

        // Verify both references point to the same instance
        if (logger1 == logger2) {
            System.out.println("Only one instance of Logger is used.");
        } else {
            System.out.println("Different instances exist!");
        }
    }
}