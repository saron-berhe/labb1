package bo;

import db.UserDB;

public class User {
    private int userId;
    private String username;

    static public User login(String username, String password){
        return UserDB.checkLogin(username, password);
    }

    protected User(int userId, String username){
        this.userId = userId;
        this.username = username;
    }

    public int getUserId() {
        return userId;
    }

    public String getUsername() {
        return username;
    }
}
