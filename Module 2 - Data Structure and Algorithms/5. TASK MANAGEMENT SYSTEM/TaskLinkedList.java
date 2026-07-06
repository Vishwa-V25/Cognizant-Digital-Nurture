public class TaskLinkedList {

    Node head;

    public void addTask(Task task) {

        Node newNode = new Node(task);

        if (head == null) {
            head = newNode;
            return;
        }

        Node temp = head;

        while (temp.next != null) {
            temp = temp.next;
        }

        temp.next = newNode;
    }

    public void displayTasks() {

        Node temp = head;

        while (temp != null) {
            temp.task.display();
            temp = temp.next;
        }
    }

    public void searchTask(int id) {

        Node temp = head;

        while (temp != null) {

            if (temp.task.taskId == id) {
                System.out.println("Task Found");
                temp.task.display();
                return;
            }

            temp = temp.next;
        }

        System.out.println("Task Not Found");
    }

    public void deleteTask(int id) {

        if (head == null)
            return;

        if (head.task.taskId == id) {
            head = head.next;
            System.out.println("Task Deleted");
            return;
        }

        Node temp = head;

        while (temp.next != null && temp.next.task.taskId != id) {
            temp = temp.next;
        }

        if (temp.next != null) {
            temp.next = temp.next.next;
            System.out.println("Task Deleted");
        } else {
            System.out.println("Task Not Found");
        }
    }
}