package db;

import java.sql.*;

public class UserDB extends bo.User {
    public static bo.User checkLogin(String username, String password) {
        try {
            Connection con = DBmanager.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "SELECT userId, username FROM users WHERE username = ? AND password = ?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new UserDB(rs.getInt("userId"), rs.getString("username"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private UserDB(int userId, String username) {
        super(userId, username);
    }

}
