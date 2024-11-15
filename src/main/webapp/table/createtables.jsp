<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
try {
    // Get the connection
    Connection con = ConnectionProvider.getcon();

    if (con == null) {
        out.println("Database connection failed!");
        return;  // Exit the code early if connection is null
    }

    Statement st = con.createStatement();
    String q1 = "CREATE TABLE user(" +
                "name VARCHAR(100), " +
                "email VARCHAR(100) PRIMARY KEY, " +
                "mobilenumber BIGINT, " +
                "securityQues VARCHAR(200), " +
                "answer VARCHAR(200), " +
                "password VARCHAR(50), " +
                "address VARCHAR(500), " +
                "city VARCHAR(100), " +
                "state VARCHAR(100), " +
                "country VARCHAR(100))";
    
    String q2 = "create table product(id int,name varchar(500),category varchar(200),price int,active varchar(10))";
    String q3 = "create table cart(email varchar(100),product_id int,quantity int,price int,total int,address varchar(500),city varchar(100),state varchar(100),country varchar(100),mobileNumber bigint,orderDate varchar(100),deliveryDate varchar(100),paymentMethod varchar(100),transactionId varchar(100),status varchar(10))";
    System.out.println(q1);  // Log query to console
    System.out.println(q2);
  
    System.out.println(q3);
   // st.execute(q1);
    st.execute(q2);
    st.execute(q3);
    System.out.println("Table Created");
    con.close();

    
} catch (SQLException e) {
    e.printStackTrace();  // Print the full exception
    out.println("An error occurred: " + e.getMessage());
} catch (Exception e) {
    e.printStackTrace();  // Print any other exceptions
    out.println("An unexpected error occurred: " + e.getMessage());
}
%>
