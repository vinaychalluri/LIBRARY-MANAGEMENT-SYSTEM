<!DOCTYPE html>
<%@page import="ProjectLibrary.dto.Student"%>
<%@page import="ProjectLibrary.dao.StudentDao"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details</title>
    <style>
        /* Basic styling for the page */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        /* Container for the entire content */
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        /* Header section */
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            background-color: #1ad0e4;
            color: white;
        }

        .header .back-btn {
            font-size: 16px;
            cursor: pointer;
            background-color: #ffffff;
            border: 1px solid #007BFF;
            padding: 5px 10px;
            color: #007BFF;
            border-radius: 5px;
            text-decoration: none;
        }

        /* Centered content */
        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 60vh;
        }

        /* Student information card */
        .student-info {
            background-color: #1ad0e4;
            border: 5px solid black;
            padding: 50px;
            margin-left:60px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px; /* Wider width for better display */
            text-align: left; /* Align text to the left */
        }

        .student-info h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        .student-info .info-item {
            margin-bottom: 15px;
        }

        .student-info .info-item strong {
            display: inline-block;
            width: 100px; /* Fixed width for labels */
            font-weight: bold;
        }

        .student-info .info-item span {
            font-size: 16px;
        }

        /* Back button on hover */
        .header .back-btn:hover {
            background-color: red;
            color: white;
        }
    </style>
</head>
<body>



  <% 
  
  HttpSession session2 = request.getSession();
  String studentName = (String) session2.getAttribute("sname"); 
  String email = (String) session2.getAttribute("semail");
  
  
     StudentDao sDao = new StudentDao();  
     Student student = sDao.fetch(email);
  
 %>

    <!-- Header Section with Back Button -->
    <div class="header">
        <a href="javascript:history.back()" class="back-btn">Back</a>
    </div>

    <!-- Main Content Section -->
    <div class="container">
        <div class="content">
            <!-- Student Information Card -->
            <div class="student-info">
                <h2>Student Details</h2>
                <div class="info-item">
                    <strong>Name:</strong> <span><%= student.getName() %></span>
                </div>
                <div class="info-item">
                    <strong>Email:</strong> <span><%= student.getEmail() %></span>
                </div>
                <div class="info-item">
                    <strong>Phone:</strong> <span><%= student.getPhone() %></span>
                </div>
                <div class="info-item">
                    <strong>Year:</strong> <span><%= student.getYear() %></span>
                </div>
                <div class="info-item">
                    <strong>Gender:</strong> <span><%= student.getGender() %></span>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
