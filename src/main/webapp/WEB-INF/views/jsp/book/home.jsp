<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Spring MVC Handling</title>
<head>

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
    <nav class="navbar bg-body-tertiary">
      <div class="container-fluid">
        <form:form class="d-flex" action="search" method="get">
          <input class="form-control me-2" placeholder="Search by name or author">
          <button class="btn btn-outline-success" type="submit">Search</button>
          <button class="btn btn-outline-success" type="submit" style="margin-left: 10px;">Add</button>
        </form:form>
      </div>
    </nav>

    <c:if test="${not empty bookList}">
        <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">ISBN</th>
                        <th scope="col">Price</th>
                        <th scope="col">Publish</th>
                        <th scope="col">Category</th>
                      </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="book" items="${bookList}" varStatus="index">
                            <tr>
                                <th scope="row">${book.id}</th>
                                <td>${book.name}</td>
                                <td>${book.author}</td>
                                <td>${book.bookDetails.isbn}</td>
                                <td>${book.bookDetails.price}</td>
                                <td>${book.bookDetails.publishDate}</td>
                                <td>${book.category.name}</td>
                                <td>
                                    <button type="button" class="btn btn-outline-primary" onclick="location.href='edit/${book.id}'">Edit</button>
                                    <button type="button" class="btn btn-outline-danger" onclick="location.href='delete/${book.id}'">Delete</button>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
        </table>
    </c:if>

    <c:if test="${bookList.size() == 0}">
        <br>
        <div class="alert alert-warning">
            There is no data
        </div>
    </c:if>

</body>
</html>