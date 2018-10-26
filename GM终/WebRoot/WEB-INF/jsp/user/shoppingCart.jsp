<%@ page language="java" import="java.util.*,com.vo.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
    <title>我的购物车</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
   
    <link rel="stylesheet" type="text/css" href="css/up.css"/>
	<link rel="stylesheet" type="text/css" href="css/shoppingcar/shopping.css"/>
    <link rel="stylesheet" type="text/css" href="css/down.css"/>
    <script type="text/javascript" src="js/js_login/jquery-2.1.4.js"></script>
    <link rel="stylesheet" href="css/shoppingcar/login.css" />
    
	<script type="text/javascript" src="js/js_login/login.js" ></script>
    <script type="text/javascript">
     function gologin(){
     	$("#login").show();
     	$(".gui_modal").show();
     }

    </script>
 

  </head>
  
  <body>
 
  	<div id="login" class="login-box-wrap login-box-wrap1" style="position:fixed;z-index:999;display: none;">
					<div class="loginBoxICon">
						<span class="f1">国美会员登录</span>
						<span id="close" class="loginBoxClose"></span>
					</div>
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
							<a href="#" class="registerBtn">免费注册</a>
						</div>
					</div>
					
					<!-- 账户登录      -->
					<div id="loginBox2" style="display: none;" class="loginBox">
						<div class="login-wrap">
							<form id="frm333" method="post"  action="UserServlet?action=login">
			
								<input type="hidden" name="where" value="订单信息.jsp"/>
								<div class="normalLogin">
									<p id="tips-1" class="tips" style="display: none;"><em></em>公共场所不建议自动登录，以防账号丢失</p>
									<p id="tips-2" class="tips" style="display: none;"><em></em>请输入正确的账号，以便用于登录</p>
									<div class="login-item">
										<input name="loginName" id="loginName" class="txt" tabindex="1" type="text" placeholder="手机号码/用户名/邮箱/门店会员卡号" style="height: 40px;"/>
									</div>
									<div class="login-item">
										<input name="password" id="password" class="txt" tabindex="1" type="password" placeholder="密码" style="height: 40px;"/>
									</div>
									<div class="remember">
										<div class="f1">
											<input id="autoLoginFlag" class="autoLoginFlag" name="autoLoginFlag" value="radiobutton" type="checkbox" />
											<label>自动登录</label>
										</div>
										<div class="f2">
											<a class="f2-1" href="#">忘记密码</a>
											<span class="displayb">|</span>
											<a class="f2-2" href="#">免费注册</a>
										</div>
									</div>
									<div class="actions">
										<input class="btnnuw" tabindex="5" value="登 录" type="button" id="login000"/>
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
							<form id="quickeLoginForm" method="post" action="" autocomplete="off">
								<div class="quickenLogin">
									<div class="login-item">
										<input name="loginName" id="loginName1" class="txt" tabindex="1" type="text" placeholder="请输入手机号" style="height: 40px;"/>
									</div>
									<div class="login-item">
										<input name="loginName" id="loginName2" class="txt w138" tabindex="1" type="text" placeholder="短信验证码" style="height: 40px;"/>
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
  	
  	<div id="total" >
  	<!--最顶上的一条开始-->
		<div id="shortcut">
			<div class="w">
				<ul class="fl">
					<li class="dorpdown" id="ttbar-mycity">
						<div class="dt cw-icon area-text-wrap">
							<i class="ci-right"><s>◇</s></i> 北京
							<span class="area-text" title="北国" id="gm">G1</span>
						</div>

						<div class="dd dorpdown-layer">
							<div class="dd-spacer"></div>
							<div class="area-content-wrap">
								<div class="area-content">
									<div class="area-content-list">
										<div class="item">
											<a href="" class="selected">北京</a>
										</div>
										<div class="item">
											<a href="">上海</a>
										</div>
										<div class="item">
											<a href="">天津</a>
										</div>
										<div class="item">
											<a href="">重庆</a>
										</div>
										<div class="item">
											<a href="">河北</a>
										</div>
										<div class="item">
											<a href="">山西</a>
										</div>
										<div class="item">
											<a href="">河南</a>
										</div>
										<div class="item">
											<a href="">辽宁</a>
										</div>
										<div class="item">
											<a href="">吉林</a>
										</div>
										<div class="item">
											<a href="">黑龙江</a>
										</div>
										<div class="item">
											<a href="">内蒙古</a>
										</div>
										<div class="item">
											<a href="">江苏</a>
										</div>
										<div class="item">
											<a href="">山东</a>
										</div>
										<div class="item">
											<a href="">安徽</a>
										</div>
										<div class="item">
											<a href="">浙江</a>
										</div>
										<div class="item">
											<a href="">福建</a>
										</div>
										<div class="item">
											<a href="">湖北</a>
										</div>
										<div class="item">
											<a href="">湖南</a>
										</div>
										<div class="item">
											<a href="">广东</a>
										</div>
										<div class="item">
											<a href="">广西</a>
										</div>
										<div class="item">
											<a href="">江西</a>
										</div>
										<div class="item">
											<a href="">四川</a>
										</div>
										<div class="item">
											<a href="">海南</a>
										</div>
										<div class="item">
											<a href="">贵州</a>
										</div>
										<div class="item">
											<a href="">云南</a>
										</div>
										<div class="item">
											<a href="">西藏</a>
										</div>
										<div class="item">
											<a href="">陕西</a>
										</div>
										<div class="item">
											<a href="">甘肃</a>
										</div>
										<div class="item">
											<a href="">青海</a>
										</div>
										<div class="item">
											<a href="">宁夏</a>
										</div>
										<div class="item">
											<a href="">新疆</a>
										</div>
										<div class="item">
											<a href="">台湾</a>
										</div>
										<div class="item">
											<a href="">香港</a>
										</div>
										<div class="item">
											<a href="">澳门</a>
										</div>
										<div class="item">
											<a href="">钓鱼岛</a>
										</div>
										<div class="item">
											<a href="" target="_blank">海外</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
				<ul class="fr">
					<li class="fore1" id="ttbar-login">
						<%
						
						User user = (User)session.getAttribute("user");
						if(user==null){
					%>
						<a href="jsp/user/login.jsp">你好,请登录</a>
						<a href="jsp/user/regist.jsp" class="link-regist style-red">免费注册</a>
					
					<%
						}else{
					%>
						<a href="#">hey,<%=user.getUsername() %></a>
						<a href="UserServlet?action=logout">退出</a>
					<%
						}
					 %>
					</li>
					<li class="spacer"></li>
					<li class="fore2">
						<div class="dt">
							<a target="_blank" href="">我的订单</a>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore3 dorpdown" id="ttbar-myjd">
						<div class="dt cw-icon">
							<i class="ci-right"><s>◇</s></i>
							<a target="_blank" href="">我的国美</a>
						</div>
						<div class="dd dorpdown-layer">
							<div class="dd-spacer"></div>
							<div class="userinfo">
								<div class="u-pic">
									<a href=""><img src="img/no-img_mid_.jpg" width="60" height="60"></a>
								</div>
								<div class="u-name u-login">
									<a href="" class="link-login">你好，请登录</a>
								</div>
								<div class="u-extra">
									<a href="" target="_blank">优惠券<span id="num-ticket"></span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
									<a href="" target="_blank">消息<span id="num-tip"></span></a>
								</div>
							</div>
							<div class="otherlist">
								<div class="fore1">
									<div class="item">
										<a href="" clstag="" target="_blank">待处理订单<span id="num-unfinishedorder"></span></a>
									</div>
									<div class="item">
										<a href="" clstag="" target="_blank">咨询回复<span id="num-consultation"></span></a>
									</div>
									<div class="item">
										<a href="" clstag="" target="_blank">降价商品<span id="num-reduction"></span></a>
									</div>
									<div class="item">
										<a href="" clstag="" target="_blank">返修退换货</a>
									</div>
								</div>
								<div class="fore2">
									<div class="item">
										<a href="" clstag="" target="_blank">我的关注</a>
									</div>
									<div class="item">
										<a href="" clstag="" target="_blank">我的美豆</a>
									</div>
									<div class="item">
										<a href="" clstag="" target="_blank">我的理财</a>
									</div>
									<div class="item baitiao">
										<a href="" target="_blank">国美白条</a>
									</div>
								</div>
							</div>
							<div class="viewlist" style="display:none;">
								<div class="smt">
									<h4>我的足迹</h4>
									<span class="extra">
										<a target="_blank" href="">更多&nbsp;&gt;</a>
									</span>
								</div>
								<div class="smc"></div>
							</div>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore4">
						<div class="dt">
							<a target="_blank" href="">国美会员</a>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore5">
						<div class="dt">
							<a target="_blank" href="">企业采购</a>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore6 dorpdown" id="ttbar-apps">
						<div class="dt cw-icon">
							<i class="ci-left"></i>
							<i class="ci-right"><s>◇</s></i>
							<a target="_blank" href="">手机国美</a>
						</div>
						<div class="dd dorpdown-layer">
							<div class="dd-spacer"></div>
							<div class="dd-inner" id="ttbar-apps-main">
								<a href="" class="link link1" target="_blank">国美客户端</a>
								<a href="" class="link link3" target="_blank">国美钱包客户端</a>
								<a href="" class="link link4"></a>
								<a href="" class="link link5"></a>
								<a href="" class="applink jdapp-ios" target="_blank">国美客户端ios版</a>
								<a href="" class="applink jdapp-android" target="_blank">客户端android版</a>
								<a href="" class="applink jdapp-ipad" target="_blank">国美客户端ipad版</a>
								<a href="" class="applink wyapp-ios" target="_blank">国美钱包客户端ios版</a>
								<a href="" class="applink wyapp-android" target="_blank">国美钱包客户端android版</a>
							</div>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore7 dorpdown" id="ttbar-atte">
						<div class="dt cw-icon">
							<i class="ci-right"><s>◇</s></i>关注国美
						</div>
						<div class="dd dorpdown-layer"></div>
						<div class="dd dorpdown-layer">
							<div class="dd-spacer"></div>
							<div class="dd-inner" id="ttbar-atte-main">
								<img src="img/1.jpg" alt="关注国美">
							</div>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore8 dorpdown" id="ttbar-serv">
						<div class="dt cw-icon">
							<i class="ci-right"><s>◇</s></i>客户服务
						</div>
						<div class="dd dorpdown-layer">
							<div class="dd-spacer"></div>
							<div class="item-client">客户</div>
							<div class="item">
								<a href="" target="_blank" true="">帮助中心</a>
							</div>
							<div class="item">
								<a href="" target="_blank" true="">售后服务</a>
							</div>
							<div class="item">
								<a href="" target="_blank" true="">在线客服</a>
							</div>
							<div class="item">
								<a href="" target="_blank" true="">意见建议</a>
							</div>
							<div class="item">
								<a href="" target="_blank" true="">电话客服</a>
							</div>
							<div class="item">
								<a href="" target="_blank" true="">客服邮箱</a>
							</div>
							<div class="item-business">商户</div>
							<div class="item">
								<a href="" target="_blank" true="">国美商学院</a>
							</div>
							<div class="item">
								<a href="" target="_blank" true="">商家入驻</a>
							</div>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore9 dorpdown" id="ttbar-navs" clstag="h|keycount|2015|01j" data-load="1">
						<div class="dt cw-icon">
							<i class="ci-right"><s>◇</s></i>网站导航
						</div>
						<div class="dd dorpdown-layer">
							<div class="dd-spacer"></div>
							<dl class="fore1"> <dt>特色主题</dt>
								<dd>
									<div class="item">
										<a href="//pinpaijie.jd.com/" target="_blank">品牌街</a>
									</div>
									<div class="item">
										<a href="//hao.jd.com/" target="_blank">好物100</a>
									</div>
									<div class="item">
										<a href="//xinpin.jd.com/presale.html " target="_blank">国美预售</a>
									</div>
									<div class="item">
										<a href="//zan.jd.com" target="_blank">尖er货</a>
									</div>
									<div class="item">
										<a href="//xinpin.jd.com/new.html" target="_blank">国美首发</a>
									</div>
									<div class="item">
										<a href="//tuan.jd.com/homevirtual-beijing.html" target="_blank">今日团购</a>
									</div>
									<div class="item">
										<a href="//youhuiquan.jd.com/" target="_blank">优惠券</a>
									</div>
									<div class="item">
										<a href="//red.jd.com/" target="_blank">闪购</a>
									</div>
									<div class="item">
										<a href="//vip.jd.com/" target="_blank">国美会员</a>
									</div>
									<div class="item">
										<a href="//miao.jd.com/" target="_blank">秒杀</a>
									</div>
									<div class="item">
										<a href="//ding.jd.com/" target="_blank">定期送</a>
									</div>
									<div class="item">
										<a href="//diy.jd.com/" target="_blank">装机大师</a>
									</div>
									<div class="item">
										<a href="//hao.jd.com/hwy.html" target="_blank">新奇特</a>
									</div>
									<div class="item">
										<a href="//try.jd.com/" target="_blank">国美试用</a>
									</div>
									<div class="item">
										<a href="//gift.jd.com/" target="_blank">礼品购</a>
									</div>
									<div class="item">
										<a href="//smarthome.jd.com/" target="_blank">智能馆</a>
									</div>
									<div class="item">
										<a href="//sale.jd.com/act/tp6KfYH7wb.html" target="_blank">玩bigger</a>
									</div>
									<div class="item">
										<a href="//sale.jd.com/act/rKhJit1fWVDR.html" target="_blank">大牌免息</a>
									</div>
									<div class="item">
										<a href="//sale.jd.com/act/3je8ZTCxNl6SusId.html " target="_blank">北国老字号</a>
									</div>
								</dd>
							</dl>
							<dl class="fore2"> <dt>行业频道</dt>
								<dd>
									<div class="item">
										<a href="//channel.jd.com/fashion.html" target="_blank">服装城</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/electronic.html" target="_blank">家用电器</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/computer.html" target="_blank">电脑办公</a>
									</div>
									<div class="item">
										<a href="//shouji.jd.com/" target="_blank">手机</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/beauty.html" target="_blank">美妆馆</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/chaoshi.html" target="_blank">食品</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/digital.html" target="_blank">数码</a>
									</div>
									<div class="item">
										<a href="//baby.jd.com/" target="_blank">母婴</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/jiazhuang.html" target="_blank">家装城</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/sports.html" target="_blank">运动户外</a>
									</div>
									<div class="item">
										<a href="http://car.jd.com" target="_blank">整车</a>
									</div>
									<div class="item">
										<a href="//book.jd.com/" target="_blank">图书</a>
									</div>
									<div class="item">
										<a href="//nong.jd.com/" target="_blank">农资频道</a>
									</div>
									<div class="item">
										<a href="//smart.jd.com/" target="_blank">国美智能</a>
									</div>
								</dd>
							</dl>
							<dl class="fore3"> <dt>生活服务</dt>
								<dd>
									<div class="item">
										<a href="//z.jd.com/" target="_blank">国美众筹</a>
									</div>
									<div class="item">
										<a href="//baitiao.jd.com/activity/third" target="_blank">白条</a>
									</div>
									<div class="item">
										<a href="https://www.jdpay.com/" target="_blank">国美钱包</a>
									</div>
									<div class="item">
										<a href="//trade.jr.jd.com/myxjk/jrbincome.action" target="_blank">国美小金库</a>
									</div>
									<div class="item">
										<a href="//licai.jd.com/" target="_blank">理财</a>
									</div>
									<div class="item">
										<a href="//chongzhi.jd.com/" target="_blank">话费</a>
									</div>
									<div class="item">
										<a href="//trip.jd.com/" target="_blank">旅行</a>
									</div>
									<div class="item">
										<a href="//caipiao.jd.com/" target="_blank">彩票</a>
									</div>
									<div class="item">
										<a href="//game.jd.com/" target="_blank">游戏</a>
									</div>
									<div class="item">
										<a href="//jipiao.jd.com/" target="_blank">机票酒店</a>
									</div>
									<div class="item">
										<a href="//movie.jd.com/" target="_blank">电影票</a>
									</div>
									<div class="item">
										<a href="//jiaofei.jd.com/" target="_blank">水电煤</a>
									</div>
									<div class="item">
										<a href="//daojia.jd.com/html/welcome.html" target="_blank">国美到家</a>
									</div>
									<div class="item">
										<a href="//smartcloud.jd.com/app" target="_blank">国美微联</a>
									</div>
									<div class="item">
										<a href="//try-smart.jd.com/" target="_blank">国美众测</a>
									</div>
								</dd>
							</dl>
							<dl class="fore4"> <dt>更多精选</dt>
								<dd>
									<div class="item">
										<a href="http://group.jd.com" target="_blank">国美社区</a>
									</div>
									<div class="item">
										<a href="//mobile.jd.com/index.do" target="_blank">国美通信</a>
									</div>
									<div class="item">
										<a href="//read.jd.com/" target="_blank">在线读书</a>
									</div>
									<div class="item">
										<a href="//o.jd.com/market/index.action" target="_blank">国美E卡</a>
									</div>
									<div class="item">
										<a href="http://group.jd.com/site/20000121/20000032.htm" target="_blank">智能社区</a>
									</div>
									<div class="item">
										<a href="http://group.jd.com/index/20000001.htm" target="_blank">游戏社区</a>
									</div>
									<div class="item">
										<a href="//you.jd.com/index.html?entrance=jd_home" target="_blank">友邦</a>
									</div>
									<div class="item">
										<a href="//sale.jd.com/act/wQTpIm7GnXE.html" target="_blank">卖家入驻</a>
									</div>
									<div class="item">
										<a href="//b.jd.com/" target="_blank">企业采购</a>
									</div>
									<div class="item">
										<a href="//fw.jd.com/" target="_blank">服务市场</a>
									</div>
									<div class="item">
										<a href="//zhaomu.jd.com/XCDLzm.html" target="_blank">乡村招募</a>
									</div>
									<div class="item">
										<a href="//zhaomu.jd.com/intro.html" target="_blank">校园加盟</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/office.html" target="_blank">办公生活馆</a>
									</div>
									<div class="item">
										<a href="//ipr.jd.com/" target="_blank">知识产权维权</a>
									</div>
									<div class="item">
										<a href="//en.jd.com/" target="_blank">English Site</a>
									</div>
								</dd>
							</dl>
						</div>
					</li>
				</ul>

			</div>

		</div>
		<!--最顶上的一条结束-->
		
		<!-- 搜索栏 -->
		
		
		
		
		
  		<div id="gome-head">
  			<div id="logo1">
  				<img alt="guomei" src="img/shoppinglogo.png">
  				
  			</div>
  			<div id="gwc">
  				
  			</div>
  			
  		</div>
  		
  		
  		
    		
    		<!-- 标题处 -->
    		<% if(user!=null){
    		%>
    			
    		<%
    		}else{
    		%>
    		
    		<div class="div2">
    			<div id="idnotlogin">
    				 	您还没有登录！登录后购物车的商品将保存到您账号中。
    				 	<a href="javascript:void(0)" class="cart-login-btn" onclick="gologin()">立即登录</a>
    			</div>
    			<!--<a href="#" style="" class="toRed"><em class="div2-1 ">全部商品&nbsp;</em><span class="number switch">1</span></a>-->
    			
    			<div class="sendToHere">
    				<div>北京朝阳区</div>
    				<b class="div2-b"></b>
    			</div>
    			<div class="sendTo">配送至：</div>
    			
    		</div>
    		
    		<% 
    		}
    		
    		
    		%>
    		
    		<div class="w-line">
						<!--<div style="width: 82px; left: 0px;" class="floater"></div>-->
					</div>
    		<div class="div2-line"></div>
    		<div class="div3">
    			<div class="cart-checkbox">
					<input checked="checked"class="jdcheckbox"type="checkbox" style="position: relative;top:1px;" id="fuxuankaung">
					<label class="checked" for="" >全选</label>
					<div class="t-goods">商品</div>
					<div class="t-price">单价(元)</div>
					<div class="t-quantity">数量</div>
					<div class="t-sum">小计(元)</div>
					<div class="t-action">操作</div>
				</div>
    		</div>
    		<%
    					List<Product> list = (List<Product>)request.getAttribute("list");
							
						double productTotalPrice = 0;
												
    					if(list.size()!=0){
    					
    		
	    					for(Product product:list){
	    					
	    						int shoppingCarSum = product.getShoppingCarSum();
	    						double price = product.getPrice();
	    						double singleProductTotalPrice = price * shoppingCarSum;
	    						productTotalPrice = productTotalPrice + singleProductTotalPrice;
    				%>
    		<!-- 京东商店-->
    		<div class="goods">
    			<div class="shop">
	    			
    				<div class="buygoods item-list">
    					<div class="p-checkbox cell">
    						<input checked="checked"class="jdcheckbox"type="checkbox">
    						<div class="p-goods cell">
							<!-- 手机图片 -->
								<div class="p-img">
									<a target="_blank" "><img  src="img/productImage/<%=product.getDetailSmallImg1()%>" ></a>
								</div>
								<div class="p-name" >
									<a  href="javascript:void(0)" target="_blank"><%=product.getPdesc() %></a>
								</div>
								<div class="p-extend">
									<span class="promise"><i></i><a>购买礼品包装</a></span><br/>
									<span class="promise baozhang" ><i style="background-position: 0 -23px;"></i><a class="jd-service" href="#none">购买增值保障</a></span>
								</div>
    					</div>
    					
    					<div class="p-div2">
							<div class="props-txt" title="黑">颜色：磨砂黑</div>
								<div class="props-txt" title="标准(16GB)">尺码：标准(64GB)</div>
						</div>
  						
  						<div class="cell p-price p-div3" id="danjia">
								<strong><%=product.getPrice() %></strong>
																											                	            				
    					</div>
    					
    					<div class="quantity-form">
    						
							  <a href="ShoppingCartServlet?action=jian&pid=<%=product.getPid()%>" class="decrement"  id="shoppingjian" style="cursor:pointer;">-</a>   
								<%-- <a href="javascript:void(0);action=jian&pid=<%=product.getPid()%>" class="decrement"  id="shoppingjian" style="cursor:pointer" >-</a>   --%>
							
								<input id="productSum" value="<%=shoppingCarSum%>" type="text" autocomplete="off" class="p-quantity-itxt" disabled="disabled"/>
								
							
							  <a class="increment" href="ShoppingCartServlet?action=jia&pid=<%=product.getPid()%>" id="shoppingjia" style="cursor:pointer" onclick="jia(<%=product.getPid()%>)">+</a>  
								<%-- <a class="increment" href="javascript:void(0);action=jia&pid=<%=product.getPid()%>" id="shoppingjia" style="cursor:pointer">+</a>  	 --%>
					    </div>
					    
					    <div class="cell p-sum div4" id="sumprice">
							<strong><%=singleProductTotalPrice %></strong>
						</div>
						
						<!--操作  -->
						<div class="cell p-ops div5">
							<!--单品-->
							<a href="ShoppingCartServlet?action=delete&pid=<%=product.getPid()%>">删除</a>
							<a class="a1">移到我的关注</a>
						</div>
    		</div>
    			
    	</div>
    </div>
    </div>
			
					<%				
    						}
    					}else {
    				%>
    					
    					<div class="goods">
    				<div class="shop">
	    			
    				<div class="buygoods item-list">
    					
    			<%="购物车没有商品的样式" %>
    			</div>
   				 </div>
   				 </div>
    				<%
    					}
    				%>
			<!-- 结算 -->
			<div class="check11">
			<div class="selectall11">
				<div style="float: left;"class="cart-checkbox">
					<input checked="checked" class="jdcheckbox selectall-box" type="checkbox">
					<label class="checked" for="">全选</label>
				</div>
				<div class="operation11">
					<a href="#none"  class="remove-batch">删除选中的商品</a>
					<a href="#none" class="follow-batch" >移到我的关注</a>
				</div>
				</div>
			</div>  
			<div class="toolbar-right11">
			<% Integer product_s = (Integer)request.getAttribute("product_s"); 
			System.out.println(product_s);
			%>
			
				<div class="amount-sum">
					已选择<em><%=product_s %></em>件商品<b class="up"></b>
				</div>
				<div class="toolbar-right-money"  >
					<span class="txt11">总价（不含运费）：</span>
					<span class="price sumPrice"id="zongjia" style="color:#e4393c;font-weight: 800"><em><%=productTotalPrice %></em></span><br/>

					<!--<span class="txt toolbar-right-money-span ">已节省：</span>
					<span class="price totalRePrice toolbar-right-money-span">-￥0.00</span>-->
				</div>
				<div class="btn-area">
					<a class="submit-btn" href="javascript:void(0)" id="qujiesuan">
					<b>去结算</b></a>
				</div>
			</div>
			
			<!-- 猜你喜欢 -->
			<div class="w">
				<div class="m m1" id="c-tabs-new">
					<div class="mt">
						<div class="extra-1">
							<a href="#none" class="c-item curr">猜你喜欢</a>
							<a href="#none" class="c-item extra-1-1">我的关注</a>
							<a href="#none" class="c-item extra-1-2">最近浏览</a>
						</div>
					</div>
					<div style="position: relative;" class="mc c-panel-main">
						<div style="position: absolute; z-index: 1; opacity: 1;" class="c-panel ui-switchable-panel-selected" id="guess-products">
							<div class="goods-list-tab">
								<a href="#none" class="s-item curr">&nbsp;</a>
								<a href="#none" class="s-item">&nbsp;</a>
								<a href="#none" class="s-item">&nbsp;</a>
							</div>
						</div>
						<div style="position: absolute; z-index: 1; opacity: 1;" class="goods-list c-panel ui-switchable-panel-selected">
							<!--猜你喜欢-->
							<ul>
								<!--1.1-->
								<li>
									<div class="item">
										<div style="width: 160px;margin: 0 auto;">
											<a target="_blank" href="#"><img src="img/CarImg//T1VCLvB5Dv1RCvBVdK_160.jpg" alt="小米(Mi)小米Max2  全网通 4GB+64GB 金色   移动联通电信4G手机" height="160" width="160"></a>
											
										</div>
										<div class="p-name">
											<a target="_blank" href="#">小米(Mi)小米Max2  全网通 4GB+64GB 金色   移动联通电信4G手机<br></a>
										</div>
		
										<div class="p-price p-price-pos">	
											<strong><em>￥</em><i>1299.00</i></strong>
										</div>
										<div class="p-btn">
											<a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
										</div>
									</div>
								</li>
								<!--1.2-->
								<li>
									<div class="item">
										<div style="width: 160px;margin: 0 auto;">
											<a target="_blank" href="#"><img src="img/CarImg//T1x5ZTBjJv1RCvBVdK_160.jpg" alt="羽博移动电源S8Plus喵女王(20000毫安)" height="160" width="160"></a>
											
										</div>
										<div class="p-name">
											<a target="_blank" href="#">羽博移动电源S8Plus喵女王(20000毫安)<br></a>
										</div>
		
										<div class="p-price p-price-pos">	
											<strong><em>￥</em><i>89.00</i></strong>
										</div>
										<div class="p-btn">
											<a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
										</div>
									</div>
								</li>
								<!--1.3-->
								<li>
									<div class="item">
										<div style="width: 160px;margin: 0 auto;">
											<a target="_blank" href="#"><img src="img/CarImg//T1dkLTBTAT1RCvBVdK_160.jpg" alt="羽博移动电源S20-1珊瑚蓝(20000毫安)" height="160" width="160"></a>
											
										</div>
										<div class="p-name">
											<a target="_blank" href="#">羽博移动电源S20-1珊瑚蓝(20000毫安)<br></a>
										</div>
		
										<div class="p-price p-price-pos">	
											<strong><em>￥</em><i>89.00</i></strong>
										</div>
										<div class="p-btn">
											<a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
										</div>
									</div>
								</li>
								<!--1.4-->
							<li>
									<div class="item">
										<div style="width: 160px;margin: 0 auto;">
											<a target="_blank" href="#"><img src="img/CarImg//T1b.jpg" alt="派瑞空气净化器KJ258F-H01" height="160" width="160"></a>
											
										</div>
										<div class="p-name">
											<a target="_blank" href="#">派瑞空气净化器KJ258F-H01<br></a>
										</div>
		
										<div class="p-price p-price-pos">	
											<strong><em>￥</em><i>1299.00</i></strong>
										</div>
										<div class="p-btn">
											<a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
										</div>
									</div>
								</li>
							</ul>
							<!--我的关注-->
							<ul>
								<!--2.1-->
								<li>
									<div class="item">
										<div style="width: 160px;margin: 0 auto;">
											<a target="_blank" href="#"><img src="img/CarImg//T1GmKvBT_g1RCvBVdK_160.jpg" alt="荣耀(honor) 荣耀8青春版  尊享版 4GB+64B 全网通版 幻海蓝" height="160" width="160"></a>
											
										</div>
										<div class="p-name">
											<a target="_blank" href="#">荣耀(honor) 荣耀8青春版  尊享版 4GB+64B 全网通版 幻海蓝<br></a>
										</div>
		
										<div class="p-price p-price-pos">	
											<strong><em>￥</em><i>1599.00</i></strong>
										</div>
										<div class="p-btn">
											<a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
										</div>
									</div>
								</li>
								<!--2.2-->
								<li>
									<div class="item">
										<div style="width: 160px;margin: 0 auto;">
											<a target="_blank" href="#"><img src="img/CarImg//tj1.jpg" alt="派滋 小米note手机壳 透明硅胶软保护套" height="160" width="160"></a>
											
										</div>
										<div class="p-name">
											<a target="_blank" href="#">派滋 小米note手机壳 透明硅胶软保护套<br></a>
										</div>
		
										<div class="p-price p-price-pos">	
											<strong><em>￥</em><i>35.00</i></strong>
										</div>
										<div class="p-btn">
											<a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
										</div>
									</div>
								</li>
								<!--2.3-->
								<li>
									<div class="item">
										<div style="width: 160px;margin: 0 auto;">
											<a target="_blank" href="#"><img src="img/CarImg//T1tmDvB4CT1RCvBVdK_160.jpg" alt="华为畅享7 (SLA-AL00) 2GB+16GB 全网通 双卡 双待 黑色" height="160" width="160"></a>
											
										</div>
										<div class="p-name">
											<a target="_blank" href="#">华为畅享7 (SLA-AL00) 2GB+16GB 全网通 双卡 双待 黑色<br></a>
										</div>
		
										<div class="p-price p-price-pos">	
											<strong><em>￥</em><i>899.00</i></strong>
										</div>
										<div class="p-btn">
											<a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
										</div>
									</div>
								</li>
								<!--2.4-->
							<li>
									<div class="item">
										<div style="width: 160px;margin: 0 auto;">
											<a target="_blank" href="#"><img src="img/CarImg//T1KmJvBbZs1RCvBVdK_160.jpg" alt="荣耀 (honor) V9 标配版  2GB+16GB 全网通版 幻夜黑" height="160" width="160"></a>
											
										</div>
										<div class="p-name">
											<a target="_blank" href="#">荣耀 (honor) V9 标配版  2GB+16GB 全网通版 幻夜黑<br></a>
										</div>
		
										<div class="p-price p-price-pos">	
											<strong><em>￥</em><i>2599.00</i></strong>
										</div>
										<div class="p-btn">
											<a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
										</div>
									</div>
								</li>
							</ul>
							<!--最近浏览-->
							<ul>
								<!--3.1-->
								<li>
									<div class="item">
										<div style="width: 160px;margin: 0 auto;">
											<a target="_blank" href="#"><img src="img/CarImg//T1bGETBsAT1RCvBVdK_160.jpg" alt="派瑞空气净化器KJ258F-H01" height="160" width="160"></a>
											
										</div>
										<div class="p-name">
											<a target="_blank" href="#">派瑞空气净化器KJ258F-H01<br></a>
										</div>
		
										<div class="p-price p-price-pos">	
											<strong><em>￥</em><i>1299.00</i></strong>
										</div>
										<div class="p-btn">
											<a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
										</div>
									</div>
								</li>
								<!--3.2-->
								<li>
									<div class="item">
										<div style="width: 160px;margin: 0 auto;">
											<a target="_blank" href="#"><img src="img/CarImg//T1LcZvBvVg1RCvBVdK_160.jpg" alt="荣耀(honor) 荣耀9高配版版 6GB+64B 全网通版 琥珀金" height="160" width="160"></a>
											
										</div>
										<div class="p-name">
											<a target="_blank" href="#">荣耀(honor) 荣耀9高配版版 6GB+64B 全网通版 琥珀金<br></a>
										</div>
		
										<div class="p-price p-price-pos">	
											<strong><em>￥</em><i>2699.00</i></strong>
										</div>
										<div class="p-btn">
											<a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
										</div>
									</div>
								</li>
								<!--3.3-->
								<li>
									<div class="item">
										<div style="width: 160px;margin: 0 auto;">
											<a target="_blank" href="#"><img src="img/CarImg//T1l7bvBXJv1RCvBVdK_160.jpg" alt="北纯   东北黄小米   120g" height="160" width="160"></a>
											
										</div>
										<div class="p-name">
											<a target="_blank" href="#">北纯   东北黄小米   120g<br></a>
										</div>
		
										<div class="p-price p-price-pos">	
											<strong><em>￥</em><i>5.90</i></strong>
										</div>
										<div class="p-btn">
											<a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
										</div>
									</div>
								</li>
								<!--3.4-->
							<li>
									<div class="item">
										<div style="width: 160px;margin: 0 auto;">
											<a target="_blank" href="#"><img src="img/CarImg//T1y.jpg" alt="Blueair/布鲁雅尔   瑞典家用空气   净化器   303 除PM2.5甲醛雾霾粉尘" height="160" width="160"></a>
											
										</div>
										<div class="p-name">
											<a target="_blank" href="#">Blueair/布鲁雅尔   瑞典家用空气   净化器   303 除PM2.5甲醛雾霾粉尘<br></a>
										</div>
		
										<div class="p-price p-price-pos">	
											<strong><em>￥</em><i>2799.00</i></strong>
										</div>
										<div class="p-btn">
											<a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
			</div>
			<!-- 底部版权信息 -->
		<div id="gome-foot">
			<div id="gome-foot-box">
				<span class="clearfix "><i></i><p><strong>门店服务</strong><a href="#">国美门店全国共计2000余家</a></p></span>
				<span class="clearfix ued"><i></i><p><strong>用户体验</strong><a href="#">参与用户体验改进计划</a>  <a href="#">用户反馈</a></p></span>
				<div class="qrcode-section">
					<em class="code-sm wx">
						<i></i>
						<p>公众号</p>
						<div style="display: none;">
							<img src="img/1.jpg">
							<i class="icon-triangle"></i>
						</div>
					</em>
					<em class="code-sm wap">
						<i></i>
						<p>手机站点</p>
						<div style="display: none;">
							<img src="img/2.jpg">
							<i class="icon-triangle"></i>
						</div>
					</em>
					<em class="code-bg app">
						<i><a href="#"><img src="img/3.jpg" /></a></i>
						<p>扫描下载客户端</p>
					</em>
				</div>
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
				<p>本公司游戏产品适合18岁以上成年人使用  违法和不良信息举报电话：021-60766055  <a class="interDrug" href="#">互联网药品信息服务资格证编号（京）-经营性-2013-0011</a></p>
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
					
