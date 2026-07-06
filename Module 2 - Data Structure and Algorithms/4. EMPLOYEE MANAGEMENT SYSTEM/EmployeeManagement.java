public class EmployeeManagement {

    Employee[] employees;
    int count;

    public EmployeeManagement(int size) {
        employees = new Employee[size];
        count = 0;
    }

    public void addEmployee(Employee employee) {
        if (count < employees.length) {
            employees[count++] = employee;
            System.out.println("Employee Added Successfully");
        } else {
            System.out.println("Employee List is Full");
        }
    }

    public void displayEmployees() {
        System.out.println("\nEmployee Details");
        for (int i = 0; i < count; i++) {
            employees[i].display();
        }
    }

    public void searchEmployee(int id) {
        for (int i = 0; i < count; i++) {
            if (employees[i].employeeId == id) {
                System.out.println("\nEmployee Found");
                employees[i].display();
                return;
            }
        }
        System.out.println("Employee Not Found");
    }

    public void deleteEmployee(int id) {
        for (int i = 0; i < count; i++) {
            if (employees[i].employeeId == id) {

                for (int j = i; j < count - 1; j++) {
                    employees[j] = employees[j + 1];
                }

                employees[count - 1] = null;
                count--;

                System.out.println("Employee Deleted Successfully");
                return;
            }
        }

        System.out.println("Employee Not Found");
    }
}