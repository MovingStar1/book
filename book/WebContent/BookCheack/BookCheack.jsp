<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<c:if test="${flag==null}">
<%out.print("<script>alert('该物品已存在于购物车！');window.location='../mingxi.jsp'</script>");%>
</c:if>
</body>
</html>