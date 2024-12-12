<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Register</title>
    <style>
        /* General resets */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body styles */
        body {
            font-family: 'Arial', sans-serif;
            background-image: url('images/new.jpg');
            background-color: black;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            position: relative;
        }

        /* Home button styles */
        .home-button {
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

        .home-button:hover {
            transform: scale(1.1);
            box-shadow: 0 6px 12px rgba(255, 255, 0, 0.8);
        }

        /* Container for the form */
        .form-container {
            width: 600px;
            padding: 10px;
            background-color: rgba(30, 30, 30, 0.95);
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.8);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Heading styles */
        h2 {
           color: #00aaff;
            font-size: 32px;
            margin-bottom: 25px;
            text-align: center;
        }

        h3 {
            color: red;
            font-size: 16px;
            margin-bottom: 15px;
        }

        /* Label and input fields */
        label {
            font-size: 18px;
            margin-bottom: 8px;
            display: block;
        }

        input[type="text"], input[type="email"], input[type="password"], input[type="tel"] {
            width: 100%; /* Wider input fields */
            padding: 10px; /* Increased padding for larger input feel */
            font-size: 16px;
            border-radius: 5px;
            border: none;
            margin-bottom: 10px;
            background-color: rgba(255, 255, 255, 0.9);
            color: black;
        }

        input[type="radio"] {
            margin-right: 10px;
        }

        .gender-label {
            font-size: 18px;
            margin-bottom: 20px;
        }

        /* Submit button styles */
        input[type="submit"] {
            width: 95%;
            padding: 15px;
            background-color: #4CAF50;
            color: white;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        /* Footer links */
        .footer-links {
            margin-top: 25px;
            text-align: center;
        }

        .footer-links a {
            color: #ffcc00;
            text-decoration: none;
            font-size: 16px;
            margin: 0 10px;
        }

        .footer-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <!-- Home button -->
    <a href="index.jsp" class="home-button">Home</a>

    <div class="form-container">
        <h2>Faculty Registration</h2>

        <form action="facultyRegister" method="post">
            <% String facultyr = (String) request.getAttribute("facultyR"); if (facultyr != null) { %>
                <h3><%= facultyr %></h3>
            <% } %>

            <label for="name"><b>Name:</b></label>
            <input type="text" name="name" id="name" required placeholder="Enter your name">

            <label for="email"><b>Email:</b></label>
            <input type="email" name="email" id="email" required placeholder="Enter your email">

            <label for="pwd"><b>Password:</b></label>
            <input type="password" name="pwd" id="pwd" required placeholder="Enter your password">

            <label for="phone"><b>Phone:</b></label>
            <input type="tel" name="phone" id="phone" required placeholder="Enter your phone number" pattern="[0-9]{10}" title="Enter a 10-digit phone number">

            <div class="gender-label">
                <label><b>Gender:</b></label><br>
                <input type="radio" name="gender" value="male" required> Male
                <input type="radio" name="gender" value="female" required> Female
                <input type="radio" name="gender" value="Others" required> Other
            </div>

            <input type="submit" value="Register Now">
        </form>

        <div class="footer-links">
            <h3>Already registered? <a href="facultyLogin.jsp">Login</a> 
        </div>
    </div>

</body>
</html>
