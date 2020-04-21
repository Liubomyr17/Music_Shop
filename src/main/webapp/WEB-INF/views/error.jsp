<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:url var="css" value="/resources/css/" />

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

</head>

<body>

<div class="wrapper">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="${contextRoot}/home">Home</a>
    </div>
</nav>
    </div>

<div class="content">

    <div class="container">

        <div class="row">

            <div class="col-xs-12">


                <div class="jumbotron">

                    <h1>${errorTitle}</h1>
                    <hr/>

                    <blockquote style="word-wrap:break-word">

                        ${errorDescription}
                        <hr/>

                    </blockquote>

                </div>


            </div>

        </div>

    </div>

</div>


<%@include file="./shared/footer.jsp" %>

</div>


</body>


</html>