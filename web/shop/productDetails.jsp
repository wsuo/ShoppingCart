<%--
  Created by IntelliJ IDEA.
  User: wsuo
  Date: 2020/4/22 0022
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详情</title>
    <style>
        td {
            text-align: center;
        }

        table {
            width: 300px;
            height: 150px;
            border: 2px cornflowerblue;
            border-radius: 20px;
        }
    </style>
</head>
<body>
<form action="addCart" method="post">
    <input type="hidden" name="id" value="${requestScope.product.id}">
    <table border="2px">
        <tbody>
        <tr>
            <th>属性</th>
            <th>值</th>
        </tr>
        <tr>
            <td>ID</td>
            <td>${requestScope.product.id}</td>
        </tr>
        <tr>
            <td>商品名称</td>
            <td>${requestScope.product.name}</td>
        </tr>
        <tr>
            <td>商品说明</td>
            <td>${requestScope.product.description}</td>
        </tr>
        <tr>
            <td>商品价格</td>
            <td>${requestScope.product.price}</td>
        </tr>
        <tr>
            <td>
                <label>
                    <input type="text" name="quality">
                </label>
            </td>
            <td>
                <input type="submit" value="加入购物车">
            </td>
        </tr>
        </tbody>
    </table>
</form>
<a href="productList.jsp">商品列表</a>
</body>
</html>
