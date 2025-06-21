public class SingletonPatternExample {

    // Singleton Logger class
    static class Logger {
        private static Logger instance;

        private Logger() {
            System.out.println("Logger instance created");
        }

        public static Logger getInstance() {
            if (instance == null) {
                instance = new Logger();
            }
            return instance;
        }

        public void log(String message) {
            System.out.println("Log: " + message);
        }
    }

    public static void main(String[] args) {
        // First instance
        Logger logger1 = Logger.getInstance();
        logger1.log("First log message");

        // Second instance (actually same instance)
        Logger logger2 = Logger.getInstance();
        logger2.log("Second log message");

        // Verifying both instances are same
        if (logger1 == logger2) {
            System.out.println("Only one instance of Logger is used.");
        } else {
            System.out.println("Multiple instances exist!");
        }
    }
}
