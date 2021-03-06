<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>登录界面</title>
		<link rel="stylesheet" href="css/login.css" />
		
	</head>
	<body>
	<%		String msg = (String)request.getAttribute("msg");%>
		
		
	
		<div id="gome-head">
			<div id="logo">
				<a href="#"></a>
			</div>
			<div class="survey">
				<i></i>
				<a href="#">我想对“登录”提意见</a>
			</div>
		</div>
		
		<!-- 信息提示栏      -->
		<div class="safeTipDiv">
			<p class="safeTip"><em></em>为确保您账户的安全及正常使用，依《网络安全法》相关要求，6月1日起会员账户需绑定手机。如您还未绑定，请尽快完成，感谢您的理解及支持！</p>
		</div>
		
		<!-- 中间背景      -->
		<div class="content-bg">
			<div class="clearfix">
				<div class="login-box-wrap">
					
					<div class="loginHead">
						<div class="tabLeft">
							<a id="cur1" class="cur cur-1" href="javascript:void(0)">扫码登录</a>
						</div>
						<div class="tabRight">
							<a id="cur2" class="cur1 cur-2" href="javascript:void(0)">账户登录</a>
						</div>
					</div>
					
					<!-- 扫码登录      -->
					<div id="loginBox1" style="display: block;" class="loginBox">
						<div class="sm-login-box">
							<div class="qrcode-main">
								<img id="image1" src="img/login/getQrcode.no.png" />
								<img id="image2" src="img/login/mobile.png" />
							</div>
							<p class="qrcode-desc">打开手机 <a href="#">国美</a></p>
							<p class="smCode">扫一扫登录</p>
							<a href="UserServlet?action=register" class="registerBtn">免费注册</a>
						</div>
					</div>
					
					<!-- 账户登录      -->
					<div id="loginBox2" style="display: none;" class="loginBox">
						<div class="login-wrap">
							<form id="frm" method="post"  action="UserServlet?action=login">
								
								<div class="normalLogin">
									<div id="tips-4" class="tips">
										<%
								
										if(msg!=null){
										 %>
										 	<em></em><%=msg %>
										 		
									
										 <%
										 }
										 %>
									  		
								</div>
								<div id="tips-3" class="tips" style="display: none;">
									<em></em>公共场所不建议自动登录，以防账号丢失
								</div>
								<p id="tips-1" class="tips" style="display: none;"><em></em>公共场所不建议自动登录，以防账号丢失</p>
								<p id="tips-2" class="tips" style="display: none;"><em></em>请输入正确的账号，以便用于登录</p>
								<div class="login-item">
									<input name="loginName" id="loginName" class="txt" tabindex="1" type="text" placeholder="手机号码/用户名/邮箱/门店会员卡号" />
								</div>
								<div class="login-item">
									<input name="password" id="password" class="txt" tabindex="1" type="password" placeholder="密码" />
								</div>
								<div class="remember">
									<div class="f1">
										<input id="autoLoginFlag" class="autoLoginFlag" name="autoLoginFlag" value="radiobutton" type="checkbox" />
										<label>自动登录</label>
									</div>
									<div class="f2">
										<a class="f2-1" href="#">忘记密码</a>
										<span class="displayb">|</span>
										<a class="f2-2" href="UserServlet?action=register">免费注册</a>
									</div>
								</div>
								<div class="actions">
									<a href="javascript:viod(0)" onclick="checkUser()">
										<input class="btnnuw" tabindex="5" value="登 录" type="button" onclick="yincang()"/>
									</a>
									
								</div>
								<p style="padding: 30px 0 15px;"><a id="phonenum" class="f2-2" href="javascript:void(0);">手机号快速登录</a></p>
								
							</div>
							</form>
						</div>
					</div>
					
					<!-- 手机号快速登录      -->
					<div id="loginBox3" style="display: none;" class="loginBox">
						<div class="login-wrap">
							<div id="err-tip1" class="err-tip" style="display: none;">
								<span class="icon"></span>
								<p>手机号不能为空</p>
							</div>
							<div id="err-tip2" class="err-tip" style="display: none;">
								<span class="icon"></span>
								<p>短信验证码不能为空</p>
							</div>
							<form id="quickeLoginForm" method="post" autocomplete="off">
								<div class="quickenLogin">
									<div class="login-item">
										<input name="loginName1" id="loginName1" class="txt" tabindex="1" type="text" placeholder="请输入手机号" />
									</div>
									<div class="login-item">
										<input name="loginName2" id="loginName2" class="txt w138" tabindex="1" type="text" placeholder="短信验证码" />
									</div>
									<div class="check">
										<a href="javascript:void(0);" class="check-phone">获取短信验证码</a>
									</div>
									<div class="remember remember1">
										<div class="f1">
											<input id="autoLoginFlag" class="autoLoginFlag" name="autoLoginFlag" value="radiobutton" type="checkbox" />
											<label>自动登录</label>
										</div>
									</div>
									<p class="detailContent">未注册的手机号将自动注册，且代表您同意<a href="#" class="fontBlink">《服务协议》</a></p>
									<div class="actions">
									
											<input class="btnnuw" tabindex="5" value="登 录" type="button" />
										
									</div>
									<p style="padding: 10px 0 15px;"><a id="idpaw" class="fontBlink" href="javascript:void(0);">账号密码登录</a></p>
								</div>
							</form>
						</div>
					</div>
					
					
					<div class="corp-login">
						<div class="play_icon">
							<a class="borderLine" href="#">门店会员卡登录</a>
							<a class="borderLine" href="#">QQ</a>
							<a class="borderLine" href="#">微信</a>
							<a class="borderLine" href="#">微博</a>
							<a href="#">美付宝</a>
							<a style="display: none;" class="borderLine borderLin" href="#">极信通</a>
							<a class="borderLin" style="display: none;" href="#">支付宝</a>
						</div>
						<a id="more" class="more"></a>
					</div>
					
				</div>
			</div>
		</div>
		
		<!-- 底部      -->
		<div id="gome-foot">
			<div id="gome-foot-box">
				<ul>
					<li><a href="#">国美集团</a></li>
					<li><a href="#">国美管家</a></li>
					<li><a href="#">关于国美</a></li>
					<li><a href="#">加入我们</a></li>
					<li>|</li>
					<li><a href="#">品牌大全</a></li>
					<li><a href="#">商品专题</a></li>
					<li><a href="#">批发大全</a></li>
					<li><a href="#">热词搜索</a></li>
					<li><a href="#">友情链接</a></li>
					<li><a href="#">风险监测</a></li>
					<li>|</li>
					<li><a href="#">销售联盟</a></li>
					<li><a href="#">商家入驻</a></li>
				</ul>
				<p>本公司游戏产品适合18岁以上成年人使用  违法和不良信息举报电话：021-60766055  <a href="#">互联网药品信息服务资格证编号（京）-经营性-2013-0011</a></p>
				<p>国美在线电子商务有限公司  办公地址:上海市嘉定区沪宜公路3163-3199号一楼A区  客服电话:4008708708</p>
				<p>©2000-2017  国美在线电子商务有限公司版权所有  京公安网备11010502027062  沪ICP备11009419号  沪B2-20120004号</p>
				<div class="gome-foot-credit">
					<a class="credit-baxx" href="#"><i></i><b>经营性网站备案信息</b></a>
					<a class="credit-xypj" href="#"><i></i><b>可信网站信用评价</b></a>
					<a class="credit-cxwz" href="#"><i></i><b>诚信网站</b></a>
					<a class="credit-hdjc" href="#"><i></i><b>朝阳网络警察</b></a>
					<a class="credit-wgdj" href="#"><i></i><b>网购大家评</b></a>
					<a class="credit-report" href="#"><i></i><b>上海市互联网违法和不良信息举报中心</b></a>
				</div>
			</div>
		</div>
		<% 	if(msg!=null){
				%>	
				<script type="text/javascript">
					
								$("#cur2").trigger("click");
		
						</script>	
		<%
				
				}else {
		%>	
				<script type="text/javascript">
						$("#cur1").trigger("click");
						</script>	
		<%
				
				}
	 %>
		
		<script type="text/javascript" src="js/jquery-2.1.4.js" ></script>
		<script type="text/javascript" src="js/login.js" ></script>
		<script type="text/javascript">
		
			var errors = [
				"请输入账户名和密码",
				"请输入密码"
			];
			
			var $username = $("#loginName");
			var $password = $("#password");
			var $errorCue = $("#tips-3");
			
			function checkUser(){
				
				
				var username = trim($username.val());
				var password = trim($password.val());
				
				var flag = true;
				
				if(username == ""){
					$errorCue.text("");
					$errorCue.append("<em></em>");
					$errorCue.append(errors[0]);
					$errorCue.show();
					flag = false;
					return false;
				}
				if(password == "" && username!= ""){
					$errorCue.text("");
					$errorCue.append("<em></em>");
					$errorCue.append(errors[1]);
					$errorCue.show();
					flag = false;
					return false;
				} 
				if(flag){
					//提交表单
					$("#frm").submit();
					
				}
			}
			function trim(txt) {
				var afterTrimTxt = txt.replace(/^\s*/, "").replace(/\s*$/, "");
				return afterTrimTxt;
			}
			function yincang(){
				$("#tips-4").hide();
			}
	
			$(function(){
										
				$("#cur2").trigger("click");
			}); 
		</script>
	</body>
</html>

