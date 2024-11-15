<!DOCTYPE html>
<html>
<head>
    <title>PetLover Login</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        #container {
            display: flex;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 900px;
            width: 100%;
            background-color: #ffffff;
        }
        .image-section {
            flex: 1;
            background: url('img/pet-login.jpg') no-repeat center center/cover;
        }
        .signup {
            flex: 1;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .signup h2 {
            color: #ff6347;
            text-align: center;
            margin-bottom: 20px;
        }
        .signup input[type="email"],
        .signup input[type="password"],
        .signup input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .signup input[type="submit"] {
            background-color: #ff6347;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .signup input[type="submit"]:hover {
            background-color: #ff4500;
        }
        .signup a {
            color: #ff6347;
            text-decoration: none;
            font-weight: bold;
            text-align: center;
            display: block;
            margin-top: 15px;
        }
        .signup a:hover {
            text-decoration: underline;
        }
        .whysignLogin {
            color: #333;
            padding: 20px;
            text-align: center;
        }
        .whysignLogin h1 {
            color: #ff6347;
            margin-bottom: 20px;
        }
        .whysignLogin p {
            font-size: 16px;
            line-height: 1.5;
        }
    </style>
</head>
<body>
    <div id="container">
        <!-- Image Section -->
        <div class="image-section"></div>

        <!-- Login Form Section -->
        <div class="signup">
            <form action="loginAction.jsp" method="post">
                <h2>PetLover Login</h2>
                <input type="email" name="email" placeholder="Enter Email" required>
                <input type="password" name="password" placeholder="Enter Password" required>
                <input type="submit" value="Login">
            </form>
            <a href="signup.jsp">Sign Up</a>
            <a href="forgetPassword.jsp">Forget Password?</a>
        </div>
        <div class='whysignLogin'>
            <% String msg = request.getParameter("msg");
                if ("notexist".equals(msg)) { %>
                <h1>Incorrect Username or Password</h1>
            <% } else if ("invalid".equals(msg)) { %>
                <h1>Something Went Wrong! Try Again!</h1>
            <% } %>
            <h2>PetLover Care</h2>
            <p>Your trusted online store for pet care products, ensuring your furry friends stay happy and healthy.</p>
        </div>
    </div>
</body>
</html>
