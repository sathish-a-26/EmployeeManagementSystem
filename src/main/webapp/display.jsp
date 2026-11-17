
<%@ page import="java.sql.*" %>
<%@ page import="connection.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Employees</title>
</head>
<body>

<h2>All Employee Details</h2>

<table border="1" cellpadding="10">

<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Age</th>
    <th>Department</th>
    <th>Salary</th>
    <th>Email</th>
    <th>Action</th>
</tr>

<%
Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
    "select * from employee"
);

ResultSet rs = ps.executeQuery();

while(rs.next()) {
%>

<tr>

    <td><%=rs.getInt("empid")%></td>
    <td><%=rs.getString("name")%></td>
    <td><%=rs.getInt("age")%></td>
    <td><%=rs.getString("department")%></td>
    <td><%=rs.getDouble("salary")%></td>
    <td><%=rs.getString("email")%></td>

    <td>
        <a href="update.jsp?id=<%=rs.getInt("empid")%>">
            Update
        </a>

        |

        <a href="delete.jsp?id=<%=rs.getInt("empid")%>"
           onclick="return confirm('Are you sure you want to delete?')">
            Delete
        </a>
    </td>

</tr>

<%
}

rs.close();
ps.close();
con.close();
%>

</table>

<br>

<a href="register.jsp">Add New Employee</a>

</body>
</html>
