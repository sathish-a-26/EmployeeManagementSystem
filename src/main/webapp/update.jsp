
<%@ page import="java.sql.*" %>
<%@ page import="connection.DBConnection" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

Connection con = DBConnection.getConnection();

if(request.getParameter("update") != null) {

    String department = request.getParameter("department");
    double salary = Double.parseDouble(request.getParameter("salary"));

    PreparedStatement ps = con.prepareStatement(
        "update employee set department=?, salary=? where empid=?"
    );

    ps.setString(1, department);
    ps.setDouble(2, salary);
    ps.setInt(3, id);

    int result = ps.executeUpdate();

    ps.close();
    con.close();

    if(result > 0) {
        response.sendRedirect("display.jsp");
    } else {
        out.println("Employee Not Updated");
    }

    return;
}

PreparedStatement ps = con.prepareStatement(
    "select * from employee where empid=?"
);

ps.setInt(1, id);

ResultSet rs = ps.executeQuery();

if(rs.next()) {
%>

<!DOCTYPE html>
<html>
<head>
<title>Update Employee</title>
</head>
<body>

<h2>Update Employee Details</h2>

<form method="post">

    Employee ID:
    <input type="text" value="<%=rs.getInt("empid")%>" readonly>
    <br><br>

    Employee Name:
    <input type="text" value="<%=rs.getString("name")%>" readonly>
    <br><br>

    Department:
    <input type="text" name="department"
           value="<%=rs.getString("department")%>" required>
    <br><br>

    Salary:
    <input type="number" name="salary"
           value="<%=rs.getDouble("salary")%>" required>
    <br><br>

    <input type="submit" name="update" value="Update">

</form>

</body>
</html>

<%
} else {
    out.println("Employee Not Found");
}

rs.close();
ps.close();
con.close();
%>
