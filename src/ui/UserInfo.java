package ui;

public class UserInfo {
    private int userId;
    private String username;

    public UserInfo(int userId, String username) {
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
