
package model;

public class Employee {

    private int empid;
    private String name;
    private int age;
    private String department;
    private double salary;
    private String email;

    public Employee(int empid, String name, int age,
            String department, double salary, String email) {

        this.empid = empid;
        this.name = name;
        this.age = age;
        this.department = department;
        this.salary = salary;
        this.email = email;
    }

    public int getEmpid() {
        return empid;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getDepartment() {
        return department;
    }

    public double getSalary() {
        return salary;
    }

    public String getEmail() {
        return email;
    }
}
