<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    // Get parameters from the form
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String MobileNumber = request.getParameter("MobileNumber");
    String SecurityQuestions = request.getParameter("SecurityQuestions");
    String answer = request.getParameter("answer");
    String password = request.getParameter("password");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String country = request.getParameter("country");



    try {
        // Get the connection from the ConnectionProvider
        Connection con = ConnectionProvider.getcon();
        
        // SQL query to insert user data into the 'user' table
        String query = "INSERT INTO user (name, email, mobilenumber, securityQues, answer, password, address, city, state, country) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        // Create prepared statement
       PreparedStatement ps = con.prepareStatement(query);

        // Set parameters for the prepared statement
        ps.setString(1, name);            // Set the 'name' parameter
        ps.setString(2, email);           // Set the 'email' parameter
        ps.setString(3, MobileNumber);    // Set the 'mobilenumber' parameter
        ps.setString(4, SecurityQuestions);  // Set the 'securityQues' parameter
        ps.setString(5, answer);          // Set the 'answer' parameter
        ps.setString(6, password);        // Set the 'password' parameter
        ps.setString(7, address);         // Set the 'address' parameter
        ps.setString(8, city);            // Set the 'city' parameter
        ps.setString(9, state);           // Set the 'state' parameter
        ps.setString(10, country);        // Set the 'country' parameter

        // Execute the insert query
 			ps.executeUpdate();
			response.sendRedirect("signup.jsp?msg=valid");
			
        
        } catch (Exception e) {
    System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");

        }
%>
