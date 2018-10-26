<%@ page language="java" import="java.util.*,com.vo.*,com.service.inter.*,com.service.impl.*,com.page.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>国美单个商品展示</title>
	<link rel="stylesheet" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/css1/single.css" />
	<link rel="stylesheet" type="text/css" href="css/right.css"/>
	<link rel="stylesheet" type="text/css" href="css/up.css"/>
	<script type="text/javascript" src = "js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src = "js/javascript.js"></script>
	<script type="text/javascript" src="js/number.js"></script>
	<link href="jqzoom.css" rel="stylesheet" type="text/css" />  
	
 
</head>

<body>
	<!--头部导航栏-->
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
									<a href=""><img src="img1/no-img_mid_.jpg" width="60" height="60"></a>
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
								<img src="img1/1.jpg" alt="关注国美">
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
		<div id="txt">
			<div id="logo">
				<a href="#"></a>
			</div>
			<div id="sousuo">
				<div class="d1">
					<div id="d1-name">
						<span>商品</span>
						<i></i>
					</div>
				</div>
				<div id="d2">
					<input type="text" name="username" id="username" placeholder="iphone 8" />
				</div>
				<div id="d3">
					<a href="#">搜索</a>
				</div>
				&nbsp;&nbsp;<a href="#">iphone 8</a>&nbsp;&nbsp;
				<a href="#">红米Note4X</a>&nbsp;
				<a href="#">iphone 8</a>&nbsp;
				<a href="#">三星Note8</a>&nbsp;
				<a href="#">魅族Pro7</a>&nbsp;
				<a href="#">OppO R11</a>&nbsp;
				<a href="#">GOME手机</a>&nbsp;
			</div>
			<div id="gome-right">
				<span>
					<em class="i-cart"></em>
					<a href="#">购物车空了</a>
					<b></b>
				</span>
			</div>
		</div>

<!--全部商品-->
<div class="category-box">
	<div class="category wbox " style="position:relative; z-index:2">
		<div class="sidecategory">
			<h2>
				<span></span>
				<a href="">全部商品分类</a>
			</h2>
		</div>
		<ul class="mainnav">
			<li>
				<a href="">
					<span>首页</span>
				</a>
			</li>
			<li>
				<a href="">
					<span style="color: #f5004b;">圈子</span>
				</a>
			</li>
			<li>
				<a href="">
					<span>真划算</span>
				</a>
				<span class="tag_line"></span>
			</li>
			<li>
				<a href="">
					<span>服装城</span>
				</a>
			</li>
			<li>
				<a href="">
					<span>超市</span>
				</a>
			</li>
			<li>
				<a href="">
					<span>电器城</span>
				</a>
			</li>
			<li>
				<a href="">
					<span>国美电器</span>
				</a>
			</li>
			<li>
				<a href="">
					<span>汽车</span>
				</a>
			</li>
			<li>
				<a href="">
					<span>家居家装</span>
				</a>
				<span class="tag_line"></span>
			</li>
			<li>
				<a href="">
					<span>智能</span>
				</a>
			</li>
			<li>
				<a href="">
					<span>管家</span>
				</a>
			</li>
			<li>
				<a href="">
					<span>金融</span>
				</a>
			</li>
		</ul>
	</div>
	
</div>
<div style="clear:both"></div>
<div class="breadcrumbs-wrapper">
		<div class="breadcrumbs-container">
			<div class="breadcrumbs-container-left">
				<ul>
					<li>
						<a href="">手机</a>
					</li>
					<li>
						<a href="">手机通讯</a>
					</li>
					<li>
						<a href="">手机</a>
					</li>
					<li>
						<a href="">Apple</a>
					</li>
					<li>
						<a>Apple iphone8...</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

