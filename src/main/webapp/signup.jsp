<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <style>
        /* Background and container styling */
        body {
            background-color: #FFA500; /* Changed to orange */
            font-family: Arial, sans-serif;
            color: #333;
        }

        #container {
            width: 840px;
            margin: 50px auto;
            display: flex;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Signup form styling */
        .signup {
            width: 50%;
            padding: 30px 20px;
            background-color: #FFFFFF;
            text-align: center;
            border-right: 1px solid #ddd;
        }

        .signup h2 {
            font-size: 1.5em;
            margin-top: 20px;
            color: #333;
        }

        /* Form input styling */
        [type=text], [type=email], [type=number], [type=password], select {
            width: 80%;
            padding: 10px;
            margin: 10px auto;
            display: block;
            font-size: 1em;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* Submit button styling */
        [type=submit] {
            margin-top: 20px;
            width: 80%;
            padding: 12px;
            font-size: 1.1em;
            color: #fff;
            background-color: tomato; /* Changed to tomato-red */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        [type=submit]:hover {
            background-color: #d9534f;
        }

        /* Right-side panel styling */
        .whysign {
            width: 50%;
            background-color: #FFFFFF;
            padding: 30px;
        }

        .whysign h1 {
            font-size: 2em;
            color: #ff6347;
            margin-bottom: 10px;
        }

        .whysign h2 {
            font-size: 1.7em;
            color: #333;
            margin-top: 20px;
        }

        .whysign p {
            color: #666;
            font-size: 1.1em;
            line-height: 1.5;
        }

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
        <!-- Form to submit signup details to a specific action -->
        <form action="signupaction.jsp" method="post">
            <input type="text" name="name" placeholder="Enter Name" required>
            <input type="email" name="email" placeholder="Enter E-mail" required>
            <input type="number" name="MobileNumber" placeholder="Enter Mobile Number" required>
            
            <select name="SecurityQuestions" required>
                <option value="What is the name of your first car?">What is the name of your first car?</option>
                <option value="What is your pet name?">What is your pet name?</option>
                <option value="What is your birthplace?">What is your birthplace?</option>
            </select>
            
            <input type="text" name="answer" placeholder="Enter Answer" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="submit" value="Sign Up">
        </form>

        <!-- Login link -->
        <h2><a href="login.jsp">Login</a></h2>
    </div>

    <div class="whysign">
        <%-- JSP code for message display --%>
        <% String msg = request.getParameter("msg"); if ("valid".equals(msg)) { %>
            <h1>Successfully Registered!</h1>
        <% } else if ("invalid".equals(msg)) { %>
            <h1>Registration Failed. Please try again.</h1>
        <% } %>
        <h2>PetLover</h2>
        
    </div>
</div>
</body>
</html>
