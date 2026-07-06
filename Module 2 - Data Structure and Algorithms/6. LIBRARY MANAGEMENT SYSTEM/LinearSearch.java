public class LinearSearch {

    public static Book search(Book[] books, int id) {

        for (Book book : books) {
            if (book.bookId == id) {
                return book;
            }
        }

        return null;
    }
}