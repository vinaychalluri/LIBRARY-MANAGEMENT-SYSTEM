<%@page import="ProjectLibrary.dto.BorrowData"%>
<%@page import="ProjectLibrary.dao.BorrowBookDao"%>
<%@page import="ProjectLibrary.dto.Book"%>
<%@page import="java.util.List"%>
<%@page import="ProjectLibrary.dao.addbookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrower List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f8f9fa;
            margin-top: 80px;
        }

        .navbar {
            background-color:#1ad0e4;
        }

        .navbar a {
            color: white !important;
            text-decoration: none;
        }

        .offcanvas {
            background-color: #f8f9fa;
        }

        .table-container {
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            width: 90%;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
            border: 1px solid black;
            
        }

        th, td {
            border: 1px solid black;
            padding: 10px;
        }

        th {
            background-color: red;
            color: white;
        }

        .table-actions button {
            margin: 0 5px;
        }

        .action-btn a {
            color: white;
            text-decoration: none;
        }

        .main-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 20px 100px;
        }
        .btn-outline-success a:hover {
    color: #155724;  /* Change color when hovered */
}
/* Change the button border color */
.btn-outline-success {
    border-color: black;
    border: 2px solid black;
      /* Green border color */
}
  

        .main-header h1 {
            text-transform: uppercase;
        }
    </style>
</head>
<body>
<% String name = (String) session.getAttribute("fname"); %>

 
<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid">
        <button class="btn btn-outline-success me-2">
            <a href="BorrowRequest.jsp">Borrower Request</a>
        </button>
        <button class="btn btn-outline-success me-2">
            <a href="BorrowerList.jsp">Borrower List</a>
        </button>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title"><%= name %></h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
            </div>
            
        </div>
    </div>
</nav>

<!-- Header -->
<div class="container main-header">
    <button class="btn btn-primary btn-lg action-btn">
        <a href="facultyHome.jsp">BACK</a>
    </button>
    <h1><%= name %></h1>
    
</div>

<!-- Table -->
<div class="container table-container">
    <%
         BorrowBookDao borrowbook = new BorrowBookDao();
         List<BorrowData> data = borrowbook.fetchAll();
    %>
    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th>Book ID</th>
            <th>Book NAME</th>
            <th>BORROW DATE</th>
            <th>SUBMIT DATE</th>
            <th>STUDENT NAME</th>
            <th>YEAR</th>
            <th>CONTACT</th>
             
             
        </tr>
        </thead>
        <tbody>
        <% for (BorrowData  book : data) { %>
            
           <tr>
              <!-- Check if book.getB() is null before accessing Book fields -->
                <td><%= (book.getB() != null) ? book.getB().getBookId() : "N/A" %></td>
                <td><%= (book.getB() != null) ? book.getB().getBookName() : "N/A" %></td>

                <!-- Check if borrowDate is null -->
                <td><%= (book.getBorrowDate() != null) ? book.getBorrowDate() : "Not Available" %></td>

                <!-- Check if submitDate is null -->
                <td><%= (book.getSubmitDate() != null) ? book.getSubmitDate() : "Not Submitted" %></td>

                <!-- Check if book.getS() is null before accessing Student fields -->
                <td><%= (book.getS() != null) ? book.getS().getName() : "N/A" %></td>
                <td><%= (book.getS() != null) ? book.getS().getYear() : "N/A" %></td>
                <td><%= (book.getS() != null) ? book.getS().getPhone() : "N/A" %></td>
          </tr>
      
            
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
