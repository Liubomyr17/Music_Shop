<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--@elvariable id="registerModel" type="net.kzn.onlineshopping.model.RegisterModel"--%>


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
                <a class="navbar-brand" href="${contextRoot}/home">Home</a>
            </div>
        </div>
    </nav>
    <br/>
    <br/>

    <!-- Page Content -->
    <div class="content">

        <div class="container">
            <div class="row">
                <br/>
                <!-- column to display the personal details -->
                <div class="col-sm-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>Personal Details</h4>
                        </div>
                        <div class="panel-body">

                            <div class="text-center">
                                <h4>Name : <strong>${registerModel.user.firstName} ${registerModel.user.lastName}</strong></h4>
                                <h4>Email : <strong>${registerModel.user.email}</strong></h4>
                                <h4>Contact Number: <strong>${registerModel.user.contactNumber}</strong></h4>
                                <h4>Role : <strong>${registerModel.user.role}</strong></h4>
                            </div>

                        </div>
                        <div class="panel-footer">
                            <!-- anchor to move to the edit of personal details -->
                            <a href="${flowExecutionUrl}&_eventId_personal" class="btn btn-info">Edit</a>

                        </div>
                    </div>

                </div>

                <!-- column to display the address  -->
                <div class="col-sm-6">

                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>Billing Address</h4>
                        </div>
                        <div class="panel-body">
                            <!-- code to display the communication address -->
                            <div class="text-center">
                                <p>${registerModel.billing.addressLineOne}, </p>
                                <p>${registerModel.billing.addressLineTwo}, </p>
                                <p>${registerModel.billing.city} -  ${registerModel.billing.postalCode}, </p>
                                <p>${registerModel.billing.state} - ${registerModel.billing.country}</p>
                            </div>

                        </div>
                        <div class="panel-footer">
                            <!-- anchor to move to the edit of address -->
                            <a href="${flowExecutionUrl}&_eventId_billing" class="btn btn-info">Edit</a>
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <br/>
        <br/>
        <br/>

        <!-- to provide the confirm button after displaying the details -->
        <div class="row">
            <div class="col-sm-4 offset-md-4">

                <div class="text-center">

                    <a href="${flowExecutionUrl}&_eventId_submit" class="btn btn-primary">Confirm</a>

                </div>

            </div>
        </div>
        <br/>
        <br/>
        <br/>

        <%@include file="../shared/flows-footer.jsp" %>

        <!-- Bootstrap core JavaScript -->
        <script src="${js}/jquery.js"></script>
        <script src="${js}/bootstrap.min.js"></script>
        <script src="${js}/jquery.validate.min.js"></script>
        <!-- Self coded javascript -->
        <script src="${js}/myapp.js"></script>

    </div>
</div>
</body>

</html>