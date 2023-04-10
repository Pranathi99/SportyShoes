<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sporty Shoes</title>
</head>
<body>
<h3>Update Product Details</h3>
	<form action="Products/updateProduct?id=${product.id}" method="post">
		<table>
			<tr>
				<td>Product Category : </td>
				<td><input name="category" value="${product.category}" required="required"/></td>
			</tr>
			<tr>
				<td>Product Name : </td>
				<td><input name="name" value="${product.name}" required="required"/></td>
			</tr>
			<tr>
				<td>Description : </td>
				<td><input name="desc" value="${product.desc}" required="required"/></td>
			</tr>
			<tr>
				<td>Quantity : </td>
				<td><input name="quantity" value="${product.quantity}" required="required"/></td>
			</tr>
			<tr>
				<td>Price : </td>
				<td><input name="price" value="${product.price}" required="required"/></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Submit"/></td>
			</tr>
		</table>
	</form>
	<br/><br/>
	<a href="AdminHome">Home</a>
</body>
</html>