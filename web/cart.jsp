<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Varukorg</title>
</head>
<body>

<h1>Varukorg</h1>

<%
    ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");

    if (cart == null){
        cart = new ArrayList<String>();
        session.setAttribute("cart", cart);
    }

    HashMap<String, Integer> quantities = new HashMap<String, Integer>();

    for (String product : cart){
        if (quantities.containsKey(product)){
            quantities.put(product, quantities.get(product) + 1);
        }else{
            quantities.put(product, 1);
        }
    }

    for (String product : quantities.keySet()){
        int quantity = quantities.get(product);
%>

<p>
    <%= product %>
    <% if (quantity > 1){ %>
        x<%= quantity %>
    <% } %>
</p>

<%
    }
%>

<a href="items.jsp">Tillbaka till produkter</a>

</body>
</html>