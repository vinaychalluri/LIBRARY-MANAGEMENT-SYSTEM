<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Register</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('images/new.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        .home-btn {
            position: absolute;
            top: 20px;
            left: 20px;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 18px;
            color: white;
            background-color: #007acc;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
        }

        .home-btn:hover {
            background-color: #005b99;
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.8);
        }

        .container {
            width: 400px;
            margin: auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
            margin-top: 100px;
        }

        h1 {
            text-align: center;
            font-size: 28px;
            color: #007acc;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-size: 18px;
            margin-bottom: 5px;
        }

        input, select {
            padding: 10px;
            font-size: 16px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 95%;
            box-sizing: border-box;
        }

        input[type="radio"] {
            margin-right: 10px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .gender-group {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .gender-group label {
            margin: 0;
            font-size: 16px;
        }

        .submit-btn {
            padding: 10px;
            font-size: 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #45a049;
        }

        .links {
            text-align: center;
            margin-top: 20px;
        }

        .links a {
            color: #007acc;
            text-decoration: none;
            margin: 0 10px;
        }

        .links a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }

        @media screen and (max-width: 768px) {
            .container {
                width: 90%;
            }

            .home-btn {
                font-size: 16px;
                padding: 8px 16px;
            }

            .gender-group {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
</head>
<body>
    <a href="index.jsp" class="home-btn">Home</a>
    
    <div class="container">
        <h1>Student Register</h1>
        <form action="studentRegister" method="post">
            <% 
                String studentr = (String) request.getAttribute("studentR");
                if (studentr != null) {
            %>
            <div class="error-message"><%= studentr %></div>
            <% } %>
            
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required placeholder="Enter your name">
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required placeholder="Enter your email">
            </div>

            <div class="form-group">
                <label for="pwd">Password:</label>
                <input type="password" id="pwd" name="pwd" required placeholder="Enter a new password">
            </div>

            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="tel" id="phone" name="phone" required placeholder="Enter your phone number">
            </div>

            <div class="form-group">
                <label for="year">Year:</label>
                <select id="year" name="year" required>
                    <option value="1st Year">1st Year</option>
                    <option value="2nd Year">2nd Year</option>
                    <option value="3rd Year">3rd Year</option>
                    <option value="4th Year">4th Year</option>
                </select>
            </div>

            <div class="form-group">
                <label>Gender:</label>
                <div class="gender-group">
                    <input type="radio" id="male" name="gender" value="male" required>
                    <label for="male">Male</label>

                    <input type="radio" id="female" name="gender" value="female" required>
                    <label for="female">Female</label>

                    <input type="radio" id="others" name="gender" value="others" required>
                    <label for="others">Others</label>
                </div>
            </div>

            <button type="submit" class="submit-btn">Register</button>
        </form>

        <div class="links">
            <p>Already registered? <a href="studentLogin.jsp">Login</a></p>
             
        </div>
    </div>
</body>
</html>
