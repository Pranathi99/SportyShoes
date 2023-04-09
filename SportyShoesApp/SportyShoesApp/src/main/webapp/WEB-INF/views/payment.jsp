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
	<form action="receipt?id=${id}" method="post">
		<h1>Enter Payment Details:</h1>
		<table>
			<tr>
				<td>Name on Card : </td>
				<td><input type="text" name="cardname" placeholder="ABC" required="required"></td>
		    </tr>
		    <tr>
		    	<td>Credit card number : </td>
		    	<td><input type="text" name="cardnumber" placeholder="1111-2222-3333-4444" required="required"></td>
		    </tr>
		    <tr>
		    	<td>Exp Date : </td>
		    	<td><input type="text" name="expdate" placeholder="01/01" required="required"></td>
		    </tr>
		    <tr>
		    	<td>CVV : </td>
		    	<td><input type="text" name="cvv" placeholder="352" required="required"></td>
		    </tr>
		    <tr>
		    	<td></td>
		    	<td><input type="submit" value="Submit"/></td>
		    </tr>
	    </table>
    </form>
    <br/>
    <a href="userHome.html">Home</a>
</body>
</html>