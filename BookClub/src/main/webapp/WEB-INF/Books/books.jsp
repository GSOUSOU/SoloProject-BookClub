<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Club</title>
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
        <h4>Add a New Book</h4>
        <form:form action="/createbook" method="post" modelAttribute="book">
          <div class="form-group row row my-3">
            <label  for="title" class="col-sm-2 col-form-label">Title:</label>
            <div class="col-sm-10">
             <form:input class="form-control form-control-lg" path="title"/>
             <form:errors path="title" class="text-danger"/>
            
           </div>
          </div>
    
         <div class="form-group row row my-3">
           <label class="col-sm-2 col-form-label" for="description">Description:</label>
           <div class="col-sm-10">
            <form:textarea class="form-control form-control-lg" path="description"/>
            <form:errors path="description" class="text-danger"/>
           
           </div>
        </div>
        <div class="form-group row mt-3">
          <div class="col-sm-10 offset-sm-2">
            <input type="submit" class="btn btn-primary" style="box-shadow: 5px 5px 5px black; border: 2px solid black;" value="Add"/>
           
         </div>
       </div>
     </form:form>
    </div>
    <div class="col-sm-6 ">
        <h4>ALL Books</h4>
        <div>
           <c:forEach items="${favoritesBooks}" var="favbook">
          <a href="/books/${favbook.id}"><c:out value="${favbook.title}"></c:out></a><br />
							(added by
							<c:out value="${favbook.author.firstName} ${favbook.author.lastName}"></c:out>
							) <br>
							<p> this is one of your favorites</p>
          </c:forEach>
        </div>
        <div>
           <c:forEach items="${unfavoritesBooks}" var="unfavbook">
          <a href="/books/${unfavbook.id}"><c:out value="${unfavbook.title}"></c:out></a><br />
							(added by
							<c:out value="${unfavbook.author.firstName} ${unfavbook.author.lastName}"></c:out>
							) <br>
							<p> <a href="/books/favorites/${unfavbook.id}">Add to Favorites</a></p>
          </c:forEach>
        </div>
    </div>
    
  </div>
 
</div>
</body>
</html>