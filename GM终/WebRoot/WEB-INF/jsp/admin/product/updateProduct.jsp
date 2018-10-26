<%@ page language="java" import="java.util.*,com.vo.*,com.page.PageInfo" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <base href="<%=basePath%>">

<title>修改商品</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.css"/>

<style type="text/css">

body {
		background-color:#F9F9F9;
}

div.categoryClass {
	margin-bottom: 20px;
}

#categoryFieldset {
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

.addCategoryBtn {
	position:absolute;
	right:50px;
	bottom:50px;
}

.categoryLabel
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
		<li><a href="#">商品管理</a></li>
		<li><a href="#">修改商品</a></li>
	</ul>
	
	<form action="ProductServlet" method="post">
	<%
			Product product = (Product)request.getAttribute("product");
			//System.out.println("界面category="+category);
			String requestPage = request.getParameter("requestPage");
		 %>
		
		<input type="hidden" name="action" value="update"/>
		<input type="hidden" name="target" value="productMain"/>
		<input type ="hidden" name = "pid" value="<%=product.getPid()%>"/>
		<input type ="hidden" name = "requestPage" value="<%=requestPage%>"/>
		
		<fieldset id="categoryFieldset">
			<legend>修改商品种类</legend>
			<div class="categoryClass">
				<label for="pname">商品名称</label><input type="text" class="categoryLabel" name="pname"
					id="pname" value="<%=product.getPname()%>"/>
			</div>

			<div class="categoryClass">
				<label for="price">商品价格</label><input type="text" class="categoryLabel" name="price"
					id="price" value="<%=product.getPrice()%>"/>
			</div>
			<div class="categoryClass">
				<label for="productSum">商品数量</label><input type="text" class="categoryLabel" name="productSum"
					id="productSum" value='<%=product.getProductSum() %>'/>
			</div>
			<div class="categoryClass">
				<label for="dianpuName">店铺名称</label><input type="text" class="categoryLabel" name="dianpuName"
					id="dianpuName" value="<%=product.getDianpuName() %>"/>
			</div>
			
			<div class="categoryClass">
				<label >商品所属种类</label>
				<select class="categoryselect" name="cid">
				<%
				   List<Category2> list = (List<Category2>)request.getAttribute("list");
					for(Category2 category2:list){
					if(product.getCid()==category2.getCid()){
				%>
					<option value='<%=category2.getCid()%>' selected='selected'>
						<%=category2.getCname() %>
					</option>
				<% 	
					}else{
					
				%>
					<option value='<%=category2.getCid()%>'>
						<%=category2.getCname() %>
					</option>
				<% 	
					
					}
				
					}
				 %>
					
				</select>
			</div>

			<div class="categoryClass">
				<input type="submit" class="btn btn-success addCategoryBtn" value="修改" />
			</div>
		</fieldset>
	</form>

<script src="css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
<script src="css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
