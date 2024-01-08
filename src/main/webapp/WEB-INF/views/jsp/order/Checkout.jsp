<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
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

<mvc:form class="mb-3" modelAttribute="customer" action="Checkout" >
    <table>
      <tr>
        <td>Name (*)</td>
        <td><mvc:input class="form-control" path="customerName" required="true" placeholder="Name" /></td>
      </tr>
      <tr>
        <td>Address (*)</td>
        <td><mvc:input class="form-control" path="customerAddress" required="true" placeholder="Address" /></td>
      </tr>
<tr>
  <td colspan="2">
    <input class="btn btn-primary" type="submit" name=""  onclick="welcome()" value="Checkout">
  </td>
</tr>
    </table>
  </mvc:form>


</body>

</html>