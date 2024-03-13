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
<title>Details Page for Viewer</title>
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
      
         
           <h5><c:out value="${book.title}"></c:out></h5>
           <p>Added by: <c:out value="${book.author.firstName} ${book.author.lastName}"></c:out> 
           <br></p>
            <p>Added on:<fmt:formatDate  value="${book.createdAt}" pattern="MMM dd, yyyy '@'h:mm a"/>
           <br></p>
           <p>Last updated on:<fmt:formatDate value="${book.updatedAt}" pattern="MMM dd, yyyy '@'h:mm a"/>
           <br></p>
          <p>Description: <c:out value="${book.description}"></c:out></p>
        </div>
 

 
    <div class="col-sm-6 ">
        <h4>Users Who like This Book</h4>
        <div>
           <c:forEach items="${book.users}" var="favuser">
                    <li><c:out value="${favuser.firstName} ${favuser.lastName}"/>  
          </c:forEach>
        </div>
        <div>
         <c:if  test="${!fn:contains(book.users,loggedUser)}">
         <a href="/books/favorites/${book.id}">Add t Favorites</a>
         </c:if> 
      </div>
    </div>
    
  </div>
 
</div>
</body>
</html>