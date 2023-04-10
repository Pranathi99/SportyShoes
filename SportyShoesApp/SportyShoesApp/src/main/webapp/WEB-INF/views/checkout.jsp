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
	<span style="color: green; font-size: 3rem">Purchase Successful!</span>
	<br />
	<h3>Purchase Order Receipt</h3>
	<br/>
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
								<td contenteditable="true" style="width: 50%">Sporty Shoes,<br />
									XYZ Land,<br /> XYZ-11122<br /> Contact 111-222-3335<br />
								</td>
								<td contenteditable="true" style="width: 50%">
									${cart_items.get(0).user.fname}
									${cart_items.get(0).user.lname},<br />
									${cart_items.get(0).user.mobile_no},<br />
									${cart_items.get(0).user.address.city},
									${cart_items.get(0).user.address.state},
									${cart_items.get(0).user.address.pincode}
								</td>
							</tr>
							<tr>
								<td></td>
								<td><label style="font-weight: bold">Date</label> :
									${cart_items.get(0).date_time}</td>
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
						<c:forEach items="${cart_items}" var="order">
							<tr>
								<td>${loop.index+1}</td>
								<td>${order.product.name}</td>
								<td>${order.quantity}</td>
								<td>Rs ${order.product.price}</td>
								<c:set var="total"
									value="${order.product.price * order.quantity}"></c:set>
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
	<a href="/userHome">Home</a>
</body>
</html>