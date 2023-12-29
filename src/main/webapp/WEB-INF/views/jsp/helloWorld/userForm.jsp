<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Spring MVC Handling</title>
<head>

    <link rel="stylesheet" type="text/css" href='${pageContext.request.getContextPath()}/webjars/bootstrap/5.1.3/css/bootstrap.min.css' />
    <script type="text/javascript" src="${pageContext.request.getContextPath()}/webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.getContextPath()}/resources/js/main.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>User Registration Form</title>
    <style>
    <%@include file="/resources/css/main.css" %>
    </style>
    <jsp:include page="header.jsp" />


</head>
<body>
	<div class ="contain pt-10">
	    <h2>User Registration Form</h2>
        	<mvc:form modelAttribute="user" action="result">
                    <table>
                        <tr>
                            <td>First Name (*)</td>
                            <td><mvc:input path="name" class="form-control" required="true" placeholder="First Name"/></td>
                        </tr>
                        <tr>
                            <td>Last Name (*)</td>
                            <td><mvc:input path="lastname" class="form-control" required="true" placeholder="Last Name"/></td>
                        </tr>
                        <tr>
                            <td>Password (*)</td>
                            <td><mvc:password path="password" class="form-control" required="true" placeholder="Password"/></td>
                        </tr>
                        <tr>
                            <td>Detail</td>
                            <td><mvc:textarea path="detail" class="form-control" placeholder="Detail information"/></td>
                        </tr>
                        <tr>
                            <td>Birth Date</td>
                            <td><mvc:input path="birthDate" type="Date"/></td>
                        </tr>
                        <tr>
                            <td>Country</td>
                            <td><mvc:select path="country" class="form-label" items="${country}"/></td>
                        </tr>
                        <tr>
                            <td>Non Smoking</td>
                            <td><mvc:checkbox path="nonSmoking" class="form-check-label" checked="true"/></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" class="btn btn-primary" value="Submit"  onclick="welcome()"/>
                            </td>
                        </tr>
                    </table>
            </mvc:form>
	</div>

</body>
</html>