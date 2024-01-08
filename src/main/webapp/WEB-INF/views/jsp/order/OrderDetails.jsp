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

    <h1>My Order List Details</h1>
    <table class="table">
        <thead>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Desciption</th>
                <th scope="col">Unit Price </th>
                <th scope="col">Quantity</th>

            </tr>
        </thead>
        <tbody>
            <c:forEach var="orderdetails" items="${orderdetailsList}">
                <tr>
                    <td>${orderdetails.product.productName}</td>
                    <td>${orderdetails.product.productDescription}</td>
                    <td>${orderdetails.product.unitPrice}</td>
                     <td>${orderdetails.quantity}</td>

                </tr>
            </c:forEach>
        </tbody>
    </table>



</body>

</html>