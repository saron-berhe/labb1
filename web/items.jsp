<%@ page import="bo.ItemHandler" %>
<%@ page import="bo.CartHandler" %>
<%@ page import="ui.ItemInfo" %>
<%@ page import="ui.UserInfo" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--Startsidan är en öppen sida för alla, men för att lägga varor i korgen måste man logga in --%>
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
<html>
<head>
    <title>Produkter</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="wrapper">
<header>
    <h1>YSkor Webbshop</h1>
    <nav>
        <ul>
            <li><a href="cart.jsp">Visa kundvagn</a></li>
            <% if (user == null) { %>
                <li><a href="login.jsp">Logga in</a></li>
            <% } else { %>
                <li>Inloggad som <%= user.getUsername() %></li>
                <li><a href="logout.jsp">Logga ut</a></li>
            <% } %>
        </ul>
    </nav>
</header>
<main>
<%
    Collection<ItemInfo> items = ItemHandler.getItemsWithGroup("");

    for (Iterator<ItemInfo> it = items.iterator(); it.hasNext();){
        ItemInfo item = it.next();
%>

<section class="card">
    <img src="images/<%= item.getItemId() %>.jpg" alt="<%= item.getName() %>">
    <p><%= item.getName() %> - <%= String.format("%.2f", item.getPrice()) %> kr </p>

    <form method="post" action="items.jsp">
        <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
        <input type="submit" value="Lägg till i varukorg">
    </form>
</section>

<%
    }
%>
</main>
</div>
</body>
</html>