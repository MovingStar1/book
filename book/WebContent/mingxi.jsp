<%@page import="com.book.entity.Book"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<title>蔚蓝网商品展示页面</title>
    <link href="css/global.css" rel="stylesheet"/>
    <link href="css/layout.css" rel="stylesheet"/>
    <link href="css/template.css" rel="stylesheet" />
</head>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(function(){
	var num=$(".price_input").val();
	var bookpress=$(".bookpress").html();
	$("#minus").click(function(){
		num--;
		if(num<1){
			alert("数量不符合规范!");
			num=1;
		}
		$(".price_input").val(num);
		$(".price_count").html(num*bookpress);
	 });
	$("#add").click(function(){
		num++;
		$(".price_input").val(num);
		$(".price_count").html(num*bookpress);
	})

	
})
</script>
<style>
.bookClear{
 display: inline-block;
position: absolute;
}
.bookname{
font-size: 20px;
font-family: "微软雅黑";
position: relative;
top:0px;
left: 170px;
padding-top: 20px;
}
.book_oper{
padding-top: 35px;
    font-family: "Hiragino Sans GB","WenQuanYi Micro Hei","Microsoft Yahei",simsun,tahoma,arial,sans-serif;
}
.add{
border: 1px solid #ff002d;
    color: #ff002d;
    background-color: #ffeded;
}
.buy{
border: 1px solid #ff002d;
    color: #ff002d;
    background-color: #ffeded;
}
.color{
    border: 1px solid #ff002d;
    color: #ff002d;
    background-color: #ffeded;
    cursor: pointer;
    margin-right: 10px;
}
</style>
<c:if test="${username==null}">
<%out.print("<script>alert('您还没有登录，请登录...'); window.location='login.jsp'</script>");%>
</c:if>
<c:if test="${bk==null}">
<%out.print("<script>alert('您还没有选择书籍，请先选择图书...'); window.location='index.jsp'</script>");%>
</c:if>
<body>
<header id="header">
    <div class="header_top">
        <div class="header_top_left">您好！${username} [<a href="login.jsp" target="_parent">退出</a> | <a href="register.html" target="_parent">免费注册</a>]</div>
        <div class="header_top_right">
            <ul>
                <li><a href="#" target="_self">客户服务</a></li>
                <li>|</li>
                <li id="menu"><a href="#" target="_self">新手入门</a> <img src="images/arrow_down.gif" alt="arrow" />
                    <div id="dd_menu_top_down">
                        <a href="#" target="_self">购物保障</a><br />
                        <a href="#" target="_self">购物流程</a><br />
                        <a href="#" target="_self">会员介绍</a><br />
                        <a href="#" target="_self">常见问题</a><br />
                    </div>
                </li>
                <li>|</li>
                <li><a href="#" target="_self">礼品卡</a></li>
                <li>|</li>
                <li><a href="#" target="_self">我的订单</a></li>
                <li>|</li>
                <li><a href="#" target="_self">我的账户</a></li>
                <li>|</li>
                <li><a href="BookServlet?action=shoppingcar&username=${username}" target="_parent">购物车</a></li>
                <li><img src="images/header_shop.gif" alt="shopping"/></li>
            </ul>
        </div>
    </div>
</header>
<div class="header_middle">
    <div class="logo"><img src="images/logo.png" alt="logo"/></div>
    <div class="search"><input type="text" placeholder="请输入搜索关键字"><input type="button"></div>
</div>
<nav id="nav">
    <ul>
        <li><a href="#"> 全部商品分类</a></li>
        <li><a href="#"> 首页</a></li>
        <li><a href="#"> 图书</a></li>
        <li><a href="#"> 特价</a></li>
        <li><a href="#"> 团购</a></li>
    </ul>
