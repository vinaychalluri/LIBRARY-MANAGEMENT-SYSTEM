<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <link rel="stylesheet" href="addBook.css">
    <style>
        /* Header styling for back button and name */
        .header {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            position: absolute;
            width: 90%;
            top: 10px;
            z-index: 0;
        }

        /* Styling for the back button */
        .back-btn {
            background-color: #4CAF50;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
        }

        .back-btn:hover {
            background-color: #45a049;
        }

        /* Styling for the name */
        .name {
            color: white;
            font-size: 24px;
            font-weight: bold;
            text-transform: uppercase;
            
        }

        /* Message fade-out animation */
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

        /* Centered form container */
        .circular-element {
            position: relative;
            top: 100px;
            left: 0%;
            /*transform: translateX(-50%);*/
            background-color: rgba(255, 255, 255, 0.2);
            padding: 20px;
            border-radius: 15px;
            width: 400px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3);
        }

        /* Form input styling */
        input[type="text"], input[type="number"] {
            width: 90%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            border-radius: 5px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body style="background-image: url('images/new.jpg'); background-repeat: no-repeat; background-size: cover;">
   
   <!-- Header Section with Back button and Name -->
   <div class="header">
        <a href="facultyHome.jsp" class="back-btn">Back</a>
        <div class="name">
            <% String name = (String) session.getAttribute("fname"); %>
            <%= name %>
        </div>
    </div>

    <% String book = (String) request.getAttribute("book");
      if (book != null) { %>
      
   <center>   
      <h3 id="message" style="color: red; font-size: 30px;"><%= book %></h3>
   </center>
      
    <% } %>

    <!-- Form to Add Book -->
    <div class="circular-element">
        <form action="AddBook" method="post">
            <label for="bookId">Book ID:</label>
            <input type="text" id="bookId" name="bookId" required><br><br>

            <label for="bookName">Book Name:</label>
            <input type="text" id="bookName" name="bookName" required><br><br>

            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" required><br><br>

            <label for="author">Author:</label>
            <input type="text" id="author" name="author" required><br><br>

            <center> 
                <input type="submit" value="Add Book" id="submit">
            </center>
        </form>
    </div>

</body>
</html>
