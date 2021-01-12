package g;

import java.sql.*;

public class GetCon {

    public static Connection con;

    public static Connection getCon() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ce4_140", "root","");
           // Class.forName("org.apache.derby.jdbc.ClientDriver");
            //con=DriverManager.getConnection("jdbc:derby://localhost:1527/ce4_140","CE4_140","CE4_140");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {

            System.out.println("Exception in GetCon");

        }
        return con;
    }
}
