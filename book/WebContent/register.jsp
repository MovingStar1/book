<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<title>蔚蓝网注册页面</title>
    <link href="css/global.css" rel="stylesheet" />
    <link href="css/layout.css" rel="stylesheet" />
    <link href="css/template.css" rel="stylesheet" />
</head>

<body>
<header class="header_middle">
    <div id="register_header">
        <div class="register_header_left"><img src="images/logo.png" alt="logo"/></div>
        <div class="register_header_right"><a href="index.html" class="blue">首页</a> | <a href="product.html" class="blue">商品展示页</a>  | <a href="shopping.html" class="blue">购物车</a> |  <a href="login.html" class="blue">登录</a></div>
    </div>
</header>
<section id="main">
    <div class="register_content">
        <div class="register_mid_bg">用户注册</div>
        <div class="register_message">
            <form action="UserServlet?action=reg" method="post" id="myform">
                <dl class="register_row">
                    <dt>设置用户名：</dt>
                    <dd><input id="email" type="text" required="required" class="register_input" name="username"/></dd>
                </dl>
                <dl class="register_row">
                    <dt>设置手机号：</dt>
                    <dd><input id="phone" type="text" required="required" class="register_input" name="phone"/></dd>
                </dl>
                <dl class="register_row">
                    <dt>设定密码：</dt>
                    <dd><input id="pwd" type="password" class="register_input"required="required"  pattern="[a-zA-Z0-9]{6,20}" name="pwd"/></dd>
                </dl>
                <dl class="register_row">
                    <dt>再输入一次密码：</dt>
                    <dd><input id="repwd" type="password" class="register_input"/></dd>
                </dl>
                <div class="registerBtn"><input id="registerBtn" type="image" src="images/register_btn_out.gif"/></div>
            </form>
        </div>
    </div>
</section>
<!--网站版权部分开始-->
<footer id="footer">
    <div class="footer_top"><a href="#" target="_parent" class="footer_dull_red">正版保障</a> | <a href="#" target="_parent" class="footer_dull_red">满额免运</a> | <a href="#" target="_parent" class="footer_dull_red">货到付款</a> | <a href="#" target="_parent" class="footer_dull_red">品种最全</a> | <a href="#" target="_parent" class="footer_dull_red">免费退换</a></div>
    <div class="footer_end">Copyright (C) 蔚蓝网 2006-2016, All Rights Reserved  <img src="images/validate.gif"  alt="版权" style="vertical-align:middle;" /> 京ICP证100488号 出版物经营许可证 京批100160号</div>
</footer>
<script src="js/jquery-1.12.4.js"></script>
<script  src="js/register.js"></script>
</body>
</html>
