<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <met0a name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WELCOME PAGE</title>
    <style>
        /* General resets */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            
        }

        /* Body styles */
        body {
            
            
            background-image: url('images/new.jpg');
            background-color:#81ecec;
               background-repeat: no-repeat;
            background-size: cover;

            font-family: Arial, sans-serif;
            /* Dark background */
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
            position: relative; /* Make the body a relative container */ /* Stack the message and dropdowns vertically */
        }

        /* Welcome message style */
        h2 {
            font-size: 50px;
    margin-bottom: 50px;
    text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.7); /* Optional: Add shadow for readability */
    position: absolute; /* Fix the welcome message in place */
    top: 20%; /* Position the welcome message from the top */
    left: 50%;
    transform: translateX(-50%); /* Center horizontally */
    white-space: nowrap; /* Prevent the text from wrapping to the next line */
    overflow: hidden; /* Hide the overflowing text if it doesn't fit */
    text-overflow: ellipsis; /* Adds "..." if the text overflows */
    max-width: 100%; /* Optional: Add shadow for readability */
        }

        /* Container for dropdowns */
        .container {
            display: flex;
            justify-content: center;
            gap: 40px;
            align-items: center;
            flex-wrap: wrap; /* Ensure it wraps on smaller screens */
            margin-top: 20px;
        }

        /* Dropdown styles */
        .dropdown {
            position: relative;
            width: 250px;
       /*     background-color: #3b3b3b; /* Darker background for the dropdown */
            border: 3px solid #444; /* Soft borders */
            border-radius: 10px;
            padding: 10px;
            display: flex;
            flex-direction: column; /* Stack the button and dropdown content */
            justify-content: flex-start;
            align-items: center;
            transition: background-color 0.3s ease;
        }

        /* Dropdown button style */
        .dropbtn {
            background-color: #008CBA; /* Light blue button */
            color: white;
            padding: 16px;
            font-size: 20px;
            border: none;
            cursor: pointer;
            border-radius: 10px;
            width: 100%;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        .dropbtn:hover {
            background-color: #005f73; /* Darker shade on hover */
        }

        /* Dropdown content style - hidden by default */
        .dropdown-content {
            display: none; /* Hide dropdown by default */
            background-color: #333; /* Dark background for content */
            border-radius: 10px;
            width: 100%;
            margin-top: 10px; /* Space between button and dropdown */
        }

        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: center;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        .dropdown-content a:hover {
            background-color: #008CBA; /* Change color on hover */
        }

        /* Show the dropdown content when hovering over the dropdown */
        .dropdown:hover .dropdown-content {
            display: block; /* Display dropdown content when hovering */
        }

        /* Spacing between dropdowns */
        .dropdown + .dropdown {
            margin-left: 20px;
        }
    </style>
</head>
<body>

    <!-- Welcome Message -->
    <h2>WELCOME TO LIBRARY MANAGEMENT SYSTEM</h2>

    <!-- Dropdown Buttons Section -->
    <div class="container">
        <!-- Faculty Dropdown -->
        <div class="dropdown">
            <button class="dropbtn">FACULTY</button>
            <div class="dropdown-content">
                <a href="facultyregister.jsp">REGISTER</a>
                <a href="facultyLogin.jsp">LOGIN</a>
            </div>
        </div>

        <!-- Student Dropdown -->
        <div class="dropdown">
            <button class="dropbtn">STUDENT</button>
            <div class="dropdown-content">
                <a href="studentRegister.jsp">REGISTER</a>
                <a href="studentLogin.jsp">LOGIN</a>
            </div>
        </div>

        <!-- Book Search Dropdown -->
        <div class="dropdown">
            <button class="dropbtn">BOOK SEARCH</button>
            <div class="dropdown-content">
                <a href="BookSearch1.jsp">BY NAME</a>
                <a href="BookSearch1.jsp">BY AUTHOR</a>
                <a href="BookSearch1.jsp">BY BOOK ID</a>
            </div>
        </div>
    </div>

</body>
</html>
