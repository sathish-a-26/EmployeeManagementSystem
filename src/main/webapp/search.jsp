
<%@ page import="java.sql.*" %>
<%@ page import="connection.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Employee</title>
</head>
<body>

<h2>Search Employee by Department</h2>

<form method="get">

    Enter Department:
    <input type="text" name="department" required>

    <input type="submit" value="Search">

</form>

<br>

<table border="1" cellpadding="10">

<tr>
    <th>Employee ID</th>
    <th>Name</th>
    <th>Age</th>
    <th>Department</th>
    <th>Salary</th>
    <th>Email</th>
</tr>

<%
if(request.getParameter("department") != null) {

    String department = request.getParameter("department");

    Connection con = DBConnection.getConnection();

    PreparedStatement ps = con.prepareStatement(
        "select * from employee where department=?"
    );

    ps.setString(1, department);

    ResultSet rs = ps.executeQuery();

    boolean found = false;

    while(rs.next()) {

        found = true;
%>

<tr>
    <td><%=rs.getInt("empid")%></td>
    <td><%=rs.getString("name")%></td>
    <td><%=rs.getInt("age")%></td>
    <td><%=rs.getString("department")%></td>
    <td><%=rs.getDouble("salary")%></td>
    <td><%=rs.getString("email")%></td>
</tr>

<%
    }

    if(!found) {
        out.println("<tr><td colspan='6'>No Employees Found</td></tr>");
    }

    rs.close();
    ps.close();
    con.close();
}
%>

</table>

<br>

<a href="display.jsp">View All Employees</a>

</body>
</html>
