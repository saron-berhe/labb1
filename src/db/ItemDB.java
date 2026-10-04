package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collection;
import java.util.Vector;

public class ItemDB extends bo.Item {
    public static Collection searchItems(String group) {
        Vector v = new Vector();
        try {

            Connection con = DBmanager.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT itemId, name, price FROM items");

            while (rs.next()) {
                int itemId = rs.getInt("itemId");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                v.addElement(new ItemDB(itemId, name, price));
            }

        }catch (SQLException e) {e.printStackTrace();}

        return v;
    }
    private ItemDB(int itemId, String name, double price) {
            super(itemId, name, price);
    }
}
