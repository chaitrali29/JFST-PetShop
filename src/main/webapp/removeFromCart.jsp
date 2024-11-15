<%@page import = "connection.ConnectionProvider" %>
<%@page import = "java.sql.*" %>
<% 
String email = session.getAttribute("email").toString();
String product_id = request.getParameter("id");
try {
    Connection con = ConnectionProvider.getcon();
    Statement st = con.createStatement();  // Corrected this line
    st.executeUpdate("delete from cart where email = '"+email+"' and product_id ='"+product_id+"' and address is NULL");
    response.sendRedirect("myCart.jsp?msg=removed"); // Remove space around the "="
}
catch(Exception e) {
    System.out.println(e);
}
%>
