<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="https://getbootstrap.com/favicon.ico">
  <title>Book management demo</title>
  <link rel="stylesheet" type="text/css" href='${pageContext.request.getContextPath()}/webjars/bootstrap/5.1.3/css/bootstrap.min.css' />
  <script type="text/javascript" src="${pageContext.request.getContextPath()}/webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>

</head>
<body>
  <nav class="navbar navbar-inverse navbar-fixed-top">
    <nav style="--bs-breadcrumb-divider: '';" aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/product">Home</a></li>
        <li class="breadcrumb-item active" aria-current="page"><a href="/myCart">My Cart</a></li>
        <li class="breadcrumb-item active" aria-current="page"><a href="/checkout">My Orders</a></li>

      </ol>
    </nav>


    </div>
  </nav>
</body>
</html>