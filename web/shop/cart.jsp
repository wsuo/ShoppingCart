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

        table {
            width: 600px;
            height: 300px;
        }
    </style>
</head>
<body>
<a href="./productList.jsp">📄 商品列表</a>
<c:choose>
    <c:when test="${sessionScope.cart != null}">
        <table>
            <tr>
                <th>📜 数量</th>
                <th>商品名</th>
                <th>价格</th>
                <th>小计</th>
                <th>是否删除</th>
            </tr>
            <c:forEach items="${sessionScope.cart}" var="cart">
                <tr>
                    <td>📌${cart.value}</td>
                    <td>${cart.key.name}</td>
                    <td><span style="color: darkorange">${cart.key.price}</span>💰</td>
                    <td><span style="color: darkorange">${cart.key.price * cart.value}</span>💰</td>
                    <c:if test="${sessionScope.cart.size() >= 2}">
                        <td><a href="deleteItem?id=${cart.key.id}">删除💨</a></td>
                    </c:if>
                </tr>
                <c:set var="total" value="${cart.value * cart.key.price + total}"/>
                <c:set var="sum" value="${sum + cart.value}"/>
            </c:forEach>
                <%--        <c:if test="${sessionScope.cart == null || sessionScope.cart.size() == 0}">--%>
                <%--            <tr><td><h2>购物车中没有商品 🙁</h2></td></tr>--%>
                <%--        </c:if>--%>
            <tr>
                <td>✍总计 <span style="color: darkorange">${total}</span>💰</td>
                <td>总数量 ${sum}</td>
                <td></td>
                <td></td>
                <td><a href="./clearCart">清空购物车❗</a></td>
            </tr>
        </table>
    </c:when>
    <c:otherwise>
        <h2>购物车中没有商品 🙁</h2>
    </c:otherwise>
</c:choose>
</body>
</html>
