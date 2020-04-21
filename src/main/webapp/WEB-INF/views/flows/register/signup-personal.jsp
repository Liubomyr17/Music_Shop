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
                            <h4>Sign Up - Personal</h4>
                        </div>

                        <div class="panel-body">

                            <%--@elvariable id="user" type=""--%>
                            <sf:form
                                    method="POST"
                                    class="form-horizontal"
                                    id="registerForm"
                                    modelAttribute="user"
                            >


                                <div class="form-group">
                                    <label class="control-label col-md-4">First Name:</label>
                                    <div class="col-md-8">
                                        <sf:input type="text" path="firstName" class="form-control"
                                                  placeholder="First Name" />
                                        <sf:errors path="firstName" cssClass="help-block" element="em"/>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="control-label col-md-4">Last Name:</label>
                                    <div class="col-md-8">
                                        <sf:input type="text" path="lastName" class="form-control"
                                                  placeholder="Last Name" />
                                        <sf:errors path="lastName" cssClass="help-block" element="em"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-4">Email:</label>
                                    <div class="col-md-8">
                                        <sf:input type="text" path="email" class="form-control"
                                                  placeholder="abc@zyx.com" />
                                        <sf:errors path="email" cssClass="help-block" element="em"/>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-4">Contact Number:</label>
                                    <div class="col-md-8">
                                        <sf:input type="text" path="contactNumber" class="form-control"
                                                  placeholder="XXXXXXXXXX" maxlength="50" />
                                        <sf:errors path="contactNumber" cssClass="help-block" element="em"/>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-4">Password:</label>
                                    <div class="col-md-8">
                                        <sf:input type="password" path="password" class="form-control"
                                                  placeholder="Password" />
                                        <sf:errors path="password" cssClass="help-block" element="em"/>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-4">Confirm Password</label>
                                    <div class="col-md-8">
                                        <sf:input type="password" path="confirmPassword" class="form-control"
                                                  placeholder="Re-type password" />
                                        <sf:errors path="confirmPassword" cssClass="help-block" element="em"/>
                                    </div>
                                </div>

                                <!-- radio button using bootstrap class of radio-inline -->
                                <div class="form-group">
                                    <label class="control-label col-md-4">Select Role:</label>
                                    <div class="col-md-8">
                                        <label class="radio-inline">
                                            <sf:radiobutton path="role" value="USER" checked="checked"/> User
                                        </label>
                                        <label class="radio-inline">
                                            <sf:radiobutton path="role" value="SUPPLIER"/> Supplier
                                        </label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="offset-md-6 col-md-8">
                                        <!-- submit button inside the form -->
                                        <button type="submit" name="_eventId_billing" class="btn btn-primary">
                                            Next
                                        </button>
                                    </div>
                                </div>

                            </sf:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
