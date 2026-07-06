import java.util.Arrays;
import java.util.Comparator;

public class SearchMain {

    public static void main(String[] args) {

        Product[] products = {
                new Product(103, "Keyboard", 1500),
                new Product(101, "Laptop", 65000),
                new Product(104, "Monitor", 12000),
                new Product(102, "Mouse", 700)
        };

        System.out.println("Linear Search");

        Product result = LinearSearch.search(products, 102);

        if (result != null)
            result.display();
        else
            System.out.println("Product Not Found");

        Arrays.sort(products, Comparator.comparingInt(p -> p.productId));

        System.out.println("\nBinary Search");

        result = BinarySearch.search(products, 102);

        if (result != null)
            result.display();
        else
            System.out.println("Product Not Found");
    }
}