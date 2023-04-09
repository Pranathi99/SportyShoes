<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sporty Shoes</title>
</head>
<body>
<h1>Admin Login</h1>
<c:if test="${not empty errorMsg}">
  <p class="error-message" style="color:red;font-size:1.5rem">${errorMsg}</p>
</c:if>
<form action="AdminLogin" method="post">
	<table>
		<tr>
			<td>Username : </td>
			<td><input type="text" name="username" required="required"/></td>
		</tr>
		<tr>
			<td>Password : </td>
			<td><input type="password" name="password" required="required"/></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Login"/></td>
		</tr>
	</table>
</form>
</body>
</html>