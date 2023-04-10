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
<h3>Add Flight Details</h3>
<form action="Products/addProduct" method="post">
		<table>
			<tr>
				<td>Product Category : </td>
				<td><input name="category" required="required"/></td>
			</tr>
			<tr>
				<td>Product Name : </td>
				<td><input name="name" required="required"/></td>
			</tr>
			<tr>
				<td>Description : </td>
				<td><input name="desc" required="required"/></td>
			</tr>
			<tr>
				<td>Quantity : </td>
				<td><input name="quantity" required="required"/></td>
			</tr>
			<tr>
				<td>Price</td>
				<td><input name="price" required="required"/></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Add"/></td>
			</tr>
		</table>
		<br/><br/>
		<a href="AdminHome">Home</a>
</body>
</html>