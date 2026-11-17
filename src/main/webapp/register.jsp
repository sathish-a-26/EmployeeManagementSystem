
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Registration</title>
</head>
<body>

<h2>Employee Registration Form</h2>

<form action="insert.jsp" method="post">

    Employee ID:
    <input type="number" name="empid" required>
    <br><br>

    Employee Name:
    <input type="text" name="name" required>
    <br><br>

    Age:
    <input type="number" name="age" required>
    <br><br>

    Department:
    <input type="text" name="department" required>
    <br><br>

    Salary:
    <input type="number" name="salary" required>
    <br><br>

    Email:
    <input type="email" name="email" required>
    <br><br>

    <input type="submit" value="Register">

</form>

</body>
</html>
