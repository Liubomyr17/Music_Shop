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
    <nav class="navbar navbar-inverse navbar-dark bg-dark fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="${contextRoot}/home">Online Shopping</a>
            </div>
        </div>
    </nav>
    <!-- Page Content -->
    <div class="content">

        <div class="container">
            <%-- this will be displayed if the credentials are wrong --%>
            <c:if test="${not empty message}">
                <div class="row">
                <div class="col-xs-12 offset-md-3 col-md-6">
                    <div class="alert alert-danger">${message}</div>
                </div>
                </div>
            </c:if>

                <%-- this will be displayed only when user has logged out --%>
                <c:if test="${not empty logout}">
                    <div class="row">
                        <div class="col-xs-12 offset-md-3 col-md-6">
                            <div class="alert alert-success">${logout}</div>
                        </div>
                    </div>
                </c:if>

            <div class="row">

                <div class="offset-md-4 col-md-6">

                    <div class="panel panel-primary">

                        <div class="panel-heading">
                            <h4>Login</h4>
                        </div>

                        <div class="panel-body">
                            <form action="${contextRoot}/login" method="POST" class="form-horizontal"
                                  id="loginForm"
                            >
                                <div class="form-group">
                                    <label for="username" class="col-md-4 control-label">Email: </label>
                                    <div class="col-md-8">
                                        <input type="text" name="username" id="username" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-md-4 control-label">Password: </label>
                                    <div class="col-md-8">
                                        <input type="password" name="password" id="password" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-offset-4 col-md-8">
                                        <input type="submit" value="Login" class="btn btn-primary"/>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    </div>
                                </div>
                            </form>

                        </div>
                        <div class="panel-footer">
                            <div class="offset-md-4">
                                New User - <a href="${contextRoot}/register">Register Here</a>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </div>

    <!-- Footer comes here -->
    <%@include file="./shared/footer.jsp" %>


    <!-- Bootstrap core JavaScript -->
    <script src="${js}/jquery.js"></script>
    <script src="${js}/bootstrap.min.js"></script>
    <script src="${js}/jquery.validate.min.js"></script>
    <!-- Self coded javascript -->
    <script src="${js}/myapp.js"></script>

</div>
</body>

</html>
