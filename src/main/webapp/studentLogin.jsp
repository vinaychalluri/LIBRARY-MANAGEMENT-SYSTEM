<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login Page</title>
    <link rel="stylesheet" href="studentlogin.css">
    <style>
        body {
            background-image: url('images/new.jpg');
            background-color: #000;
            background-repeat: no-repeat;
            background-size: cover;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: white;
            position: relative; /* Ensures the position of home button is relative to the body */
        }

        /* Home Button Style */
        .home-button {
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: #333;
            color: white;
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

        .login-form {
            background-color: rgba(0, 0, 0, 0.6);
            border-radius: 15px;
            padding: 30px;
            width: 350px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        .login-form h1 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #fff;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 18px;
            color: #f4f4f4;
        }

        input[type="text"], input[type="password"], input[type="email"] {
            width: 90%;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: 1px solid #ccc;
            background-color: #fff;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .register-link {
            color: #ffcc00;
            font-size: 16px;
            text-decoration: none;
        }

        .register-link:hover {
            text-decoration: underline;
        }

        .request-message {
            color: red;
            font-size: 16px;
            text-align: left;
        }
    </style>
</head>
<body>
    <!-- Home Button -->
    <a href="index.jsp">
        <button class="home-button">Home</button>
    </a>

    <div class="login-form">
        <h1>Login</h1>
        <form action="StudentLogin" method="post">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <% String email = (String)request.getAttribute("email");
                if(email != null) { %>
                    <div class="error-message"><%= email %></div>
            <% } %>

            <label for="password">Password:</label>
            <input type="password" id="password" name="pwd" required>
            <% String pwd = (String)request.getAttribute("pwd");
                if(pwd != null) { %>
                    <div class="error-message"><%= pwd %></div>
            <% } %>

            <input type="submit" value="Login">

            <% String Request = (String)request.getAttribute("request");
                if(Request != null) { %>
                    <div class="request-message">
                        <%= Request %> <a href="studentR	equest.jsp" class="register-link">REQUEST</a>
                    </div>
            <% } %>
            
             <% String Request1 = (String)request.getAttribute("request1");
                if(Request1 != null) { %>
                    <div class="request-message">
                        <%= Request1 %>
                    </div>
            <% } %>

            <div>
                <p>Don't have an account? <a href="studentRegister.jsp" class="register-link">Sign Up</a></p>
            </div>
        </form>
    </div>
</body>
</html>
