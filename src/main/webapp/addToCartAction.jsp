<%@page import = "connection.ConnectionProvider"%>
<%@page import = "java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String product_id = request.getParameter("id");
int quantity = 1;
int product_price = 0;
int product_total = 0;
int cart_total = 0;

int z = 0;
try {
    Connection con = ConnectionProvider.getcon();
    Statement st = con.createStatement();
    
    // Fetch product details
    ResultSet rsProduct = st.executeQuery("SELECT * FROM product WHERE id = '" + product_id + "'");
    if (rsProduct.next()) {
        product_price = rsProduct.getInt(4);
        product_total = product_price;
    }
    rsProduct.close(); // Close the ResultSet after use
    
    // Check if product is already in cart
    ResultSet rsCart = st.executeQuery("SELECT * FROM cart WHERE product_id = '" + product_id + "' AND email = '" + email + "' AND address IS NULL");
    if (rsCart.next()) {
        cart_total = rsCart.getInt(5) + product_total;
        quantity = rsCart.getInt(3) + 1;
        z = 1;
    }
    rsCart.close(); // Close the ResultSet after use

    // Update or insert into cart based on the existence of the product in cart
    if (z == 1) {
        st.executeUpdate("UPDATE cart SET total = '" + cart_total + "', quantity = '" + quantity + "' WHERE product_id = '" + product_id + "' AND email = '" + email + "' AND address IS NULL");
        response.sendRedirect("home.jsp?msg=exist");
    } else {
        PreparedStatement ps = con.prepareStatement("INSERT INTO cart (email, product_id, quantity, price, total) VALUES(?,?,?,?,?)");
        ps.setString(1, email);
        ps.setString(2, product_id);
        ps.setInt(3, quantity);
        ps.setInt(4, product_price);
        ps.setInt(5, product_total);
        ps.executeUpdate();
        ps.close(); // Close PreparedStatement after use
        response.sendRedirect("home.jsp?msg=added");
    }

    st.close(); // Close the Statement after use
    con.close(); // Close the Connection after use
} catch(Exception e) {
    System.out.println(e);
    response.sendRedirect("home.jsp?msg=invalid");
}
%>
