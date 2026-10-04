package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBmanager {

    private static DBmanager instance = null;
    private Connection con = null;

    private static DBmanager getInstance() {
        if (instance == null)
            instance = new DBmanager();
        return instance;
    }
    private DBmanager() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webshop?user=webshopuser&password=123");

        } catch (Exception e) { e.printStackTrace();}
    }

    public static Connection getConnection() {
        return getInstance().con;
    }
}
