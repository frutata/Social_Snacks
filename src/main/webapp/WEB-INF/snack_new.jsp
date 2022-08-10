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

	<h1>New Snack</h1>
	
	<form:form action="/socialsnacks/new" modelAttribute="snack" method="POST">
	
		<form:errors path="name"></form:errors>
		<form:input path="name" placeholder="Name"></form:input>
		
		<form:errors path="price"></form:errors>
		<form:input type="number" min="1" path="price" placeholder="Price $"></form:input>
		
		<form:select path="flavor">
			<c:forEach var="flavor" items="${flavor}">
				<form:option value="${flavor.id}">${flavor.name}</form:option>
			</c:forEach>
		</form:select>
		
		<form:errors path="description"></form:errors>
		<form:textarea rows="3" cols="35" path="description" placeholder="Description"></form:textarea>
		
		<input type="submit" value="Add Snack"/>
		
	</form:form>
	
</body>
</html>