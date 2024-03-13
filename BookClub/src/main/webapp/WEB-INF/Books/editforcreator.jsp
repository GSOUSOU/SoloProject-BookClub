<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@ page isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Details Page for Creator</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid mt-3">
  <div class="row justify-content-center">
    <div class="col-sm-8 ">
      <h3>welcome, ${loggedUser.getFirstName() }!</h3>
    </div>
    <div class="col-sm-4 ">
      <a href="/logout">Log Out</a>
    </div>
    <hr>
  </div>
 
  
  <div class="row">
    <div class="col-sm-6  ">

        <form:form method="post" action="/book/${id}"  modelAttribute="book">
          <input type="hidden" name="_method" value="put">
         
            <div class="col-sm-10">
             <form:input class="form-control border-dark d-inline-block w-auto" path="title" value="${book.title}" readonly="true"/>
             <form:errors path="title" class="text-danger"/>
           </div>
           <p>Added by: <c:out value="${book.author.firstName} ${book.author.lastName}"></c:out> 
           <br></p>
            <p>Added on: <fmt:formatDate  value="${book.createdAt}" pattern="MMM dd, yyyy '@'h:mm a"/>
           <br></p>
           <p>Last updated on: <fmt:formatDate value="${book.updatedAt}" pattern="MMM dd, yyyy '@'h:mm a"/>
           <br></p>
         <div class="form-group row row my-3">
           <label class="col-sm-2 col-form-label" for="description">Description:</label>
           <div class="col-sm-10">
            <form:textarea class="form-control" path="description" value="${book.description}"/>
            <form:errors path="description" class="text-danger"/>
           
           </div>
        </div>
       <div class="d-inline-flex">
         <button class="btn btn-primary w-auto" type="submit" style="box-shadow: 5px 5px 5px black; border: 2px solid black;">Update</button>
          
       </div>
     </form:form>
       <form action="/books/${book.id}/delete" method="post">
            <input type="hidden" name="_method" value="delete">
            <input type="submit" value="Delete" class="btn btn-danger" style="box-shadow: 5px 5px 5px black">
          </form>
 
    </div>
 
    <div class="col-sm-6 ">
        <h4>Users Who like This Book</h4>
        <div>
           <c:forEach items="${book.users}" var="favuser">
                    <li><c:out value="${favuser.firstName} ${favuser.lastName}"/>
                    <c:if test="${favuser.id == book.author.id}">
                      <c:if  test="${fn:contains(book.users,loggedUser)}">
		                <a href="/books/unfavorite/${book.id}">Un-Favorite</a>
		                </c:if> 
					</c:if>  
          </c:forEach>
        </div>
     
    </div>
    
  </div>
 
</div>
</body>
</html>