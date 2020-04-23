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
    <title>购物车</title>
    <style>
        td {
            text-align: center;
        }
    </style>
</head>
<body>
<a href="./productList.jsp">商品列表</a>
<table>
    <tr>
        <th>数量</th>
        <th>商品名</th>
        <th>价格</th>
        <th>小计</th>
        <th>是否删除</th>
    </tr>
    <c:forEach items="${sessionScope.cart}" var="cart">
        <tr>
            <td>${cart.value}</td>
            <td>${cart.key.name}</td>
            <td>${cart.key.price}</td>
            <td>${cart.key.price * cart.value}</td>
            <td><a href="deleteItem?id=${cart.key.id}">删除</a></td>
        </tr>
        <c:set var="total" value="${cart.value * cart.key.price + total}"/>
    </c:forEach>
    <tr>
        <td>总计${total}</td>
    </tr>
</table>
</body>
</html>
