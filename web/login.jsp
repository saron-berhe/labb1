<%@ page import="bo.UserHandler" %>
<%@ page import="ui.UserInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String error = null;
    String info = null;

    if ("needlogin".equals(request.getParameter("msg"))) {
        info = "Du måste logga in för att lägga varor i varukorgen.";
    }

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        UserInfo user = UserHandler.login(username, password);
        if (user != null) {
            session.setAttribute("user", user);
            response.sendRedirect("items.jsp");
            return;
        } else {
            error = "Fel användarnamn eller lösenord";
        }
    }
%>
<html>
<head>
    <title>Logga in</title>
</head>
<body>
<h1>Logga in</h1>

<% if (info != null) { %>
    <p><%= info %></p>
<% } %>
<% if (error != null) { %>
    <p style="color:red"><%= error %></p>
<% } %>

<form method="post" action="login.jsp">
    Användarnamn: <input type="text" name="username"><br>
    Lösenord: <input type="password" name="password"><br>
    <input type="submit" value="Logga in">
</form>

<p><a href="items.jsp">Tillbaka till produkterna</a></p>
</body>
</html>