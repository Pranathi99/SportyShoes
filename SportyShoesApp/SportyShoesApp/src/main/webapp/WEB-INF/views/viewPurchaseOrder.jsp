<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sporty Shoes</title>
</head>
<body>
	<form method="post">
		<label for="category">Filter by Category:</label> <select
			name="category" onchange="this.form.submit()">
			<option value="">All</option>
			<option value="Sneakers">Sneakers</option>
			<option value="Sports">Sports</option>
			<option value="Heels">Heels</option>
			<option value="Sandals">Sandals</option>
			<option value="Slippers">Slippers</option>
			<option value="Skates">Skates</option>
			<option value="Boots">Boots</option>
			<option value="Office">Office</option>
		</select> <label for="date">Filter by Date:</label>
		 <input type="date" id="date" name="date" onchange="this.form.submit()">
	</form>
	<br />
	<br />
	<c:if test="${empty param.category and empty param.date}">
		<c:forEach items="${order_list}" var="order">
			<table border="2px" style="margin-bottom: 10px">
				<tr>
					<td>
						<table>
							<thead style="font-weight: bold">
								<tr>
									<th>FROM</th>
									<th>SHIP TO</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td contenteditable="true" style="width: 50%">Sporty
										Shoes,<br /> XYZ Land,<br /> XYZ-11122<br /> Contact
										111-222-3335<br />
									</td>
									<td contenteditable="true" style="width: 50%">
										${order.user.fname} ${order.user.lname},<br />
										${order.user.mobile_no},<br /> ${order.user.address.city},
										${order.user.address.state}, ${order.user.address.pincode}
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table border="1px" style="border-collapse: collapse;">
							<tr>
								<th>SNo.</th>
								<th>Description</th>
								<th>Quantity</th>
								<th>Price</th>
								<th>Total</th>
							</tr>
							<tr>
								<td>1</td>
								<td>${order.product.desc}</td>
								<td>${order.product.quantity}</td>
								<td>Rs ${order.product.price}</td>
								<td>Rs ${order.product.price}</td>
							</tr>
						</table>
						<p style="float: right; margin-bottom: 2px">SubTotal : Rs
							${order.product.price}</p> <br /> <br />
						<p style="font-size: 1.2rem; font-weight: bold; float: right;">Total
							: Rs ${order.product.price}</p>
					</td>
				</tr>
			</table>
		</c:forEach>
	</c:if>
	<c:if test="${not empty param.category}">
		<c:forEach items="${order_list}" var="order">
			<c:if test="${order.product.category==param.category}">
				<table border="2px" style="margin-bottom: 10px">
					<tr>
						<td>
							<table>
								<thead style="font-weight: bold">
									<tr>
										<th>FROM</th>
										<th>SHIP TO</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td contenteditable="true" style="width: 50%">Sporty
											Shoes,<br /> XYZ Land,<br /> XYZ-11122<br /> Contact
											111-222-3335<br />
										</td>
										<td contenteditable="true" style="width: 50%">
											${order.user.fname} ${order.user.lname},<br />
											${order.user.mobile_no},<br /> ${order.user.address.city},
											${order.user.address.state}, ${order.user.address.pincode}
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table border="1px" style="border-collapse: collapse;">
								<tr>
									<th>SNo.</th>
									<th>Description</th>
									<th>Quantity</th>
									<th>Price</th>
									<th>Total</th>
								</tr>
								<tr>
									<td>1</td>
									<td>${order.product.desc}</td>
									<td>${order.product.quantity}</td>
									<td>Rs ${order.product.price}</td>
									<td>Rs ${order.product.price}</td>
								</tr>
							</table>
							<p style="float: right; margin-bottom: 2px">SubTotal : Rs
								${order.product.price}</p> <br /> <br />
							<p style="font-size: 1.2rem; font-weight: bold; float: right;">Total
								: Rs ${order.product.price}</p>
						</td>
					</tr>
				</table>
			</c:if>
		</c:forEach>
	</c:if>
	<c:if test="${not empty param.date}">
		<c:forEach items="${order_list}" var="order">
			<c:if test="${order.date_of_purchase==param.date}">
				<table border="2px" style="margin-bottom: 10px">
					<tr>
						<td>
							<table>
								<thead style="font-weight: bold">
									<tr>
										<th>FROM</th>
										<th>SHIP TO</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td contenteditable="true" style="width: 50%">Sporty
											Shoes,<br /> XYZ Land,<br /> XYZ-11122<br /> Contact
											111-222-3335<br />
										</td>
										<td contenteditable="true" style="width: 50%">
											${order.user.fname} ${order.user.lname},<br />
											${order.user.mobile_no},<br /> ${order.user.address.city},
											${order.user.address.state}, ${order.user.address.pincode}
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table border="1px" style="border-collapse: collapse;">
								<tr>
									<th>SNo.</th>
									<th>Description</th>
									<th>Quantity</th>
									<th>Price</th>
									<th>Total</th>
								</tr>
								<tr>
									<td>1</td>
									<td>${order.product.desc}</td>
									<td>${order.product.quantity}</td>
									<td>Rs ${order.product.price}</td>
									<td>Rs ${order.product.price}</td>
								</tr>
							</table>
							<p style="float: right; margin-bottom: 2px">SubTotal : Rs
								${order.product.price}</p> <br /> <br />
							<p style="font-size: 1.2rem; font-weight: bold; float: right;">Total
								: Rs ${order.product.price}</p>
						</td>
					</tr>
				</table>
			</c:if>
		</c:forEach>
	</c:if>
</body>
</html>