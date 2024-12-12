<%@page import="ProjectLibrary.dto.Book"%>
<%@page import="ProjectLibrary.dao.addbookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Book</title>
    <link rel="stylesheet" href="addBook.css"> </head>
    <style>
    #message {
    animation: fadeOut 10s forwards;
}

@keyframes fadeOut {
    0% {
        opacity: 1;
    }
    100% {
        opacity: 0;
        visibility: hidden;
    }
    
     
}
    
    </style>
    
<body style="background-image: url('images/new.jpg');background-repeat: no-repeat;background-size: cover;">
   
   <div class="header">
        <a href="facultyHome.jsp" class="back-btn">Back</a>
        
    </div>
   
   
    <% 
     
    int id = Integer.parseInt(request.getParameter("id"));
    addbookDao bDao = new addbookDao();  
    Book book1 = bDao.fetch(id);
    
    String requestMessage = (String)request.getAttribute("book"); 
    if (requestMessage != null) { 
    %>
        <div class="request-message">
            <%= requestMessage %>
        </div>
    <% 
    }
    %>
   
   
   
   <% String name = (String)session.getAttribute("fname"); %>
    <h1 style="color: white;text-transform: uppercase;"><%=name %></h1>

 
    <div class="circular-element">
         
         
     
      
    <form action="UpdateBook" method="post">
    
        <label for="bookId">Book ID:</label>
        <input type="text" id="bookId" value="<%= book1.getBookId() %>" readonly="readonly" name="bookId" required><br><br>

        <label for="bookName">Book Name:</label>
        <input type="text" id="bookName" value="<%= book1.getBookName() %>" name="bookName" required><br><br>

        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" value="<%= book1.getQuantity() %>" name="quantity" required><br><br>

        <label for="author">Author:</label>
        <input type="text" id="author" value="<%= book1.getAuthor() %>" name="author" required><br><br>
   <br>
   <br>
       <center> <input type="submit" value="Update Book"submit"></center>
    </form>
</div>
</body>
</html>