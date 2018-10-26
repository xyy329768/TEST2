<%@ page language="java" import="java.util.*,com.vo.*,com.page.PageInfo" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <base href="<%=basePath%>">
 <link rel="shortcut icon" type="image/x-icon" href="img/bit.ico" />

<title>修改用户</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.css"/>

<style type="text/css">

body {
		background-color:#F9F9F9;
}

div.user1Class {
	margin-bottom: 20px;
}

#user1Fieldset {
	width: 370px;
	height:300px;
	padding: 50px;
	position:relative;
	top:10px;
	left:200px;
}

fieldset legend {
	font-size:20px;
	font: 16px/100% Arial, Verdana, "宋体";
}

fieldset label {
	margin-right: 50px;
	font: 16px/100% Arial, Verdana, "宋体";
}

/*bootstrap 按钮样式*/
.btn {
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: normal;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
      touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
}

.btn-success {
  color: #fff;
  background-color: #5cb85c;
  border-color: #4cae4c;
}

.addUser1Btn {
	position:absolute;
	right:50px;
	bottom:50px;
}

.user1Input
 {
  
  padding: 0px 10px;
  font-size: 16px;
  border-radius: 3px;
}


ul.breadcrumb>li a {
	background-color: #EDF7ED;
	color:#5EB95E;
}

ul.breadcrumb>li a:hover {
	background-color: #E3F2E5;
	
}



</style>



</head>

<body>
	<ul class="breadcrumb">
		<li><a href="#">首页</a></li>
		<li><a href="#">管理用户</a></li>
		<li><a href="#">修改用户</a></li>
	</ul>
	
	<form action="User1Servlet?action=update&target=UserMain" method="post">
	<%
		User1 user1 = (User1)request.getAttribute("user1");
		String requestPage = request.getParameter("requestPage");
		String searchCondition = request.getParameter("searchCondition");
	%>
		
		<input type="hidden" name="action" value="update"/>
		<input type ="hidden" name = "userId" value="<%=user1.getUserId()%>"/>
		<input type ="hidden" name = "requestPage" value="<%=requestPage%>"/>
		<input type="hidden" name="searchCondition" value="<%=searchCondition%>"/>
		
		<fieldset id="user1Fieldset">
			<legend>修改用户 </legend>
			<div class="user1Class">
				<label  class="user1Label" for="userName"style="text-align:right;width:52px">用户名</label><input type="text" class="user1Input" name="userName"
					id="cname" value="<%=user1.getUserName()%>"/>
			</div>

			<div class="user1Class">
				<label class="user1Label" for="password" style="text-align:right;width:52px" >密码 </label><input type="text" class="user1Input" name="password"
					id="password" value="<%=user1.getPassword()%>"/>
			</div>
			<div class="user1Class">
				<label class="user1Label" for="nickName"style="text-align:right;width:52px">昵称 </label><input type="text" class="user1Input" name="nickName"
					id="nickName" value="<%=user1.getNickName()%>"/>
			</div>
			<div class="user1Class">
				<label class="user1Label" for="phoneNumber"style="text-align:right;width:52px">手机号</label><input type="text" class="user1Input" name="phoneNumber"
					id="phoneNumber" value="<%=user1.getPhoneNumber()%>"/>
			</div>
			<div class="user1Class">
				<label class="user1Label" for="email"style="text-align:right;width:52px">邮箱    </label><input type="text" class="user1Input" name="email"
					id="email" value="<%=user1.getEmail()%>"/>
			</div>

			<div class="user1Class">
				<input type="submit" class="btn btn-success addUser1Btn" value="修改" />
			</div>
		</fieldset>
	</form>

<script src="css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
<script src="css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
