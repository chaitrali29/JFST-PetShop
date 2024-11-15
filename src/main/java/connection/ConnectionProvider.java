package connection;

import java.sql.*;

public class ConnectionProvider {
    public static Connection getcon() {
        Connection con = null;
        try {
            // Register the JDBC driver (make sure the driver is in the classpath)
            Class.forName("com.mysql.cj.jdbc.Driver");  // Assuming MySQL
            // Open a connection to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jfstproj", "root", "CHaitu@54");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();  // Print error to console
        }
        return con;
    }
}
