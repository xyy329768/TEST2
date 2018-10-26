<%@page import="com.vo.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>注册成功跳转</title>
		<link rel="stylesheet" type="text/css" href="css/registersuccess.css"/>
	</head>
	<body id="body">
		<div id="all">
			<div id="top">
				<div id="cat">
					<a href="http://www.gome.com.cn">
						<img src="img/11.11.png" />
					</a>
				</div>
				
				<div id="success">
					<img src="img/1.2.png" />
				</div>
			</div>
			
			<div id="middel">
				<div id="duiHao">
					<img src="img/1.3.png" />
				</div>
				
				<% 
					User user = (User)session.getAttribute("user");
				%>
				
				<div id="center">
					<span >恭喜您,</span>
					<span id="phoneNumber"> <%=user.getUsername() %> </span>
					<span id="">注册成功</span>
				</div>
				
				<div id="jump">
					<font id="ten" color="gray" size="2">进入邮箱激活：<a href="https://mail.qq.com"><%=user.getEmail()%></a></font>
					<span>或点击</span>
					<a href="/GM1.2/jsp/user/index.jsp" >自动跳到首页></a>
				</div>
				
				<div id="imgCenter">
					<img src="img/1.4.png"/>
				</div>
			</div>
			
			<div id="copyright">
				<ul>
					<li><a target="_blank" href="http://igome.com" >国美集团</a></li>
					<li><a target="_blank" href="http://www.gomegj.com" >国美管家</a></li>
					<li><a target="_blank" href="http://help.gome.com.cn/about/company.html" >关于国美</a></li>
					<li><a target="_blank" href="http://zp.gome.com.cn" >加入我们</a></li>
					<li>|</li>
					<li><a target="_blank" href="//brand.gome.com.cn/" >品牌大全</a></li>
					<li><a target="_blank" href="http://www.gome.com.cn/topic/" >商品专题</a></li>
					<li><a target="_blank" href="http://www.gome.com.cn/pifa/" >批发大全</a></li>
					<li><a target="_blank" href="http://www.gome.com.cn/hotwords/" >热词搜索</a></li>
					<li><a target="_blank" href="http://www.gome.com.cn/links/" >友情链接</a></li>
					<li id="fengxian"><a target="_blank" href="http://news.gome.com.cn/4-8ef49f4b-1-8.html/" >风险监测</a></li>
					<li>|</li>
					<li><a target="_blank" href="http://cps.gome.com.cn/" >销售联盟</a></li>
					<li><a target="_blank" href="http://www.gome.com.cn/join/" >商家入驻</a></li>
				</ul>
				<p>
					国美在线电子商务有限公司  办公地址：上海市嘉定区沪宜公路3163-3199号一楼A区  客服电话：4008708708|本公司游戏产品适合18岁以上成年人使用
				</p>
				<p>
					©2000-2007 国美在线电子商务有限公司版权所有 京公安网备11010502027062 沪ICP备11009419号 沪B2-20120004号
				</p>
				<div id="oredit">
					<a id="baxx" target="_blank" href="//www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&entyId=dov73ne26zbqpugb8ivnfez35upwknav4n">
						
						<i></i>
						<b>经营性网站备案信息</b>
					</a>
					<a id="xypj" target="_blank" href="https://ss.knet.cn/verifyseal.dll?sn=2011071100100011373&comefrom=trust">
						
						<i></i>
						<b>可信网站信用评价</b>
					</a>
					<a id="cxwz" target="_blank" href="http://search.cxwz.org/cert/l/CX20111018000607000618">
						
						<i></i>
						<b>诚信网站</b>
					</a>
					<a id="wljc" target="_blank" href="http://www.bj.cyberpolice.cn/index.do">
						
						<i></i>
						<b>朝阳网络警察</b>
					</a>
					<a id="wgdjp" target="_blank" href="http://shwg.dianping.com/index.html">
						
						<i></i>
						<b>网购大家评</b>
					</a>
					<div id="gbhgh">
						
					</div>
				</div>
				
			</div>
			
		</div>
	</body>
</html>