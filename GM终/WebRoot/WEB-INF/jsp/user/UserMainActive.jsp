<%@ page language="java" import="java.util.*,com.vo.User1,com.page.PageInfo" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link rel="shortcut icon" type="image/x-icon" href="img/bit.ico" />
    <base href="<%=basePath%>">
    
    <title>My JSP 'UserMain.jsp' starting page</title>
    
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
		
		.breadcrumb a{
			background-color: #EDF7ED;
				color:#5EB95E;
		}
	
		tr.tableHead {
			background-color: #EDF7ED;
			color: #5EB95E;
		}
		
		tr.tableHead>th {
			text-align: center;
			height:35px;
		}
		#userTable td{
			height:35px;
		}
		
		/*鼠标悬停的 当前行高亮*/
		/*table>tbody>tr:hover {
			background-color:#BAD0EF !important;
		}*/
		
		div.userTableDiv {
			width:1060px;
			margin:0px auto;
			position:relative;
			top:45px;
			right:30px;
			
		}
		
		#pageDiv {
				position:absolute;
				right:0px;
			}
		td{
			text-align:center;
		}
		/*管理用户搜索框*/
			#gmUser1Search {
				width:500px;
				margin:0px auto;
				position:relative;
				top:25px;
				right:60px;
			}
	</style>
  </head>
  
  <body>
  		<%
			PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
		 %>
    <div>
		<ul class="breadcrumb">
			<li><a href="#" >首页</a></li>
			<li><a href="#">管理用户</a></li>
		</ul>
	</div>
	
	<form id="user1Form2" action="User1Servlet?action=getPageByQuery&target=UserMainActive" method="post">
		
			<div id="gmUser1Search" class="input-group">
				<input type="search" id="searchCondition" name="searchCondition" value='${requestScope.searchCondition}' class="form-control"/>
				
				<span class="input-group-btn">
				<input type="submit"  value="搜索" class="btn btn-default"/>
				</span>
			</div>
	
	</form>
	<div class="text-center userTableDiv">

		<table id="userTable" class="table table-striped table-bordered table-hover">
			<thead>
				<tr class="tableHead">
					<th width="10%">用户编号</th>
					<th width="15%">用户名</th>
					<th width="15%">密码</th>

					<th width="15%">手机号</th>
					<th width="20%">邮箱</th>
					<th width="15%">激活状态</th>
					<th width="10%">操作</th>
				</tr>
			</thead>

			<tbody>
				<%
						String isActive="激活";
						String notActive = "未激活";
						List<User1> list = (List<User1>)request.getAttribute("list");
						
						for(User1 user1:list){
					%>
					
					<tr>
						<td><%=user1.getUserId()%></td>
						<td><%=user1.getUserName()%></td>
						<td><%=user1.getPassword()%></td>
							<td><%=user1.getPhoneNumber()%></td>
						<td><%=user1.getEmail()%></td>
						<td>
						<%
							if(user1.getIsActive()==0 ){
						%>
								<%=notActive%>
						<% 
							}else{
						%>	
							<%=isActive%>
						<% 
							}
						%>				
						</td>
						
						<td>
						<%
							if(user1.getIsActive()==0 ){
						%>
							<button class="btn btn-success btn-xs" onclick="active(<%=user1.getUserId()%>)">激活</button>
						<% 
							} else {
						%>	
							 <button class="btn btn-success btn-xs" onclick="active(<%=user1.getUserId()%>)" disabled="disabled">激活</button>
						<%	
							}
						%>
							
						</td>
					</tr>
				
			    <%
					}
				%>
			
			

				

			</tbody>

		</table>
		
		<div id="pageDiv">
					
				
			<form id="user1Form" action="User1Servlet?action=getPageByQuery&target=UserMainActive" method="post">
			<input type="hidden" name="searchCondition" value="${requestScope.searchCondition}"/>
	<a id="first" class="btn btn-default btn-sm" href="User1Servlet?action=getPageByQuery&target=UserMainActive&searchCondition=${requestScope.searchCondition}&requestPage=1">首页</a>
    
    
    <a id="previous" class="btn btn-default btn-sm" href="User1Servlet?action=getPageByQuery&target=UserMainActive&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getPreviousPage()%>"> 上一页</a>
      <a id="next" class="btn btn-default btn-sm" href="User1Servlet?action=getPageByQuery&target=UserMainActive&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getNextPage()%>"> 下一页</a>
    
    
     <a id="last" class="btn btn-default btn-sm" href="User1Servlet?action=getPageByQuery&target=UserMainActive&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getTotalPageCount()%>">尾页</a>
    
   <span class="mySpan">
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

	</div>
	
	<script src="css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
		<script src="css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="css/jQuery-confirm/jquery-confirm.js" type="text/javascript" charset="utf-8"></script>
	
	<script type="text/javascript">
		
		$(function(){
			//对id为userTable表格进行隔行换色
			$("#userTable>tbody>tr:even").css("background-color","#fff");
			
			
			//给跳到第几页下拉列表框绑定事件
				$("#requestPage").change(function(){
					
					//提交请求
					$("#user1Form").submit();
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
		
		function getOneForUpdate(id){
			
			location.assign("User1Servlet?action=getOneForUpdate&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&userId=" + id);
		}
		
		
		function active(id){
			
				$.confirm({
					title: '',
					content: '您确认要激活编号为'+ id+'的用户吗?',
					confirm: function() {
						
						location.assign("User1Servlet?action=user1Active&target=UserMainActive&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&isActive=1&userId=" + id  );
						
					},
					cancel: function() {
						
					},
					
				});
			}
	</script>
  </body>
</html>
