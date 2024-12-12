<%@page import="ProjectLibrary.dao.SearchBookDao"%>
<%@page import="ProjectLibrary.dao.addbookDao"%>
<%@page import="java.util.List"%>
<%@page import="ProjectLibrary.dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            margin-top: 60px;
        }

        .navbar {
            background-color: #1ad0e4;
        }

        .navbar a, .navbar .dropdown-item {
            color: white;
            text-decoration: none;
        }

        .navbar .btn-borrowed {
            border-color: white;
            color: white;
            font-weight: bold;
        }

        .navbar .btn-borrowed:hover {
            background-color: white;
            color: red;
        }

        .dropdown-menu {
            background-color: green;
            border: none;
        }

        .container {
            margin-top: 80px;
        }

        .table-container {
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
        }

        th {
            background-color: red;
            color: white;
        }

        .dropdown-toggle::after {
            display: none;
        }
         .home-button {
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: #333;
            color: white;
            margin-top:50px;
            border: none;
            padding: 12px 20px;
            font-size: 18px;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .home-button:hover {
            background-color: #ffcc00;
            transform: scale(1.1);
        }
        
        
         @media screen and (max-width: 768px) {
           
            .home-btn {
                font-size: 16px;
                padding: 8px 16px;
            }
      
            
        }
    </style>
</head>
<body>
 
<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid">
        <!-- Styled Borrowed Books Button -->
 
        <!-- Search Bar in Navbar -->
        <form class="d-flex mx-auto" method="get" action="SearchBooks">
            <input class="form-control me-2" type="search" name="search" placeholder="Search by Title, Author, or Genre" aria-label="Search">
            <button class="btn btn-outline-light" type="submit">Search</button>
        </form>

        <!-- Profile Dropdown -->
        
    </div>
</nav>

 
<a href="index.jsp">
        <button class="home-button">Home</button>
    </a>
<!-- Book List Table -->
<div class="container table-container">
    <h2 class="text-center">Library Books</h2>
    <%
        String keyWord = (String)request.getParameter("search");
        SearchBookDao searchbook = new SearchBookDao(); 
        addbookDao bookDao = new addbookDao();
        List<Book> books = bookDao.fetchAll(); // Fetch all books from the database
        List<Book> Sbook = searchbook.search(keyWord);
        %>
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Quantity</th>
            </tr>
        </thead>
        <tbody>
        <% 
            for (Book book : Sbook) { 
        %>
            <tr>
                <td><%= book.getBookId() %></td>
                <td><%= book.getBookName() %></td>
                <td><%= book.getAuthor() %></td>
                <td><%= book.getQuantity() %></td>
                 
                 
            </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
