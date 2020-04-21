<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:url var="css" value="/resources/css/" />
<spring:url var="js" value="/resources/js/" />
<spring:url var="images" value="/resources/images/" />


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="expires" content="-1" />



    <title>Online Shopping - ${title}</title>

    <script>
        window.menu = '${title}';

        window.contextRoot = '${contextRoot}'
    </script>

    <!-- Bootstrap core CSS -->
    <link href="${css}/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap theme CSS -->
    <link href="${css}/bootstrap-simplex-theme.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="${css}/myapp.css" rel="stylesheet">

</head>

<body>
<div class="wrapper">

<!-- Navigation -->
<%@include file="./shared/navbar.jsp"%>

<!-- Page Content -->
    <div class="content">
<!-- Loading home content -->
<c:if test="${userClickHome == true }">
    <%@include file="home.jsp"%>
</c:if>

<!-- Load only when user clicks About -->
<c:if test="${userClickAbout == true }">
    <%@include file="about.jsp"%>
</c:if>

<!-- Load only when user clicks Contact -->
<c:if test="${userClickContact == true }">
    <%@include file="contact.jsp"%>
</c:if>

<!-- Load only when user clicks Contact -->
<c:if test="${userClickAllProducts == true or userClickCategoryProducts == true}">
    <%@include file="listProducts.jsp"%>
</c:if>

<!-- Load only when user clicks show product -->
<c:if test="${userClickShowProduct == true}">
    <%@include file="singleProduct.jsp"%>
</c:if>

<!-- Load only when user clicks manage products -->
<c:if test="${userClickManageProducts == true}">
    <%@include file="manageProducts.jsp"%>
</c:if>

 <!-- Load only when user clicks manage products -->
 <c:if test="${userClickShowCart == true}">
    <%@include file="cart.jsp"%>
 </c:if>



    </div>

<!-- Footer comes here -->
<%@include file="./shared/footer.jsp" %>


<!-- Bootstrap core JavaScript -->
<script src="${js}/jquery.js"></script>
<script src="${js}/bootstrap.min.js"></script>


    <!-- datatable Plugin -->
    <script src="${js}/jquery.dataTables.min.js"></script>
    <script src="${js}/dataTables.bootstrap4.min.js"></script>

    <!-- Bootbox -->
    <script src="${js}/bootbox.all.min.js"></script>
    <script src="${js}/bootbox.locales.min.js"></script>
    <script src="${js}/bootbox.min.js"></script>

    <script src="${js}/jquery.validate.min.js"></script>



    <!-- Self coded javascript -->
<script src="${js}/myapp.js"></script>

</div>
</body>

</html>
