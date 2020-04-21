<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>


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

    <!-- Page Content -->
    <div class="content">

        <div class="container">
            <div class="row">

                <div class="offset-md-3 col-md-8">

                    <div class="panel panel-primary">

                        <div class="panel-heading">
                            <h4>Sign Up - Address</h4>
                        </div>

                        <div class="panel-body">

                            <%--@elvariable id="billing" type=""--%>
                            <sf:form
                                    method="POST"
                                    class="form-horizontal"
                                    id="billingForm"
                                    modelAttribute="billing"
                            >


                            <div class="form-group">
                                <label class="control-label col-md-4" for="addressLineOne">Address Line One:</label>
                                <div class="col-md-8">
                                    <sf:input type="text" path="addressLineOne" class="form-control"
                                              placeholder="Enter Address Line One" />
                                    <sf:errors path="addressLineOne" cssClass="help-block" element="em"/>

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4" for="addressLineTwo">Address Line Two:</label>
                                <div class="col-md-8">
                                    <sf:input type="text" path="addressLineTwo" class="form-control"
                                              placeholder="Enter Address Line Two" />
                                    <sf:errors path="addressLineTwo" cssClass="help-block" element="em"/>

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4" for="city">City:</label>
                                <div class="col-md-8">
                                    <sf:input type="text" path="city" class="form-control"
                                              placeholder="Enter City Name" />
                                    <sf:errors path="city" cssClass="help-block" element="em"/>

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4" for="postalCode">Postal Code:</label>
                                <div class="col-md-8">
                                    <sf:input type="text" path="postalCode" class="form-control"
                                              placeholder="XXXXXX" />
                                    <sf:errors path="postalCode" cssClass="help-block" element="em"/>

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4" for="state">State:</label>
                                <div class="col-md-8">
                                    <sf:input type="text" path="state" class="form-control"
                                              placeholder="Enter State Name" />
                                    <sf:errors path="state" cssClass="help-block" element="em"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4" for="country">Country:</label>
                                <div class="col-md-8">
                                    <sf:input type="text" path="country" class="form-control"
                                              placeholder="Enter Country Name" />
                                    <sf:errors path="country" cssClass="help-block" element="em"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group offset-2">
                        <div style="float: left; width: 49%;">
                            <!-- submit button inside the form -->
                            <button type="submit" name="_eventId_personal" class="btn btn-info">
                                Previous
                            </button>
                            <div style="float: right; width: 49%;">
                                <!-- submit button inside the form -->
                                <button type="submit" name="_eventId_confirm" class="btn btn-primary">
                                    Next
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </sf:form>
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
