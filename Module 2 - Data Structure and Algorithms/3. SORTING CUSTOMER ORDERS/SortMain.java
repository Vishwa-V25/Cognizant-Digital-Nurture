public class SortMain {

    public static void main(String[] args) {

        Order[] orders = {
                new Order(101, "Shyam", 5500),
                new Order(102, "Rahul", 3200),
                new Order(103, "Priya", 8700),
                new Order(104, "Arun", 2500)
        };

        System.out.println("Before Sorting");

        for (Order order : orders)
            order.display();

        BubbleSort.sort(orders);

        System.out.println("\nAfter Bubble Sort");

        for (Order order : orders)
            order.display();

        QuickSort.sort(orders, 0, orders.length - 1);

        System.out.println("\nAfter Quick Sort");

        for (Order order : orders)
            order.display();
    }
}