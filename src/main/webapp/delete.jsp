
<%@ page import="java.sql.*" %>
<%@ page import="connection.DBConnection" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
    "delete from employee where empid=?"
);

ps.setInt(1, id);

int result = ps.executeUpdate();

ps.close();
con.close();

if(result > 0) {
    response.sendRedirect("display.jsp");
} else {
    out.println("Employee Not Found");
}
%>
