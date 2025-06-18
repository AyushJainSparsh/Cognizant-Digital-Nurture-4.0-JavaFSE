public class FinancialForecast {

    public static double predictFutureValue(double currentValue, double rate, int years) {
        if (years == 0) {
            return currentValue;
        }
        return predictFutureValue(currentValue, rate, years - 1) * (1 + rate);
    }

    public static void main(String[] args) {
        double currentValue = 10000.0;
        double rate = 0.10;
        int years = 5;

        double futureValue = predictFutureValue(currentValue, rate, years);
        System.out.printf("Predicted Value after %d years: %.2f\n", years, futureValue);
    }
}