</nav>
<!--中间部分开始-->
<section id="main">
    <div class="current_place">您现在的位置：<a href="index.jsp">蔚蓝图书</a> &gt;&gt; 详细信息</div>
    <!--左侧菜单开始-->
    <div id="product_left">
        <div id="product_catList">
            <div class="product_catList_top">浏览同级分类</div>
            <div id="product_catList_class"><!--使用javaScript显示图书分类--></div>
        </div>
        <div class="product_catList_end">
            <img src="images/product_01.gif" alt="shopping"/>
            <img src="images/product_02.gif" alt="shopping"/>
        </div>
    </div>
    <!--右侧内容开始-->
    <div id="product_storyList">
        <div id="product_storyList_top">
            <ul>
                <li>排序方式</li>
                <li><img src="images/dd_arrow_right.gif" alt="arrow"/></li>
                <li>
                    <select id="compositor">
                    <option>按销量 降序</option>
                    <option>按价格 升序</option>
                    <option>按价格 降序</option>
                    <option>按折扣 升序</option>
                    <option>按折扣 降序</option>
                    <option>按出版时间 升序</option>
                    <option>按出版时间 降序</option>
                    <option>按上架时间 升序</option>
                    <option>按上架时间 降序</option>
                    </select>
                </li>
                <li><img src="images/product_icon_01.gif" alt="icon"/></li>
                <li><img src="images/product_icon_02.gif" alt="icon"/></li>
                <li><img src="images/product_icon_03.gif" alt="icon"/></li>
                <li><img src="images/product_icon_04.gif" alt="icon"/></li>
                <li>每页显示的数量</li>
                <li><img src="images/dd_arrow_right.gif" alt="arrow"/></li>
                <li><img src="images/product_icon_20.gif" alt="icon"/></li>
                <li><img src="images/product_icon_40.gif" alt="icon"/></li>
                <li style="float:right; padding-right:10px;"><img src="images/product_page_down.gif" alt="icon"/></li>
                <li style="float:right;">第1页</li>
                <li style="float:right;"><img src="images/product_page_up.gif" alt="icon"/></li>
            </ul>
        </div>
        <div id="product_array">
            <a class="click" name="array"  href="javascript:void(0)">列表</a>
            <a name="bigImg" href="javascript:void(0)">大图</a>
        </div>
        <!--图书排列开始-->
        <div id="product_storyList_content" class="product_storyList_content">
        <ul>
        <li>
         <img src="${bk.imgsrc}" style="cursor: pointer;display: inline-block;">
                   <div class="bookClear">
                        <div class="bookname">${bk.bookname}</div>
                        <div class="book_mingxi">简介：${bk.booktitle}</div>
                        <div class="book_mingxi">作者：${bk.bookauthor}</div>
                        <div class="book_mingxi">单价：${bk.bookpress}</div>
                        <div class="book_mingxi">发行日期：${bk.presstime}</div>
                        <div class="book_oper">    
                             <a href="BookServlet?action=add&bid=${bk.bid}&username=${username}&color=${i.color}" class="add">加入购物车</a>
                             <a href="" class="buy">立即购买</a>
                        </div>
                   </div>
        </li>
        
           
         </ul>
            </div>
        </div>
    
    <!--右侧内容结束-->
</section>
<!--网站版权部分开始-->
<footer id="footer">
    <div class="footer_top"><a href="#" target="_parent" class="footer_dull_red">正版保障</a> | <a href="#" target="_parent" class="footer_dull_red">满额免运</a> | <a href="#" target="_parent" class="footer_dull_red">货到付款</a> | <a href="#" target="_parent" class="footer_dull_red">品种最全</a> | <a href="#" target="_parent" class="footer_dull_red">免费退换</a></div>
    <div class="footer_end">Copyright (C) 蔚蓝网 2006-2016, All Rights Reserved  <img src="images/validate.gif"  alt="版权" style="vertical-align:middle;" /> 京ICP证100488号 出版物经营许可证 京批100160号</div>
</footer>

<script src="js/jquery-1.12.4.js"></script>
<script src="js/product.js"></script>
<script src="js/header.js"></script>
</body>
</html>
