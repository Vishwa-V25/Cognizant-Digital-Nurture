public class BinarySearch {

    public static Book search(Book[] books, int id) {

        int low = 0;
        int high = books.length - 1;

        while (low <= high) {

            int mid = (low + high) / 2;

            if (books[mid].bookId == id)
                return books[mid];

            if (books[mid].bookId < id)
                low = mid + 1;
            else
                high = mid - 1;
        }

        return null;
    }
}
