<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<c:if test="${username==null}">
<%out.print("<script>alert('您还没有登录，请登录...'); window.location='login.jsp'</script>");%>
</c:if>
<c:if test="${list.isEmpty()}">
<%out.print("<script>alert('您的购物车为空！请先添加商品...');window.location='index.jsp'</script>"); %>
</c:if>
<head>
    <meta charset="UTF-8">
    <title>蔚蓝网首页</title>
    <link href="css/global.css" rel="stylesheet"/>
    <link href="css/layout.css" rel="stylesheet"/>
    <link href="css/template.css" rel="stylesheet" />
</head>
<style>
.price_input{width: 15px;text-align: center;}
.tr_title td{background-color:pink;margin: 0;}
.shoppingcar{width: 1000px;}
.shopping_list_end_2{margin: 15px -16px 0px 0px};
</style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
function ajax(){
	$.ajax({
		url:"BookServlet?action=getShoppingcar&username=${username}",
		type:"post",
		data:"text",
		dataType:"json",
		success:function(data){
			var i=1;
		    var d=JSON.parse(data);
		    $(".shoppingcar").append("<tr><td>商品信息</td><td>操作</td><td>单价</td><td>数量</td><td>总计</td></tr>")
		    $(d).each(function(){
		    	$(".shoppingcar").append("<tr>"+
		    			"<td><img src='"+this.imgsrc+"'></td>"+
		    			"<td><a href='BookServlet?action=delbook&bid="+this.bid+"'>移除</a></td>"+
		    			"<td class='bookpress' id=b"+i+">"+this.bookpress+"</td>"+
		    			"<td class='num_oper'>"+
		    			"<input id=m"+i+" type='button' value='-' style='font-size: 25px;' />"+
		    			"<input  type='text' class='price_input' value='1' id=t"+i+">"+
		    			"<input id=a"+i+" type='button' value='+' style='font-size: 25px;' />"+
		    			"</td>"+
		    			"<td><span class='price_count' id=p"+i+"><input type='text' id=c"+i+" style='width:20px;text-align: center;'></span><span>元</span></td>"+
		    			"</tr>");
		    	i++;
		    })
		    
		    $(".shoppingcar").append("<tr>"+
		    		"<td></td>"+
		    		"<td></td>"+
		    		"<td></td>"+
		    		"<td>"+
		    		"<span class='shopping_list_end_2'>￥</span>"+
		    		"<span class='shopping_list_end_3'>商品金额总计：</span>"+
		    		"<span class='shopping_count'></span><span>元</span></td>"+
		    		"<td> <a onclick='Pay();'><input type='image' src='images/shopping_balance.gif'></a></td>"+
		    		
		    
		    "</tr>")
		    
	var index=[1,2,3,4,5,6,7,8,9,10];
	var num=$("#t"+index[0]+"").val();
	var num1=$("#t"+index[1]+"").val();
	var num2=$("#t"+index[2]+"").val();
	var num3=$("#t"+index[3]+"").val();
	var num4=$("#t"+index[4]+"").val();
	var num5=$("#t"+index[5]+"").val();
	var num6=$("#t"+index[6]+"").val();
	var num7=$("#t"+index[7]+"").val();
	var num8=$("#t"+index[8]+"").val();
	var num9=$("#t"+index[9]+"").val();
	var bookpress=$("#b"+index[0]+"").html();
	var bookpress1=$("#b"+index[1]+"").html();
	var bookpress2=$("#b"+index[2]+"").html();
	var bookpress3=$("#b"+index[3]+"").html();
	var bookpress4=$("#b"+index[4]+"").html();
	var bookpress5=$("#b"+index[5]+"").html();
	var bookpress6=$("#b"+index[6]+"").html();
	var bookpress7=$("#b"+index[7]+"").html();
	var bookpress8=$("#b"+index[8]+"").html();
	var bookpress9=$("#b"+index[9]+"").html();
	//第一本
	$("#m"+index[0]+"").click(function(){
		num--;
		if(num<1){
			alert("数量不符合规范!");
			num=1;
		}
		$("#t"+index[0]+"").val(num);
		$("#c"+index[0]+"").val(num*bookpress);
		var count=Number($("#c"+index[0]+"").val());
		$(".shopping_count").text((count));
	 });
	$("#a"+index[0]+"").click(function(){
		num++;
		$("#t"+index[0]+"").val(num);
		$("#c"+index[0]+"").val(num*bookpress);
		var count=Number($("#c"+index[0]+"").val());
		$(".shopping_count").text((count));
	})
	//第二本
		$("#m"+index[1]+"").click(function(){
		num1--;
		if(num1<1){
			alert("数量不符合规范!");
			num1=1;
		}
		$("#t"+index[1]+"").val(num1);
		$("#c"+index[1]+"").val(num1*bookpress1);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
        $(".shopping_count").text((count+count1));
	 });
	$("#a"+index[1]+"").click(function(){
		num1++;
		$("#t"+index[1]+"").val(num1);
		$("#c"+index[1]+"").val(num1*bookpress1);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
        $(".shopping_count").text((count+count1));
	})
	//第三本
		$("#m"+index[2]+"").click(function(){
		num2--;
		if(num2<1){
			alert("数量不符合规范!");
			num2=1;
		}
		$("#t"+index[2]+"").val(num2);
		$("#c"+index[2]+"").val(num2*bookpress2);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
		var count2=Number($("#c"+index[2]+"").val());
        $(".shopping_count").text((count+count1+count2));
	 });
	$("#a"+index[2]+"").click(function(){
		num2++;
		$("#t"+index[2]+"").val(num2);
		$("#c"+index[2]+"").val(num2*bookpress2);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
		var count2=Number($("#c"+index[2]+"").val());
        $(".shopping_count").text((count+count1+count2));
	})
	//第四本
		$("#m"+index[3]+"").click(function(){
		num3--;
		if(num3<1){
			alert("数量不符合规范!");
			num3=1;
		}
		
		$("#t"+index[3]+"").val(num3);
		$("#c"+index[3]+"").html(num3*bookpress3);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
		var count2=Number($("#c"+index[2]+"").val());
		var count3=Number($("#c"+index[3]+"").val());
        $(".shopping_count").text((count+count1+count2+count3));
	 });
	$("#a"+index[3]+"").click(function(){
		num3++;
		$("#t"+index[3]+"").val(num3);
		$("#c"+index[3]+"").val(num3*bookpress3);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
		var count2=Number($("#c"+index[2]+"").val());
		var count3=Number($("#c"+index[3]+"").val());
        $(".shopping_count").text((count+count1+count2+count3));
	})
	//第五本
		$("#m"+index[4]+"").click(function(){
		num4--;
		if(num4<1){
			alert("数量不符合规范!");
			num4=1;
		}
		$("#t"+index[4]+"").val(num4);
		$("#c"+index[4]+"").val(num4*bookpress4);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
		var count2=Number($("#c"+index[2]+"").val());
		var count3=Number($("#c"+index[3]+"").val());
		var count4=Number($("#c"+index[4]+"").val());
        $(".shopping_count").text((count+count1+count2+count3+count4));
	 });
	$("#a"+index[4]+"").click(function(){
		num4++;
		$("#t"+index[4]+"").val(num4);
		$("#c"+index[4]+"").val(num4*bookpress4);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
		var count2=Number($("#c"+index[2]+"").val());
		var count3=Number($("#c"+index[3]+"").val());
		var count4=Number($("#c"+index[4]+"").val());
        $(".shopping_count").text((count+count1+count2+count3+count4));
	})
	//第六本
		$("#m"+index[5]+"").click(function(){
		num5--;
		if(num5<1){
			alert("数量不符合规范!");
			num=5;
		}
		$("#t"+index[5]+"").val(num5);
		$("#c"+index[5]+"").val(num5*bookpress5);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
		var count2=Number($("#c"+index[2]+"").val());
		var count3=Number($("#c"+index[3]+"").val());
		var count4=Number($("#c"+index[4]+"").val());
		var count5=Number($("#c"+index[5]+"").val());
        $(".shopping_count").text((count+count1+count2+count3+count4+count5));
	 });
	$("#a"+index[5]+"").click(function(){
		num5++;
		$("#t"+index[5]+"").val(num5);
		$("#c"+index[5]+"").val(num5*bookpress5);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
		var count2=Number($("#c"+index[2]+"").val());
		var count3=Number($("#c"+index[3]+"").val());
		var count4=Number($("#c"+index[4]+"").val());
		var count5=Number($("#c"+index[5]+"").val());
        $(".shopping_count").text((count+count1+count2+count3+count4+count5));
	})
	//第七本
		$("#m"+index[6]+"").click(function(){
		num6--;
		if(num6<1){
			alert("数量不符合规范!");
			num6=1;
		}
		$("#t"+index[6]+"").val(num6);
		$("#c"+index[6]+"").val(num6*bookpress6);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
		var count2=Number($("#c"+index[2]+"").val());
		var count3=Number($("#c"+index[3]+"").val());
		var count4=Number($("#c"+index[4]+"").val());
		var count5=Number($("#c"+index[5]+"").val());
		var count6=Number($("#c"+index[6]+"").val());
        $(".shopping_count").text((count+count1+count2+count3+count4+count5+count6));
	 });
	$("#a"+index[6]+"").click(function(){
		num6++;
		$("#t"+index[6]+"").val(num6);
		$("#c"+index[6]+"").val(num6*bookpress6);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
		var count2=Number($("#c"+index[2]+"").val());
		var count3=Number($("#c"+index[3]+"").val());
		var count4=Number($("#c"+index[4]+"").val());
		var count5=Number($("#c"+index[5]+"").val());
		var count6=Number($("#c"+index[6]+"").val());
        $(".shopping_count").text((count+count1+count2+count3+count4+count5+count6));
	})
	//第八本
		$("#m"+index[7]+"").click(function(){
		num7--;
		if(num7<1){
			alert("数量不符合规范!");
			num7=1;
		}
		
		$("#t"+index[7]+"").val(num7);
		$("#c"+index[7]+"").val(num7*bookpress7);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
		var count2=Number($("#c"+index[2]+"").val());
		var count3=Number($("#c"+index[3]+"").val());
		var count4=Number($("#c"+index[4]+"").val());
		var count5=Number($("#c"+index[5]+"").val());
		var count6=Number($("#c"+index[6]+"").val());
		var count7=Number($("#c"+index[7]+"").val());
        $(".shopping_count").text((count+count1+count2+count3+count4+count5+count6+count7));
	 });
	$("#a"+index[7]+"").click(function(){
		num7++;
		$("#t"+index[7]+"").val(num7);
		$("#c"+index[7]+"").val(num7*bookpress7);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
		var count2=Number($("#c"+index[2]+"").val());
		var count3=Number($("#c"+index[3]+"").val());
		var count4=Number($("#c"+index[4]+"").val());
		var count5=Number($("#c"+index[5]+"").val());
		var count6=Number($("#c"+index[6]+"").val());
		var count7=Number($("#c"+index[7]+"").val());
        $(".shopping_count").text((count+count1+count2+count3+count4+count5+count6+count7));
	})
	//第九本
		$("#m"+index[8]+"").click(function(){
		num8--;
		if(num8<1){
			alert("数量不符合规范!");
			num8=1;
		}
		$("#t"+index[8]+"").val(num8);
		$("#c"+index[8]+"").val(num8*bookpress8);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
		var count2=Number($("#c"+index[2]+"").val());
		var count3=Number($("#c"+index[3]+"").val());
		var count4=Number($("#c"+index[4]+"").val());
		var count5=Number($("#c"+index[5]+"").val());
		var count6=Number($("#c"+index[6]+"").val());
		var count7=Number($("#c"+index[7]+"").val());
		var count8=Number($("#c"+index[8]+"").val());
        $(".shopping_count").text((count+count1+count2+count3+count4+count5+count6+count7+count8));
	 });
	$("#a"+index[8]+"").click(function(){
		num8++;
		$("#t"+index[8]+"").val(num8);
		$("#c"+index[8]+"").val(num8*bookpress8);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
		var count2=Number($("#c"+index[2]+"").val());
		var count3=Number($("#c"+index[3]+"").val());
		var count4=Number($("#c"+index[4]+"").val());
		var count5=Number($("#c"+index[5]+"").val());
		var count6=Number($("#c"+index[6]+"").val());
		var count7=Number($("#c"+index[7]+"").val());
		var count8=Number($("#c"+index[8]+"").val());
        $(".shopping_count").text((count+count1+count2+count3+count4+count5+count6+count7+count8));
	})
	//第十本
		$("#m"+index[9]+"").click(function(){
		num9--;
		if(num9<1){
			alert("数量不符合规范!");
			num9=1;
		}
		$("#t"+index[9]+"").val(num9);
		$("#p"+index[9]+"").html(num9*bookpress9);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
		var count2=Number($("#c"+index[2]+"").val());
		var count3=Number($("#c"+index[3]+"").val());
		var count4=Number($("#c"+index[4]+"").val());
		var count5=Number($("#c"+index[5]+"").val());
		var count6=Number($("#c"+index[6]+"").val());
		var count7=Number($("#c"+index[7]+"").val());
		var count8=Number($("#c"+index[8]+"").val());
		var count9=Number($("#c"+index[9]+"").val());
        $(".shopping_count").text((count+count1+count2+count3+count4+count5+count6+count7+count8+count9));
	 });
	$("#a"+index[9]+"").click(function(){
		num9++;
		$("#t"+index[9]+"").val(num9);
		$("#c"+index[9]+"").val(num9*bookpress9);
		var count=Number($("#c"+index[0]+"").val());
		var count1=Number($("#c"+index[1]+"").val());
		var count2=Number($("#c"+index[2]+"").val());
		var count3=Number($("#c"+index[3]+"").val());
		var count4=Number($("#c"+index[4]+"").val());
		var count5=Number($("#c"+index[5]+"").val());
		var count6=Number($("#c"+index[6]+"").val());
		var count7=Number($("#c"+index[7]+"").val());
		var count8=Number($("#c"+index[8]+"").val());
		var count9=Number($("#c"+index[9]+"").val());
        $(".shopping_count").text((count+count1+count2+count3+count4+count5+count6+count7+count8+count9));
	})   
		},
		error:function(){
			alert("系统异常");
		}
		
	})
}
function Pay() {
	$.ajax({
		 url:"BookServlet?action=Pay",
         type:"post",
		 data: {count:Math.ceil($('.shopping_count').text())},
		 success:function(d){
			 window.location.replace("./PaySuccess/PaySuccess.jsp");
		 },
		 error:function(){
			 alert("系统异常");
		 }
	})
}


