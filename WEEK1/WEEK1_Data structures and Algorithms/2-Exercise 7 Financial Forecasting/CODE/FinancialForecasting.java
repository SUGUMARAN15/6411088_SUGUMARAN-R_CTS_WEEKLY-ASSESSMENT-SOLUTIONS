public class FinancialForecasting {

    /**
     * Recursive method to calculate future value
     * @param principal - Initial amount
     * @param rate - Annual growth rate (in decimal form, e.g., 5% = 0.05)
     * @param years - Number of years
     * @return - Future value after given years
     */
    public static double calculateFutureValue(double principal, double rate, int years) {
        // Base case
        if (years == 0) {
            return principal;
        }
        // Recursive step
        return (1 + rate) * calculateFutureValue(principal, rate, years - 1);
    }

    public static void main(String[] args) {
        // Sample input
        double principal = 10000;     // Initial investment
        double rate = 0.07;           // 7% annual growth rate
        int years = 5;                // Forecast period

        double futureValue = calculateFutureValue(principal, rate, years);
        System.out.printf("Future value after %d years is: %.2f\n", years, futureValue);
    }
}