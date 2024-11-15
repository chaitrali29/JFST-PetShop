<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import = "connection.ConnectionProvider" %>
<%@page import = "java.sql.*" %>
<%@include file = "header.jsp" %>
<%@include file = "footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
/* Reset styling */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
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

/* Header Styling */
div[style*="color: white; text-align: center; font-size: 30px;"] {
    color: white;
    text-align: center;
    font-size: 2em;
    font-weight: bold;
    background-color: #d35400; /* Orange background */
    padding: 15px;
    width:100%;
    border-radius: 8px;
    margin-bottom: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}

/* Alert Messages */
h3.alert {
    font-size: 1.2em;
    text-align: center;
    color: #e67e22; /* Orange text */
    background-color: #fbeee6; /* Light orange background */
    border-radius: 8px;
    padding: 10px;
    margin: 15px auto;
    max-width: 80%;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

/* Table Styling */
table {
    width: 90%;
    max-width: 1000px;
    margin: 20px auto;
    border-collapse: collapse;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    overflow: hidden;
}

table thead {
    background-color: #d35400; /* Orange header */
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
    background-color: orange;
}

table tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

table tbody tr:hover {
    background-color: #f1f1f1;
}

table td a {
    color: #d35400; /* Deep orange links */
    text-decoration: none;
    font-weight: bold;
    transition: color 0.3s ease;
}

table td a:hover {
    color: #e67e22; /* Lighter orange on hover */
}

table .quantity-adjust a {
    font-size: 1.2em;
    color: #d35400;
    text-decoration: none;
    margin: 0 8px;
    transition: transform 0.3s ease, color 0.3s ease;
}

table .quantity-adjust a:hover {
    transform: scale(1.2);
    color: #e67e22;
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

/* Responsive Design */
@media (max-width: 768px) {
    table {
        font-size: 0.9em;
    }

    h3.alert {
        font-size: 1em;
    }

    div[style*="color: white; text-align: center; font-size: 30px;"] {
        font-size: 1.5em;
        padding: 10px;
    }
}

/* Button styling in table header */

/* Button styling in table header */
.proceed-btn-table {
    display: inline-block;
    background-color: #d35400; /* Deep orange */
    color: white;
    padding: 10px 20px;
    font-size: 1em;
    font-weight: bold;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease, transform 0.2s ease;
    text-align: right; /* Ensure the button text is right-aligned */
}

.proceed-btn-table:hover {
    background-color: #e67e22; /* Lighter orange on hover */
    transform: scale(1.05); /* Slightly enlarge on hover */
}


</style>


</head>
<body>


<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
String msg = request.getParameter("msg");
if("notPossible".equals(msg))
{
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<% } %>

<%
if("inc".equals(msg))
{
%>
<h3 class="alert">Quantity Increased Successfully!</h3>
<%} %>

<%
if("dec".equals(msg))
{
%>
<h3 class="alert">Quantity Decreased Successfully!</h3>
<% } %>


<%
if("remove".equals(msg))
{
%>
<h3 class="alert">Product Successfully Removed!</h3>
<% } %>

<table>
<thead>
<%
int total=0;
int sno=0;
try{
    Connection con = ConnectionProvider.getcon();
    Statement st = con.createStatement();
    ResultSet rs1 = st.executeQuery("select sum(total) from cart where email = '"+email+"' and address is NULL ");
    while(rs1.next()){
        total = rs1.getInt(1);
    }

%>
 <th scope="col" style="background-color: yellow; color: black;">Total: <i class="fa fa-inr"></i> <% out.println(total); %></th>
           <% if(total > 0) { %>   
             <a href="addressPaymentForOrder.jsp" class="proceed-btn-table">Proceed to Order</a>
        <% } %>
        
          
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      <%  ResultSet rs = st.executeQuery("select * from product inner join cart on product.id = cart.product_id and cart.email = '"+email+"' and cart.address is NULL ");
      while(rs.next())
      {
    %>
       <tr>
        <td><%= sno=sno+1 %></td>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><i class="fa fa-inr"></i> <%= rs.getString(4) %></td>
        <td class="quantity-adjust">
            <a href="incDecQuantityAction.jsp?id=<%= rs.getString(1) %>&quantity=inc"><i class='fas fa-plus-circle'></i></a>
            <%= rs.getString(8) %>
            <a href="incDecQuantityAction.jsp?id=<%= rs.getString(1) %>&quantity=dec"><i class='fas fa-minus-circle'></i></a>
        </td>
        <td><i class="fa fa-inr"></i> <%= rs.getString(10) %></td>
        <td><a href="removeFromCart.jsp?id=<%= rs.getString(1) %>">Remove <i class='fas fa-trash-alt'></i></a></td>
    </tr>
       
          <% 
          }
     
          }catch(Exception e){
        	  
          }
          %>

        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>