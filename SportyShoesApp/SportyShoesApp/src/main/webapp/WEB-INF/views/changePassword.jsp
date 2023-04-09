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
	<c:if test="${not empty msg}">
  <p class="success-message" style="color:green;font-size:1.5rem">${msg}</p>
</c:if>
	<form action="ChangePassword" method="post">
		<h3>Enter New Password:</h3>
		<table>
			<tr>
				<td>Username : </td>
				<td><input type="text" name="username" value="admin" readonly="readonly""/></td>
			</tr>
			<tr>
				<td>Password : </td>
				<td><input type="password" name="password" required="required"/></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Submit"/></td>
			</tr>
	</table>
	</form>
	<a href="AdminHome">Back</a>
	
</body>
</html>