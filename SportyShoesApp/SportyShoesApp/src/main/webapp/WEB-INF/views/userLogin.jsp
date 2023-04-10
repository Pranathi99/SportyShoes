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
<h2>User Login</h2>
<c:if test="${not empty errorMsg}">
  <p class="error-message" style="color:red;font-size:1.5rem">${errorMsg}</p>
</c:if>
	<form action="UserLogin" method="post">
		<table>
			<tr>
			<td>Username:</td>
			<td><input type="text" name="Username" required="required"/></td>
			</tr>
			<tr>
			<td>Password:</td>
			<td><input type="password" name="Password" required="required"/></td>
			</tr>
			<tr>
				<td><input type="submit" name="Register"/></td>
			</tr>
		</table>
	</form>
	<a href="userRegister">New User?Click here to Register</a><br/><br/>
	<a href="index.html">Home</a>
</body>
</html>