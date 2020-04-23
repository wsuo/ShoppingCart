<%--
  Created by IntelliJ IDEA.
  User: wsuo
  Date: 2020/4/22 0022
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>首页</title>
</head>
<style>
    body, html {
        background-color: #EBECF0;
    }

    body, p, input, select, textarea, button {
        font-family: "Montserrat", sans-serif;
        letter-spacing: -0.2px;
        font-size: 16px;
    }

    div, p {
        color: #BABECC;
        text-shadow: 1px 1px 1px #FFF;
    }

    form {
        padding: 16px;
        width: 320px;
        margin: 0 auto;
    }

    .segment {
        padding: 32px 0;
        text-align: center;
    }

    button, input {
        border: 0;
        outline: 0;
        font-size: 16px;
        border-radius: 320px;
        padding: 16px;
        background-color: #EBECF0;
        text-shadow: 1px 1px 0 #FFF;
    }

    label {
        display: block;
        margin-bottom: 24px;
        width: 100%;
    }

    input {
        margin-right: 8px;
        box-shadow: inset 2px 2px 5px #BABECC, inset -5px -5px 10px #FFF;
        width: 100%;
        box-sizing: border-box;
        transition: all 0.2s ease-in-out;
        appearance: none;
        -webkit-appearance: none;
    }

    input:focus {
        box-shadow: inset 1px 1px 2px #BABECC, inset -1px -1px 2px #FFF;
    }

    button {
        color: #61677C;
        box-shadow: -5px -5px 20px #FFF, 5px 5px 20px #BABECC;
        transition: all 0.2s ease-in-out;
        cursor: pointer;
        font-weight: 600;
    }

    button:hover {
        box-shadow: -2px -2px 5px #FFF, 2px 2px 5px #BABECC;
    }

    button:active {
        box-shadow: inset 1px 1px 2px #BABECC, inset -1px -1px 2px #FFF;
    }

    button .icon {
        margin-right: 8px;
    }

    button.unit {
        border-radius: 8px;
        line-height: 0;
        width: 48px;
        height: 48px;
        display: inline-flex;
        justify-content: center;
        align-items: center;
        margin: 0 8px;
        font-size: 19px;
    }

    button.unit .icon {
        margin-right: 0;
    }

    button.red {
        display: block;
        width: 100%;
        color: #AE1100;
    }

    .input-group {
        display: flex;
        align-items: center;
        justify-content: flex-start;
    }

    .input-group label {
        margin: 0;
        flex: 1;
    }

</style>
<body>
<c:redirect url="shop/productList.jsp"/>
</body>
</html>
