<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Email Input Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #ff0000, #ff7300, #fffb00, #3fffd9, #304ffe, #8e2de2);
            background-size: 600% 600%;
            animation: rainbowBG 10s ease infinite;
            color: #333;
            overflow: hidden;
        }

        @keyframes rainbowBG {
            0% { background-position: 0% 50%; }
            14% { background-position: 20% 50%; }
            28% { background-position: 40% 50%; }
            42% { background-position: 60% 50%; }
            57% { background-position: 80% 50%; }
            71% { background-position: 100% 50%; }
            85% { background-position: 80% 50%; }
            100% { background-position: 0% 50%; }
        }

        .home-btn, .back-btn {
            position: absolute;
            top: 20px;
            text-decoration: none;
            padding: 12px 20px;
            font-size: 18px;
            color: white;
            border: none;
            border-radius: 30px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.3s ease;
        }

        .home-btn {
            left: 20px;
            background-color: #4CAF50;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .home-btn:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        .back-btn {
            right: 20px;
            background-color: #e63946;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .back-btn:hover {
            background-color: #d32f2f;
            transform: scale(1.05);
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative;
            z-index: 10;
        }

        .form-group {
            display: flex;
            align-items: center;
            background: rgba(255, 255, 255, 0.9);
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .form-group input {
            font-size: 18px;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-right: 10px;
            width: 300px;
            transition: box-shadow 0.3s ease;
        }

        .form-group input:focus {
            box-shadow: 0 0 10px #6a11cb;
            outline: none;
            border-color: #6a11cb;
        }

        .form-group button {
            font-size: 18px;
            padding: 12px 20px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .form-group button:hover {
            background: linear-gradient(135deg, #5a67d8, #6b46c1);
            transform: scale(1.05);
        }

        h1 {
            position: absolute;
            top: 10%;
            text-align: center;
            font-size: 36px;
            width: 100%;
            font-weight: bold;
            color: #ffffff;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
            z-index: 10;
        }

        .error-message {
            color: red;
            font-size: 18px;
            margin-bottom: 15px;
            opacity: 1;
            animation: fadeOut 5s forwards; /* Fade out after 5 seconds */
        }

        /* Fade out animation */
        @keyframes fadeOut {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }

    </style>
</head>
<body>
    <h1>Welcome! Please Enter Your Email</h1>
    <a href="index.jsp" class="home-btn">Home</a>
    <a href="javascript:history.back()" class="back-btn" style="text-decoration: none; color: white;">Back</a>

    <% 
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
        <div class="error-message">
            <%= errorMessage %>
        </div>
    <% } %>

    <div class="container">
        <form action="StudentRequest" class="form-group">
            <input type="email" name="email" required placeholder="Enter your email">
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
