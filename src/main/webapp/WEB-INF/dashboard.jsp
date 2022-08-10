<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script type="text/javascript" src="js/main.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<a href="/logout">Logout</a>
	<a href="/socialsnacks/profile/${user.id}">Profile</a>

	<h1>Welcome, ${user.name}</h1>
	
	<table class="table">
		<thead>
			<tr>
				<th>Name</th>
				<th>Price</th>
				<th>Flavor</th>
				<th>Description</th>
				<th>Uploaded By</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="snack" items="${snacks}">
				<tr>
					<td><a href="/socialsnacks/show/${snack.id}">${snack.name}</a></td>
					<td>$${snack.price}</td>
					<td>${snack.flavor.name}</td>
					<td>${snack.description}</td>
					<td>${snack.user.name}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<a href="/socialsnacks/new">Add a New Snack</a>
	
</body>
</html>