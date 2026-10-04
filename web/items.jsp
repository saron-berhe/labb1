<%@ page import="bo.ItemHandler" %>
<%@ page import="ui.ItemInfo" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>Produkter</title>
</head>
<body>

<h1>Produkter</h1>
<%
    ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");

    if (cart == null){
        cart = new ArrayList<String>();
        session.setAttribute("cart", cart);
    }

    String name = request.getParameter("name");
    String price = request.getParameter("price");

    if (name != null && price != null){
        cart.add(name + " - " + String.format("%.2f", Double.parseDouble(price)) + " kr");
    }
%>

<a href="cart.jsp">Visa varukorg</a>

<%
    Collection<ItemInfo> items = ItemHandler.getItemsWithGroup("");

    for (Iterator<ItemInfo> it = items.iterator(); it.hasNext();){
        ItemInfo item = it.next();
%>

<p>
    <%= item.getName() %> - <%= String.format("%.2f", item.getPrice()) %> kr

    <form method="post" action="items.jsp">
        <input type="hidden" name="name" value="<%= item.getName() %>">
        <input type="hidden" name="price" value="<%= item.getPrice() %>">
        <input type="submit" value="Lägg till i varukorg">
    </form>
</p>

<%
    }
%>

</body>
</html>