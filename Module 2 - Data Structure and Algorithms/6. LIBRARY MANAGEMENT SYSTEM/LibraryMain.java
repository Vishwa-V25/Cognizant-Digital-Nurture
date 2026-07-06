import java.util.Arrays;
import java.util.Comparator;

public class LibraryMain {

    public static void main(String[] args) {

        Book[] books = {
                new Book(103, "Java", "James Gosling"),
                new Book(101, "Python", "Guido van Rossum"),
                new Book(104, "C Programming", "Dennis Ritchie"),
                new Book(102, "Data Structures", "Mark Allen")
        };

        System.out.println("Linear Search");

        Book result = LinearSearch.search(books, 102);

        if (result != null)
            result.display();
        else
            System.out.println("Book Not Found");

        Arrays.sort(books, Comparator.comparingInt(b -> b.bookId));

        System.out.println("\nBinary Search");

        result = BinarySearch.search(books, 102);

        if (result != null)
            result.display();
        else
            System.out.println("Book Not Found");
    }
}