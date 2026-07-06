import java.util.ArrayList;

public class Inventory {

    ArrayList<Product> products = new ArrayList<>();

    public void addProduct(Product product) {
        products.add(product);
        System.out.println("Product Added Successfully.");
    }

    public void displayProducts() {
        if (products.isEmpty()) {
            System.out.println("Inventory is Empty.");
            return;
        }

        for (Product p : products) {
            p.display();
        }
    }

    public void searchProduct(int id) {
        for (Product p : products) {
            if (p.productId == id) {
                System.out.println("Product Found");
                p.display();
                return;
            }
        }

        System.out.println("Product Not Found.");
    }
}