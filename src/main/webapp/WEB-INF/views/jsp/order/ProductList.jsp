<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
            <html>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Spring MVC Handling</title>

            <head>

                <link rel="stylesheet" type="text/css"
                    href='${pageContext.request.getContextPath()}/webjars/bootstrap/5.1.3/css/bootstrap.min.css' />
                <script type="text/javascript"
                    src="${pageContext.request.getContextPath()}/webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>

                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

                <title>User Registration Form</title>
                <style>
                    <%@include file="/resources/css/main.css" %>
                </style>
                <jsp:include page="header.jsp" />


            </head>

            <body>


                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Description</th>
                            <th scope="col">Unit Price</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="productEntity" items="${productList}">
                            <tr>
                                <th scope="row">${productEntity.productId}</th>
                                <td>${productEntity.productName}</td>
                                <td>${productEntity.productDescription}</td>
                                <td>${productEntity.unitPrice}</td>
                                <td>
                                    <button type="button" class="btn btn-outline-primary"
                                        onclick="location.href='add/${productEntity.productId}'">Add to cart</button>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>


                <c:if test="${productList.size() == 0}">
                    <br>
                    <div class="alert alert-warning">
                        There is no data
                    </div>
                </c:if>

            </body>

            </html>