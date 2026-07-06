public class Product {
    int productId;
    String productName;
    double price;

    public Product(int productId, String productName, double price) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
    }

    public void display() {
        System.out.println(productId + " | " + productName + " | ₹" + price);
    }
}