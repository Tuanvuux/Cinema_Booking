<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Spring MVC Handling</title>

    <link rel="stylesheet" type="text/css" href='${pageContext.request.getContextPath()}/webjars/bootstrap/5.1.3/css/bootstrap.min.css' />
        <script type="text/javascript" src="${pageContext.request.getContextPath()}/webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>User Registration Form</title>
        <style>
        <%@include file="/resources/css/main.css" %>
        </style>
        <jsp:include page="header.jsp" />
</head>
<body>
	<h2>User Registration Result</h2>
	<table>
	    <tr>
	        <td>Name</td>
            <td>${user.name}</td>
        </tr>
        <tr>
        	<td>Last name</td>
            <td>${user.lastname}</td>
        </tr>
        <tr>
            <td>Password</td>
            <td>${user.password}</td>
        </tr>
        <tr>
            <td>Detail</td>
            <td>${user.detail}</td>
        </tr>
        <tr>
            <td>Birth Date</td>
            <td>${user.birthDate}</td>
        </tr>
        <tr>
            <td>Gender</td>
            <td>${user.gender}</td>
        </tr>
        <tr>
            <td>Country</td>
            <td>${user.country}</td>
        </tr>
        <tr>
            <td>Non-smoking</td>
            <td>${user.nonSmoking}</td>
        </tr>
    </table>
</body>
</html>