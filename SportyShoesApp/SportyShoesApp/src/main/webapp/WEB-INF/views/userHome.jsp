<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.example.SportyShoesApp.entity.Product"%>
<%@ page
	import="com.example.SportyShoesApp.repository.ProductRepository"%>
<%@ page import="java.util.Map"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sporty Shoes</title>
</head>
<body>
<table>
<tr>
	<td style="padding-right: 70rem"><h2>Welcome, ${name}!</h2></td>
	<td><a href="/index.html">Logout</a></td>	
</tr>
</table>
<h3>Available Categories</h3>
<c:if test="${not empty errorMsg}">
  <p class="error-message" style="color:red;font-size:1.5rem">${errorMsg}</p>
</c:if>
	<div>
		<c:set var="cartLen" value="${fn:length(cart.keySet())}" />
		<span style="float: right;font-weight: bold">Cart Items:${cartLen}</span>
	</div>
	<ul>
		<li><a href="/Category?category=Sneakers">Sneakers</a></li>
		<li><a href="/Category?category=Sports">Sports Shoes</a></li>
		<li><a href="/Category?category=Heels">Heels</a></li>
		<li><a href="/Category?category=Sandals">Sandals</a></li>
		<li><a href="/Category?category=Slippers">Slippers</a></li>
		<li><a href="/Category?category=Skates">Skating Shoes</a></li>
		<li><a href="/Category?category=Boots">Rain Boots</a></li>
		<li><a href="/Category?category=Office">Office Shoes</a></li>
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
							<td>
							<form action="updateCart?id=${product.id}" method="post">
								<input type="hidden" name="action" value="add" />
								<input type="submit" value="+" /> 
							</form>
							<c:out value="${cart[product.id]}" />
							<form action="updateCart?id=${product.id}" method="post">
								<input type="hidden" name="action" value="remove" />
  								<input type="submit" value="--" />
  							</form>
  							</td>
						</tr>
					</c:forEach>
			</table>
		</c:if>
	</div>
	<a href="Checkout/payment?cart_len=${cartLen}">Proceed to checkout</a>
</body>
</html>