</script>
<body onload="ajax()">
<!--随滚动条滚动可关闭广告-->
<div id="right" class="right">
    <div class="dd_close" id="dd_close"><a href="javascript:void(0);">关闭</a></div>
    <img src="images/scroll.jpg" id="right1" />
</div>
<!--头部-->
<header id="header">
    <div class="header_top">
        <div class="header_top_left">您好!${username}欢迎光临蔚蓝网 [<a href="login.jsp" target="_parent">注销</a> | <a href="register.html" target="_parent">免费注册</a>]</div>
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

<!--网站中间内容开始-->
              <table class="shoppingcar" >
                    <!-- <tr class="tr_title">
                         <td>商品信息</td><td>单价</td><td>操作</td><td>数量</td><td>总计</td>
                     </tr>
                     
                     
                     
                     <c:forEach var="i" items="${list}" varStatus="s">
                         <tr class="tr_book">
                             <td><img src="${i.imgsrc}"></td>
                             <td class="bookpress">${i.bookpress}</td>
                             <td><a href="BookServlet?action=delbook&bid=${i.bid}">移除</a></td>
                              <td>
                             <input id="minus" type="button" value="-" style="font-size: 25px;" />
                             <input  type="text" class="price_input" value="3">
                             <input id="add" type="button" value="+" style="font-size: 25px;" />
                             </td>
                             <td><span class="price_count"></span><span>元</span></td> 
                         </tr>
                     </c:forEach>
                            -->
                            
                         

                     
              </table>
   
    



<!--网站版权部分开始-->
<footer id="footer">
    <div class="footer_top"><a href="#" target="_parent" class="footer_dull_red">正版保障</a> | <a href="#" target="_parent" class="footer_dull_red">满额免运</a> | <a href="#" target="_parent" class="footer_dull_red">货到付款</a> | <a href="#" target="_parent" class="footer_dull_red">品种最全</a> | <a href="#" target="_parent" class="footer_dull_red">免费退换</a></div>
    <div class="footer_end">Copyright (C) 蔚蓝网 2006-2016, All Rights Reserved  <img src="images/validate.gif"  alt="版权" style="vertical-align:middle;" /> 京ICP证100488号 出版物经营许可证 京批100160号</div>
</footer>
<script  src="js/jquery-1.12.4.js"></script>
<script src="js/index.js"></script>
<script src="js/header.js"></script>
</body>
</html>

