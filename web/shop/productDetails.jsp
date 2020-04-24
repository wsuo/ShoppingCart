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
        * {
            padding: 0;
            margin: 0;
        }

        td {
            text-align: center;
        }

        table {
            width: 600px;
            height: 300px;
            border: 2px cornflowerblue;
            color: darkorange;
        }

        #quality {
            width: 50px;
            height: 60px;
            border-radius: 10px;
            border: cornflowerblue;
            font-size: 28px;
        }


    </style>
    <script>
        test = function () {
            var quality = document.getElementById("quality");
            var reg = /^[0-9]*$/g;
            if (!reg.test(quality.value)) {
                alert("请输入数字");
            }
        };
    </script>
</head>
<body>
<form action="addCart" method="post">
    <input type="hidden" name="id" value="${requestScope.product.id}">
    <table border="2px">
        <tbody>
        <tr>
            <th></th>
            <th></th>
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
            <td>商品图片</td>
            <td><img src="${requestScope.product.img}"></td>
        </tr>
        <tr>
            <td>商品价格</td>
            <td>${requestScope.product.price}</td>
        </tr>
        <tr>
            <td>
                <label>
                    <input type="text" name="quality" id="quality" onkeyup="test()">
<%--                    <input type="text" name="" oninput="value=value.replace(/[^\d]/g,'')">--%>
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
