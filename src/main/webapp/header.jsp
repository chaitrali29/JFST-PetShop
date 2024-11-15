<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
   <style>
    /* Body Styling */
    /* Header Section */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%; /* Makes the header span full width */
    background-color: #ff7f50; /* Coral background */
    padding: 15px 20px; /* Adds padding for better spacing */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.header h2 {
    color: white;
    margin: 0;
    font-size: 2em;
    text-align: center;
    flex-grow: 1; /* Ensures text is centered within the header */
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
}

.header a {
    color: white;
    background-color: #ff6347; /* Tomato */
    padding: 10px 15px;
    margin: 0 10px;
    border-radius: 12px;
    text-decoration: none;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

.header a:hover {
    background-color: #e55342; /* Slightly darker tomato on hover */
    transform: translateY(-3px); /* Lift effect */
}

.header a i {
    margin-left: 5px;
}
    
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5fffa; /* Mint Cream background */
    }

    /* Header Styling */
    h2 {
        text-align: center;
        margin: 10px 0;
        font-size: 2em;
        color: #4b0082; /* Indigo color */
        text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
    }

    /* Navigation Bar */
    a {
        color: white;
        text-decoration: none;
        margin: 0 15px;
        font-size: 1.1em;
        padding: 10px 15px;
        border-radius: 8px;
        transition: background-color 0.3s ease;
    }

    a:hover {
        background-color: #ff6347; /* Tomato color on hover */
    }

    a i {
        margin-left: 8px;
    }

    /* Header Section Links */
    .header a {
        display: inline-block;
        color: white;
        background-color: #ff7f50; /* Coral */
        padding: 10px 15px;
        margin: 10px 9px;
        width: 100%;
        border-radius: 12px;
        transition: transform 0.3s ease, background-color 0.3s ease;
    }

    .header a:hover {
        background-color: #ff6347; /* Tomato hover effect */
        transform: translateY(-3px); /* Lift effect */
    }

    /* User Icon Section */
    h2 a {
        text-decoration: none;
        color: #4b0082; /* Indigo */
        font-weight: bold;
    }

    h2 a i {
        color: #ff6347; /* Tomato icon color */
    }

    /* Search Bar */
    .search-container {
        text-align: center;
        margin: 20px 0;
    }

    .search-container input[type="text"] {
        width: 60%;
        padding: 10px 15px;
        border: 2px solid #ddd;
        border-radius: 20px;
        font-size: 1em;
        outline: none;
        transition: border-color 0.3s ease;
    }

    .search-container input[type="text"]:focus {
        border-color: #4b0082; /* Indigo border on focus */
    }

    .search-container button {
        background-color: #ff7f50; /* Coral button */
        border: none;
        color: white;
        padding: 10px 15px;
        border-radius: 20px;
        cursor: pointer;
        font-size: 1em;
        transition: background-color 0.3s ease, transform 0.3s ease;
    }

    .search-container button:hover {
        background-color: #ff6347; /* Tomato hover */
        transform: translateY(-2px);
    }

    /* Table Styling */
    table {
        width: 90%;
        margin: 20px auto;
        border-collapse: collapse;
        border: 1px solid #ddd;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        background-color: #fff;
        border-radius: 8px;
        overflow: hidden;
    }

    table th, table td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    table th {
        background-color: #ff6347; /* Tomato header */
        color: white;
        font-weight: bold;
    }

    table tr:hover {
        background-color: #f9f9f9;
    }

    /* Footer Styling (Optional) */
    footer {
        background-color: #333;
        color: white;
        text-align: center;
        padding: 20px 0;
        margin-top: 20px;
    }

    footer a {
        color: #ff6347;
        text-decoration: none;
    }

    footer a:hover {
        text-decoration: underline;
    }
</style>
    <br>
    <div class="topnav sticky">
    <% String email = session.getAttribute("email").toString(); %>
            <center><h2>PetLover </h2></center>
            <h2><a href=""><%out.println(email); %> <i class='fas fa-user-alt'></i></a></h2>
            <a href="home.jsp">Home<i class="fa fa-institution"></i></a>
            <a href="myCart.jsp">My Cart<i class='fas fa-cart-arrow-down'></i></a>
           
            <a href="about.html">About <i class="fa fa-address-book"></i></a>
            <a href="logout.jsp">Logout <i class='fas fa-share-square'></i></a>
           <div class="search-container">
    <form action="searchHome.jsp" method="post">
        <input type="text" placeholder="Search" name="search">
        <button type="submit"><i class="fa fa-search"></i></button>
    </form>
</div>

          </div>
           <br>
           <!--table-->

