<%@page import="ProjectLibrary.dto.Book"%>
<%@page import="java.util.List"%>
<%@page import="ProjectLibrary.dao.addbookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Set headers to prevent caching
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    // Fetch student data from session
    HttpSession session2 = request.getSession(false); // Get the session (if exists)
    String studentName = (String) session2.getAttribute("fname");
    String studentEmail = (String) session2.getAttribute("femail");

    if (studentName == null || studentEmail == null) {
        // If the session is invalid (user is not logged in), redirect to login page
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrow Request</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f8f9fa;
            margin-top: 80px;
        }

        .navbar {
            background-color: #1ad0e4;
        }

        .navbar a {
            color: white !important;
            text-decoration: none;
        }

        .offcanvas {
            background-color: black;
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
        }

        th, td {
            border: 1px solid #ddd;
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
            color: black;
            text-decoration: none;
            
        }

        .main-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 50px 100px;
        }

        /* Center the name */
        .main-header h1 {
            text-transform: uppercase;
            flex-grow: 1; /* This will ensure the name is in the center */
            text-align: center;
        }

        /* Align "Add Book" button to the right */
        .add-book-btn {
            margin-left: auto;
            background-color: white;
        }

        /* Custom dropdown styles */
        .custom-dropdown {
            background-color: #1ad0e4;
        }

        .custom-dropdown .dropdown-item {
            color: black !important;
        }

        .custom-dropdown .dropdown-item:hover {
            background-color: darkgreen !important;
        }

        .dropdown-toggle {
            color: black;
        }
        /* Change text color on hover */
.btn-outline-success a:hover {
    color: #155724;  /* Change color when hovered */
}
/* Change the button border color */
.btn-outline-success {
    border-color: black;
    border: 2px solid black;
      /* Green border color */
}
        
        a {
    text-decoration: none;
    color: white;
         }     
                  /* Style the button */
.btn-warning {
    background-color: #ffc107;  /* Button background color */
    color: white;               /* Button text color */
    border: none;               /* Remove border */
    padding: 10px 10px;         /* Adjust padding for size */
    border-radius: 5px;         /* Optional: rounded corners */
}

/* Style the anchor tag inside the button */
.btn-warning a {
    color: white;               /* Link text color */
    text-decoration: none;      /* Remove underline */
}

/* Optional: Change colors when hovering over the button */
.btn-warning:hover {
    background-color: #e0a800;  /* Darker shade when hovered */
}

.btn-warning a:hover {
    color: #333;  /* Change the color of the link when hovered */
}
                  
         


    </style>
</head>
<body>

<% String name = (String) session.getAttribute("fname"); %>
<% String email = (String) session.getAttribute("femail"); %>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid">
        <button class="btn btn-outline-success me-2">
            <a href="BorrowRequest.jsp" class="text-decoration-none text-success">Borrower Request</a>
        </button>
        <button class="btn btn-outline-success me-2">
            <a href="BorrowerList.jsp" class="text-decoration-none text-success">Borrower List</a>
        </button>
        
        <!-- Toggle button for smaller screens -->
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title"><%= name %></h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
            </div>
        </div>
        
        <!-- Dropdown for top-right corner -->
        <div class="dropdown ms-auto">
            <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                ☰
            </button>
            <ul class="dropdown-menu dropdown-menu-end custom-dropdown" aria-labelledby="dropdownMenuButton">
                <li><a class="dropdown-item" href="FacultyProfile.jsp">Profile</a></li>
                <li><a class="dropdown-item" href="facultyUpdate.jsp">Update</a></li>
                <li><a class="dropdown-item" href="facultyDelete?email=<%=email%>">Delete</a></li>
                <li><a class="dropdown-item" href="facultyLogin.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Header -->
<div class="container main-header">
    <button class="btn btn-primary btn-lg action-btn add-book-btn">
        <a href="index.jsp">HOME</a>
    </button>
    <h1><%= name %></h1>
    <button class="btn btn-primary btn-lg action-btn add-book-btn">
        <a href="addBook.jsp">Add Book</a>
    </button>
</div>

<!-- Table -->
<div class="container table-container">
    <%
        addbookDao bookDao = new addbookDao();
        List<Book> bookList = bookDao.fetchAll();
    %>
    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th>Book ID</th>
            <th>Name</th>
            <th>Author</th>
            <th>Quantity</th>
            <th colspan="2">Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (Book book : bookList) { %>
            <tr>
                <td><%= book.getBookId() %></td>
                <td><%= book.getBookName() %></td>
                <td><%= book.getAuthor() %></td>
                <td><%= book.getQuantity() %></td>
                <td class="table-actions">
                    <button class="btn btn-warning"><a href="UpdateBook.jsp?id=<%=book.getBookId() %>">Update</a></button>
                </td>
                <td class="table-actions">
                    <button class="btn btn-danger"><a href="DeleteBook?id=<%=book.getBookId() %>">Delete</a></button>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
