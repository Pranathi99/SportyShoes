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
<h3>Purchase Orders</h3>
<br/>
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
		</select> <label for="date">Filter by Date:</label> <input type="date"
			id="date" name="date" onchange="this.form.submit()">
	</form>
	<br />
	<br />
	<c:if test="${empty param.category and empty param.date}">
		<c:forEach items="${order_list.entrySet()}" var="order">
			<table border="2px" style="margin-bottom: 10px">
				<tr>
					<td>
						<table style="padding: 10px">
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
										${order.value.get(0).user.fname}
										${order.value.get(0).user.lname},<br />
										${order.value.get(0).user.mobile_no},<br />
										${order.value.get(0).user.address.city},
										${order.value.get(0).user.address.state},
										${order.value.get(0).user.address.pincode}
									</td>
								</tr>
								<tr>
									<td></td>
									<td><label style="font-weight: bold">Date</label> :
										${order.key}</td>
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
							<c:forEach items="${order.value}" var="order_val">
								<tr>
									<td>${loop.index+1}</td>
									<td>${order_val.product.name}</td>
									<td>${order_val.quantity}</td>
									<td>Rs ${order_val.product.price}</td>
									<c:set var="total"
										value="${order_val.product.price * order_val.quantity}"></c:set>
									<td>Rs ${total}</td>
								</tr>
							</c:forEach>
						</table>
						<p style="float: right; margin-bottom: 2px">SubTotal : Rs
							${total}</p> <br /> <br />
						<p style="font-size: 1.2rem; font-weight: bold; float: right;">Total
							: Rs ${total}</p>
					</td>
				</tr>
			</table>
		</c:forEach>
	</c:if>
	<!-- ----------------------------------------------------------------------------------------------------------- -->
	<c:if test="${not empty param.category}">
	<c:set var="breakLoop" value="false"/>
		<c:forEach items="${order_list.entrySet()}" var="order">
			<c:forEach items="${order.value}" var="item" varStatus="index">
				<c:if test="${item.product.category eq param.category and breakLoop==false}">
					<c:set var="breakLoop" value="true"/>
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
												${order.value.get(0).user.fname}
												${order.value.get(0).user.lname},<br />
												${order.value.get(0).user.mobile_no},<br />
												${order.value.get(0).user.address.city},
												${order.value.get(0).user.address.state},
												${order.value.get(0).user.address.pincode}
											</td>
										</tr>
										<tr>
											<td></td>
											<td><label style="font-weight: bold">Date</label> :
												${order.key}</td>
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
									<c:forEach items="${order.value}" var="order_val">
										<tr>
											<td>${loop.index+1}</td>
											<td>${order_val.product.name}</td>
											<td>${order_val.quantity}</td>
											<td>Rs ${order_val.product.price}</td>
											<c:set var="total"
												value="${order_val.product.price * order_val.quantity}"></c:set>
											<td>Rs ${total}</td>
										</tr>
									</c:forEach>
								</table>
								<p style="float: right; margin-bottom: 2px">SubTotal : Rs
									$${total}</p> <br /> <br />
								<p style="font-size: 1.2rem; font-weight: bold; float: right;">Total
									: Rs ${total}</p>
							</td>
						</tr>
					</table>
				</c:if>
			</c:forEach>
		</c:forEach>
	</c:if>
	<!-- ------------------------------------------------------------------------------------------------------- -->
	<c:if test="${not empty param.date}">
		<c:forEach items="${order_list.entrySet()}" var="order">
			<c:if test="${order.value.get(0).date_of_purchase eq param.date}">
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
											${order.value.get(0).user.fname}
											${order.value.get(0).user.lname},<br />
											${order.value.get(0).user.mobile_no},<br />
											${order.value.get(0).user.address.city},
											${order.value.get(0).user.address.state},
											${order.value.get(0).user.address.pincode}
										</td>
									</tr>
									<tr>
										<td></td>
										<td><label style="font-weight: bold">Date</label> :
											${order.key}</td>
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
								<c:forEach items="${order.value}" var="order_val">
									<tr>
										<td>${loop.index+1}</td>
										<td>${order_val.product.name}</td>
										<td>${order_val.quantity}</td>
										<td>Rs ${order_val.product.price}</td>
										<c:set var="total"
											value="${order_val.product.price * order_val.quantity}"></c:set>
										<td>Rs ${total}</td>
									</tr>
								</c:forEach>
							</table>
							<p style="float: right; margin-bottom: 2px">SubTotal : Rs
								${total}</p> <br /> <br />
							<p style="font-size: 1.2rem; font-weight: bold; float: right;">Total
								: Rs ${total}</p>
						</td>
					</tr>
				</table>
			</c:if>
		</c:forEach>
	</c:if>
	<br/><br/>
<a href="AdminHome">Home</a>
</body>
</html>