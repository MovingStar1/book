<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<style>
.imgbox{margin: 0px auto;position: absolute;left:410px;top:200px;}
.imgbox img{width: 30px;height: 30px}
.imgbox_ul li{list-style: none;text-decoration: none;display: block;}
.imgbox_ul{list-style: none;text-decoration: none;}
.p{margin-left: 30px;}
</style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">

</script>
<body>
<c:if test="${flag==true}">
<div class="imgbox">
     <ul class="imgbox_ul">
         <li><p style="font-size: 25px"><img src="../images/paysuccess.jpg">您已成功支付${count}元</p></li>
         <li class="p"><p style="font-size: 14px">卖家将立即收到您的付款</p></li>
         <li class="p"><p style="font-size: 14px">您可能需要:</p><a href="../index.jsp" style="font-size: 14px">继续购买</a>|<a href="Bo" style="font-size: 14px">消费记录</a></li>
     </ul>
</div>
</c:if>
</body>
</html>