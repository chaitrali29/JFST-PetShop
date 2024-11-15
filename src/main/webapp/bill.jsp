<%@page import = "connection.ConnectionProvider" %>
<%@page import = "java.sql.*" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>
<%
String email = session.getAttribute("email").toString();
try {
    int total = 0;
    int sno = 0;
    Connection con = ConnectionProvider.getcon();
    Statement st = con.createStatement();

    // Retrieve total sum from cart
    ResultSet rs = st.executeQuery("SELECT SUM(total) FROM cart WHERE email='" + email + "' AND status='bill'");
    if (rs.next()) {
        total = rs.getInt(1);
    }

    // Retrieve user and order details
    ResultSet rs2 = st.executeQuery("SELECT * FROM user INNER JOIN cart ON user.email = cart.email WHERE cart.email='" + email + "' AND cart.status='bill'");
    if (rs2.next()) {
%>
<h3>Online Shopping Bill</h3>
<hr>
<div class="left-div"><h3>Name: <%= rs2.getString(1) %> </h3></div>
<div class="right-div-right"><h3>Email: <%= email %> </h3></div>
<div class="right-div"><h3>Mobile Number: <%= rs2.getString(20) %> </h3></div>  

<div class="left-div"><h3>Order Date: <%= rs2.getString(21) %> </h3></div>
<div class="right-div-right"><h3>Payment Method: <%= rs2.getString(23) %> </h3></div>
<div class="right-div"><h3>Expected Delivery: <%= rs2.getString(22) %> </h3></div> 

<div class="left-div"><h3>Transaction Id: <%= rs2.getString(24) %> </h3></div>
<div class="right-div-right"><h3>City: <%= rs2.getString(17) %> </h3></div> 
<div class="right-div"><h3>Address: <%= rs2.getString(16) %> </h3></div> 

<div class="left-div"><h3>State: <%= rs2.getString(18) %> </h3></div>
<div class="right-div-right"><h3>Country: <%= rs2.getString(19) %> </h3></div>  

<hr>
<br>

<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>Category</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Sub Total</th>
  </tr>
<%
    // Retrieve product details in the user's cart
    ResultSet rs1 = st.executeQuery("SELECT * FROM cart INNER JOIN product ON cart.product_id = product.id WHERE cart.email='" + email + "' AND cart.status='bill'");
    while (rs1.next()) {
        sno++;
%>
  <tr>
    <td><%= sno %></td>
    <td><%= rs1.getString(17) %></td> <!-- Assuming product_name is the 17th column -->
    <td><%= rs1.getString(18) %></td> <!-- Assuming category is the 18th column -->
    <td><%= rs1.getString(19) %></td> <!-- Assuming price is the 19th column -->
    <td><%= rs1.getString(3) %></td>  <!-- Assuming quantity is the 3rd column -->
    <td><%= rs1.getString(5) %></td>  <!-- Assuming sub total is the 5th column -->
  </tr>
<%
    }
%>
</table>
<h3>Total: <%= total %> </h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%
} // End of if condition for rs2
} catch (Exception e) {
    e.printStackTrace();
}
%>
</body>
</html>
