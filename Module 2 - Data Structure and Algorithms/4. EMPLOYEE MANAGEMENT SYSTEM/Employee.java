public class Employee {

    int employeeId;
    String employeeName;
    String department;
    double salary;

    public Employee(int employeeId, String employeeName, String department, double salary) {
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.department = department;
        this.salary = salary;
    }

    public void display() {
        System.out.println(employeeId + " | " + employeeName + " | " + department + " | ₹" + salary);
    }
}