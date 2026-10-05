<%@ page import="bo.CartHandler" %>
<%@ page import="ui.CartInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Varukorg</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
<h1>Varukorg</h1>

<%
    if (session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp?msg=needlogin");
            return;
    }

    CartHandler cart = (CartHandler) session.getAttribute("cart");
    if (cart == null){
        cart = new CartHandler();
        session.setAttribute("cart", cart);
    }

    String remove = request.getParameter("remove");
    if (remove != null) {
        cart.removeItem(Integer.parseInt(remove));
        response.sendRedirect("cart.jsp");
        return;
    }

    if (cart.isEmpty()){
%>
            <p>Kundvagnen är tom.</p>
<%
    }
    else{
        for (CartInfo ci : cart.getItems()){
%>
        <div class="item">
            <%= ci.getName() %> - <%= String.format("%.2f", ci.getPrice()) %> kr
            <% if (ci.getQuantity() > 1){ %>
                x<%= ci.getQuantity() %>
                (<%= String.format("%.2f", ci.getItemsTotal()) %> kr)
            <% } %>

            <form method="post" action="cart.jsp" class="remove">
                    <input type="hidden" name="remove" value="<%= ci.getItemId() %>">
                    <input type="submit" value="Ta bort">
            </form>
        </div>
    <%
        }
    %>
        <p><b>Totalt: <%= String.format("%.2f", cart.getTotal()) %> kr</b></p>
<%
    }
%>

<a href="items.jsp">Tillbaka till produkter</a>
</div>
</body>
</html>