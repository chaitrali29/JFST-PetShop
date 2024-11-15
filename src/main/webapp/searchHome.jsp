<%@page import = "connection.ConnectionProvider"%>
<%@page import = "java.sql.*"%>
<%@include file = "header.jsp" %>
<%@include file = "footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<style>
/* Reset styling */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body styling */
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

/* Header styling */
div[style*="color: white; text-align: center; font-size: 30px;"] {
    color: white;
    text-align: center;
    font-size: 2em;
    font-weight: bold;
    background-color: #d35400;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}

/* Table styling */
table {
    width: 90%;
    max-width: 800px;
    margin: 20px auto;
    border-collapse: collapse;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    overflow: hidden;
}

table thead {
    background-color: #d35400;
    color: white;
}

table th,
table td {
    padding: 15px;
    text-align: center;
    font-size: 1em;
    border-bottom: 1px solid #ddd;
}

table th {
    font-weight: bold;
    color: white; /* Dark orange color */
    background-color: orange; /* Optional: adds contrast with white background */
}
table tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

table tbody tr:hover {
    background-color: #f1f1f1;
}

table td a {
    color: #e67e22;
    text-decoration: none;
    font-weight: bold;
    transition: color 0.3s ease;
}

table td a:hover {
    color: #d35400;
}

/* Icon styling */
.fa-inr,
.fa-cart-plus {
    margin-left: 5px;
}

/* Message for "Nothing to show" */
h1[style*="color:white; text-align: center;"] {
    color: white;
    text-align: center;
    font-size: 1.5em;
    margin-top: 20px;
    font-weight: bold;
}

/* Footer styling */
.footer {
    background-color: #333;
    color: #ddd;
    text-align: center;
    padding: 15px;
    width: 100%;
    margin-top: auto;
    font-size: 1em;
    box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.1);
}

.footer p {
    margin: 0;
}
</style>

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
int z=0;
try {  
    String search = request.getParameter("search");
    Connection con = ConnectionProvider.getcon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM product WHERE (name LIKE '%" + search + "%' OR category LIKE '%" + search + "%') AND active = 'Yes'");
    
    while(rs.next()) {
        z = 1;
%>

          <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%= rs.getString(4) %></td>
            <td><a href="addToCartAction.jsp?id=<%= rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
<%   
    } 
} catch(Exception e) {
    System.out.println(e);
}
%>

    </tbody>
</table>

<% if(z == 0) { %>
    <h1 style="color:white; text-align: center;">Nothing to show</h1>
<% } %>

<br>
<br>
<br>
<div class="footer">
    <p>All right reserved by BTech Days</p>
</div>

</body>
</html>
