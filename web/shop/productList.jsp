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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
<%--<p>🍓商品列表</p>--%>
<%--<ul>--%>
<%--    <c:forEach var="product" items="${applicationScope.products}">--%>
<%--        <li>--%>
<%--            🔥${product.name}(${product.price})(<a href="details?id=${product.id}">详细信息</a>)--%>
<%--        </li>--%>
<%--    </c:forEach>--%>
<%--</ul>--%>

<%--<ul>--%>
<%--    🛒<a href="cart.jsp">查看购物车</a>--%>
<%--</ul>--%>
<div class="page">
    <div id="mallPage" class=" mallist tmall- page-not-market ">

        <!-- 头部搜索 -->
        <div id="header" class=" header-list-app">
            <div class="headerLayout">
                <div class="headerCon ">
                    <!-- Logo-->
                    <h1 id="mallLogo">
                        <img th:src="@{/images/jdlogo.png}" alt="">
                    </h1>

                    <div class="header-extra">

                        <!--搜索-->
                        <div id="mallSearch" class="mall-search">
                            <form name="searchTop" class="mallSearch-form clearfix" action="search">
                                <fieldset>
                                    <legend>搜索</legend>
                                    <div class="mallSearch-input clearfix">
                                        <div class="s-combobox" id="s-combobox-685">
                                            <div class="s-combobox-input-wrap">
                                                <input type="text" autocomplete="off" placeholder="输入关键字搜索" id="mq"
                                                       class="s-combobox-input" aria-haspopup="true" name="keyword">
                                            </div>
                                        </div>
                                        <button type="submit" id="searchbtn">搜索</button>
                                    </div>
                                </fieldset>
                            </form>
                            <ul class="relKeyTop">
                                <li><a>硕硕学Java</a></li>
                                <li><a>硕硕学前端</a></li>
                                <li><a>硕硕学Linux</a></li>
                                <li><a>硕硕学大数据</a></li>
                                <li><a>硕硕学理财</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 商品详情页面 -->
        <div id="content">
            <div class="main">
                <!-- 品牌分类 -->
                <form class="navAttrsForm">
                    <div class="attrs j_NavAttrs" style="display:block">
                        <div class="brandAttr j_nav_brand">
                            <div class="j_Brand attr">
                                <div class="attrKey">
                                    功能
                                </div>
                                <div class="attrValues">
                                    <ul class="av-collapse row-2">
                                        <li><a href="cart.jsp"> 🛒 购物车 </a></li>
<%--                                        <li><a href="#"> Java </a></li>--%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <!-- 排序规则 -->
<%--                <div class="filter clearfix">--%>
<%--                    <a class="fSort fSort-cur">综合<i class="f-ico-arrow-d"></i></a>--%>
<%--                    <a class="fSort">人气<i class="f-ico-arrow-d"></i></a>--%>
<%--                    <a class="fSort">新品<i class="f-ico-arrow-d"></i></a>--%>
<%--                    <a class="fSort">销量<i class="f-ico-arrow-d"></i></a>--%>
<%--                    <a class="fSort">价格<i class="f-ico-triangle-mt"></i><i class="f-ico-triangle-mb"></i></a>--%>
<%--                </div>--%>

                <!-- 商品详情 -->
                <div class="view grid-nosku">
                    <c:forEach var="product" items="${applicationScope.products}">
                            <div class="product">
                                <div class="product-iWrap">
                                    <!--商品封面-->
                                    <div class="productImg-wrap">
                                        <a class="productImg">
                                            <img src="${product.img}">
                                        </a>
                                    </div>
                                    <!--价格-->
                                    <p class="productPrice">
                                        <em><b>¥</b>${product.price}</em>
                                    </p>
                                    <!--标题-->
                                    <p class="productTitle">
                                        <a href="details?id=${product.id}"> ${product.name} </a>
                                    </p>
                                    <!-- 店铺名 -->
                                    <div class="productShop">
                                        <span>店铺： 学习Java </span>
                                    </div>
                                    <!-- 成交信息 -->
                                    <p class="productStatus">
                                        <span>月成交<em>999笔</em></span>
                                        <span>评价 <a>3</a></span>
                                    </p>
                                </div>
                            </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
