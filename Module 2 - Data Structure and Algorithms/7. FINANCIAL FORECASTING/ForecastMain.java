public class ForecastMain {

    public static void main(String[] args) {

        double currentValue = 10000;
        double growthRate = 8;
        int years = 5;

        double futureValue = FinancialForecast.forecast(currentValue, growthRate, years);

        System.out.println("Current Value : ₹" + currentValue);
        System.out.println("Growth Rate : " + growthRate + "%");
        System.out.println("Years : " + years);
        System.out.printf("Future Value : ₹%.2f%n", futureValue);
    }
}