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
	<a href="/socialsnacks/dashboard">Home</a>
	<a href="/socialsnacks/profile/${user.id}">Profile</a>

	<h1>${snack.name}</h1>
	
	<p>Price: $${snack.price}</p>
	<p>Flavor: ${snack.flavor.name}</p>
	<h4>Thoughts: ${snack.description}</h4>
	
	<c:if test="${snack.user.id == user.id}"><a href="/socialsnacks/edit/${snack.id}">Edit Snack</a></c:if>
	
	<c:if test="${snack.user.id == user.id}">
		<form action="/socialsnacks/delete/${snack.id}" method="POST">
			<input type="submit" value="Delete"/>
		</form>
	</c:if>
	
	
</body>
</html>