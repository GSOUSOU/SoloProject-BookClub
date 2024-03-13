<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login & Registration</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid mt-3">
 
 
  <div class="row">
     <div class="col-sm-8  ">
     <h2>Registration</h2>
     <form:form action="/register" method="post" modelAttribute="newUser" class="form">
                    <div class="form-group row my-3">
                        <label for="firstName" class="col-sm-2 col-form-label">firstName:</label>
                        <div class="col-sm-10">
                            <form:input path="firstName" id="firstName" class="form-control"/>
                            <form:errors path="firstName" class="text-danger"/>
                        </div>
                    </div>
                    <div class="form-group row my-3">
                        <label for="lastName" class="col-sm-2 col-form-label">lastName:</label>
                        <div class="col-sm-10">
                            <form:input path="lastName" id="lastName" class="form-control"/>
                            <form:errors path="lastName" class="text-danger"/>
                        </div>
                    </div>
                    <div class="form-group row my-3">
                        <label for="email" class="col-sm-2 col-form-label">Email:</label>
                        <div class="col-sm-10">
                            <form:input path="email" id="email" type="email" class="form-control"/>
                            <form:errors path="email" class="text-danger"/>
                        </div>
                    </div>
                    <div class="form-group row my-3">
                        <label for="password" class="col-sm-2 col-form-label">Password:</label>
                        <div class="col-sm-10">
                            <form:input path="password" type="password" id="password" class="form-control"/>
                            <form:errors path="password" type="password" class="text-danger"/>
                        </div>
                    </div>
                   <div class="form-group row my-3">
                        <label for="confirm" class="col-sm-2 col-form-label">Confirm PW:</label>
                        <div class="col-sm-10">
                            <form:input path="confirm" id="confirm" class="form-control"/>
                            <form:errors path="confirm"  type="password" class="text-danger"/>
                        </div>
                    </div>
                    <div class="col-sm-12 text-center mt-3">
                        <div class="col-sm-12 text-center">
                            <button type="submit" class="btn btn-secondary">Submit</button>
                        </div>
                    </div>
                </form:form>
     </div>
    <div class="col-sm-4 ">
    <h2>Login</h2>
    <form:form action="/login" method="post" modelAttribute="newLogin">

    				<div class="form-group row my-3">
                        <label for="email" class="col-sm-2 col-form-label">Email:</label>
                        <div class="col-sm-10">
                            <form:input path="email" id="email" type="email" class="form-control"/>
                            <form:errors path="email" class="text-danger"/>
                        </div>
                    </div>
                    <div class="form-group row my-3">
                        <label for="password" class="col-sm-2 col-form-label">Password:</label>
                        <div class="col-sm-10">
                            <form:input path="password" type="password" id="password" class="form-control"/>
                            <form:errors path="password" class="text-danger"/>
                        </div>
                    </div>
                    <div class="col-sm-12 text-center mt-3">
                        <div class="col-sm-12 text-center">
       					 <button type="submit" class="btn btn-secondary btn-block ">Submit</button>
                        </div>
                    </div>
                </form:form>
    </div>
   
  </div>
</div>

</body>
</html>