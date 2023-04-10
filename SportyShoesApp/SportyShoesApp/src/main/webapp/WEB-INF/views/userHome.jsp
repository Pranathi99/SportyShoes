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
 <ul>
        <li><a href="Category?category=Sneakers">Sneakers</a></li>
        <li><a href="Category?category=Sports">Sports Shoes</a></li>
        <li><a href="Category?category=Heels">Heels</a></li>
        <li><a href="Category?category=Sandals">Sandals</a></li>
        <li><a href="Category?category=Slippers">Slippers</a></li>
        <li><a href="Category?category=Skates">Skating Shoes</a></li>
        <li><a href="Category?category=Boots">Rain Boots</a></li>
        <li><a href="Category?category=Office">Office Shoes</a></li>
    </ul>
    <div>
        <c:if test="${fn:length(product_list)>0}">
		<h3>List of Available Products</h3>
		<table border="2">
			<tr>
				<th>Name</th>
				<th>Description</th>
				<th>Quantity</th>
				<th>Price</th>
			</tr>
			<c:forEach var="product" items="${product_list}">
				<tr>
					<td>${product.name}</td>
					<td>${product.desc}</td>
					<td>${product.quantity}</td>
					<td>${product.price}</td>
					<td><a href="Checkout/payment?id=${product.id}">Select</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
    </div>
</body>
</html>