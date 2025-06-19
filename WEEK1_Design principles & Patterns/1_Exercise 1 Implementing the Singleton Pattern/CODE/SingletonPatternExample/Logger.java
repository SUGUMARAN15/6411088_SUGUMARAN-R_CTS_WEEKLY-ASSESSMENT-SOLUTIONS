package SingletonPatternExample;

/**
 * Logger class implementing Singleton Design Pattern
 */
public class Logger {
    
    // Private static instance of Logger (Eager Initialization)
    private static Logger instance = new Logger();

    /**
     * Private constructor to prevent instantiation from other classes
     */
    private Logger() {
        System.out.println("Logger instance created");
    }

    /**
     * Public static method to provide global point of access to the instance
     * 
     * @return single instance of Logger
     */
    public static Logger getInstance() {
        return instance;
    }

    /**
     * Method to perform logging
     * 
     * @param message - The message to be logged
     */
    public void log(String message) {
        System.out.println("Log: " + message);
    }
}