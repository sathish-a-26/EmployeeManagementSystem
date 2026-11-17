
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.DBConnection;
import model.Employee;

public class EmployeeDAO {

    // 1. Employee Registration
    public int insertEmployee(Employee e) throws Exception {

        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(
            "insert into employee values(?,?,?,?,?,?)"
        );

        ps.setInt(1, e.getEmpid());
        ps.setString(2, e.getName());
        ps.setInt(3, e.getAge());
        ps.setString(4, e.getDepartment());
        ps.setDouble(5, e.getSalary());
        ps.setString(6, e.getEmail());

        int result = ps.executeUpdate();

        con.close();

        return result;
    }

    // 2. Display All Employees
    public ResultSet displayEmployees() throws Exception {

        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(
            "select * from employee"
        );

        return ps.executeQuery();
    }

    // 3. Update Employee
    public int updateEmployee(int id, String department,
                              double salary) throws Exception {

        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(
            "update employee set department=?, salary=? where empid=?"
        );

        ps.setString(1, department);
        ps.setDouble(2, salary);
        ps.setInt(3, id);

        int result = ps.executeUpdate();

        con.close();

        return result;
    }

    // 4. Delete Employee
    public int deleteEmployee(int id) throws Exception {

        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(
            "delete from employee where empid=?"
        );

        ps.setInt(1, id);

        int result = ps.executeUpdate();

        con.close();

        return result;
    }

    // 5. Search Employee by Department
    public ResultSet searchEmployee(String department) throws Exception {

        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(
            "select * from employee where department=?"
        );

        ps.setString(1, department);

        return ps.executeQuery();
    }
}
