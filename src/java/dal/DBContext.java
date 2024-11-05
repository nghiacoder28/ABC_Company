package dal;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public abstract class DBContext<T> {

    protected Connection connection;

    public DBContext() {
        String user = "sa";
        String pass = "123";
        String url = "jdbc:sqlserver://NGUYEN-VU-NGHIA\\NGHIA:1433;databaseName=Assignment;trustServerCertificate=true;";

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
