<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sporty Shoes</title>
</head>
<body>
<h2>List of Users</h2>
<br/>
<form method="post">
  <input type="text" name="prefix" placeholder="Enter User Name"/>
  <button type="submit">Search</button>
</form>
<br/><br/>
<table border="2px">
  <tr>
  	<th>FirstName</th>
  	<th>LastName</th>
  	<th>MobileNo</th>
  	<th>Username</th>
  	<th>City</th>
  	<th>State</th>
  	<th>Pincode</th>
  </tr>
<c:if test="${not empty param.prefix}">
<c:forEach items="${user_list}" var="user">
  <c:if test="${fn:startsWith(fn:toLowerCase(user.fname), fn:toLowerCase(param.prefix))}">
     <tr>
     	<td>${user.fname}</td>
     	<td>${user.lname}</td>
     	<td>${user.mobile_no}</td>
     	<td>${user.username}</td>
     	<td>${user.address.city}</td>
     	<td>${user.address.state}</td>
     	<td>${user.address.pincode}</td>
     </tr>
  </c:if>
</c:forEach>
</c:if>
<c:if test="${empty param.prefix}">
<c:forEach items="${user_list}" var="user">
     <tr>
     	<td>${user.fname}</td>
     	<td>${user.lname}</td>
     	<td>${user.mobile_no}</td>
     	<td>${user.username}</td>
     	<td>${user.address.city}</td>
     	<td>${user.address.state}</td>
     	<td>${user.address.pincode}</td>
     </tr>
</c:forEach>
</c:if>
</table>
<br/><br/>
<a href="AdminHome">Home</a>
</body>
</html>