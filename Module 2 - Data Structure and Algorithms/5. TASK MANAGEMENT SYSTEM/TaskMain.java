public class TaskMain {

    public static void main(String[] args) {

        TaskLinkedList list = new TaskLinkedList();

        list.addTask(new Task(101, "Design UI", "Pending"));
        list.addTask(new Task(102, "Write Code", "In Progress"));
        list.addTask(new Task(103, "Testing", "Completed"));

        System.out.println("Task List");
        list.displayTasks();

        System.out.println("\nSearch Task");
        list.searchTask(102);

        System.out.println("\nDelete Task");
        list.deleteTask(102);

        System.out.println("\nUpdated Task List");
        list.displayTasks();
    }
}