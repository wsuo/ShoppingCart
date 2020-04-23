<%--
  Created by IntelliJ IDEA.
  User: wsuo
  Date: 2020/4/22 0022
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品列表</title>
    <style>
        li {
            color: cornflowerblue;
        }
    </style>
</head>
<body>
<p>🍓商品列表</p>
<ul>
    <c:forEach var="product" items="${applicationScope.products}">
        <li>
            🔥${product.name}(${product.price})(<a href="details?id=${product.id}">详细信息</a>)
        </li>
    </c:forEach>
</ul>

<ul>
    🛒<a href="cart.jsp">查看购物车</a>
</ul>
</body>
</html>
