<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Faculty Login</title>
<style>
    body {
        margin: 0;
        background-image: url('images/new.jpg');
        padding: 0;
        background-color: black;
        font-family: Arial, sans-serif;
        color: white;
    }

    .container {
        width: 400px;
        height: 400px;
        margin: auto;
        margin-top: 100px;
        padding: 30px;
        background-color: rgba(255, 255, 255, 0.1);
        border-radius: 15px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.8);
        text-align: center;
    }

    .container h1 {
        margin-bottom: 20px;
        font-size: 28px;
        color: #00aaff;
    }

    .form-group {
        margin-bottom: 20px;
        text-align: left;
    }

    .form-group label {
        display: block;
        font-size: 18px;
        margin-bottom: 5px;
    }

    .form-group input {
        width: 90%;
        padding: 10px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.5);
    }

    .form-group input:focus {
        outline: none;
        border: 2px solid #00aaff;
    }

    .error {
        color: red;
        font-size: 14px;
    }

    .submit-btn {
        width: 50%;
        padding: 10px;
        font-size: 18px;
        color: white;
        background-color: #4CAF50; /* #00aaff*/
        border: none;
        border-radius: 5px;
        cursor: pointer;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.5);
    }
    input[type="submit"]:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

    .submit-btn:hover {
        background-color: #0088cc;
    }

    .links {
        margin-top: 20px;
        font-size: 14px;
    }

    .links a {
        color: #00aaff;
        text-decoration: none;
        margin: 0 10px;
    }

    .links a:hover {
        text-decoration: underline;
    }

    .home-btn {
            position: absolute;
            top: 20px;
            left: 20px;
            text-decoration: none;
            padding: 12px 25px;
            font-size: 18px;
            color: black;
            background-color: #FFD700;
            border: none;
            border-radius: 30px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 8px rgba(255, 255, 0, 0.5);
    }

    .home-btn:hover {
        background-color: #00aaff;
        box-shadow: 0 6px 12px rgba(255, 255, 0, 0.8);
    }
    
    h3{
      color: red;
    }
</style>
</head>
<body>
    <button class="home-btn" onclick="location.href='index.jsp';">Home</button>

    <div class="container">
        <h1>Faculty Login</h1>
        <form action="FacultyLogin" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" id="email" required name="email" placeholder="Enter your email"  >
                <% String email = (String) request.getAttribute("email");
                   if (email != null) { %>
                    <div class="error"><%= email %></div>
                <% } %>
            </div>

            <div class="form-group">
                <label for="pwd">Password</label>
                <input type="password" id="pwd" required name="pwd" placeholder="Enter your password">
                <% String pwd = (String) request.getAttribute("pwd");
                   if (pwd != null) { %>
                    <div class="error"><%= pwd %></div>
                <% } %>
            </div>

            <button type="submit" class="submit-btn">Login</button>
        </form>

        <div class="links">
          <h3>  Don't have an account?</h3> <a href="facultyregister.jsp">Register</a>
             
        </div>
    </div>
</body>
</html>
