<%@page import="java.sql.*" %>
<%@page import="connection.ConnectionProvider" %>
<%@page contentType="text/html; charset=ISO-8859-1" %>
<html>
<head>
    <title>Payment for Order</title>
</head>
<body>

<%
    // Retrieve email from session
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("login.jsp"); // Redirect to login page if session is not valid
        return;
    }

    // Retrieve form parameters
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String country = request.getParameter("country");
    String mobileNumber = request.getParameter("mobileNumber");
    String paymentMethod = request.getParameter("paymentMethod");
    String transactionID = request.getParameter("transactionID");
    String status = "bill"; // Default status value for order

    // Database connection and prepared statement initialization
    Connection con = null;
    PreparedStatement ps = null;
    PreparedStatement ps1 = null;

    try {
        // Establish connection to the database
        con = ConnectionProvider.getcon();

        // Update user details
        ps = con.prepareStatement("UPDATE user SET address=?, city=?, state=?, country=?, mobilenumber=? WHERE email=?");
        ps.setString(1, address);
        ps.setString(2, city);
        ps.setString(3, state);
        ps.setString(4, country);
        ps.setString(5, mobileNumber);
        ps.setString(6, email);
        ps.executeUpdate(); // Execute the update for user table

        // Update cart details
        ps1 = con.prepareStatement("UPDATE cart SET address=?, city=?, state=?, country=?, mobileNumber=?, orderDate=NOW(), deliveryDate=DATE_ADD(orderDate, INTERVAL 7 DAY), paymentMethod=?, transactionID=?, status=? WHERE email=? AND address IS NULL");
        ps1.setString(1, address);
        ps1.setString(2, city);
        ps1.setString(3, state);
        ps1.setString(4, country);
        ps1.setString(5, mobileNumber);
        ps1.setString(6, paymentMethod);
        ps1.setString(7, transactionID);
        ps1.setString(8, status);
        ps1.setString(9, email);
        ps1.executeUpdate(); // Execute the update for cart table

        // After successful update, redirect to the bill page
        response.sendRedirect("bill.jsp");

    } catch (SQLException e) {
        // Print and handle the SQLException
        e.printStackTrace();
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        // Close the resources in finally block to avoid resource leaks
        try {
            if (ps != null) ps.close();
            if (ps1 != null) ps1.close();
            if (con != null) con.close();
        } catch (SQLException se) {
            se.printStackTrace(); // Handle exception while closing resources
        }
    }
%>

</body>
</html>
