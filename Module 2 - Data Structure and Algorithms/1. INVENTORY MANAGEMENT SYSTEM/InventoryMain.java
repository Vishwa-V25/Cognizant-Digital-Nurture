public class InventoryMain {

    public static void main(String[] args) {

        Inventory inventory = new Inventory();

        Product p1 = new Product(101, "Laptop", 5, 65000);
        Product p2 = new Product(102, "Mouse", 20, 700);
        Product p3 = new Product(103, "Keyboard", 15, 1500);

        inventory.addProduct(p1);
        inventory.addProduct(p2);
        inventory.addProduct(p3);

        System.out.println("\nAll Products");
        inventory.displayProducts();

        System.out.println("\nSearching Product...");
        inventory.searchProduct(102);
    }
}