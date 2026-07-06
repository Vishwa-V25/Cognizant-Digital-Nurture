public class EmployeeMain {

    public static void main(String[] args) {

        EmployeeManagement management = new EmployeeManagement(10);

        management.addEmployee(new Employee(101, "Shyam", "IT", 50000));
        management.addEmployee(new Employee(102, "Rahul", "HR", 40000));
        management.addEmployee(new Employee(103, "Priya", "Finance", 55000));

        management.displayEmployees();

        management.searchEmployee(102);

        management.deleteEmployee(102);

        management.displayEmployees();
    }
}