<!--头部以下-->
<div class="dakuangjia">
	<% Product product=(Product)request.getAttribute("product"); %>
		<div>
			<div class="photo">
				<div style="clear:both;"></div>
				<div id="mImg"></div>

				<img id="img111" style="display: block;" src="img/productImage/<%=product.getDetailLargeImg1() %>" width="450px" height="450px" /> 
				<img id="img222" style="display: none;" src="img/productImage/<%=product.getDetailLargeImg2() %>" width="450px" height="450px" />
				<img id="img333" style="display: none;" src="img/productImage/<%=product.getDetailLargeImg3() %>" width="450px" height="450px" />
				<img id="img444" style="display: none;" src="img/productImage/<%=product.getDetailLargeImg4() %>" width="450px" height="450px" />
				<img id="img555" style="display: none;" src="img/productImage/<%=product.getDetailLargeImg5() %>" width="450px" height="450px" />
				
				 <!-- src="img1/zhuye1.jpg" -->
				 <span class="zoomspan" id="slider"></span>
				
			</div>
			<div id="big" class="imagezoom-viewer" style="display: none;">
						<img id="bigimg" src="img/productImage/<%=product.getDetailLargeImg1()%>" style="position: relative; width: 800px; height: 800px;">
						 <%-- <img id="bigimg" src="img/productImage/<%=product.getDetailLargeImg2()%>" style="position: relative; width: 800px; height: 800px;">
						<img id="bigimg" src="img/productImage/<%=product.getDetailLargeImg3()%>" style="position: relative; width: 800px; height: 800px;">
						<img id="bigimg" src="img/productImage/<%=product.getDetailLargeImg4()%>" style="position: relative; width: 800px; height: 800px;">
						<img id="bigimg" src="img/productImage/<%=product.getDetailLargeImg5()%>" style="position: relative; width: 800px; height: 800px;">  --%>
						
						
					</div>
					<script src="zoomDemo.js" type="text/javascript" charset="utf-8"></script>
			<div class="description">
				<h1 style="display: inline;"><%=product.getPname() %></h1>
				<h4>
					新一代 ViVO，让智能看起来更不一样，双面全玻璃设计、A11 仿生、支持无线充电 <br />
					<a href="" style="text-decoration: none;color: #069;">查看
				更多iPhone 请点击》</a>
					<a href="" style="text-decoration: none;color:#069"> 新品上市 转盘抽奖赢好礼 立即参与》</a>
				</h4>
				<div class="description-duibi">
					<label>对比</label>
				</div>
		<script type="text/javascript">
					var small = document.getElementById("mImg");
					var slider = document.getElementById("slider");
					var big = document.getElementById("big");
					var bigImg = document.getElementById("bigimg");
					
					//让slider跟随鼠标移动.给小的方块绑定事件
					small.onmousemove = function(e) {
						
						var even = e || event;  //兼容火狐浏览器
						var x = even.clientX - small.offsetLeft - slider.offsetWidth/2;
						//var y = even.offsetY - small.offsetTop - slider.offsetHeight/2;
						var y = even.offsetY - slider.offsetHeight/2;
						//水平方向的最大值
						var maxX = small.clientWidth - slider.clientWidth;
						//竖直方向的最大值
						var maxY = small.clientHeight - slider.clientHeight;
						if(x<0){
						//相当于超出左侧,超出左侧时,拉回
						x=0;
						}
						//超出右侧时拉回
						if(x>maxX){
							x = maxX;
						}
						//顶部超出
						if(y<0){
							y=0;
						}
						//底部超出
						if(y>maxY){
							y = maxY;
						}
						slider.style.top = y +230+ "px";
						slider.style.left = x+160 + "px";
						//放大的图片的主要实现代码:一个比例计算
						big.scrollLeft = x/maxX*(bigImg.clientWidth - big.clientWidth);
						big.scrollTop = y/maxY*(bigImg.clientHeight - big.clientHeight);
					}
					//鼠标移入事件
					small.onmouseenter = function(){
						//鼠标移入到原图时候实现,上面出现的小的方块
						slider.style.display = "block";
						//右侧的大图区域显示出来图片
						big.style.display = "block";
					}
					//添加鼠标移出事件,鼠标移出原图的时候,
					small.onmouseleave = function(){
						slider.style.display = "none";
						big.style.display = "none";
					}
				</script>
				
				<div class="yuyue">
					<span>国美价</span>
					<strong>¥<%=product.getPrice() %></strong>
					<label><a href="">降价通知</a></label>
					<div class="lingquan">
						<label style="letter-spacing:15px;">领券</label>
						<b>满1000减20</b>
						<b>满2000减50</b>
					</div>
					<div class="haopingdu">
						<span style="color: color: #5e5e5e;;">好评度100%</span>
						<span><a>7人评价</a></span>
					</div>
				</div>

				<div class="tesebody">
					<div class="tese">
						<label style="letter-spacing:10px;">特             色</label>
						<span class="test-yijiuhuanxin">
						<em></em>
						<b></b>
						<a href="//yjhx.gome.com.cn/" target="_blank">以旧换新再送好礼</a>
					</span>

						<span class="test-guanjiafuwu">
						<em></em>
						<b></b>
						<a href="//yjhx.gome.com.cn/" target="_blank">管家服务</a>
					</span>

						<span class="test-guomeizhineng">
						<em></em>
						<b></b>
						<a href="//yjhx.gome.com.cn/" target="_blank">国美智能</a>
					</span>
						<div class="songzhi">
							<label style="letter-spacing:10px;">送             至</label>
							<a href="" class="" id="" title="">送至北京市朝阳区外街道</a>
							<span style="letter-spacing:10px;">支             持</span>
							<a>免运费</a>
						</div>

						<div class="fuwu">
							<label style="letter-spacing:10px;">服             务</label>
							<span>
							由<b>&nbsp;&nbsp;国美&nbsp;&nbsp;</b>配送并提供保障监管。
						</span>
						</div>

						<div class="yanse">
							<label style="float: left;letter-spacing:10px;">颜             色</label>

							<div style="width: 800px;">
								<div class="jinse">
									<a href="">
										<img alt="jinse" src="img1/jinse.jpg" />
										<span>金色</span>
										<i></i>
									</a>
								</div>

								<div class="shengkonghui">
									<a href="">
										<img alt="jinse" src="img1/shengkonghui.jpg" />
										<span>深空灰</span>
										<i></i>
									</a>
								</div>

								<div class="yinse">
									<a href="">
										<img alt="jinse" src="img1/yinse.jpg" />
										<span>银色</span>
										<i></i>
									</a>
								</div>
							</div>

						</div>

						<div class="rongliang">
							<label style="letter-spacing:10px;">容             量</label>
							<div class="quanwang">
								<div class="liusi">
									<a href="">全网通64GB</a>
									<i></i>
								</div>

								<div class="erliuwu">
									<a href="">全网通265GB</a>
								</div>
							</div>

						</div>

						<div class="yanbaofuwu">
							<label>延保服务</label>
							<div class="yanchangbaoxiu">
								<a href="">
									<b class="icon-yb" style="top:4px; display: inline-block;">
									<img src="img1/xiaokuai.png" />
								</b>
									<span>延长保修一年</span>
									<span>￥499</span>
								</a>
							</div>
						</div>

						<div class="jiarugouwuche">
							<div class="jiajian">
								<input type="text" name="shuzi" class="shuzi" id="shuzi" value="1" disabled="disabled"/>
								<a href="javascript:;" class="jia">+</a>
								<a href="javascript:;" class="jian">-</a>
								<div class="dianjijiaru">
									<a href="javascript:void(0)" onclick="addToCar()">加入购物车</a>
								</div>
								<div class="fenqigou">
									<a href="#" id="goushouji">分期购</a>
								</div>
								<div class="kuaisugou">
									<a href="#" id="goushouji">快速购</a>
								</div>
								<div class="shoujixiadan">
									<a href="#">
									手机下单
								</a>
								</div>
							</div>
						</div>
						<div class="wenxintishi">
							<p>温馨提示</p>
							<ol>
								<li>1.正品保障：支持7天无理由退款</li>
							</ol>
						</div>

					</div>

				</div>

			</div>

		</div>
		<div class="foot">
			<div class="fangdajingtupian">
				<ul>
					<li id="jiaodu1">
						<img src="img/productImage/<%=product.getDetailSmallImg1()%>" width="60px" height="60px" /> <!-- src="img1/T1oGdvBvxT1RCvBVdK_60.jpg" -->
					</li>
					<li id="jiaodu2">
						<img src="img/productImage/<%=product.getDetailSmallImg2()%>" width="60px" height="60px" /> <!-- src="img1/T1MvEvBjDj1RCvBVdK_60.jpg" -->
					</li>
					<li id="jiaodu3">
						<img src="img/productImage/<%=product.getDetailSmallImg3()%>" width="60px" height="60px" /> <!-- src="img1/T1TJAvBbKb1RCvBVdK_60.jpg" -->
					</li>
					<li id="jiaodu4">
						<img src="img/productImage/<%=product.getDetailSmallImg4()%>" width="60px" height="60px" /> <!-- src="img1/T1MvEvBjDj1RCvBVdK_60.jpg" -->
					</li>
					<li id="jiaodu5">
						<img src="img/productImage/<%=product.getDetailSmallImg5()%>" width="60px" height="60px" /> <!-- src="img1/T1xdAvBgKs1RCvBVdK_60.jpg" -->
					</li>
				</ul>
			</div>
			<div class="chanpingbianhao">
				<span>商品编号：100453505</span>
				<a>分享赚￥6.36</a>
				<a>提心愿</a>
				<a>收藏</a>
			</div>
		</div>

		<!--描述：附近门店部分 -->
		<div class="fujinmendian">
			<div class="mendiantiyan">
				<p>附近门店</p>
				<p id="qumendian">去门店体验，预约专业导购</p>
			</div>
			<div class="liulin">
				<div class="shilihedian">
					<div class="liulinimg">
						<img src="img1/T1akLvBCZT1RXrhCrK.jpg" />
					</div>
					<div class="beijingshilihedin" title="北京十里河店">
						<h4>北京国美十里河店 </h4>
						<p class="p1">
							<span>刘玲</span>
							<a href="#">去门店找TA</a>
						</p>
						<p class="p2">
							<span>已服务
							<p>166人</p>	
							</span>
						</p>
					</div>
				</div>

				<div class="xibahedian">
					<div class="liulinimg">
						<img src="img1/T1y5bvBsbv1RXrhCrK.jpg" />
					</div>
					<div class="beijingshilihedin" title="北京十里河店">
						<h4>北京国美西河坝店 </h4>
						<p class="p1">
							<span>贾小庆</span>
							<a href="#">去门店找TA</a>
						</p>
						<p class="p2">
							<span>已服务
							<p>61人</p>	
							</span>
						</p>
					</div>
				</div>

				<div class="chakangengduo">
					<a href="#">查看更多门店</a>
				</div>
			</div>
		</div>

		<!--
        	描述：其他类似商品部分
        -->
		<div class="similar">
			<div class="other">
				<h3>其他类似商品</h3>
			</div>
			<div class="otheriphone">
				<a href="#"><b></b></a>
				<a href="#"><s></s></a>
				<div class="iphoneimg">
					<ul>
						<li>
							<a href="#">
								<img src="img1/T1KIETByL_1RCvBVdK_130.jpg" />
								<h2>Apple iPhone 6 32G 金色 移动联通电信4G手机</h2>
							</a>
							<span>￥2398.00</span>
						</li>
						<li>
							<a href="#">
								<img src="img1/T1iCWvByDg1RCvBVdK_130.jpg" />
								<h2>Apple 苹果 iPhone6S/iphone6S Plus 16G/32G/64G/128G</h2>
							</a>
							<span>￥3968.00</span>
						</li>
						<li>
							<a href="#">
								<img src="img1/T1aAWvBbVb1RCvBVdK_130.jpg" />
								<h2>三星(SAMSUNG) Galaxy N8 (N9500)全网通 手机 旷野灰</h2>
							</a>
							<span>￥9999.00</span>
						</li>
						<li>
							<a href="#">
								<img src="img1/T10PJvBbxv1RCvBVdK_130.jpg" />
								<h2>手机大促 苹果/Apple iPhone 7/iPhone 7 Plus iphone7 移</h2>
							</a>
							<span>￥4428.00</span>
						</li>
						<li>
							<a href="#">
								<img src="img1/T1AwKTBgYg1RCvBVdK_130.jpg" />
								<h2>AApple iPhone 7 Plus (A1661) 32G 移动联通电信4G手机</h2>
							</a>
							<span>￥5888.00</span>
						</li>
						<li>
							<a href="#">
								<img src="img1/T1XoZvBQWT1RCvBVdK_130.jpg" />
								<h2>手机大促 苹果/Apple iPhone 7/iPhone 7 Plus 移动联通电</h2>
							</a>
							<span>￥6288.00</span>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<!--
        	描述：相关分类部分
        -->
		<div class="left">
			<div class="xiangguanfenlei">
				<h2 class="hzhauyong">相关分类</h2>
				<div class="heyueji">
					<a href="#">合约机</a>
					<a href="#">手机服务</a>
					<a href="#">对讲机</a>
					<a href="#">手机</a>
					<a href="#">二手手机</a>
				</div>
			</div>

			<div class="tongleiqitapingpai">
				<h2 class="hzhauyong">同类其它品牌</h2>
				<div class="qitapinpai">
					<a href="#">Apple</a>
					<a href="#">三星（SAMSUNG）</a>
					<a href="#">华为（HUAWEI）</a>
					<a href="#">摩托罗拉（Motorola）</a>
					<a href="#">联想（lenovo）</a>
					<a href="#">诺基亚（NOKIA）</a>
					<a href="#">HTC（SAMSUNG）</a>
					<a href="#">中兴（ZTE）</a>
					<a href="#">酷派（Coolpad）</a>
					<a href="#">金立（GiONEE）</a>
					<a href="#">macoox</a>
					<a href="#">努比亚</a>
					<a href="#">OPPO</a>
					<a href="#">步步高</a>
					<a href="#">飞利浦（Philips）</a>
					<a href="#">朵唯（DOOV）</a>
					<a href="#">魅族（MEIZU）</a>
					<a href="#">天语（K-</a>
				</div>
			</div>
			<!--
        	描述：浏览最终购买
        -->
			<div class="liulanzuizhonggoumai" id="tongyong">
				<h2 class="hzhauyong">浏览最终购买</h2>
				<ul>
					<li>
						<a href="#">
							<img src="img1/T1KIETByL_1RCvBVdK_130.jpg" />
							<span>￥2398.00</span>
							<div class="miaoshu">Apple iPhone 6 32G 金色 移动联通电信4G手机</div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1JKYvBQA_1RCvBVdK_160.jpg" />
							<span>￥4748.00</span>
							<div class="miaoshu">苹果（Apple）iPhone6S/iPhone6S </div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1UmCvBKhb1RCvBVdK_160.jpg" />
							<span>￥2898.00</span>
							<div class="miaoshu">华为（HUAWEI）Mate9 移动联通电信4G 手机(香槟金 全网通版) </div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1KmJvBbZs1RCvBVdK_160.jpg" />
							<span>￥2599.00</span>
							<div class="miaoshu">荣耀（honor）V9 标配版 4GB+64GB 全网通版 幻夜黑 </div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1SZWvBCZT1RCvBVdK_160.jpg" />
							<span>￥1399.00</span>
							<div class="miaoshu">荣耀（honor）荣耀8青春版 高配版 4GB+32GB 全网通版 幻夜黑 </div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1uTYTB5bv1RCvBVdK_160.jpg" />
							<span>￥1099.00</span>
							<div class="miaoshu">MI手机红米4X磨砂黑3GB内存32GB</div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1iCWvByDg1RCvBVdK_130.jpg" />
							<span>￥3968.00</span>
							<div class="miaoshu">Apple 苹果 iPhone6S/iPhone6S Plus16G/32G/64G/128G版 移动联</div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1MAYvBmD_1RCvBVdK_160.jpg" />
							<span>￥2648.00</span>
							<div class="miaoshu">手机大促 小米（MI）小米6 移动联通电信全网通4G手机(亮黑色)</div>
						</a>
					</li>
				</ul>
			</div>

			<!--
        	描述：热销排行榜
        -->
			<div class="rexiaopaihangbang">
				<h2 class="hzhauyong">热销排行榜</h2>
				<ul>
					<li>
						<div class="shunxu">1</div>
						<div class="shunxuimg">
							<a href="#">
								<img src="img1/T1zoYvBjWT1RCvBVdK_100.jpg" />
							</a>
						</div>
						<div class="shoujidacu">
							<p>
								<a href="#">手机大促 vivo X9 4GB+64GB 全网通</a>
							</p>
							<span>￥2398.00</span>
						</div>
					</li>

					<li>
						<div class="shunxu">2</div>
						<div class="shunxuimg">
							<a href="#">
								<img src="img1/T1b.hvBXCv1RCvBVdK_100.jpg" />
							</a>
						</div>
						<div class="shoujidacu">
							<p>
								<a href="#">手机大促 苹果/APPLE iPhone 6</a>
							</p>
							<span>￥2399.00</span>
						</div>
					</li>

					<li>
						<div class="shunxu">3</div>
						<div class="shunxuimg">
							<a href="#">
								<img src="img1/T13oDvB7Cj1RCvBVdK_100.jpg" />
							</a>
						</div>
						<div class="shoujidacu">
							<p>
								<a href="#">苹果/APPLE iPhone6/iPhone 6 </a>
							</p>
							<span>￥2305.00</span>
						</div>
					</li>

					<li>
						<div class="shunxu">4</div>
						<div class="shunxuimg">
							<a href="#">
								<img src="img1/T1wPbTBgAj1RCvBVdK_100.jpg" />
							</a>
						</div>
						<div class="shoujidacu">
							<p>
								<a href="#">vivo X7 全网通4G 八核 5.2寸屏 双卡 </a>
							</p>
							<span>￥2276.00</span>
						</div>
					</li>

					<li>
						<div class="shunxu">5</div>
						<div class="shunxuimg">
							<a href="#">
								<img src="img1/T177CvBmE_1RCvBVdK_100.jpg" />
							</a>
						</div>
						<div class="shoujidacu">
							<p>
								<a href="#">OPPO A77 4GB+64GB 全网通 </a>
							</p>
							<span>￥2199.00</span>
						</div>
					</li>

					<li>
						<div class="shunxu">6</div>
						<div class="shunxuimg">
							<a href="#">
								<img src="img1/T1FcKvB4A_1RCvBVdK_100.jpg" />
							</a>
						</div>
						<div class="shoujidacu">
							<p>
								<a href="#">手机节【789月放假放量】 apple/苹果 </a>
							</p>
							<span>￥2598.00</span>
						</div>
					</li>

					<li>
						<div class="shunxu">7</div>
						<div class="shunxuimg">
							<a href="#">
								<img src="img1/T1KmJvBbZs1RCvBVdK_100.jpg" />
							</a>
						</div>
						<div class="shoujidacu">
							<p>
								<a href="#">荣耀（honor）V9 标配版 4GB+64GB </a>
							</p>
							<span>￥2599.00</span>
						</div>
					</li>

					<li>
						<div class="shunxu">8</div>
						<div class="shunxuimg">
							<a href="#">
								<img src="img1/T1_OhvBydv1RCvBVdK_100.jpg" />
							</a>
						</div>
						<div class="shoujidacu">
							<p>
								<a href="#">手机节 苹果/APPLE iPhone6 移动联通 </a>
							</p>
							<span>￥2629.00</span>
						</div>
					</li>
				</ul>
			</div>

			<!--
        	描述：浏览了还浏览部分
        -->
			<div class="liulanlehailiulan" id="tongyong">
				<h2 class="hzhauyong">浏览了还浏览</h2>
				<ul>
					<li>
						<a href="#">
							<img src="img1/T1XoZvBQWT1RCvBVdK_130.jpg" />
							<span>￥5798.00</span>
							<div class="miaoshu">手机节 Apple iPhone 7 苹果7 移动联通电信4G手机(亮黑色 全网通</div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1e.DvBybT1RCvBVdK_160.jpg" />
							<span>￥5738.00</span>
							<div class="miaoshu">苹果(Apple) iPhone 7 全网通4G手机 苹果7(亮黑色) </div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1CjYTBChT1RCvBVdK_160.jpg" />
							<span>￥6088.00</span>
							<div class="miaoshu">Apple iPhone 7 Plus 移动联通电信4G手机 5.5英寸(32GB 玫瑰金色 </div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1j5KvBgJv1RCvBVdK_160.jpg" />
							<span>￥6249.00</span>
							<div class="miaoshu">手机节 Apple/苹果 iPhone 7/iphone 7 PLUS 国行全网通4G手 </div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1XoZvBQWT1RCvBVdK_160.jpg" />
							<span>￥6278.00</span>
							<div class="miaoshu">手机大促 苹果/Apple iPhone 7/iPhone 7 Plus 移动联通电信全网 </div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1uTYTB5bv1RCvBVdK_160.jpg" />
							<span>￥6288.00</span>
							<div class="miaoshu">Apple iPhone 7 Plus 移动联通电信4G手机(金色 7plus)</div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1u5xvBybj1RCvBVdK_160.jpg" />
							<span>￥5299.00</span>
							<div class="miaoshu">Apple iPhone 7 移动联通电信4G手机(玫瑰金 7)</div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1bAhvBvxb1RCvBVdK_160(1).jpg" />
							<span>￥6548.00</span>
							<div class="miaoshu">手机大促 apple/苹果7P iphone7p 128G 全网通移动联通电信4G手机</div>
						</a>
					</li>
				</ul>
			</div>


			<!--
        	
        	描述：产品精选部分
        -->
			<div class="chanpingjingxuan" id="tongyong">
				<h3 class="hzhauyong">产品精选
					<p>广告</p>
				</h3>
				<ul>
					<li>
						<a href="#">
							<img src="img1/T1.ZWTBCYv1RCvBVdK_210-210.jpg" />
							<span>￥2999.00</span>
							<div class="miaoshu">OPPO R9s Plus 6GB+64GB 全网通 4G手机 双卡双待手机 黑色</div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T10mdvBv_g1RCvBVdK_210-210.jpg" />
							<span>￥2999.00</span>
							<div class="miaoshu">荣耀（honor）荣耀9 尊享版 6GB+128GB 全网通版 海鸥灰</div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1f6ZvBXhg1RCvBVdK_210-210.jpg" />
							<span>￥1799.00</span>
							<div class="miaoshu">国美 (GOME K1 4GB+64GB 移动联通电信 手机 虹膜解锁 墨韵灰 </div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T10mdvBv_g1RCvBVdK_210-210.jpg" />
							<span>￥2299.00</span>
							<div class="miaoshu">荣耀（honor）荣耀9 标配版 4GB+64GB 全网通版 海鸥灰 </div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1tUKTByCT1RCvBVdK_210-210.jpg" />
							<span>￥2599.00</span>
							<div class="miaoshu">OPPO R9s 4GB+64GB 全网通 4G手机 双卡双待手机 黑色</div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1FZATBCVT1RCvBVdK_210-210.jpg" />
							<span>￥5288.00</span>
							<div class="miaoshu">Apple iPhone 7 128G 黑色 移动联通电信4G手机</div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1y0xvBTVg1RCvBVdK_210-210.jpg" />
							<span>￥2399.00</span>
							<div class="miaoshu">vivo X9 4GB+64GB 移动联通电信4G手机 双卡双待 玫瑰金</div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1CvKTByZT1RCvBVdK_210-210.jpg" />
							<span>￥3599.00</span>
							<div class="miaoshu">华为 HUAWEI Mate 9 4GB+64GB 全网通版 香槟金</div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1a6hvBs_g1RCvBVdK_210-210.jpg" />
							<span>￥1999.00</span>
							<div class="miaoshu">国美 (GOME U1 4GB+64GB 手机 虹膜解锁 泰迪棕</div>
						</a>
					</li>

					<li>
						<a href="#">
							<img src="img1/T1PZCvBTWg1RCvBVdK_210-210.jpg" />
							<span>￥2999.00</span>
							<div class="miaoshu">OPPO R11 4GB+64GB 4G手机 全网通 双卡双待手机 金色</div>
						</a>
					</li>
				</ul>
			</div>

		</div>

		<!--
        	描述：商品 详情部分
        -->
		<div class="big">
			<div class="head">
				<ul>
					<li class="cur">
						<a>商品详情</a>
					</li>
					<li>
						<a>规格与包装</a>
					</li>
					<li>
						<a>商品评价(75)</a>
					</li>
					<li>
						<a>售后保障</a>
					</li>
					<li>
						<a>小助手</a>
					</li>
				</ul>
			</div>

			<!--
            	描述：头部以下第二块
            -->
			<div class="two">
				<!-- 描述主体 -->
				<div class="first-panel">
					<div class="main">

						<h1>
							<img src="img1/T1cdKvB_Db1RCvBVdK.png" />
							<span>主体</span>
							<i class="icon-arrow-down">arrow</i>
						</h1>
						<ul>
							<li>
								<span class="attr">品牌:</span>
								<span class="value">Apple</span>
							</li>
							<li>
								<span class="attr">型号:</span>
								<span class="value">iphone8</span>
							</li>
							<li>
								<span class="attr">颜色 :</span>
								<span class="value">金色</span>
							</li>
						</ul>
					</div>
				</div>

				<!--	描述：操作系统-->
				<div id="tow-panel" class="first-panel">
					<div class="main">
						<h1>
							<img src="img1/T1cdKvB_Db1RCvBVdK.png" />
							<span>操作系统</span>
							<i class="icon-arrow-down">arrow</i>
						</h1>
						<ul>
							<li>
								<span class="attr">操作系统:</span>
								<span class="value">苹果(IOS)</span>
							</li>
						</ul>
					</div>
				</div>

				<!--	描述：主芯片-->
				<div id="tow-panel" class="first-panel">
					<div class="main">
						<h1>
							<img src="img1/T1cdKvB_Db1RCvBVdK.png" />
							<span>主芯片</span>
							<i class="icon-arrow-down">arrow</i>
						</h1>
						<ul>
							<li>
								<span class="attr">CPU型号:</span>
								<span class="value">以官网信息为准</span>
							</li>
						</ul>
					</div>
				</div>

				<!--	描述：网络-->
				<div id="tow-panel" class="first-panel">
					<div class="main">
						<h1>
							<img src="img1/T1cdKvB_Db1RCvBVdK.png" />
							<span>网络</span>
							<i class="icon-arrow-down">arrow</i>
						</h1>
						<ul>
							<li>
								<span class="attr">4G网络制式:</span>
								<span class="value">移动</span>
							</li>
							<li>
								<span class="value">4G(TD-LTE)、联通</span>
							</li>
							<li>
								<span class="attr">3G网络制式:</span>
								<span class="value">3G(TD-LTE)、联通</span>
							</li>
							<li>
								<span class="attr">2G网络制式:</span>
								<span class="value">2G(TD-LTE)、联通</span>
							</li>
						</ul>
					</div>
				</div>

				<!--	描述：存储-->
				<div id="five-panel" class="first-panel">
					<div class="main">
						<h1>
							<img src="img1/T1cdKvB_Db1RCvBVdK.png" />
							<span>存储</span>
							<i class="icon-arrow-down">arrow</i>
						</h1>
						<ul>
							<li>
								<span class="attr">机身内存:</span>
								<span class="value">以官网网信息为准</span>
							</li>
							<li>
								<span class="attr">运行内存</span>
								<span class="value">以官网网信息为准</span>
							</li>
						</ul>
					</div>
				</div>

				<!--	描述：显示-->
				<div id="six-panel" class="first-panel">
					<div class="main">
						<h1>
							<img src="img1/T1cdKvB_Db1RCvBVdK.png" />
							<span>显示</span>
							<i class="icon-arrow-down">arrow</i>
						</h1>
						<ul>
							<li>
								<span class="attr">屏幕:</span>
								<span class="value">4.7</span>
							</li>
							<li>
								<span class="attr">屏幕分辨率:</span>
								<span class="value">1334x750</span>
							</li>
						</ul>
					</div>
				</div>
				<!--描述：摄像功能-->
				<div id="seven-panel" class="first-panel">
					<div class="main">
						<h1>
							<img src="img1/T1cdKvB_Db1RCvBVdK.png" />
							<span>摄像功能</span>
							<i class="icon-arrow-down">arrow</i>
						</h1>
						<ul>
							<li>
								<span class="attr">后置摄像头:</span>
								<span class="value">1200万</span>
							</li>
							<li>
								<span class="attr">前置摄像头:</span>
								<span class="value">以官网信息</span>
							</li>
						</ul>

					</div>
				</div>
				<p>
					<a href="#">更多参数</a>
				</p>

				<!-- 结束 -->

			</div>

			<!--头部以下第三块-->
			<div class="there">
				<table class="thereimg" cellspacing="0" cellpadding="0">
					<!--手机会场-->
					<tr id="shoujihuichang">
						<td>
							<a href="#">
								<img src="img1/T1tGYvBTEj1RCvBVdK(1).jpg" />
							</a>
						</td>
					</tr>

					<!--产品介绍-->
					<tr>
						<td>
							<img src="img1/T11PYvBgZj1RCvBVdK.jpg" />
						</td>
					</tr>

					<!--售后服务说明-->
					<tr>
						<td>
							<img src="img1/T13G_vBjbT1RCvBVdK.jpg" />
						</td>
					</tr>

					<!--美在智慧-->
					<tr>
						<td>
							<img src="img1/T1UIbvByVT1RCvBVdK.jpg" />
						</td>
					</tr>

					<tr>
						<td>
							<img src="img1/T1PPKvBX__1RCvBVdK.jpg" />
						</td>
					</tr>

					<tr>
						<td>
							<img src="img1/T1mGZvBCbb1RCvBVdK.jpg" />
						</td>
					</tr>

					<!--已玻璃凝成-->
					<tr>
						<td>
							<img src="img1/T1kPKvB4C_1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1xvKvBsKv1RCvBVdK.jpg" />
						</td>
					</tr>

					<!--双面全玻璃-->
					<tr>
						<td>
							<img src="img1/T1JGdvBsKQ1RCvBVdK.jpg" />
						</td>
					</tr>
					<!--防水防尘-->
					<tr>
						<td>
							<img src="img1/T1sPYvBbdg1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1eP_vB_CT1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1QIdvBKxQ1RCvBVdK.jpg" />
						</td>
					</tr>

					<!--两种尺寸-->
					<tr>
						<td>
							<img src="img1/T1PvZvB5Db1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1OI_vBQZT1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1zvdvBjZQ1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T17vYvB5dj1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1vPKvBvVv1RCvBVdK(1).jpg" />
						</td>
					</tr>


					<!--原彩显示技术-->
					<tr>
						<td>
							<img src="img1/T1DIKvBvV_1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1UICvBgLg1RCvBVdK.jpg" />
						</td>
					</tr>

					<!--绚丽鲜明的-->
					<tr>
						<td>
							<img src="img1/T13GdvBvWQ1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1JPDvB5xQ1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1rvCvBXAj1RCvBVdK.jpg" />
						</td>
					</tr>

					<!--备受喜爱的相机倍加出色-->
					<tr>
						<td>
							<img src="img1/T17GYvB_dg1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1eIZvBXdb1RCvBVdK.jpg" />
						</td>
					</tr>

					<!--人像模式 -->
					<tr>
						<td>
							<img src="img1/T1iIYvBbCg1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1HGYvBgEj1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1fPbvByxT1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T11I_vBjDT1RCvBVdK.jpg" />
						</td>
					</tr>

					<!--光学变焦-->
					<tr>
						<td>
							<img src="img1/T14GKvB_Ev1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T15GZvBCdb1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1qvKvByY_1RCvBVdK.jpg" />
						</td>
					</tr>

					<!--更快的中央处理器-->
					<tr>
						<td>
							<img src="img1/T1LIKvBXW_1RCvBVdK(2).jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1IvdvBjWQ1RCvBVdK.jpg" />
						</td>
					</tr>

					<!--app设计的图形处理器-->
					<tr>
						<td>
							<img src="img1/T1lG_vB_xT1RCvBVdK.jpg" />
						</td>
					</tr>
					<!--增强现实-->
					<tr>
						<td>
							<img src="img1/T1yv_vBmCT1RCvBVdK.jpg" />
						</td>
					</tr>
					<!--无线充电-->
					<tr>
						<td>
							<img src="img1/T1aIdvBs_Q1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1CvYvB7Aj1RCvBVdK.jpg" />
						</td>
					</tr>
					<!--拥抱无线世界-->
					<tr>
						<td>
							<img src="img1/T17GdvB_JQ1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1_PYvB5Kj1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1YIdvBbCQ1RCvBVdK.jpg" />
						</td>
					</tr>
					<!--iOS-->
					<tr>
						<td>
							<img src="img1/T1KvDvB__j1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T1IvDvBC_Q1RCvBVdK.jpg" />
						</td>
					</tr>
					<!--iOS11新功能-->
					<tr>
						<td>
							<img src="img1/T1.I_vBmxv1RCvBVdK.jpg" />
						</td>
					</tr>
					<!--增强现实-->
					<tr>
						<td>
							<img src="img1/T1DPKvBvV_1RCvBVdK.jpg" />
						</td>
					</tr>
					<!--机型比较-->
					<tr>
						<td>
							<img src="img1/T1VvCvBsb_1RCvBVdK.jpg" />
						</td>
					</tr>
					<tr>
						<td>
							<img src="img1/T13vdvBjxQ1RCvBVdK.jpg" />
						</td>
					</tr>
				</table>

			</div>
			
				<!--售后-->
<div class="sever" style="margin-top: 100px;">
    <div class="sever-top">
        <span>售后保障</span>
    </div>
    <div class="sever-bottom">
        <div class="sever-bottom-main">
            <div class="sever-bottom-main-top">
                <span>售后内容</span>
            </div>
            <div class="describe">

                <i></i>
                <p>
                    本产品全国联保，享受三包服务，质保期为：一年质保如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！售后服务电话：400-666-8800品牌官方网站：<br>http://www.apple.com.cn/
                </p>
            </div>

            <div class="sever-bottom-main-top">
                <span>售后承诺</span>
            </div>
            <div class="describes">
                <li>
                    <i></i>
                    <h5>正品行货</h5>
                    <p>国美向您保证所售商品均为正品行货；国美自营商品开具普通发票或电子发票（详情请见发票制度） 。</p>
                </li>

                <li>
                    <i></i>
                    <h5>全国联保</h5>
                    <p>凭质保证书及国美发票，可享受全国联保服务，与您亲临商场选购的商品享受相同的质量保证。国美还为您提供具有竞争力的商品价格 运费政策，请您放心购买</p>
                    <span>温馨提示：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若国美没有及时更新，请大家谅解！</span>
                </li>
                <li>
                    <i></i>
                    <h5>无忧退换货</h5>
                    <p>用户购买国美自营商品，在保证商品完好的前提下，7日内可无理由退货(含7日，自您收到商品次日0点起计算)，15日内可换货。(部分商品除外，详情请见 <a href="#">退换货政策-自营</a>）</p>
                </li>
            </div>
			
			<!--最后的售后-->
            <div class="sever-bottom-main-top">
                <span>售后服务</span>
            </div>
			<div class="describes1">
	                <ul id="describes1-body">
	                	<li>
	                		<span>家安保 (延长保修 碎屏保修 意外保修)</span>
	                	</li>
	                	<li>
	                		<span></span>专业维修</span>
	                	</li>
	                	<li>
	                		<span></span>家电回收</span>
	                	</li>
	                	<li>
	                		<span>家电清洗</span>
	                	</li>
	                	<li>
	                		<span></span>上门安装</span>
	                	</li>
	                	<li class="pdt1-s"></li>
	                </ul>
			</div>

        </div>
    </div>


</div>	
				
		
	<!--热门链接-->
	<div class="remenlianjie">
		<div class="remen">热门链接：</div>
		<div class="huaweicangxiang">
			<a href="#">华为畅享7plus</a>
			<a href="#">华为nova2手机</a>
			<a href="#">华为nova2Plus</a>
			<a href="#">华为P10</a>
			<a href="#">华为P10 Plus</a>
			<a href="#">三星Galaxy S8</a>
			<a href="#">三星Galaxy S8 Plus</a>
			<a href="#">OppO R9s</a>
			<a href="#">OppO手机R9s Plus</a>
		</div>	
	</div>
	
		<!--商品评价部分-->
	<div class="shangpingpingjia">
		<ul class="ds-hd">
			<li class="cur2">
				<a href="#">商品评价</a>
			</li>
		</ul>
		<div class="ds-hd-active">
			<div class="sorceOut">
				<div class="sor">
					<div class="sper">
						<span>99</span>
						<b>%</b>
						<em>好评度</em>
					</div>
					<div class="gmb">
						<p>
							好评
							<span>(99%)</span>
							<em>
								<b style="width: 100%;"></b>
							</em>
						</p>
						<p>
							中评
							<span>(1%)</span>
							<em>
								<b style="width: 1%;"></b>
							</em>
						</p>
						<p>
							差评
							<span>(0%)</span>
							<em>
								<b style="width: 0%;"></b>
							</em>
						</p>
					</div>
				</div>
				<div class="spot">
					<p>买家印象</p>
				</div>
				<div class="comt">
					您可对已购买的商品进行评价
					<a href="#" class="fabiaopinglun">发表评价拿美豆</a>
					<span style="display: block">
						100美元=1元
					<a href="#">评论规则</a>
					</span>
				</div>	
				</div>
				
				<!--全部评论-->
				<div class="quanbupinglun">
					<label>
						<span style="color: #e3101e;">全部评论(127)</span>
					</label>
					<label>
						<span>晒图(43)</span>
					</label>
					<label>
						<span>好评论(126)</span>
					</label>
					<label>
						<span>中评(1)</span>
					</label>
					<label>
						<span>差评(0)</span>
					</label>
					<label id="zhikandangqian">
						<span>只看当前商品评论</span>
					</label>
				</div>
				<!--买家评论-->
				<div class="maijiapinglun">
					<ul class="display" style="display: block;">
						<li class="oh">
							<div class="display-left">
								<span class="yipaixingxing">
									<b class="xingxing" style="width: 100%"></b>
								</span>
								<p>收货后1天评论</p>
								<p>
									<a href="#">2017-10-03 10:28</a>
								</p>
								<p>
									<span>金色 全网通 64GB</span>
								</p>
							</div>
							<div class="display-center">
								<div class="shiiyongxinde">
									<em>使用心得：</em>
									货真价实，摸得到，看得到的商品放心购！
								</div>
							</div>
							<div class="display-right">
								<div class="display-right-photo">
									<img src="img1/T1hPVTBmdT1RCvBVdK.jpg"/>
									<span class="chusan">初三</span>
								</div>
								<p class="huiyuanshux">
									<span class="huiyuan">G4会员</span>
									<span class="beijing">北京</span>
								</p>
								<p>来自美国wap客户端</p>
							</div>
						</li>
						
						<li class="oh">
							<div class="display-left">
								<span class="yipaixingxing">
									<b class="xingxing" style="width: 100%"></b>
								</span>
								<p>收货后1天评论</p>
								<p>
									<a href="#">2017-10-03 19:28</a>
								</p>
								<p>
									<span>深空灰 全网通 64GB</span>
								</p>
							</div>
							<div class="display-center">
								<div class="shiiyongxinde">
									<em>使用心得：</em>
									物美价廉。。。。
								</div>
							</div>
							<div class="display-right">
								<div class="display-right-photo">
									<img src="img1/T1YvKTBsDv1RCvBVdK.png"/>
									<span class="chusan">gm_139^_..</span>
								</div>
								<p class="huiyuanshux">
									<span class="huiyuan">G2会员</span>
									<span class="beijing">上海市</span>
								</p>
								<p>来自美国wap客户端</p>
							</div>
						</li>
						
						<li class="oh">
							<div class="display-left">
								<span class="yipaixingxing">
									<b class="xingxing" style="width: 100%"></b>
								</span>
								<p>收货后1天评论</p>
								<p>
									<a href="#">2017-10-02 19:04</a>
								</p>
								<p>
									<span>金色 全网通 64GB</span>
								</p>
							</div>
							<div class="display-center">
								<div class="shiiyongxinde">
									<em>使用心得：</em>
									物美价廉，官方正品
								</div>
							</div>
							<div class="display-right">
								<div class="display-right-photo">
									<img src="img1/T1.vDTBQdv1RCvBVdK.jpg"/>
									<span class="chusan">燕春店通讯..</span>
								</div>
								<p class="huiyuanshux">
									<span class="huiyuan">G5会员</span>
									<span class="beijing">石家庄市</span>
								</p>
								<p>来自美国wap客户端</p>
							</div>
						</li>
						
						<li class="oh">
							<div class="display-left">
								<span class="yipaixingxing">
									<b class="xingxing" style="width: 100%"></b>
								</span>
								<p>收货后1天评论</p>
								<p>
									<a href="#">2017-09-29 11:17</a>
								</p>
								<p>
									<span>金色 全网通 64GB</span>
								</p>
							</div>
							<div class="display-center">
								<div class="shiiyongxinde">
									<em>使用心得：</em>
									好
								</div>
							</div>
							<div class="display-right">
								<div class="display-right-photo">
									<img src="img1/T1YvKTBsDv1RCvBVdK.png"/>
									<span class="chusan">gm_137^_..</span>
								</div>
								<p class="huiyuanshux">
									<span class="huiyuan">G2会员</span>
									<span class="beijing">西安市</span>
								</p>
								<p>来自美国wap客户端</p>
							</div>
						</li>
						
						<li class="oh">
							<div class="display-left">
								<span class="yipaixingxing">
									<b class="xingxing" style="width: 100%"></b>
								</span>
								<p>收货后1天评论</p>
								<p>
									<a href="#">2017-09-29 09:58</a>
								</p>
								<p>
									<span>深空灰 全网通 64GB</span>
								</p>
							</div>
							<div class="display-center">
								<div class="shiiyongxinde">
									<em>使用心得：</em>
									很好
								</div>
							</div>
							<div class="display-right">
								<div class="display-right-photo">
									<img src="img1/T1YvKTBsDv1RCvBVdK.png"/>
									<span class="chusan">gm_130^_..</span>
								</div>
								<p class="huiyuanshux">
									<span class="huiyuan">G1会员</span>
									<span class="beijing">深圳市</span>
								</p>
								<p>来自美国wap客户端</p>
							</div>
						</li>
						
						<li class="oh">
							<div class="display-left">
								<span class="yipaixingxing">
									<b class="xingxing" style="width: 100%"></b>
								</span>
								<p>收货后1天评论</p>
								<p>
									<a href="#">2017-09-29 19:28</a>
								</p>
								<p>
									<span>深空灰 全网通 256GB</span>
								</p>
							</div>
							<div class="display-center">
								<div class="shiiyongxinde">
									<em>使用心得：</em>
									东西是正品 就是苹果ios11系统发卡 优化不好
								</div>
							</div>
							<div class="display-right">
								<div class="display-right-photo">
									<img src="img1/T1YvKTBsDv1RCvBVdK.png"/>
									<span class="chusan">心随风去 19..</span>
								</div>
								<p class="huiyuanshux">
									<span class="huiyuan">G2会员</span>
									<span class="beijing">上海市</span>
								</p>
								<p>来自美国wap客户端</p>
							</div>
						</li>
						
						<li class="oh">
							<div class="display-left">
								<span class="yipaixingxing">
									<b class="xingxing" style="width: 100%"></b>
								</span>
								<p>收货后1天评论</p>
								<p>
									<a href="#">2017-09-28 12:44</a>
								</p>
								<p>
									<span>深空灰 全网通 256GB</span>
								</p>
							</div>
							<div class="display-center">
								<div class="shiiyongxinde">
									<em>使用心得：</em>
									挺好的挺好的挺好的挺好的
								</div>
							</div>
							<div class="display-right">
								<div class="display-right-photo">
									<img src="img1/T1YvKTBsDv1RCvBVdK.png"/>
									<span class="chusan">iPhone62207</span>
								</div>
								<p class="huiyuanshux">
									<span class="huiyuan">G5会员</span>
									<span class="beijing">北京市</span>
								</p>
								<p>来自美国wap客户端</p>
							</div>
						</li>
						
						<li class="oh">
							<div class="display-left">
								<span class="yipaixingxing">
									<b class="xingxing" style="width: 100%"></b>
								</span>
								<p>收货后1天评论</p>
								<p>
									<a href="#">2017-09-28 12:44</a>
								</p>
								<p>
									<span>深空灰 全网通 256GB</span>
								</p>
							</div>
							<div class="display-center">
								<div class="shiiyongxinde">
									<em>使用心得：</em>
									挺好的挺好的挺好的挺好的
								</div>
							</div>
							<div class="display-right">
								<div class="display-right-photo">
									<img src="img1/T1YvKTBsDv1RCvBVdK.png"/>
									<span class="chusan">iPhone62207</span>
								</div>
								<p class="huiyuanshux">
									<span class="huiyuan">G5会员</span>
									<span class="beijing">北京市</span>
								</p>
								<p>来自美国wap客户端</p>
							</div>
						</li>
						
						<li class="oh">
							<div class="display-left">
								<span class="yipaixingxing">
									<b class="xingxing" style="width: 100%"></b>
								</span>
								<p>收货后1天评论</p>
								<p>
									<a href="#">2017-09-28 12:44</a>
								</p>
								<p>
									<span>深空灰 全网通 256GB</span>
								</p>
							</div>
							<div class="display-center">
								<div class="shiiyongxinde">
									<em>使用心得：</em>
									挺好的挺好的挺好的挺好的
								</div>
							</div>
							<div class="display-right">
								<div class="display-right-photo">
									<img src="img1/T1YvKTBsDv1RCvBVdK.png"/>
									<span class="chusan">iPhone62207</span>
								</div>
								<p class="huiyuanshux">
									<span class="huiyuan">G5会员</span>
									<span class="beijing">北京市</span>
								</p>
								<p>来自美国wap客户端</p>
							</div>
						</li>
						
						<li class="oh">
							<div class="display-left">
								<span class="yipaixingxing">
									<b class="xingxing" style="width: 100%"></b>
								</span>
								<p>收货后1天评论</p>
								<p>
									<a href="#">2017-09-28 07:23</a>
								</p>
								<p>
									<span>金色 全网通 64GB</span>
								</p>
							</div>
							<div class="display-center">
								<div class="shiiyongxinde">
									<em>使用心得：</em>
									很好，很喜欢
								</div>
							</div>
							<div class="display-right">
								<div class="display-right-photo">
									<img src="img1/T1YvKTBsDv1RCvBVdK.png"/>
									<span class="chusan">一诺她爸</span>
								</div>
								<p class="huiyuanshux">
									<span class="huiyuan">G5会员</span>
									<span class="beijing">屯昌县</span>
								</p>
								<p>来自美国Iphone客户端</p>
							</div>
						</li>
					</ul>
				</div>
				
				<!--购买咨询-->
				<div class="goumaizixun">
					<ul class="gouumaizixun-top">
						<li>
							<a href="#">购买咨询</a>
						</li>
					</ul>
					<div class="goumaizixun-body">
						<div class="goumaizixun-body1">
							<div class="goumaizixun-body1-left">
								<div class="sousuoxiangguanzixun">
									<p class="tit">搜索相关咨询</p>
									<div class="sousuoshurukuang">
										<label style="line-height: 24px;">请输入咨询关键词</label>
										<input id="tet" type="text"/>
										<input id="btn1" type="button" value="搜索"/>
									</div>
								</div>
								<div class="goumaizixun-body1-left2">
								<dt>常见问题</dt>
								<dd>
									.
									<a href="#">忘记密码如何操作？</a>
								</dd>
								<dd>
									.
									<a href="#">如何增强账户安全系数？</a>
								</dd>
								<dd>
									.
									<a href="#">怎么操作商品签收？</a>
								</dd>
								<dd>
									.
									<a href="#">如何电话订购？</a>
								</dd>
								<dd>
									.
									<a href="#">如何查询商品参数及包装清单？</a>
								</dd>
								<dd>
									.
									<a href="#">商品无货怎么办？</a>
								</dd>
							</div>
							</div>
							<!--购买咨询右边-->
							<div class="goumaizixun-right">
								<table>
									<caption>我要发表咨询</caption>
									<tbody>
										<tr>
											<th style="width: 76px;">咨询类型：</th>
											<td style="align-self: 410px;">
												<label class="cst-type">
													<input id="1" value="1" name="zixubgoumai" checked="checked" type="radio" />
													购买咨询
												</label>
												<label class="cst-type">
													<input id="1" value="1" name="zixubgoumai"  type="radio" />
													促销优惠
												</label>
												<label class="cst-type">
													<input id="1" value="1" name="zixubgoumai"  type="radio" />
													支付问题
												</label>
												<label class="cst-type">
													<input id="1" value="1" name="zixubgoumai"  type="radio" />
													售后问题
												</label>
											</td>
										</tr>
										<tr>
											<th style="width: 76px;">回复方式：</th>
											<td style="align-self: 410px;">
												<label class="cst-type">
													<input id="1" value="1" name="huifufangshi" checked="checked" type="radio" />
													网站
												</label>
												<label class="cst-type">
													<input id="1" value="1" name="huifufangshi"  type="radio" />
													邮箱
												</label>
												<label class="cst-type">
													<input id="1" value="1" name="huifufangshi"  type="radio" />
													微信
												</label>
											</td>
										</tr>
										<tr>
											<th id="zixun" style="width: 76px;">咨询内容：</th>
											<td style="align-self: 420px;">
												<div class="neirong">
													<textarea class="tte"></textarea>
														<p id="how">
															如何尽快找到咨询答案<br>
															1、使用本页面左侧的搜索功能<br>
															2、仔细查看相关信息和帮助文档
														</p>
												</div>
											</td>
										</tr>
										<tr id="gm-submit">
											<th></th>
											<td>
												<a href="#">提交</a>
												<span class="tips">0/200</span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<!--全部咨询-->
							<div class="consult-types">
								<label class="cst-type" id="cst-type1">
									<input class="qunbuzi" value="2" name="quanbu" checked="checked" type="radio" style="margin-left: 10px;color: red;"/>
									全部咨询
								</label>
								<label class="cst-type"id="cst-type2">
									<input id="1" value="1" name="quanbu"  type="radio" />
									购买咨询
								</label>
								<label class="cst-type"id="cst-type2">
									<input id="1" value="1" name="quanbu"  type="radio" />
									促销优惠
								</label>
								<label class="cst-type"id="cst-type2">
									<input id="1" value="1" name="quanbu"  type="radio" />
									支付问题
								</label>
								<label class="cst-type"id="cst-type2">
									<input id="1" value="1" name="quanbu"  type="radio" />
									售后咨询
								</label>
							</div>
							<div class="zixun-body">
								<ul >
									<li>
										<dl>
											<dt>咨询内容：</dt>
											<dd>
											<span class="time">2017-09-23  21:31:06</span>
											<span class="name">gm_***031...</span>
											<span class="con">
												<a href="#">怎么分期</a>
											</span>
										</dd>
										</dl>
										<dl class="ques">
											<dt>国美回复:</dt>
											<dd>
												<span class="time">2017-09-28  21:45:30</span>
												<span class="con"> 亲爱的~订单结算时可选择信用卡分期付款，具体可参考
													http://help.gome.com.cn/article/234-0-0.html?intcmp=item-1000043266-2，
													感谢您对国美互联网的支持\(^o^)/~</span>
											</dd>
										</dl>
										
									</li>
									
									<li>
										<dl>
											<dt>咨询内容：</dt>
											<dd>
											<span class="time">2017-09-23  12:59:03</span>
											<span class="name">gm_***910...</span>
											<span class="con">
												<a href="#">西安有货没 </a>
											</span>
										</dd>
										</dl>
										<dl class="ques">
											<dt>国美回复:</dt>
											<dd>
												<span class="time">2017-09-23  13:31:04</span>
												<span class="con">亲，有货，天高任鸟飞，国美永相随。</span>
											</dd>
										</dl>
										
									</li>
									
									<li>
										<dl>
											<dt>咨询内容：</dt>
											<dd>
											<span class="time">2017-09-24  08:21:34</span>
											<span class="name">gm_***104...</span>
											<span class="con">
												<a href="#">分期是怎么分期法 </a>
											</span>
										</dd>
										</dl>
										<dl class="ques">
											<dt>国美回复:</dt>
											<dd>
												<span class="time">2017-09-24  09:03:35</span>
												<span class="con">亲亲，只支持信用卡分期，分期详情您可登陆
													http://help.gome.com.cn/article/234-0-0.html查看，
													已选择分期付款提交订单后，分期付款页面会显示具体还款金额及利息，
													具体分期利息建议您咨询发卡行人工客服哦，感谢您对国美在线的支持，
													祝您购物愉快！</span>
											</dd>
										</dl>
										
									</li>
									
									<li>
										<dl>
											<dt>咨询内容：</dt>
											<dd>
											<span class="time">2017-09-24  10:20:43</span>
											<span class="name">gm_***1...</span>
											<span class="con">
												<a href="#">可以分期付款？苹果8plus128个G有？ </a>
											</span>
										</dd>
										</dl>
										<dl class="ques">
											<dt>国美回复:</dt>
											<dd>
												<span class="time">2017-09-24  10:23:09</span>
												<span class="con">亲，苹果8plus暂无128G，分期付款详情请您参考：
													http://help.gome.com.cn/article/234-0-0.html?intcmp=item-
													1000043266-2，天气变化很快，寒风悄悄袭来。
												</span>
											</dd>
										</dl>
										
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
			
		</div>
	

	</div>
	
	<!--垫盒子-->
<div style="height: 18900px;width: 100%;float: left;"></div>
	
<!--根据浏览猜你喜欢-->
<div class="like" >
    <main>
        <div class="like-main">
            <div class="look-main-top">
                <span style="display: inline-block;width: 10px;"></span> 根据浏览猜你喜欢
                <span class="change">
<p>换一组</p> <i></i>
        </span>
                <div></div>
            </div>
            <div class="like-main-bottom">

                <li>
                    <div class="like-li-img">
                        <a href="#"><img src="./img1/000_130.jpg" alt=""></a>
                    </div>
                    <p>【国美自营】尼康数码相机S7000粉</p>
                    <p>¥1165.00</p>
                </li>
                <li>
                    <div class="like-li-img">
                        <a href="#"><img src="./img1/111_130.jpg" alt=""></a>
                    </div>
                    <p>手机节 apple/苹果6sP iPhone6s plus全网通移动联通电信</p>
                    <p>¥3476.00</p>
                </li>
                <li>
                    <div class="like-li-img">
                        <a href="#"><img src="./img1/222_130.jpg" alt=""></a>
                    </div>
                    <p>华为 HUAWEI Mate 9 4GB+ 64GB 全网通版 黑色</p>
                    <p>¥3599.00</p>
                </li>
                <li>
                    <div class="like-li-img">
                        <a href="#"><img src="./img1/3333_130.jpg" alt=""></a>
                    </div>
                    <p>Apple iPhone 6 32G 金色 移动联通电信4G手机</p>
                    <p>¥2399.00</p>
                </li>
                <li>
                    <div class="like-li-img">
                        <a href="#"><img src="./img1/444_130.jpg" alt=""></a>
                    </div>
                    <p>苹果 iPhone7/iPhone7 Plus 32GB/128GB/256GB 32G/1</p>
                    <p>¥7278.00</p>
                </li>
                <li>
                    <div class="like-li-img">
                        <a href="#"><img src="./img1/555_130.jpg" alt=""></a>
                    </div>
                    <p>手机节 Apple/苹果 iPhone 7/iphone 7 PLUS 国行全网通4</p>
                    <p>¥6249.00</p>
                </li>
            </div>
        </div>
    </main>
</div>
<!--最近浏览-->
<div class="recent-look">
    <main>
        <div class="recent-look-main">
            <div class="look-main-top">
                <span style="display: inline-block;width: 10px;"></span>最近浏览
            </div>
            <div class="look-main-bottom">
                <li>
                    <div class="li-img">
                        <a href="#"><img src="./img1/01_100.jpg" alt=""></a>
                    </div>
                    <p><a href="#"> Apple iPhone 8 64 G 金色 移动联通电</a></p>
                    <p class="money">¥5888.00</p>
                </li>
                <li>
                    <div class="li-img">
                        <a href="#"><img src="./img1/02_100.jpg" alt=""></a>
                    </div>
                    <p><a href="#"> OPPO R9s Plus 6GB+64GB 全网通 </a></p>
                    <p class="money">¥3199.00</p>
                </li>
                <li>
                    <div class="li-img">
                        <a href="#"><img src="./img1/03_100.jpg" alt=""></a>
                    </div>
                    <p><a href="#"> 手机节 Apple iPhone 7 苹果7 移动</a></p>
                    <p class="money">¥5798.00</p>
                </li>
                <li>
                    <div class="li-img">
                        <a href="#"><img src="./img1/04_100.jpg" alt=""></a>
                    </div>
                    <p><a href="#"> 荣耀（honor）V9 标配版 4GB+64G</a></p>
                    <p class="money">¥2599.00</p>
                </li>
                <li>
                    <div class="li-img">
                        <a href="#"><img src="./img1/05_100.jpg" alt=""></a>
                    </div>
                    <p><a href="#"> 【分期付款】手机节 apple/苹果6 i</a></p>
                    <p class="money">¥2499.00</p>
                </li>
                <li>
                    <div class="li-img">
                        <a href="#"><img src="./img1/05_100.jpg" alt=""></a>
                    </div>
                    <p><a href="#"> 华为（HUAWEI）Mate9 </a></p>
                    <p class="money">¥2898.00</p>
                </li>
                <li>
                    <div class="li-img">
                        <a href="#"><img src="./img1/T1KIETByL_1RCvBVdK_100.jpg" alt=""></a>
                    </div>
                    <p><a href="#"> 荣耀（honor）V9 标配版 4GB+64G</a></p>
                    <p class="money">¥2599.00</p>
                </li>
                <li>
                    <div class="li-img">
                        <a href="#"><img src="./img1/T1XoZvBQWT1RCvBVdK_100.jpg" alt=""></a>
                    </div>
                    <p><a href="#"> Apple iPhone 6 32G 金色 移动联通电</a></p>
                    <p class="money">¥2398.00</p>
                </li>
                
            </div>
        </div>
    </main>
</div>

<!--help-->
<div class="help">
    <main>

        <div class="help-top">
            <li><i></i><a href="#" style="font-weight: 600;color: #404040;font-size: 18px;margin-left: 5px;">品质</a><span
                    style="color: #cfcece;">·</span><a href="#" style="color: #404040;font-size: 16px;">正品行货 购物无忧</a>
            </li>
            <li><i></i><a href="#" style="font-weight: 600;color: #404040;font-size: 18px;margin-left: 5px;">低价</a><span
                    style="color: #cfcece;">·</span><a href="#" style="color: #404040;font-size: 16px;">普惠实价 帮你省钱</a>
            </li>

            <li><i></i><a href="#" style="font-weight: 600;color: #404040;font-size: 18px;margin-left: 5px;">速达</a><span
                    style="color: #cfcece;">·</span><a href="#" style="color: #404040;font-size: 16px;">专业配送 按时按需</a>
            </li>

        </div>
        <div class="help-bottom">
            <dl>
                <dt>物流配送</dt>
                <dd>配送查询</dd>
                <dd>配送服务</dd>
                <dd>配送费用</dd>
                <dd>配送失效</dd>
                <dd>签收与验货</dd>
            </dl>
            <dl>
                <dt>支付与账户</dt>
                <dd>货到付款</dd>
                <dd>在线支付</dd>
                <dd>分期付款</dd>
                <dd>门店支付</dd>
                <dd>财户安全</dd>
            </dl>
            <dl>
                <dt>售后与服务</dt>
                <dd>退换货服务</dd>
                <dd>退款说明</dd>
                <dd>专业维修</dd>
                <dd>延保服务</dd>
                <dd>家电回收</dd>
            </dl>
            <dl>
                <dt>会员专区</dt>
                <dd>会员介绍</dd>
                <dd>优惠券说明</dd>
                <dd>美豆说明</dd>
                <dd>商品评价</dd>
            </dl>
            <dl>
                <dt>购物帮助</dt>
                <dd>购物保障</dd>
                <dd>购物流程</dd>
                <dd>促销优惠</dd>
                <dd>焦点问题</dd>
                <dd>联系我们</dd>
            </dl>
        </div>

    </main>

</div>

<!--footer-->
<footer>
    <div class="footer-main">

        <i></i><!--存放图片-->
        <span class="span">
                <strong>门店服务</strong>
                <a href="#">国美门店全国共计2000余家</a>
        </span>
        <i></i>
        <span class="span">
                <strong>用户体验</strong>
                <a href="#">参与用户体验改进计划 用户反馈</a>
        </span>

        <div class="qrcode-section">

            <span class="code-sm wx"><i></i><p>公众号</p>
            	<div id="weixintu" style="display: none;">
					<img src="img1/1.jpg"">
					<i class="icon-triangle"></i>
				</div>
            </span>
            <span class="code-sm wap"><i></i><p>手机站点</p>
            	<div style="display: none;">
					<img src="img1/2.jpg">
					<i class="icon-triangle"></i>
				</div>
            </span>
            <span><i></i><p> &nbsp;扫描下载客户端</p></span>
        </div>
        <div class="ul">
            <ul>
                <li><a href="#">国美集团</a></li>
                <li><a href="#">国美管家</a></li>
                <li><a href="#">关于国美</a></li>
                <li><a href="#">加入我们</a></li>
                <li> |</li>
                <li><a href="#">商品专题</a></li>
                <li><a href="#">批发大全</a></li>
                <li><a href="#">热词搜索</a></li>
                <li><a href="#">友情链接</a></li>
                <li><a href="#">风险监测</a></li>
                <li> |</li>
                <li><a href="#">销售联盟</a></li>
                <li><a href="#">商家入驻</a></li>

            </ul>
        </div>
        <p>本公司游戏产品适合18岁以上成年人使用 违法和不良信息举报电话：021-60766055 <a href="#"> 互联网药品信息服务资格证编号（京）-经营性-2013-0011</a></p>
        <p>国美在线电子商务有限公司 办公地址:上海市嘉定区沪宜公路3163-3199号一楼A区 客服电话:4008708708</p>
        <p>&copy;2000-2017 国美在线电子商务有限公司版权所有 京公安网备11010502027062 沪ICP备11009419号 沪B2-20120004号</p>
        <hr>
        <ul class="footer-ul">
            <li><a href=""><i></i><b>经营性网站<br>备案信息</b></a></li>
            <li><a href=""><i></i><b>可信网站<br/>信用评价</b></a></li>
            <li><a href=""><i></i><b style="line-height: 30px">诚信网站 </b></a></li>
            <li><a href=""><i></i><b>朝阳网络<br/>警察</b></a></li>
            <li><a href=""><i></i><b style="line-height: 30px">网购大家评 </b></a></li>
            <li><a href=""><i></i><b>上海市互联网违法和<br/>不良信息举报中心</b></a></li>
        </ul>
    </div>
</footer>
	
	
	<!-- 最后面竖条 -->
		<div id="w5">
			<div class="w5-aside">
				<ul>
					<li class="w5-aside1"><b></b><a><i></i></a></li>
					<li class="w5-aside2"><b></b><a><i></i></a></li>
					<li class="w5-aside3"><b></b><a><i></i></a></li>
					<li class="w5-aside4"><b></b><a><i></i></a></li>
				</ul>
			</div>
			<div class="gome-tab">
				<ul>
					<li class="gome-tab1"><b></b><i></i></li>
					<li class="gome-tab2"><img src="img1/5.png" /><a>购物车</a><i></i></li>
					<li class="gome-tab3"><img src="img1/6.png" /><i></i></li>
				</ul>
			</div>
		</div>
		<script type="text/javascript">
		
			function addToCar(){
				var shoppingCarSum = $("#shuzi").val();
				var pid = <%=product.getPid()%>;
				
				location.assign("ShoppingCartServlet?action=addToCart&pid="+pid+"&shoppingCarSum="+shoppingCarSum);
			};
		</script>
</body>

</html>
