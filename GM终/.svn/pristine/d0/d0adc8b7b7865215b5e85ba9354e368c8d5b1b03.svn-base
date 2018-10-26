<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html class="no-js">
<head>
<base href="<%=basePath%>">
<title>国美商城后台管理系统</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="img/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="css/amazeui.min.css"/>
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery-1.7.2.js"></script>
<script src="js/app.js"></script>
</head>
<body>

</head>

<body>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand"><img src="img/logo.png"></div>
	<label id="logoLabel" style="
    color: #295581;
    font-size: 36px;
	font-family: '宋体';
padding-left: 400px;">国美商城后台管理系统</label>
  
</header>

<div class="am-cf admin-main"> 

<div class="nav-navicon admin-main admin-sidebar">
    
    
  
    <div class="sideMenu">
      <h3 class="am-icon-flag"><em></em> <a href="javacript:void(0)">商品种类管理</a></h3>
      <ul>
        <li><a href="JDDispatcherServlet?target=admin/category/addCategory.jsp" target="mainIFrame">添加一级商品种类</a></li>
        <li ><a href="CategoryServlet?action=getAllByPage&requestPage=1" target="mainIFrame">管理一级商品种类</a></li>
        <li><a href="Category2Servlet?action=getAllCategoryForAddCategory2" target="mainIFrame">添加二级商品种类</a></li>
        <li><a href="Category2Servlet?action=getAllByPage&requestPage=1" target="mainIFrame">管理二级商品种类</a></li>
      </ul>
      <h3 class="am-icon-cart-plus"><em></em> <a href="javacript:void(0)"> 商品管理</a></h3>
      <ul>
        <li><a href="ProductServlet?action=getAllCategoryForAddProduct" target="mainIFrame">添加商品</a></li>
        <li><a href="ProductServlet?action=getAllByPage&requestPage=1&target=uploadImage" target="mainIFrame">上传图片</a></li>
        <li><a href="ProductServlet?action=getAllByPage&requestPage=1&target=productMain" target="mainIFrame">管理商品</a></li>
        <li><a href="ProductServlet?action=getAllByPage&requestPage=1&target=productMainUpDown" target="mainIFrame">上架下架</a></li>
        
      </ul>
      <h3 class="am-icon-users"><em></em> <a href="javacript:void(0)">订单管理</a></h3>
      <ul>
        <li><a href="OrderServlet?action=getOrderByPage&requestPage=1&target=order" target="mainIFrame">管理订单</a> </li>
        <li><a href="OrderServlet?action=getOdetailByPage&requestPage=1&target=odetail" target="mainIFrame">管理订单明细</li>
        
      </ul>
      <h3 class="am-icon-volume-up"><em></em> <a href="javacript:void(0)">用户管理</a></h3>
      <ul>      
        <li><a href="User1Servlet?action=getAllByPage&requestPage=1&target=UserMain" target="mainIFrame" >管理用户</a></li>
        <li><a href="User1Servlet?action=getAllByPage&requestPage=1&target=UserMainActive" target="mainIFrame">用户激活</a></li>
      </ul>
      
     
    </div>
    <!-- sideMenu End --> 
    
    <script type="text/javascript">
			jQuery(".sideMenu").slide({
				titCell:"h3", //鼠标触发对象
				targetCell:"ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
				effect:"slideDown", //targetCell下拉效果
				delayTime:300 , //效果时间
				triggerTime:150, //鼠标延迟触发时间（默认150）
				defaultPlay:true,//默认是否执行效果（默认true）
				returnDefault:true //鼠标从.sideMen移走后返回默认状态（默认false）
				});
		</script> 

    
    
    
    
    
    
    
</div>

<div  style="background-color:#FFFFFF;">
	
	<div style="position:relative;left:214px;width:800px">
	<iframe name="mainIFrame" width="1260px" height="680px"  frameborder="0" ">
	   			</iframe>
	</div>
</div>
<div style="clear:both"></div>

</div>




</div>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]--> 

<!--[if (gte IE 9)|!(IE)]><!--> 
<script src="assets/js/amazeui.min.js"></script>
<!--<![endif]-->



</body>
</html>