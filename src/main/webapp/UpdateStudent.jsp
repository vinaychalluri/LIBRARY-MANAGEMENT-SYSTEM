<%@page import="ProjectLibrary.dto.Student"%>
<%@page import="ProjectLibrary.dao.StudentDao"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student Details</title>
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
            margin: auto;
            margin-top: 50px;
            padding: 20px;
        }

        /* Header section with back button */
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            background-color: #007BFF;
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
            height: 70vh;
        }

        /* Update form container */
        .update-form {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: left;
        }

        .update-form h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .update-form label {
            font-size: 16px;
            margin-bottom: 5px;
            display: block;
        }

        .update-form input, .update-form select {
            width: 90%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .update-form button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .update-form button:hover {
            background-color: #0056b3;
        }

        /* Request message styling */
        .request-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
</head>
<body>

    <!-- Header Section with Back Button -->
    <div class="header">
        <a href="StudentHome.jsp" class="back-btn">Back</a>
    </div>

    <% 
    HttpSession session2 = request.getSession(); 
    String update = (String)request.getParameter("update"); 
    String email =  (String)session2.getAttribute("semail");

    StudentDao sDao = new StudentDao();  
    Student student = sDao.fetch(email);
    
    String requestMessage = (String)request.getAttribute("update"); 
    if (requestMessage != null) { 
    %>
        <div class="request-message">
            <%= requestMessage %>
        </div>
    <% 
    }
    %>

    <!-- Main Content Section -->
    <div class="container">
        <div class="content">
            <!-- Update Form -->
            <div class="update-form">
                <h2>Update Student Details</h2>

                <!-- Form for updating student details -->
                <form action="updateStudent" method="POST">
                    
                     <!-- Hidden input for studentId -->
                    <input type="hidden" name="pwd" value="<%= student.getPwd() %>">
                    <input type="hidden" name="borrow" value="<%= student.getBorrow() %>">
                     
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" value="<%= student.getName() != null ? student.getName() : "" %>" required>

                    <label for="email">Email</label>
                    <input type="email" readonly= "readonly" id="email" name="email" value="<%= student.getEmail() != null ? student.getEmail() : "" %>" required>

                    <label for="phone">Phone</label>
                    <input type="text" id="phone" name="phone" value="<%= student.getPhone()   %>" required>

                    <label for="year">Year</label>
                    <select id="year" name="year" required>
                        <option value="1st Year" <%= student.getYear()  %>>1st Year</option>
                        <option value="2nd Year" <%= student.getYear()  %>>2nd Year</option>
                        <option value="3rd Year" <%= student.getYear()  %>>3rd Year</option>
                        <option value="4th Year" <%= student.getYear()  %>>4th Year</option>
                    </select>

                    <label for="gender">Gender</label>
                    <select id="gender" name="gender" required>
                        <option value="Male" <%=  student.getGender() %>>Male</option>
                        <option value="Female" <%= student.getGender()  %>>Female</option>
                    </select>

                    <button type="submit">Update Details</button>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
