
<%@ page import="java.sql.*" %>
<%@ page import="dao.EmployeeDAO" %>
<%@ page import="model.Employee" %>

<%
int empid = Integer.parseInt(request.getParameter("empid"));
String name = request.getParameter("name");
int age = Integer.parseInt(request.getParameter("age"));
String department = request.getParameter("department");
double salary = Double.parseDouble(request.getParameter("salary"));
String email = request.getParameter("email");

Employee e = new Employee(
    empid, name, age, department, salary, email
);

EmployeeDAO dao = new EmployeeDAO();

int result = dao.insertEmployee(e);

if(result > 0) {
%>

<h2>Employee Registered Successfully!</h2>
<a href="display.jsp">View Employees</a>

<%
} else {
    out.println("Employee Registration Failed");
}
%>
