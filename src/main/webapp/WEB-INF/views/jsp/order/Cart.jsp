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

                <c:if test="${not empty cartList}">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Name</th>
                                <th scope="col">Description</th>
                                <th scope="col">Unit Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cartItem" items="${cartList}">
                                <tr>
                                    <th scope="row">${cartItem.productEntity.productId}</th>
                                    <td>${cartItem.productEntity.productName}</td>
                                    <td>${cartItem.productEntity.productDescription}</td>
                                    <td>${cartItem.productEntity.unitPrice}</td>
                                    <td>${cartItem.quantity}</td>
                                    <td>
                                        <button type="button" class="btn btn-outline-primary"
                                            onclick="location.href='/remove?productId=${cartItem.productEntity.productId}'">Remove from cart</button>

                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                    <center>
                        <button type="button" class="btn btn-outline-primary" onclick="location.href='/checkout'">Checkout</button>
                    </center>
                </c:if>

                <c:if test="${cartList.size() == 0}">
                    <br>
                    <div class="alert alert-warning">
                        There is no data
                    </div>
                </c:if>

            </body>

            </html>