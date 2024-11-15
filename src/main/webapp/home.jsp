<%@page import = "connection.ConnectionProvider"%>
<%@page import = "java.sql.*"%>
<%@include file = "header.jsp" %>
<%@include file = "footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
    /* Basic Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* Body styling with gradient background */
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to bottom right, #fff7e6, #ffedd6); /* Light orange gradient */
        color: #333;
        display: flex;
        flex-direction: column;
        align-items: center;
        min-height: 100vh;
        padding: 20px;
    }
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
    

   .header-title {
    color: white;
    text-align: center;
    font-size: 30px;
    margin-bottom: 30px;
    background-color: #d35400; /* Dark Orange */
    padding: 20px;
    border-radius: 8px;
    width: 100%; /* Makes the header span full width */
}

    /* Table styling */
    table {
        width: 90%;
        max-width: 1000px;
        margin: 20px auto;
        border-collapse: collapse;
        background: #ffffff;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    th, td {
        padding: 15px;
        text-align: center;
        font-size: 1em;
        color: #444;
    }

    th {
        background-color: #f39c12;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #ffecd2;
    }

    /* Alert styling */
    .alert {
        text-align: center;
        color: #28a745;
        font-weight: bold;
        margin: 20px auto;
        background-color: #e6f4e6;
        padding: 10px;
        border-radius: 8px;
        max-width: 500px;
    }

    .alert-error {
        color: #d9534f;
        background-color: #fcecec;
    }

    /* Button styling */
    a {
        text-decoration: none;
        font-weight: bold;
        color: #d35400;
        padding: 10px 15px;
        border-radius: 6px;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    a:hover {
        background-color: #f39c12;
        color: white;
    }

    /* Table header for icons */
    .fa-inr, .fa-cart-plus {
        color: #d35400;
        font-size: 1em;
    }

    /* Product section styling */
    .product-id-label {
        text-align: center;
        font-size: 1.2em;
        color: #d35400;
        margin-bottom: 15px;
    }

    /* Styling for product listing header */
    .product-list-header {
        text-align: center;
        font-size: 1.5em;
        color: #e67e22;
        margin-bottom: 20px;
    }

    /* Button styling for adding to cart */
    .add-to-cart-button {
        background: linear-gradient(135deg, #e67e22, #f39c12);
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 1em;
        border-radius: 8px;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    .add-to-cart-button:hover {
        background: linear-gradient(135deg, #f39c12, #e67e22);
    }
</style>

</head>
<body>

<%  
String msg = request.getParameter("msg");
if("added".equals(msg))
{
%>
<h3 class="alert">Product added successfully!</h3>
<% } %>

<%  
if("exist".equals(msg))
{
%>
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<% } %>

<%  
if("invalid".equals(msg))
{
%>
<h3 class="alert">Something went wrong! Try Again!</h3>
<% } %>


<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%
try{
	Connection con = ConnectionProvider.getcon();
	Statement  st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from product where active = 'Yes'");
	while(rs.next()){
%>

          <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3)%></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(4) %></i></td>
            <td><a href="addToCartAction.jsp?id=<%= rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
<% 
	}
}
catch(Exception e){
	System.out.println(e);
	
}
%>


        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>
