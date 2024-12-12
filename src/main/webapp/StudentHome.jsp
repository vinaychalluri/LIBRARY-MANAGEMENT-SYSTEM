<%@page import="ProjectLibrary.dao.addbookDao"%>
<%@page import="java.util.List"%>
<%@page import="ProjectLibrary.dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
    // Set headers to prevent caching
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    // Fetch student data from session
    HttpSession session2 = request.getSession(false); // Get the session (if exists)
    String studentName = (String) session2.getAttribute("sname");
    String studentEmail = (String) session2.getAttribute("semail");

    if (studentName == null || studentEmail == null) {
        // If the session is invalid (user is not logged in), redirect to login page
        response.sendRedirect("studentLogin.jsp");
        return;
    }
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Home page</title>
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
            background-color: green;
            color: red;
        }

        .dropdown-menu {
            background-color: green;
            border: none;
        }

        .container {
            margin-top: 20px;
        }

        .table-container {
            margin: 20px auto;
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
    </style>
</head>
<body>



 


<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid">
        <!-- Styled Borrowed Books Button -->
        <a href="BorrowedBooks.jsp" class="btn btn-outline-light btn-borrowed me-3">My Borrowed Books</a>

        <!-- Search Bar in Navbar -->
        <form class="d-flex mx-auto" method="get" action="BookSearch.jsp">
            <input class="form-control me-2" type="search" name="search" placeholder="Search by Title, Author, or Genre" aria-label="Search">
            <button class="btn btn-outline-light" type="submit">Search</button>
        </form>

        <!-- Profile Dropdown -->
        <div class="dropdown">
            <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                ☰
            </button>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
                <li><a class="dropdown-item" href="StudentProfile.jsp">Profile</a></li>
                <li><a class="dropdown-item" href="UpdateStudent.jsp">Update</a></li>
                <li><a class="dropdown-item" href="StudentDelete?email=<%=studentEmail%>">Delete</a></li>
                <li><a class="dropdown-item" href="logoutServlet">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<h1><%= studentName %></h1>
 

<!-- Book List Table -->
<div class="container table-container">
    <h2 class="text-center">Library Books</h2>
    <%
        addbookDao bookDao = new addbookDao();
        List<Book> books = bookDao.fetchAll(); // Fetch all books from the database
    %>
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                 
                <th>Borrow</th>
            </tr>
        </thead>
        <tbody>
        <% 
            for (Book book : books) { 
        %>
            <tr>
                <td><%= book.getBookId() %></td>
                <td><%= book.getBookName() %></td>
                <td><%= book.getAuthor() %></td>
                 
                <td>
                    <form action="BorrowBook" method="get">
                        <input type="hidden" name="bookid" value="<%= book.getBookId() %>">
                        
                        
                        <button type="submit" class="btn btn-success">Borrow</button>
                    </form>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