</div>
 <div class="gui_modal"></div>
		

		<script type="text/javascript">
		   	$("#login000").click(function(){
		
				$("#frm333").submit();
	
			});
			//给去结算绑定事件
		 $(function(){
		 if($("#productSum").val()==1){
		
		 	/* $("#").click(function(){
		 		$(this).removeAttribute('href');
		 	}); */
		 }
	
			$("#qujiesuan").click(function(){ 
			
			$.post("ShoppingCartServlet",{"action":"ifdenglu"},function(data){
				next(data);
			},"json");

			
		
			
			});
		});
		
		function next(data){
			if(data==null){
				gologin();
			}else{
			location.assign("AddressServlet?action=runNext");
			}
		} 
		
		$("#shoppingjian").click(function(){
			var productSum = $("#productSum").val();
			if(productSum <= 1){
				$(this).attr("href","javascript:void(0);"); 
			}
		});
		
		
		
		
		
		/* //给加减绑定事件
			$("#shoppingjian").click(function(){
						if(parseInt($("#productSum").val())>1){
							$("#productSum").val($("#productSum").val()-1);
							$("#sumprice").text(parseInt($("#danjia").text())*parseInt($("#productSum").val()));
							$("#zongjia").text(parseInt($("#zongjia").text())-parseInt($("#danjia").text()));
							
						}
						
						
					});
			$("#shoppingjia").click(function(){
					
					if($("#productSum").val()<productSum){
						$("#productSum").val(parseInt($("#productSum").val())+1);
						$("#sumprice").text(parseInt($("#danjia").text())*parseInt($("#productSum").val()));
						$("#zongjia").text(parseInt($("#zongjia").text())+parseInt($("#danjia").text()));
						}
					}); */
			
			
			
			
		/* 	function jian(pid){
				if(parseInt($("#productSum").val())>1){
							$("#productSum").val($("#productSum").val()-1);
							$("#sumprice").text(parseInt($("#danjia").text())*parseInt($("#productSum").val()));
							$("#zongjia").text(parseInt($("#zongjia").text())-parseInt($("#danjia").text()));
							
						}
			}
				
				function jia(pid){
				if($("#productSum").val()<productSum){
						$("#productSum").val(parseInt($("#productSum").val())+1);
						$("#sumprice").text(parseInt($("#danjia").text())*parseInt($("#productSum").val()));
						$("#zongjia").text(parseInt($("#zongjia").text())+parseInt($("#danjia").text()));
						$.post("ShoppingCartServlet",{"action":"jia","pid":pid},function(date){
							changeShoppingCar(date);
						},"json");
						}
				
				}
			 		
				function changeShoppingCar(date){
				
				
					for(var i = 0; i<date.length;i++){
					  alert(date[i].shoppingCarSum)
					}
				} */
				 
			
			</script>
</body>
</html>

