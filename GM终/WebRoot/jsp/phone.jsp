<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>手机验证码</title>
	

  </head>
  
  <body>
    
    <form id="form1" action="SendServlet?action=send">
	    <input type="hidden" name="action" value="send">
	    <input type="text" name="phoneNumber">
	    <input type="submit" value="获取验证码">
    </form>
  </body>
</html>
