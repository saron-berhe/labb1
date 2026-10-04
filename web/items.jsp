<%@ page import="bo.ItemHandler" %>
<%@ page import="bo.CartHandler" %>
<%@ page import="ui.ItemInfo" %>
<%@ page import="ui.UserInfo" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--Startsidan är en öppen sida för alla, men för att lägga varor i korgen måste man logga in--%>

<html>
<head>
    <title>Produkter</title>
</head>
<body>

<h1>Produkter</h1>
<%
    UserInfo user = (UserInfo) session.getAttribute("user");
    CartHandler cart = (CartHandler) session.getAttribute("cart");

    if (cart == null){
        cart = new CartHandler();
        session.setAttribute("cart", cart);
    }

    String itemId = request.getParameter("itemId");

    if (itemId != null){
        if (user == null) {
            response.sendRedirect("login.jsp?msg=needlogin");
            return;
        }
        cart.addItem(Integer.parseInt(itemId));

        response.sendRedirect("items.jsp");
        return;
    }
%>

<a href="cart.jsp">Visa kundvagn</a> |
<% if (user == null) { %>
    <a href="login.jsp">Logga in</a>
<% } else { %>
    Inloggad som <%= user.getUsername() %> |
    <a href="logout.jsp">Logga ut</a>
<% } %>

<%
    Collection<ItemInfo> items = ItemHandler.getItemsWithGroup("");

    for (Iterator<ItemInfo> it = items.iterator(); it.hasNext();){
        ItemInfo item = it.next();
%>

<div>
    <%= item.getName() %> - <%= String.format("%.2f", item.getPrice()) %> kr

    <form method="post" action="items.jsp">
        <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
        <input type="submit" value="Lägg till i varukorg">
    </form>
</div>

<%
    }
%>

</body>
</html>