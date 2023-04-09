<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sporty Shoes</title>
</head>
<body>
	<table border="2">
		<tr>
			<th>Id</th>
			<th>Category</th>
			<th>Name</th>
			<th>Description</th>
			<th>Quantity</th>
			<th>Price</th>
		</tr>
		<c:forEach var="product" items="${prod_list}">
			<tr>
			<td><a href="/updateProd?id=${product.id}">${product.id}</a></td>
			<td>${product.category}</td>
			<td>${product.name}</td>
			<td>${product.desc}</td>
			<td>${product.quantity}</td>
			<td>${product.price}</td>
			<td><a href="/deleteProd?id=${product.id}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<a href="/addProd">Add new Product</a>
</body>
</html>