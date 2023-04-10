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
<c:if test="${not empty errorMsg}">
  <p class="error-message" style="color:red;font-size:1.5rem">${errorMsg}</p>
</c:if>
	<form action="UserRegister" method="post">
		<table>
			<tr>
			<td>Firstname:</td>
			<td><input type="text" name="fname" required="required"/></td>
			</tr>
			<tr>
			<td>Lastname:</td>
			<td><input type="text" name="lname" required="required"/></td>
			</tr>
			<tr>
			<td>MobileNo:</td>
			<td><input type="text" name="mobile_no" required="required"/></td>
			</tr>
			<tr>
			<td>Username:</td>
			<td><input type="text" name="username" required="required"/></td>
			</tr>
			<tr>
			<td>Password:</td>
			<td><input type="password" name="password" required="required"/></td>
			</tr>
			<tr>
			<tr>
			<td>City:</td>
			<td><input type="text" name="city" required="required"/></td>
			</tr>
			<tr>
			<tr>
			<td>State:</td>
			<td><input type="text" name="state" required="required"/></td>
			</tr>
			<tr>
			<tr>
			<td>Pincode:</td>
			<td><input type="text" name="pincode" required="required"/></td>
			</tr>
			<tr>
				<td><input type="submit" name="Register"/></td>
			</tr>
		</table>
	</form>
	<a href="userLogin">Already a User?Click here to Login</a>
</body>
</html>