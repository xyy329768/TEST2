<%@ page language="java" import="java.util.*,com.vo.Category,com.page.PageInfo" pageEncoding="UTF-8"%>
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
			
			#categoryTable {
				position:relative;
				top:70px;
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
				<li><a href="#">商品种类管理</a></li>
				<li><a href="#">管理一级商品种类</a></li>
			</ul>
		</div>
		<form id="categoryForm" action="CategoryServlet?action=getPageByQuery" method="post">
		
			<div id="jdCategorySearch" class="input-group">
					<input type="search" id="searchCondition" name="searchCondition" value='${requestScope.searchCondition}' class="form-control"/>
					
					<span class="input-group-btn">
						<input type="submit"  value="搜索" class="btn btn-default"/>
					</span>
			</div>
	
		</form>
		<div class="text-center categoryTableDiv">

			<table id="categoryTable" class="table table-striped table-bordered table-hover">
				<thead>
					<tr class="tableHead">
						<th width="15%">商品种类编号</th>
						<th width="15%">商品种类名称</th>
						<th width="50%">商品种类描述</th>
						<th width="10%">操作</th>
						<th width="10%">操作</th>
					</tr>
				</thead>

				<tbody>
				
					<%
						List<Category> list = (List<Category>)request.getAttribute("list");
						
						for(Category category:list){
					%>
						
						<tr>
							<td><%=category.getCid() %></td>
							<td><%=category.getCname() %></td>
							<td><%=category.getCdesc() %></td>
							
							<td>
								 <button class="btn btn-success btn-xs" onclick="getOneByIdUpdate(<%=category.getCid()%>)">修改</button>
							</td>
							<td>
								 <button class="btn btn-danger btn-xs" onclick="deleteById(<%=category.getCid()%>)">删除</button> 
								
							</td>
						</tr>
					
					<%
						}
					 %>

					

					
					

				</tbody>
			<div id="tiaozhuan">
			<form id="categoryForm2" action="CategoryServlet?action=getPageByQuery" method="post">
				<input type="hidden" name="searchCondition" value='${requestScope.searchCondition}' class="form-control"/>
				<a id="first" class="btn btn-default btn-sm" href="CategoryServlet?action=getPageByQuery&requestPage=1&searchCondition=${requestScope.searchCondition}">首页</a>
				<a id="previous" class="btn btn-default btn-sm" href="CategoryServlet?action=getPageByQuery&requestPage=<%=pageInfo.getPreviousPage()%>&searchCondition=${requestScope.searchCondition}"> 上一页</a>
				
				<a id="next" class="btn btn-default btn-sm" href="CategoryServlet?action=getPageByQuery&requestPage=<%=pageInfo.getNextPage()%>&searchCondition=${requestScope.searchCondition}"> 下一页</a>
				  <span class="mySpan">
				  <a id="last" class="btn btn-default btn-sm" href="CategoryServlet?action=getPageByQuery&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getTotalPageCount()%>">尾页</a>
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
			function deleteById(id){
			
				$.confirm({
					title: '',
					content: '您确认删除吗?',
					confirm: function() {
						
						location.assign("CategoryServlet?action=delete&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&cid=" + id);
						
					},
					cancel: function() {
						
					},
					
				});
			}
			function getOneByIdUpdate(id){
				location.assign("CategoryServlet?action=getOne&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&cid=" + id);
			
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