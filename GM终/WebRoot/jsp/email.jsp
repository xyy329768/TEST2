<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>发送邮件</title>
  </head>
  
  <body>
    <form method="post" action="LogoServlet?action=logoin">
    	<input type="text" id="username" name="username"><br>
    	<input type="password" id="password" name="password"><br>
    	<input type="submit" value="登录">
    </form>
  </body>
</html>
