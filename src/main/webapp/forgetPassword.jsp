<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forget Password</title>
    <style>
        /* General styles */
        body {
            background-color: #FFA500; /* Orange background */
            font-family: Arial, sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
        }

        #container {
            width: 800px;
            margin: 50px auto;
            display: flex;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background-color: #fff;
        }

        /* Form container styles */
        .signup {
            width: 50%;
            padding: 30px;
            text-align: center;
            border-right: 1px solid #ddd;
        }

        .signup h2 {
            font-size: 1.5em;
            color: #333;
            margin-top: 20px;
        }

        /* Input styles */
        [type="email"], [type="number"], [type="text"], [type="password"], select {
            width: 80%;
            padding: 12px;
            margin: 10px auto;
            display: block;
            font-size: 1em;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* Button styles */
        [type="submit"] {
            margin-top: 20px;
            width: 80%;
            padding: 12px;
            font-size: 1.1em;
            color: #fff;
            background-color: tomato; /* Tomato red button */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        [type="submit"]:hover {
            background-color: #e74c3c;
        }

        /* Information panel styles */
        .whyforgetPassword {
            width: 50%;
            padding: 30px;
            text-align: center;
            background-color: #fff;
        }

        .whyforgetPassword h1 {
            font-size: 1.8em;
            color: #ff6347;
            margin-bottom: 15px;
        }

        .whyforgetPassword h2 {
            font-size: 1.5em;
            color: #333;
            margin-top: 20px;
        }

        .whyforgetPassword p {
            color: #666;
            font-size: 1.1em;
            line-height: 1.5;
        }

        /* Link styling */
        .signup a {
            color: #ffa500;
            text-decoration: none;
            font-size: 1em;
            display: block;
            margin-top: 20px;
        }

        .signup a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div id="container">
    <div class="signup">
        <!-- Form to submit password reset details -->
        <form action="forgetPasswordAction.jsp" method="post">
            <input type="email" name="email" placeholder="Enter Email" required>
            <input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
            
            <select name="securityQuestion" required>
                <option value="What is the name of your first car?">What is the name of your first car?</option>
                <option value="What is your pet name?">What is your pet name?</option>
                <option value="What is your birthplace?">What is your birthplace?</option>
            </select>
            
            <input type="text" name="answer" placeholder="Enter Answer" required>
            <input type="password" name="newPassword" placeholder="Enter your password to set" required>
            <input type="submit" value="Save">
        </form>

        <!-- Login link -->
        <h2><a href="login.jsp">Login</a></h2>
    </div>

    <div class="whyforgetPassword">
        <% 
            String msg = request.getParameter("msg"); 
            if ("done".equals(msg)) { 
        %>
            <h1>Password Changed Successfully!</h1>
        <% 
            } else if ("invalid".equals(msg)) { 
        %>
            <h1>Something Went Wrong! Try Again!</h1>
        <% 
            } 
        %>
        <h2>Pet Shop</h2>
        <p>The Online Shopping System allows users to shop online without the hassle of going to physical stores. Enjoy convenient and easy shopping!</p>
    </div>
</div>
</body>
</html>
