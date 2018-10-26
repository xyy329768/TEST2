<%@ page language="java" import="java.util.*,com.vo.*,com.page.PageInfo" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<base href="<%=basePath%>">
	<head>
		<meta charset="UTF-8">
		<title>第一个Bootstrap程序</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/jQuery-confirm/jquery-confirm.css"/>
		
		<style type="text/css">
			body {
				background-color:#F9F9F9;
			}
			
			a:link {
				text-decoration: none;
			}
			
			
		
			tr.tableHead {
				background-color: #EDF7ED;
				color:#5EB95E;
			}
			
			tr.tableHead>th {
				text-align: center;
			}
			
			/*鼠标悬停的 当前行高亮*/
			/*table>tbody>tr:hover {
				background-color:#BAD0EF !important;
			}*/
			
			div.categoryTableDiv {
				width:1060px;
				margin:0px auto;
			}
			
			#productTable {
				position:relative;
				top:70px;
			}
			#productTable {
				table-layout:fixed;  
			}
			
			#productTable td{
				overflow: hidden;  
       			white-space: nowrap;  
       			text-overflow: ellipsis;
			}
			
			#tiaozhuan{
				position: absolute;
				right: 100px;
				bottom: 140px;
			}
			#jdCategorySearch {
				width:500px;
				margin:0px auto;
				position:relative;
				top:25px;
				right:60px;
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
		<%
			PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
		 %>
		<div>
			<ul class="breadcrumb">
				<li><a href="#">首页</a></li>
				<li><a href="#">商品管理</a></li>
				<li><a href="#">上传图片</a></li>
			</ul>
		</div>
		<form id="categoryForm" action="ProductServlet?action=getPageByQuery&target=uploadImage" method="post">
		
			<div id="jdCategorySearch" class="input-group">
					<input type="search" id="searchCondition" name="searchCondition" value='${requestScope.searchCondition}' class="form-control"/>
					
					<span class="input-group-btn">
						<input type="submit"  value="搜索" class="btn btn-default"/>
					</span>
			</div>
	
		</form>
		<div class="text-center categoryTableDiv">

			<table id="productTable" class="table table-striped table-bordered table-hover">
				<thead>
					<tr class="tableHead">
						<th width="10%">商品编号</th>
						<th width="20%">商品名称</th>
						<th width="10%">商品价格</th>
						<th width="10%">商品数量</th>
						<th width="20%">店铺名称</th>
						<th width="20%">所属种类</th>
						<th width="10%">操作</th>
						
					</tr>
				</thead>

				<tbody>
				
					<%
						List<Product> list = (List<Product>)request.getAttribute("list");
						
						for(Product product:list){
					%>
						
						<tr>
							<td><%=product.getPid() %></td>
							<td><%=product.getPname() %></td>
							<td><%=product.getPrice() %></td>
							<td><%=product.getProductSum() %></td>
							<td><%=product.getDianpuName() %></td>
							<td><%=product.getCategory().getCname() %></td>
							
							<td>
							<button onclick="getOneForUpload(<%=product.getPid() %>)" class="btn btn-success btn-xs">上传</button>
							</td>
							
							
						</tr>
					
					<%
						}
					 %>	

				</tbody>
			<div id="tiaozhuan">
			<form id="categoryForm2" action="ProductServlet?action=getPageByQuery&target=uploadImage" method="post">
				<input type="hidden" name="searchCondition" value='${requestScope.searchCondition}' class="form-control"/>
				<a id="first" class="btn btn-default btn-sm" href="ProductServlet?action=getPageByQuery&requestPage=1&target=uploadImage&searchCondition=${requestScope.searchCondition}">首页</a>
				<a id="previous" class="btn btn-default btn-sm" href="ProductServlet?action=getPageByQuery&target=uploadImage&requestPage=<%=pageInfo.getPreviousPage()%>&searchCondition=${requestScope.searchCondition}"> 上一页</a>
				
				<a id="next" class="btn btn-default btn-sm" href="ProductServlet?action=getPageByQuery&target=uploadImage&requestPage=<%=pageInfo.getNextPage()%>&searchCondition=${requestScope.searchCondition}"> 下一页</a>
				  <span class="mySpan">
				  <a id="last" class="btn btn-default btn-sm" href="ProductServlet?action=getPageByQuery&target=uploadImage&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getTotalPageCount()%>">尾页</a>
    <span>当前第<%=pageInfo.getCurrentPage()%>页</span>
    
   <span>共<%=pageInfo.getTotalRecordCount()%>条记录 </span>
    
    <span>共<%=pageInfo.getTotalPageCount()%>页</span>
    
    <span>每页<%=pageInfo.getPerPageRecordCount()%>条</span>
   
    
    <span>跳到第 </span>	
    	<select id="requestPage" name="requestPage">
    		<%
    			int TotalPageCount = pageInfo.getTotalPageCount();
    			
    			int currentPage = pageInfo.getCurrentPage();
    			for(int i=1;i<=TotalPageCount;i++){
    				
    				if(currentPage==i){
    					out.println("<option selected='selected'>" + i + "</option>");
    				}else{
    					out.println("<option>" + i + "</option>");
    				}
    				
    			}
    		 %>
    		
    	</select>
    	
    <span>页 </span>
   
   </span>
			</form>
			</div>
			</table>
			
		</div>

		<script src="css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
		<script src="css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="css/jQuery-confirm/jquery-confirm.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			
			$(function(){
				//对id为categoryTable表格进行隔行换色
				$("#categoryTable>tbody>tr:even").css("background-color","#fff");
				$("#requestPage").change(function(){
					
					//提交请求
					$("#categoryForm2").submit();
				});
				
				//第一页时 "首页"和上一页不能用
				
				var currentPage = <%=pageInfo.getCurrentPage()%>;
				var totalPageCount = <%=pageInfo.getTotalPageCount()%>;
				if(currentPage==1){
					$("#first").addClass("disabled");
					$("#previous").addClass("disabled");
				}else if(currentPage==totalPageCount){
					//最后一页时 "下一页"和"尾页"不能能用
					$("#next").addClass("disabled");
					$("#last").addClass("disabled");
				}

			});
			
			
			//批量上传
			function deleteall(){
			
				  var len = 0;  
			      var cks=$("input[name='selectFlag']");  
			      for(var i=0;i<cks.length;i++) {  
			        if(cks[i].checked) {  
			          ++len;  
			        }  
      			 } 
      			 if(len==0){  
			       alert("请选择要上传照片的商品");  
			        return;  
			      } 
			     var ids=[];  
			      for(var i=0;i<cks.length;i++){  
			        if(cks[i].checked){  
			          var id=$(cks[i]).val();  
			          ids.push(id);  
			        }  
			          
			      } 
			    var a= ids.join(",");
			      $.confirm({
				    title: ' ',
				    content: '您确认要为选中的商品一起上传照片吗?',
				    confirm: function(){
				       	//发请求
				      
				       	location.assign("ProductServlet?action=getSelectForUpload&target=productMain&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&pid="+ a );
				    },
				    cancel: function(){
				       
				    }
				}); 
				          
			}
			
			
			//当前页全选
			function checkAll() {
				  for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
				   document.getElementsByName("selectFlag")[i].checked = document.getElementById("ifAll").checked;
				  }
				 }
		
			
		</script>
		<script type="text/javascript">
			function getOneForUpload(pid){
				location.assign("ProductServlet?action=getOneForUpload&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&pid=" + pid);
			}
		
		</script>
		<%
			String msg = (String)request.getAttribute("msg");
			String msgDetail = (String)request.getAttribute("msgDetail");
			if(msg!=null){
			%>
			
			<script type="text/javascript">
				
			 $.alert({
                   title: '${msg}',
                   content: '${msgDetail}',
                   animation: 'rotate',
                   closeAnimation: 'right',
                   opacity: 0.5
               });
			
			
			</script>
		
			<%
				}
			%>
	</body>

</html>