package bo;

import ui.UserInfo;

public class UserHandler {
    public static UserInfo login(String username, String password){
        User u = User.login(username, password);

        if (u == null) return null;

        return new UserInfo(u.getUserId(), u.getUsername());
    }
}
