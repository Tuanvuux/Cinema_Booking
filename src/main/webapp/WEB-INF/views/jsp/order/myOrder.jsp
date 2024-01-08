<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="header.jsp" />

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="https://getbootstrap.com/favicon.ico">
    <title>Shopping Cart</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.getContextPath()}/webjars/bootstrap/5.1.3/css/bootstrap.min.css" />
    <script type="text/javascript" src="${pageContext.request.getContextPath()}/webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</head>

<body>

    <h1>My Order List</h1>
    <table class="table">
        <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Customer Name</th>
                <th scope="col">Customer Address</th>
                <th scope="col">Order Details</th>

            </tr>
        </thead>
        <tbody>
            <c:forEach var="order" items="${ordersList}">
                <tr>
                    <td>${order.orderId}</td>
                    <td>${order.customerName}</td>
                    <td>${order.customerAddress}</td>
                    <td>


                        <form action="${pageContext.request.contextPath}/viewOrderDetails/${order.orderId}" method="get">
                            <input type="submit" class="btn btn-sm btn-primary" value="View Order Details" />
                        </form>


                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>



</body>

</html>