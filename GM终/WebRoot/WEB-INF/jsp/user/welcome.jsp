<%@ page language="java" import="java.util.*,com.vo.*,com.service.inter.*,com.service.impl.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	 <base href="<%=basePath%>">
		<link rel="shortcut icon" type="image/x-icon" href="img/bit.ico" />
		<meta charset="utf-8" />
		<title>国美(GOME)-综合网购商城，正品低价、品质保证、快速送达、安心服务！</title>
		<link rel="stylesheet" href="css/index.css" />
		<link rel="stylesheet" href="css/index1.css" />
		<link rel="stylesheet" type="text/css" href="css/up.css"/>
		<script type="text/javascript" src="js/jquery-2.1.4.js" ></script>
		<script type="text/javascript" src="js/index.js" ></script>
		
	</head>
	<body>
		
		 <div width=0 height=0 src="/blog/SessionKeeper.asp"> 
</div> 
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
					</li>
					<li class="spacer"></li>
					<li class="fore2">
						<div class="dt">
							<a href="#">我的订单</a>
						</div>
					</li>
						
					<%
						}else{
					%>
						<a href="#">hey,<%=user.getUsername() %></a>
						<a href="UserServlet?action=logout">退出</a>
					
					</li>
					<li class="spacer"></li>
					<li class="fore2">
						<div class="dt">
							<a href="myOrderServlet?action=getAllMyOrderByPage&requestPage=1&userid=<%=user.getUserid() %>">我的订单</a>
						</div>
					</li>
					
					<%
						}
					 %>
					
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
				<a href="#">空调</a>&nbsp;&nbsp;
				<a href="#">电视</a>&nbsp;&nbsp;
				<a href="#">洗衣机</a>&nbsp;&nbsp;
				<a href="#">电脑</a>&nbsp;&nbsp;
			</div>
			<div id="gome-right">
				<span>
					<em class="i-cart"></em>
					<a href="#">购物车空了</a>
					<b></b>
				</span>
			</div>
		</div>
		<!-- 全部商品栏 -->
		<div id="shopping-top">
			<div id="shopping-top-left">
				<h2><a href="#">全部商品分类</a></h2>
				<div id="navbox">
					<ul id="lisnav" class="lisnav-ul">
						<li class="linav-li15"><h3><a href="#">手机</a><a href="#">充值</a><a href="#">相机</a><a href="#">智能数码</a></h3></li>
						<div id="p15" class="p1" style="display: none;">
							<b>潮3C ></b><b>手机 ></b><b>数码 ></b><b>以旧换新 ></b><b>手机充值 ></b><b>美通卡 ></b><b>延保服务 ></b><b>办公生活馆 ></b><b>智享生活 ></b>
							<%
								List<Category> list = (List<Category>)request.getAttribute("list");
								int i = 1;
								for(Category category:list){
							%>
								<i class="i<%=i%>"><%=category.getCname()%></i>
								<span class="span<%=i%>">
								<%
								Category2Service service = new Category2ServiceImpl();
								List<Category2> category2List = service.getAllCategory2ByCategory1(category.getCid());
								
								for(Category2 category2:category2List){
						
								 %>
								<a href="UserProductServlet?action=getProductListByCategory&requestPage=1&cid=<%=category2.getCid()%>"><%=category2.getCname()%></a>
								 <%
								 }
								  %>
								  </span>
							<% 	
								i++;
								}
							 %>
							
							
							<div class="p2">
								<div class="p3">
									<p><img src="img/p15/1.jpg" /><img src="img/p15/2.jpg" /></p>
									<p><img src="img/p15/3.jpg" /><img src="img/p15/4.jpg" /></p>
									<p><img src="img/p15/5.jpg" /><img src="img/p15/6.jpg" /></p>
									<p><img src="img/p15/7.jpg" /><img src="img/p15/8.jpg" /></p>
								</div>
								<div class="p4">
									<img src="img/p15/9.jpg" />
								</div>
							</div>
						</div>
						<li class="linav-li14"><h3><a href="#">电脑</a><a href="#">办公配件</a></h3></li>
						<div id="p14" class="p1" style="display: none;">
							<b>潮3C ></b><b>电脑办公 ></b><b>精品配件 ></b><b>以旧换新 ></b><b>美通卡 ></b><b>延保服务 ></b><b>办公生活馆 ></b>
							<i class="i1">电脑整机</i><span class="span1"><a>笔记本</a><a>游戏本</a><a>平板电脑</a><a>台式电脑</a><a>一体机</a><a>笔记本配件</a><a>服务器</a></span>
							<i class="i2">外设产品</i><span class="span2"><a>移动硬盘</a><a>鼠标</a><a>鼠标垫</a><a>U盘</a><a>电脑音响</a><a>键盘</a><a>散热垫</a><a>电脑清洁</a><a>笔记本包</a><a>耳机</a><a>麦克风</a><a>摄像头/监控摄像</a></span>
							<i class="i3">网络设备</i><span class="span3"><a>路由器</a><a>网卡</a><a>交换机</a><a>3G/4G上网</a><a>网络电视盒/体感游戏</a></span>
							<i class="i4">办公打印</i><span class="span4"><a>打印机</a><a>一体机</a><a>投影机</a><a>投影配件</a><a>传真机</a><a>复印机</a><a>碎纸机</a><a>扫描仪</a><a>墨盒/墨粉</a><a>硒鼓</a><a>色带</a></span>
							<i class="i5">办公文仪</i><span class="span5"><a>办公文具</a><a>文件管理</a><a>保险箱</a><a>电视机</a><a>支付设备</a><a>点钞机</a><a>计算器</a><a>激光笔</a><a>白板/封装</a><a>考勤设备</a><a>纸类</a><a>笔类</a></span>
							<i class="i6">苹果配件</i><span class="span6"><a>ipad配件</a><a>移动电源</a><a>保护套</a><a>保护膜</a><a>背壳</a><a>连接线</a><a>底座/支架</a><a>车载设备</a><a>触控笔</a><a>容量扩充</a><a>耳机</a></span>
							<i class="i7">电脑配件</i><span class="span7"><a>CPU</a><a>主板</a><a>显卡</a><a>硬盘</a><a>内存</a><a>机箱</a><a>电源</a><a>显示器</a><a>光驱</a><a>DIY整机</a><a>装机散热片</a><a>声卡/拓展卡</a></span>
							<i class="i8">增值服务</i><span class="span8"><a>电脑远程服务</a></span>
							<div class="p2">
								<div class="p3">
									<p><img src="img/p14/3.jpeg" /><img src="img/p14/3.jpeg" /></p>
									<p><img src="img/p14/3.jpeg" /><img src="img/p14/3.jpeg" /></p>
									<p><img src="img/p14/3.jpeg" /><img src="img/p14/3.jpeg" /></p>
									<p><img src="img/p14/3.jpeg" /><img src="img/p14/3.jpeg" /></p>
								</div>
								<div class="p4">
									<img src="img/p14/9.jpg" />
								</div>
							</div>
						</div>
						<li class="linav-li13"><h3><a href="#">电视</a><a href="#">影音</a><a href="#">智能</a><a href="#">国美管家</a></h3></li>
						<div id="p13" class="p1" style="display: none;">
							<b>电视影音 ></b><b>美通卡 ></b><b>以旧换新 ></b><b>延保服务 ></b><b>办公生活馆 ></b><b>智享生活 ></b>
							<div class="p7-1 p7-p13">
								<i class="p13-i1">电视</i><span class="p13-s1"><a>全部电视</a><a>国产品牌</a><a>合资品牌</a><a>4K超高清</a><a>曲面电视</a><a>HDR电视</a><a>OLED电视</a><a>70英寸及以上</a><a>58-60英寸</a><a>55英寸</a><a>49-50英寸</a><a>42-43英寸</a><a>32英寸及以下</a></span>
								<i class="p13-i2">电视配件</i><span class="p13-s2"><a>3D电视配件</a><a>保养配件</a><a>插线板</a><a>智能电视盒</a><a>电视挂架</a></span>
								<i class="p13-i3">音响/DVD</i><span class="p13-s3"><a>影院</a><a>播放器</a><a>音响</a></span>
								<i class="p13-i4">影音配件</i><span class="p13-s4"><a>其他配件</a><a>影音线材</a><a>线材转换器</a></span>
								<i class="p13-i5">智能设备</i><span class="p13-s5"><a>智能手环</a><a>智能手表</a><a>智能眼镜</a><a>智能家居</a><a>航拍设备</a><a>智能配饰</a><a>智享生活</a></span>
							</div>
							<div class="p7-2 p7-p13">
								<i class="p13-i6">以旧换新</i><span class="p13-s6"><a>手机回收</a><a>家电回收</a><a>电脑回收</a></span>
								<i class="p13-i7">清洗保养</i><span class="p13-s7"><a>家电保养</a><a>家电清洗</a></span>
								<i class="p13-i8">延长保修</i><span class="p13-s8"><a>家电延长保修</a></span>
								<i class="p13-i9">安装调试</i><span class="p13-s9"><a>空调安装</a></span>
								<i class="p13-i10">家具保养</i><span class="p13-s10"><a>家居养护</a><a>地板打蜡</a><a>卫生间深度保洁</a><a>床品除螨</a></span>
								<i class="p13-i11">维修保养</i><span class="p13-s11"><a>上门维修</a><a>家电维修</a><a>手机维修换屏</a><a>苹果专修</a></span>
							</div>
							<div class="p2">
								<div class="p3">
									<p><img src="img/p13/1.jpeg" /><img src="img/p13/2.jpeg" /></p>
									<p><img src="img/p13/3.jpeg" /><img src="img/p13/4.jpg" /></p>
									<p><img src="img/p13/5.jpeg" /><img src="img/p13/6.jpeg" /></p>
									<p><img src="img/p13/7.jpg" /><img src="img/p13/1.jpeg" /></p>
								</div>
								<div class="p4">
									<img src="img/p13/9.jpg" />
								</div>
							</div>
						</div>
						<li class="linav-li12"><h3><a href="#">空调</a><a href="#">冰箱</a><a href="#">洗衣机</a></h3></li>
						<div id="p12" class="p1" style="display: none;">
							<b>空调 ></b><b>冰箱 ></b><b>洗衣机 ></b><b>大家电节能专区 ></b><b>美通卡 ></b><b>以旧换新 ></b><b>延保服务 ></b><b>家电清洗服务 ></b><b>办公生活馆 ></b>
							<i class="i1">空调/商用</i><span class="span1"><a>家用空调</a><a>商用空调</a><a>中央空调</a><a>壁柜式空调</a><a>柜式空调</a><a>移动空调</a><a>定频</a><a>变频</a><a>单冷空调</a><a>冷暖空调</a><a>冷暖店铺</a><a>小1匹</a><a>1匹</a><a>1.5匹</a><a>2匹</a><a>3匹</a><a>除甲醛</a><a>祛PM2.5</a><a>wifi操控</a><a>圆柱型柜机</a></span>
							<i class="i2 p12-1">冰箱/冰柜</i><span class="span2 span12-1"><a>冰箱</a><a>冰柜</a><a>酒柜</a><a>对开门</a><a>三门</a><a>双门</a><a>多门</a><a>单门</a><a>单门</a><a>迷你冰箱</a><a>电脑式</a><a>机械式</a><a>冰箱配件</a></span>
							<i class="i3 p12-2">洗衣机/干</i><span class="span3 span12-2"><a>滚筒式洗衣机</a><a>波轮洗衣机</a><a>洗烘一体机</a><a>双缸洗衣机</a><a>干衣机</a><a>洗衣机配件</a></span>
							<div class="p2">
								<div class="p3">
									<p><img src="img/p12/1.jpg" /><img src="img/p12/2.jpg" /></p>
									<p><img src="img/p12/3.jpg" /><img src="img/p12/4.jpg" /></p>
									<p><img src="img/p12/5.jpg" /><img src="img/p12/6.jpg" /></p>
									<p><img src="img/p12/7.jpg" /><img src="img/p12/8.jpg" /></p>
								</div>
								<div class="p4">
									<img src="img/p12/9.jpg" />
								</div>
							</div>
						</div>
						<li class="linav-li11"><h3><a href="#">厨房卫浴</a><a href="#">卫生电器</a><a href="#">净化器</a></h3></li>
						<div id="p11" class="p1" style="display: none;">
							<b>烟灶卫浴馆 ></b><b>厨卫新活馆 ></b><b>国美净化馆 ></b><b>小家电馆 ></b><b>国美净水馆 ></b><b>美通卡 ></b><b>延保服务 ></b><b>家电清洗馆 ></b>
							<i class="i1">厨卫大电</i><span class="span1 span1-1"><a>油烟机</a><a>燃气灶</a><a>消毒柜/商用大柜</a><a>燃气热水器</a><a>电热水器</a><a>即热热水器</a><a>浴霸/换气扇</a><a>洗碗机</a><a>嵌入式厨电</a><a>壁挂炉</a><a>太阳能热水器</a><a>烟灶套餐</a><a>厨卫配件</a></span>
							<i class="i2 i2-1">厨卫小电</i><span class="span2 span2-1"><a>微波炉</a><a>豆浆机</a><a>电饭煲</a><a>电磁炉/电陶炉</a><a>电压力锅</a><a>炊具</a><a>原汁机/榨汁机</a><a>料理机</a><a>电烤箱</a><a>面包机/多士炉</a><a>咖啡机</a><a>电火锅</a><a>电水壶</a><a>电饼铛/烤饼机</a><a>电蒸锅</a><a>酸奶机/冰淇淋机</a><a>煮蛋器</a><a>电炖器/炖蛊</a><a>多用途锅</a><a>养生壶</a></span>
							<i class="i3 p11-1">环境电器</i><span class="span3 span11-1"><a>电风扇</a><a>空调扇</a><a>空气净化器</a><a>除湿机</a><a>加湿器</a><a>净化器滤网</a><a>取暖器</a></span>
							<i class="i4 p11-2">个人护理</i><span class="span4 span11-2"><a>剃须刀</a><a>电吹风</a><a>理发器</a><a>剃/脱毛器</a><a>鼻毛修剪器</a><a>美发器</a><a>美容仪</a><a>电动牙刷</a><a>冲牙器</a></span>
							<i class="i5 p11-3">水家电</i><span class="span5 span11-3"><a>净水器/设备</a><a>饮水机</a><a>滤水壶</a><a>净水龙头</a><a>净水桶</a><a>滤料</a><a>净饮机/智饮机</a></span>
							<i class="i6 p11-4">家具电器</i><span class="span6 span11-4"><a>吸尘器</a><a>挂烫机</a><a>扫地机器人</a><a>干衣机/干鞋器</a><a>毛球修剪器</a><a>电熨斗</a><a>清洁机</a></span>
							<i class="i7 p11-5">健康电器</i><span class="span7 span11-5"><a>甩脂瘦身</a><a>足浴盘</a><a>其他按摩器</a><a>电子秤</a><a>按摩椅</a><a>眼部按摩机</a><a>足疗机</a><a>血压计</a><a>按摩椅垫</a><a>计步器</a><a>其它健康电器</a><a>家用制氧机</a></span>
							<div class="p2">
								<div class="p3">
									<p><img src="img/p11/1.jpg" /><img src="img/p11/2.jpg" /></p>
									<p><img src="img/p11/3.jpg" /><img src="img/p11/4.jpg" /></p>
									<p><img src="img/p11/5.jpg" /><img src="img/p11/6.jpeg" /></p>
									<p><img src="img/p11/7.jpg" /><img src="img/p11/8.jpg" /></p>
								</div>
								<div class="p4">
									<img src="img/p11/9.jpg" />
								</div>
							</div>
						</div>
						<li class="linav-li10"><h3><a href="#">住宅家具</a><a href="#">家装建材</a><a href="#">装修</a></h3></li>
						<div id="p10" class="p1 p1-10" style="display: none;">
							<b>住宅家具 ></b><b>家装建材 ></b><b>家装馆 ></b><b>精品家电 ></b><b>鉴藏红木家具 ></b><b>装修 ></b>
							<i class="i1">客厅家具</i><span class="span1"><a>沙发</a><a>实木沙发</a><a>皮艺沙发</a><a>茶几</a><a>布艺沙发</a><a>电视柜</a><a>鞋柜</a><a>衣帽架</a></span>
							<i class="i2">卧室家具</i><span class="span2"><a>实木床</a><a>皮艺床</a><a>布艺床</a><a>床头柜</a><a>床</a><a>床垫</a><a>梳妆台</a><a>衣柜</a><a>镜类</a></span>
							<i class="i3">餐厅家具</i><span class="span3"><a>餐桌</a><a>餐椅</a><a>餐桌椅套装</a><a>餐边柜</a></span>
							<i class="i4">儿童办公</i><span class="span4"><a>儿童桌椅</a><a>儿童床类</a><a>儿童衣柜</a><a>儿童套装</a><a>休闲躺椅</a><a>班台桌</a><a>办公椅</a><a>文件柜</a></span>
							<i class="i5">书房家具</i><span class="span5"><a>书桌/电脑桌</a><a>电脑椅</a><a>书柜</a></span>
							<i class="i6">储物户外</i><span class="span6"><a>置物架</a><a>层架</a><a>晾衣架</a><a>户外桌椅</a></span>
							<i class="i7">厨房卫浴</i><span class="span7"><a>马桶</a><a>智能盖板</a><a>淋浴花洒</a><a>浴室柜</a><a>水槽</a><a>水龙头</a><a>浴缸</a><a>卫浴挂件</a><a>厨房挂件</a><a>浴霸</a><a>吊顶</a><a>换气扇</a><a>地漏/角阀</a></span>
							<i class="i8">灯具光源</i><span class="span8"><a>吸顶灯</a><a>吊灯</a><a>LED灯</a><a>台灯</a><a>筒射灯</a><a>厨卫照明</a><a>应急/手电</a><a>户外灯</a><a>节能灯</a><a>落地灯</a></span>
							<i class="i9">电工电料</i><span class="span9"><a>插座</a><a>开关</a><a>接线板/排插</a><a>安防监控</a><a>电线</a><a>断路器</a><a>电工配件</a></span>
							<i class="i10">装饰材料</i><span class="span10"><a>壁纸</a><a>瓷砖</a><a>地板</a><a>油漆涂料</a><a>散热器</a><a>净化除味</a><a>涂刷辅料</a><a>门窗定制</a></span>
							<i class="i11">五金工具</i><span class="span11"><a>电/气动工具</a><a>手动工具</a><a>智能居家</a><a>锁具</a><a>仪器仪表</a><a>拉手</a><a>家具五金</a></span>
							<i class="i12">装修服务</i><span class="span12"><a>家装设计</a><a>家装定金</a></span>
							<div class="p2">
								<div class="p3">
									<p><img src="img/p10/1.jpg" /><img src="img/p10/2.jpg" /></p>
									<p><img src="img/p10/3.jpg" /><img src="img/p10/4.jpg" /></p>
									<p><img src="img/p10/5.png" /><img src="img/p10/6.jpg" /></p>
									<p><img src="img/p10/2.jpg" /><img src="img/p10/8.jpg" /></p>
								</div>
								<div class="p4">
									<img src="img/p10/9.jpg" />
								</div>
							</div>
							<div class="p10-1">
								<div class="p10-1-right"></div>
							</div>
						</div>
						<li class="linav-li9"><h3><a href="#">床品家纺</a><a href="#">家居日用</a><a href="#">家纺城</a></h3></li>
						<div id="p9" class="p1 p1-1" style="display: none;">
							<b>床品家纺 ></b><b>家居日用 ></b><b>海外购家具 ></b><b>家居特卖会 ></b><b>家装城 ></b>
							<i class="i1">床品件套</i><span class="span1"><a>三件套</a><a>四件套</a><a>床单被罩</a><a>多件套</a><a>婚庆件套</a><a>六件套</a></span>
							<i class="i2">芯类</i><span class="span2"><a>被子</a><a>枕芯枕套</a><a>床垫/床褥</a><a>抱枕靠垫</a><a>毛巾被/毯</a><a>电热毯</a></span>
							<i class="i3">毛巾家纺</i><span class="span3"><a>面巾</a><a>浴巾</a><a>方巾</a><a>毛巾套装</a><a>童巾</a><a>浴衣/浴袍</a><a>运动巾</a></span>
							<i class="i4">布艺纺织</i><span class="span4"><a>地毯/地垫</a><a>家居服</a><a>家居鞋</a><a>窗帘/窗纱</a><a>沙发套/垫</a><a>洗衣机罩</a><a>桌布</a><a>布艺饰品</a></span>
							<i class="i5">夏凉用品</i><span class="span5"><a>凉席</a><a>夏凉被</a><a>蚊帐</a><a>凉枕</a><a>凉品套装</a></span>
							<i class="i6">厨具</i><span class="span6"><a>烹饪锅具</a><a>刀剪砧板</a><a>保险收纳</a><a>厨房小件</a><a>精美餐具</a></span>
							<i class="i7">水具茶具</i><span class="span7"><a>保温杯</a><a>保温壶/桶</a><a>塑料杯</a><a>茶具</a><a>紫砂杯/陶瓷杯</a><a>玻璃杯</a><a>酒具</a></span>
							<i class="i8">家装软饰</i><span class="span8"><a>居家软饰</a><a>工艺摆件</a><a>创意小件</a><a>家用保健</a></span>
							<i class="i9">生活用品</i><span class="span9"><a>缝纫用品</a><a>收纳用品</a><a>洗晒用品</a><a>浴室用品</a><a>净化除味</a><a>雨伞雨具</a><a>衣厨衣架</a></span>
							<i class="i10">清洁用品</i><span class="span10"><a>居室清洁</a><a>清洁工具</a><a>驱虫除害</a><a>纸品湿巾</a><a>垃圾收纳</a><a>防护用户</a><a>衣物清洁</a></span>
							<i class="i11">宠物用品</i><span class="span11"><a>宠物主粮</a><a>宠物零食</a><a>医护美容</a></span>
							<div class="p2">
								<div class="p3">
									<p><img src="img/p9/1.jpg" /><img src="img/p9/2.jpg" /></p>
									<p><img src="img/p9/3.jpg" /><img src="img/p9/4.jpg" /></p>
									<p><img src="img/p9/5.jpg" /><img src="img/p9/6.jpg" /></p>
									<p><img src="img/p9/7.jpg" /><img src="img/p9/8.png" /></p>
								</div>
								<div class="p4">
									<img src="img/p9/9.jpg" />
								</div>
							</div>
							<div class="p1-2">
								<div class="p1-2-1"></div>
							</div>
						</div>
						<li class="linav-li8"><h3><a href="#">食品酒水</a><a href="#">母婴玩具</a></h3></li>
						<div id="p8" class="p1" style="display: none;">
							<b>食品酒水 ></b><b>母婴玩具 ></b><b>海外购食品保健 ></b><b>食品酒水盛宴 ></b><b>海外购母婴 ></b><b>母婴管家 ></b>
							<div class="p7-1 p7-p13">
								<i class="p8-i1">休闲零食</i><span class="p8-s1"><a>坚果炒货</a><a>糖果巧克力</a><a>肉干肉脯</a><a>饼干糕点</a><a>休闲零食</a></span>
								<i class="p8-i2">粮油生鲜</i><span class="p8-s2"><a>水果蔬菜</a><a>海鲜水产</a><a>肉禽蛋</a><a>米面粮油</a><a>南北干货</a><a>粽子</a></span>
								<i class="p8-i3">进口食品</i><span class="p8-s3"><a>牛奶</a><a>冲调饮品</a><a>饼干糕点</a><a>糖/巧克力</a><a>米面粮油</a><a>休闲零食</a></span>
								<i class="p8-i4">酒水</i><span class="p8-s4"><a>白酒</a><a>洋酒</a><a>葡萄酒</a><a>黄酒</a><a>啤酒</a><a>保健酒</a><a>收藏酒/老酒</a></span>
								<i class="p8-i5">礼卡特产</i><span class="p8-s5"><a>东北</a><a>西北</a><a>华北</a><a>西南</a><a>华东</a><a>月饼卡</a><a>大闸蟹</a><a>礼品城</a><a>美通卡</a></span>
								<i class="p8-i6">冲调饮品</i><span class="p8-s6"><a>咖啡</a><a>谷物冲调</a><a>饮料/蔬果汁/水</a><a>奶茶</a><a>其他</a></span>
								<i class="p8-i7">茶叶</i><span class="p8-s7"><a>绿茶</a><a>铁观音</a><a>普洱茶</a><a>红茶</a><a>金骏眉</a><a>花茶</a><a>草本花果茶</a></span>
							</div>
							<div class="p7-2 p7-p13">
								<i class="p8-i1">奶粉</i><span class="p8-s1"><a>1段奶粉</a><a>2段奶粉</a><a>3段奶粉</a><a>4段奶粉</a><a>妈妈奶粉</a><a>学前奶粉</a></span>
								<i class="p8-i2">童车童床</i><span class="p8-s2"><a>婴儿推车</a><a>安全座椅</a><a>餐椅摇椅</a><a>婴儿床</a><a>自行车</a><a>电动车</a></span>
								<i class="p8-i8">尿裤湿巾</i><span class="p8-s8"><a>品牌尿裤</a><a>NB码</a><a>S码</a><a>M码</a><a>L码</a><a>拉拉裤</a></span>
								<i class="p8-i9">喂养洗护</i><span class="p8-s9"><a>奶瓶奶嘴</a><a>餐具饮具</a><a>暖奶/消毒</a><a>吸奶器</a><a>洗发沐浴</a><a>清洁用品</a></span>
								<i class="p8-i10">营养辅食</i><span class="p8-s10"><a>米粉/菜粉</a><a>肉松/面类</a><a>DHA</a><a>钙铁锌硒</a><a>宝宝零食</a><a>清火开胃</a></span>
								<i class="p8-i11">服饰用品</i><span class="p8-s11"><a>男童装</a><a>女童装</a><a>妈妈服饰</a><a>外出用品</a><a>妈妈护肤</a><a>防辐射服</a></span>
								<i class="p8-i12">玩具乐器</i><span class="p8-s12"><a>益智玩具</a><a>电动遥控</a><a>毛绒布艺</a><a>模型玩具</a><a>文体用品</a></span>
							</div>
							<div class="p2">
								<div class="p3">
									<p><img src="img/p8/1.jpg" /><img src="img/p8/2.png" /></p>
									<p><img src="img/p8/3.jpg" /><img src="img/p8/4.png" /></p>
									<p><img src="img/p8/5.jpg" /><img src="img/p8/6.jpeg" /></p>
									<p><img src="img/p8/7.jpg" /><img src="img/p8/8.jpg" /></p>
								</div>
								<div class="p4">
									<img src="img/p8/9.jpg" />
								</div>
							</div>
						</div>
						<li class="linav-li7"><h3><a href="#">医疗保健</a><a href="#">美妆个护</a></h3></li>
						<div id="p7" class="p1 p7-p1" style="display: none;">
							<b>医疗保健 ></b><b>美妆个护 ></b><b>海外购美妆 ></b><b>名品个护 ></b><b>两性生活 ></b>
							<div class="p7-1">
								<i class="p7-i1">营养成分</i><span class="p7-s1 p7-s2"><a>蛋白粉</a><a>钙</a><a>酵素</a><a>维生素/矿物质</a><a>鱼油</a><a>左旋肉碱</a></span>
								<i class="p7-i2">进口保健品</i><span class="p7-s3"><a>美体塑身</a><a>明目益智</a><a>美容养颜</a><a>免疫调节</a><a>骨骼健康</a><a>肝肾养护</a></span>
								<i class="p7-i3">家庭测量仪</i><span class="p7-s4"><a>血压计</a><a>血糖测量</a><a>体温计</a><a>计步器</a><a>心率/心电测量仪</a></span>
								<i class="p7-i4">家庭治疗仪</i><span class="p7-s5"><a>制氧机</a><a>雾化器</a><a>护理床</a><a>医护用品</a><a>环境健康</a></span>
								<i class="p7-i5">成人用品</i><span class="p7-s6"><a>安全避孕</a><a>润滑/延时</a><a>情爱玩具</a><a>情趣内衣</a><a>验孕测孕</a></span>
							</div>
							<div class="p7-2">
								<i class="p7-i1">面部护理</i><span class="p7-s1"><a>洁面</a><a>化妆水</a><a>乳液面霜</a><a>面膜</a><a>防晒隔离</a><a>套装礼盒</a><a>眼部护理</a><a>美容仪器</a></span>
								<i class="p7-i2">身体护理</i><span class="p7-s2"><a>洗发护发</a><a>沐浴</a><a>脱毛膏</a><a>纤体瘦身</a><a>染发造型</a></span>
								<i class="p7-i3">个护清洁</i><span class="p7-s3"><a>纸品湿巾</a><a>衣物清洁</a><a>口腔护理</a><a>女性护理</a><a>家庭清洁</a></span>
								<i class="p7-i4">魅力彩妆</i><span class="p7-s4"><a>粉底遮瑕</a><a>卸妆</a><a>睫毛膏</a><a>唇彩</a><a>化妆工具</a><a>彩妆组合</a><a>美甲</a></span>
								<i class="p7-i5">香水香氛</i><span class="p7-s5"><a>女士香水</a><a>男士香水</a><a>香水套装</a><a>迷你香水</a><a>香体走珠</a></span>
								<i class="p7-i6">男士护理</i><span class="p7-s6"><a>剃须护理</a><a>防脱洗护</a><a>脸部护理</a><a>眼部护理</a><a>男士唇膏</a></span>
							</div>
							<div class="p2">
								<div class="p3">
									<p><img src="img/p7/1.jpg" /><img src="img/p7/2.jpg" /></p>
									<p><img src="img/p7/3.jpg" /><img src="img/p7/4.jpg" /></p>
									<p><img src="img/p7/5.png" /><img src="img/p7/6.jpg" /></p>
									<p><img src="img/p7/7.png" /><img src="img/p7/8.png" /></p>
								</div>
								<div class="p4">
									<img src="img/p7/9.jpg" />
								</div>
							</div>
							<div class="p1-2">
								<div class="p1-2-1"></div>
							</div>
						</div>
						<li class="linav-li6"><h3><a href="#">服饰鞋帽</a><a href="#">箱包奢品</a></h3></li>
						<div id="p6" class="p1 p1-1" style="display: none;">
							<b>服饰鞋帽 ></b><b>箱包奢品 ></b><b>服装城 ></b><b>潮流服饰 ></b>
							<i class="i1">时尚女装</i><span class="span1"><a>连衣裙</a><a>T恤</a><a>卫衣/绒衫</a><a>牛仔裤</a><a>休闲裤</a><a>短外套</a><a>衬衫</a><a>西裤</a><a>针织衫</a></span>
							<i class="i2">家居内衣</i><span class="span2"><a>男士内裤</a><a>男袜</a><a>抹胸/背心</a><a>家居服</a><a>女士内裤</a><a>打底裤/丝袜</a><a>女袜</a><a>文胸</a><a>泳装</a><a>睡裙/睡袍</a><a>儿童系列</a></span>
							<i class="i3">精品男鞋</i><span class="span3"><a>商务鞋</a><a>休闲鞋</a><a>板鞋</a><a>帆布鞋</a><a>凉鞋/沙滩鞋</a><a>家居拖鞋</a><a>男靴</a></span>
							<i class="i4">潮流女装</i><span class="span4"><a>单鞋</a><a>休闲鞋</a><a>凉鞋</a><a>高跟鞋</a><a>平底鞋</a><a>帆布鞋</a><a>家居拖鞋</a><a>女靴</a></span>
							<i class="i5">服饰配件</i><span class="span5"><a>太阳镜/眼镜</a><a>遮阳伞</a><a>丝巾/披肩</a><a>男式皮带</a><a>鞋配件</a><a>手套</a><a>帽子</a><a>围巾</a></span>
							<i class="i6">奢侈品</i><span class="span6"><a>单肩包</a><a>手提包</a><a>钱包/卡包</a><a>斜挎包</a></span>
							<i class="i7">精品男包</i><span class="span7"><a>斜挎包</a><a>钱包/卡包</a><a>商务手提包</a><a>皮带/礼盒</a><a>手包</a></span>
							<i class="i8">功能包</i><span class="span8"><a>登山包</a><a>学生包</a><a>休闲运动包</a><a>电脑包</a><a>数码/摄影包</a></span>
							<i class="i9">旅行箱包</i><span class="span9"><a>登机箱</a><a>旅行包</a><a>托运箱</a><a>旅行配件</a></span>
							<i class="i10">时尚女包</i><span class="span10"><a>单肩包</a><a>钱包/卡包</a><a>手拿包</a><a>手提包</a><a>双肩包</a><a>斜挎包</a></span>
							<i class="i11">品质男装</i><span class="span11"><a>T恤</a><a>polo衫</a><a>衬衫</a><a>休闲裤</a><a>牛仔裤</a><a>针织裤</a><a>夹克</a><a>西装</a><a>西裤</a><a>卫衣</a></span>
							<div class="p2">
								<div class="p3">
									<p><img src="img/p6/1.jpeg" /><img src="img/p6/2.jpeg" /></p>
									<p><img src="img/p6/3.jpg" /><img src="img/p6/4.jpg" /></p>
									<p><img src="img/p6/5.jpg" /><img src="img/p6/6.jpg" /></p>
									<p><img src="img/p6/7.jpg" /><img src="img/p6/8.jpg" /></p>
								</div>
								<div class="p4">
									<img src="img/p6/9.jpg" />
								</div>
							</div>
							<div class="p1-2">
								<div class="p1-2-1"></div>
							</div>
						</div>
						<li class="linav-li5"><h3><a href="#">户外运动</a><a href="#">钟表首饰</a></h3></li>
						<div id="p5" class="p1" style="display: none;">
							<b>运动户外 ></b><b>钟表首饰 ></b><b>大牌便宜购 ></b>
							<i class="i1">运动鞋服</i><span class="span1 span1-1"><a>跑步鞋</a><a>休闲鞋/板鞋</a><a>帆布鞋</a><a>篮球鞋</a><a>足球鞋</a><a>训练鞋</a><a>凉鞋/拖鞋</a><a>运动T恤</a><a>运动短裤</a><a>运动套装</a><a>卫衣</a><a>夹克</a><a>运动长裤</a><a>棉服</a><a>羽绒服</a><a>瑜伽</a></span>
							<i class="i2 i2-1">运动器械</i><span class="span2 span2-1"><a>自行车</a><a>羽毛球</a><a>篮球</a><a>器械/跑步机</a><a>运动器械</a><a>瑜伽垫</a><a>护具</a><a>极限轮滑</a><a>乒乓球</a><a>网球</a><a>足球</a><a>电子琴</a><a>运动健康</a><a>其他健身</a></span>
							<i class="i3 i3-1">户外装备</i><span class="span3 span3-2"><a>帐篷</a><a>背包</a><a>桌椅床</a><a>望远镜</a><a>照明</a><a>垫子</a><a>工具</a><a>炊具</a><a>垂钓</a><a>烧烤</a><a>军迷用品</a><a>其他</a></span>
							<i class="i4 i4-1 i4-2">户外鞋服</i><span class="span4 span4-2"><a>户外T恤</a><a>户外衬衣</a><a>速干衣裤</a><a>沙滩鞋/拖鞋</a><a>溯溪鞋</a><a>休闲鞋</a><a>徒步鞋</a><a>越野鞋</a><a>登山鞋</a><a>冲锋衣/裤</a><a>软壳</a><a>夹克</a><a>卫衣</a><a>户外配饰</a></span>
							<i class="i5 i5-1 i5-2">钟表</i><span class="span5 span5-2"><a>瑞士品牌表</a><a>国产品牌表</a><a>日韩品牌表</a><a>时尚品牌表</a><a>儿童手表</a><a>挂钟闹钟</a></span>
							<i class="i6 i6-3">珠宝首饰</i><span class="span6 span6-3"><a>纯金K金饰品</a><a>金银投资</a><a>银饰品</a><a>钻石饰品</a><a>翡翠饰品</a><a>水晶玛瑙</a><a>宝石珍珠</a><a>时尚饰品</a><a>收藏品</a></span>
							<div class="p2">
								<div class="p3">
									<p><img src="img/p5/1.jpg" /><img src="img/p5/5.jpg" /></p>
									<p><img src="img/p5/3.jpg" /><img src="img/p5/7.jpg" /></p>
									<p><img src="img/p5/5.jpg" /><img src="img/p5/6.jpg" /></p>
									<p><img src="img/p5/7.jpg" /><img src="img/p5/8.jpg" /></p>
								</div>
								<div class="p4">
									<img src="img/p5/9.jpg" />
								</div>
							</div>
						</div>
						<li class="linav-li4"><h3><a href="#">汽车整车</a><a href="#">汽车用品</a></h3></li>
						<div id="p4" class="p1" style="display: none;">
							<b>国美汽车 ></b><b>车品真划算 ></b><b>轮胎满千减百 ></b><b>9.9元免运费 ></b>
							<i class="i1">整车服务</i><span class="span1"><a>行车定金</a><a>新车全款</a><a>维护保养</a><a>摩托车全款</a></span>
							<i class="i2">车载电器</i><span class="span2"><a>行车记录仪</a><a>导航仪</a><a>安全预警仪</a><a>净化器</a><a>冷暖箱</a><a>吸尘器</a><a>倒车雷达</a><a>车载生活电器</a><a>时尚影音</a><a>蓝牙设备</a><a>电源</a></span>
							<i class="i3">养护配件</i><span class="span3 span3-1"><a>机油</a><a>添加剂</a><a>防冻液</a><a>空调养护</a><a>刹车油</a><a>底盘装甲</a><a>水箱养护</a><a>轮胎</a><a>雨刷</a><a>滤清器</a><a>蓄电池</a><a>车衣</a><a>车灯灯泡</a><a>刹车片</a><a>喇叭</a><a>火花塞</a><a>改装配件</a><a>贴膜</a></span>
							<i class="i4 i4-1">美容清洁</i><span class="span4 span4-1"><a>洗车机/水枪</a><a>车蜡</a><a>玻璃水</a><a>清洁剂</a><a>汽车配件</a><a>补漆笔</a></span>
							<i class="i5 i5-1">车饰精品</i><span class="span5 span5-1"><a>专车专用系列</a><a>四季垫</a><a>座套</a><a>凉垫</a><a>香水</a><a>颈枕腰靠</a><a>挂饰摆件</a><a>功能精品</a><a>内饰精品</a><a>整理收纳</a><a>脚垫</a><a>毛垫</a><a>多功能坐垫</a><a>后备箱垫</a></span>
							<i class="i6 i6-1 i6-2">安全自驾</i><span class="span6 span6-1 span6-2"><a>儿童安全座椅</a><a>防盗设备</a><a>胎压监测</a><a>应急救援</a><a>自驾装备</a><a>倒车雷达</a><a>打气泵</a><a>摩托车用品</a><a>电动平衡车</a></span>
							<div class="p2">
								<div class="p3">
									<p><img src="img/p4/1.jpg" /><img src="img/p4/2.jpg" /></p>
									<p><img src="img/p4/3.jpg" /><img src="img/p4/4.jpg" /></p>
									<p><img src="img/p4/5.jpg" /><img src="img/p4/1.jpg" /></p>
									<p><img src="img/p4/2.jpg" /><img src="img/p4/4.jpg" /></p>
								</div>
								<div class="p4">
									<img src="img/p4/9.jpg" />
								</div>
							</div>
						</div>
						<li class="linav-li3"><h3><a href="#">文化艺术</a></h3></li>
						<div id="p3" class="p1" style="display: none;">
							<b>文化艺术 ></b><b>天天低价 ></b>
							<i class="i1">书法</i><span class="span1"><a>行书</a><a>楷书</a><a>隶书</a><a>草书</a><a>竖幅</a><a>横幅</a></span>
							<i class="i2">国画</i><span class="span2"><a>花鸟</a><a>人物</a><a>山水</a><a>写意</a><a>斗方</a><a>竖幅</a><a>横幅</a></span>
							<i class="i3">文玩杂项</i><span class="span3"><a>手串珠串</a><a>雕件绣品</a><a>民间工艺</a><a>内画</a></span>
							<i class="i4">陶瓷紫砂</i><span class="span4"><a>茶器</a><a>陈设器</a><a>紫砂</a><a>陶瓷</a><a>彩绘器</a><a>茶具</a></span>
							<i class="i5">珠宝玉石</i><span class="span5"><a>翡翠</a><a>冰糕种</a></span>
							<div class="p2">
								<div class="p3">
									<p><img src="img/p3/1.jpg" /><img src="img/p3/2.jpg" /></p>
									<p><img src="img/p3/3.jpg" /><img src="img/p3/4.jpg" /></p>
									<p><img src="img/p3/5.jpg" /><img src="img/p3/2.jpg" /></p>
								</div>
								<div class="p4">
									<img src="img/p3/7.jpg" />
								</div>
							</div>
						</div>
						<li class="linav-li2"><h3><a href="#">旅行</a><a href="#">电影票</a><a href="#">演出票</a><a href="#">游戏</a></h3></li>
						<div id="p2" class="p1" style="display: none;">
							<b>旅行 ></b><b>机票 ></b><b>房产 ></b><b>游戏 ></b><b>彩票 ></b><b>教育培训 ></b>
							<i class="i1">旅行</i><span class="span1"><a>机票</a><a>火车票</a><a>酒店</a><a>度假周边游</a><a>签证</a><a>国内游</a></span>
							<i class="i2">房产</i><span class="span2"><a>新房</a></span>
							<i class="i3">电影票</i><span class="span3"><a>电影选座</a><a>热映影片</a><a>电影兑换卡</a><a>电影卡</a></span>
							<i class="i4">演出票</i><span class="span4"><a>演唱会</a><a>话剧舞台剧</a><a>音乐会</a><a>舞蹈芭蕾</a><a>戏曲综艺</a><a>体育赛事</a><a>儿童亲子</a></span>
							<i class="i5">游戏</i><span class="span5"><a>游戏点卡</a><a>手机游戏</a><a>手机商城</a><a>网页游戏</a></span>
							<i class="i6">彩票</i><span class="span6"><a>双色球</a><a>福彩3D</a><a>七乐彩</a><a>大乐透</a><a>排列3</a><a>排列5</a><a>七星彩</a></span>
							<i class="i7">教育培训</i><span class="span7"><a>体验票</a><a>兴趣爱好</a><a>早教幼教</a><a>语言培训</a><a>留学</a><a>游学</a><a>电子书</a><a>视频课程</a><a>职业技能</a></span>
							<div class="p2">
								<div class="p3">
									<p><img src="img/p2/1.jpg" /><img src="img/p2/2.jpg" /></p>
									<p><img src="img/p2/3.jpg" /><img src="img/p2/4.jpg" /></p>
									<p><img src="img/p2/5.jpg" /><img src="img/p2/1.jpg" /></p>
									<p><img src="img/p2/6.jpg" /><img src="img/p2/4.jpg" /></p>
								</div>
								<div class="p4">
									<img src="img/p2/7.jpg" />
								</div>
							</div>
						</div>
						<li class="linav-li1"><h3><a href="#">金融理财</a><a href="#">基金理财</a></h3></li>
						<div id="p1" class="p1" style="display: none;">
							<b>金融理财 ></b>
							<i class="i1">定期理财</i><span class="span1"><a>定期理财</a><a>投金宝</a><a>票据理财</a><a>转让理财</a></span>
							<i class="i2">活期理财</i><span class="span2"><a>美盈宝</a></span>
							<i class="i3">基金理财</i><span class="span3"><a>基金</a></span>
							<i class="i4">保险理财</i><span class="span4"><a>保险理财</a></span>
							<div class="p2">
								<div class="p3">
									<p><img src="img/p1/1.jpg" /><img src="img/p1/2.jpeg" /></p>
									<p><img src="img/p1/3.jpg" /><img src="img/p1/4.jpeg" /></p>
									<p><img src="img/p1/5.jpg" /><img src="img/p1/6.jpg" /></p>
									<p><img src="img/p1/7.jpg" /></p>
								</div>
								<div class="p4">
									<img src="img/p1/8.jpg" />
								</div>
							</div>
						</div>
					</ul>
				</div>
					<div class="myphotos">
						<ul>
							<li class="myphotos1" style="display: block;"><img src="img/images/2.jpg" /></li>
							<li class="myphotos2" style="display: none;"><img src="img/images/1.jpg" /></li>
							<li class="myphotos3" style="display: none;"><img src="img/images/3.jpg" /></li>
							<li class="myphotos4" style="display: none;"><img src="img/images/4.jpg" /></li>
						</ul>
						
						<div id="myphotos-left">
							<span id="myphotos-left1" class="span-left"><b></b></span>
							<span id="myphotos-left2" class="span-right"><b></b></span>
						</div>
						
						<div id="myphotos-bottom">
							<span id="myphotos-bottom-span1"></span>
							<span id="myphotos-bottom-span2"></span>
							<span id="myphotos-bottom-span3"></span>
							<span id="myphotos-bottom-span4"></span>
						</div>						
					</div>
				<div class="myphotos-right">
					<div class="xinwen">
						<div id="xinwen-top">
							<h4>快讯</h4>
							<a href="#">更多 <span><img src="img/3.png" /></span></a>
						</div>
						<div id="xinwen-center">
							<span><a href="#">资讯 </a><a class="iphone8" href="#"> iphone 8新品预约 转盘抽奖赢好礼</a></span>
							<span><a href="#">特惠 </a><a href="#"> TCL 205升三门冰箱919元抢</a></span>
							<span><a href="#">特惠 </a><a href="#"> 美的专场 套购两件88折</a></span>
							<span><a href="#">公益 </a><a href="#"> 国美公益 你不知道的事</a></span>
						</div>
						<div id="daohang">
							<span>
								<b class="span-img1"></b>
								<a class="span-txt">充值</a>
								<b class="sanjiao"></b>
							</span>
							<span>
								<b class="span-img2"></b>
								<a class="span-txt">票务</a>
								<b class="sanjiao"></b>
							</span>
							<span>
								<b class="span-img3"></b>
								<a class="span-txt">游戏</a>
								<b class="sanjiao"></b>
							</span>
							<span>
								<b class="span-img4"></b>
								<a class="span-txt">旅行</a>
								<b class="sanjiao"></b>
							</span>
							<span>
								<b class="span-img5"></b>
								<a class="span-txt1">美盈宝</a>
							</span>
							<span>
								<b class="span-img6"></b>
								<a class="span-txt">基金</a>
							</span>
							<span>
								<b class="span-img7"></b>
								<a class="span-txt">视频</a>
							</span>
							<span>
								<b class="span-img8"></b>
								<a class="span-txt1">找服务</a>
							</span>
							<span>
								<b class="span-img9"></b>
								<a class="span-txt">金融</a>
							</span>
							<span>
								<b class="span-img10"></b>
								<a class="span-txt">定期</a>
							</span>
							<span>
								<b class="span-img11"></b>
								<a class="span-txt">转让</a>
							</span>
							<span  class="span-first">
								<b class="span-img12"></b>
								<a class="span-txt">帮助</a>
							</span>
						</div>
						<div id="daohang-bootm">
							<div class="img-center">
								<p><span> [ </span><a href="#">有奖话题</a><span> ]</span></p>
								<p><span><a href="#">牙疼那些事儿</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<ul>
				<li><a href="#"><span class="tt">圈子</span></a></li>
				<li><a href="#"><span>真划算</span></a><span class="t1"></span></li>
				<li><a href="#"><span>服装城</span></a></li>
				<li><a href="#"><span>超市</span></a></li>
				<li><a href="#"><span>电器城</span></a></li>
				<li><a href="#"><span>国美电器</span></a></li>
				<li><a href="#"><span>汽车</span></a></li>
				<li><a href="#"><span>家居家装</span></a><span class="t1"></span></li>
				<li><a href="#"><span>智能</span></a></li>
				<li><a href="#"><span>管家</span></a></li>
				<li><a href="#"><span>金融</span></a></li>
			</ul>
			<div id="shopping-top-right">
				<div id="images">
					<ul>
						<li id="down1" style="display: none;"><img src="img/images/1.png" /></li>
						<li id="down2" style="display: none;"><img src="img/images/2.png" /></li>
						<li id="down3" style="display: block;"><img src="img/images/3.png" /></li>
					</ul>
				</div>
				<div id="images-right">
					<a class="down"><i id="down-1"></i></a>
					<a class="up"><i id="down-2"></i></a>
				</div>
			</div>
		</div>
		<!-- 背景图片  -->
		<div id="beijing">
			
		</div>
		<!--  猜你喜欢  -->
		<div id="likes">
			<div class="likes-top">
				<h2>猜你喜欢</h2>
				<span>YOU MAY LIKE</span>
				<div class="likes-top-right">
					<a class="left"></a>
					<a class="right"></a>
				</div>
			</div>
			<div class="likes-bottom">
				<ul id="ulles1" style="display: block;">
					<li>
						<a href="#">
							<img src="img/like/1.jpg" />
							<p class="txtes">美的(mide)JZT-QL303B台嵌两用燃气灶</p>
							<p class="price"><span>￥</span>579.00</p>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="img/like/2.jpg" />
							<p class="txtes">【国美自营】佳能(Canon)EOSM3(EF-M 15-45 IS STM)微型单</p>
							<p class="price"><span>￥</span>3499.00</p>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="img/like/3.jpg" />
							<p class="txtes">方太(FOTILE) CXW-200-EMD2T+JZT-GT6BE ENJOY云魔方 欧式 烟灶套餐 纯平触控</p>
							<p class="price"><span>￥</span>4399.00</p>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="img/like/4.jpg" />
							<p class="txtes">美的（Midea）JSQ20-10HWA（T）燃气热水器（【支持货到付款】10L数码恒温 拉丝钢面板 铜质水箱 威灵电机 整机三年保修</p>
							<p class="price"><span>￥</span>1099.00</p>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="img/like/5.jpg" />
							<p class="txtes">美的（Midea）WQP8-3905-CN洗碗机家用全自动除菌商用嵌入式带消</p>
							<p class="price"><span>￥</span>2999.00</p>
						</a>
					</li>
					<li>
						<a class="last" href="#">
							<img src="img/like/6.jpg" />
							<p class="txtes">佳能（canon）PowerShot SX720 HS数码相机（黑色）</p>
							<p class="price"><span>￥</span>1987.00</p>
						</a>
					</li>
				</ul>
				<ul id="ulles2" style="display: none;">
					<li>
						<a href="#">
							<img src="img/like/7.jpg" />
							<p class="txtes">雷神(THUNDEROBOT) 火星救援者ST Plus-U5f 15.6英寸高端游戏笔记本电脑（ i5-7300HQ 8G内存 1T GTX1050 2G独显 win10）银</p>
							<p class="price"><span>￥</span>5499.00</p>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="img/like/8.jpg" />
							<p class="txtes">美的燃气热水器JSQ22-12WH5D（T）（12升天然气变频恒温强排式燃气热水器）</p>
							<p class="price"><span>￥</span>1199.00</p>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="img/like/9.jpg" />
							<p class="txtes">海尔热水器ES50H-S7(E)(U1)</p>
							<p class="price"><span>￥</span>2799.00</p>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="img/like/10.jpg" />
							<p class="txtes">美的F60-21WB1（E）（遥控）电热水器（60L容量  一级能效 电脑版遥控设计 预约定时开关机 三层蓝钻内胆整机八年保修）</p>
							<p class="price"><span>￥</span>1199.00</p>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="img/like/11.jpg" />
							<p class="txtes">雷神(THUNDEROBOT) 911-M3w 15.6英寸游戏笔记本电脑 （i7-6700HQ 8G 1T GTX1060 6GB显存）银</p>
							<p class="price"><span>￥</span>8099.00</p>
						</a>
					</li>
					<li>
						<a class="last" href="#">
							<img src="img/like/12.jpg" />
							<p class="txtes">华为（HUAWEI）平板电脑M3（4GB内存64GB存储 LTE版金）BTV-DL09</p>
							<p class="price"><span>￥</span>2688.00</p>
						</a>
					</li>
				</ul>
				<ul id="ulles3" style="display: none;">
					<li>
						<a href="#">
							<img src="img/like/13.jpg" />
							<p class="txtes">海尔热水器ES60H-S7(E)(U1)</p>
							<p class="price"><span>￥</span>2999.00</p>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="img/like/14.jpg" />
							<p class="txtes">美的洗碗机WQP8-3801-CN</p>
							<p class="price"><span>￥</span>2799.00</p>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="img/like/15.jpg" />
							<p class="txtes">方太(FOTILE) CXW-200-EM71T+JZT-GT6BE 云魔方 欧式 烟灶套餐 智能云控</p>
							<p class="price"><span>￥</span>5599.00</p>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="img/like/16.jpg" />
							<p class="txtes">宏碁(acer)SF113-31-C5ZH 13.3英寸全金属超薄笔记本（四核 4G 128GB SSD IPS FHD 指纹识别）粉</p>
							<p class="price"><span>￥</span>3699.00</p>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="img/like/17.jpg" />
							<p class="txtes">海尔(Haier) EC6002-D  无线遥控 双管变频加热 电热水器  8年包修 白</p>
							<p class="price"><span>￥</span>1500.00</p>
						</a>
					</li>
					<li>
						<a class="last" href="#">
							<img src="img/like/18.jpg" />
							<p class="txtes">美的（Midea）F60-21WA1 60升 2100W 经济适用 电热水器</p>
							<p class="price"><span>￥</span>899.00</p>
						</a>
					</li>
				</ul>
			</div>
		</div>
		
		<!-- 手机通讯  -->
		<div id="temp0">
			<div class="mt">
				<div class="mt-left">
					<span class="1f">1F</span>
					<h2>手机通讯</h2>
				</div>
				<div class="mt-right">
					<ul>
						<li id="right1"><a class="right1" href="#">精选热卖</a></li>
						<li id="right2"><a class="right2" href="#">时尚新品</a></li>
						<li id="right3"><a class="right3" href="#">加价换购</a></li>
						<li id="right4"><a class="right4" href="#">畅享低价</a></li>
						<li id="right5"><a class="right5" href="#">手机配件</a></li>
						<li id="right6"><a class="right6" href="#">天生一对</a></li>
					</ul>
				</div>
			</div>
			<div class="mc">
				<div class="mc-1">
					<a class="mca" href="#"><img src="img/1f/T1EnJvBsDv1RCvBVdK.jpg" ></a>
					<div class="channel">
						<ul>
							<li>
								<a href="#">手机</a><span> /</span>
								<a href="#">配件</a><span> /</span>
								<a href="#">充值</a><span> /</span>
								<a href="#">优惠券</a>
							</li>
						</ul>
					</div>
					<div class="keywords">
						<ul class="w55">
							<li><a href="#">魅族手机</a></li>
							<li><a href="#">智享生活</a></li>
							<li><a href="#">加价换购</a></li>
							<li><a href="#">国美租租</a></li>
							<li><a href="#">以旧换新</a></li>
						</ul>
						<ul class="w43">
							<li><a href="#">潮3C</a></li>
							<li><a href="#">GOME</a></li>
							<li><a href="#">努比亚</a></li>
							<li><a href="#">存储卡</a></li>
							<li><a href="#">保护套</a></li>
						</ul>
						<ul class="w62">
							<li><a href="#">荣耀手机</a></li>
							<li><a href="#">金立手机</a></li>
							<li><a href="#">美图手机</a></li>
							<li><a href="#">蓝牙耳机</a></li>
							<li><a href="#">热销推荐</a></li>
						</ul>
					</div>
				</div>
				<div id="mcbo1" class="mccc" style="display: block;">
					<div id="mccc" class="mccc-left">
						<ul>
							<li id="m1" style="display: block;"><img src="img/1f/1.jpg" /></a></li>
							<li id="m2" style="display: none;"><img src="img/1f/2.jpg" /></a></li>
							<li id="m3" style="display: none;"><img src="img/1f/3.jpg" /></a></li>
						</ul>
						<div class="mccc-left11">
							<ol>
								<li id="mccoli1"></li>
								<li id="mccoli2"></li>
								<li id="mccoli3"></li>
							</ol>
						</div>
						<div class="mccc-al" style="display: none;">
							<span id="m4" class="mccc-al1"></span>
							<span id="m5" class="mccc-al2"></span>
						</div>
						<div id="mcc77" class="mccc-center" style="display: none;">
							<ul>
								<li><a href="#"><img src="img/1f/1f-1/1.jpeg" /></a></li>
								<li><a href="#"><img src="img/1f/1f-1/2.jpg" /></a></li>
								<li><a href="#"><img src="img/1f/1f-1/3.jpeg" /></a></li>
								<li><a href="#"><img src="img/1f/1f-1/4.jpeg" /></a></li>
								<li><a href="#"><img src="img/1f/1f-1/5.jpeg" /></a></li>
								<li><a href="#"><img src="img/1f/1f-1/6.jpg" /></a></li>
							</ul>
						</div>
						<div id="mcc88" class="mccc-center" style="display: block;">
							<ul>
								<li><a href="#"><img src="img/1f/2/1.jpeg" /></a></li>
								<li><a href="#"><img src="img/1f/2/2.jpeg" /></a></li>
								<li><a href="#"><img src="img/1f/2/3.jpeg" /></a></li>
								<li><a href="#"><img src="img/1f/2/4.jpeg" /></a></li>
								<li><a href="#"><img src="img/1f/2/5.jpeg" /></a></li>
								<li><a href="#"><img src="img/1f/2/6.jpeg" /></a></li>
							</ul>
						</div>
						
						<div id="mcc99" class="mccc-center" style="display: block;">
							<ul>
								<li><a href="#"><img src="img/1f/2/3.jpeg" /></a></li>
								<li><a href="#"><img src="img/1f/1f-1/4.jpeg" /></a></li>
								<li><a href="#"><img src="img/1f/2/5.jpeg" /></a></li>
								<li><a href="#"><img src="img/1f/2/6.jpeg" /></a></li>
								<li><a href="#"><img src="img/1f/1f-1/5.jpeg" /></a></li>
								<li><a href="#"><img src="img/1f/2/1.jpeg" /></a></li>
							</ul>
						</div>
					</div>
					<div id="mcc-right" class="mcc-right">
						<ul>
							<li><a href="#"><img src="img/1f/1fli/1.jpg" /></a></li>
							<li><a href="#"><img src="img/1f/1fli/2.jpg" /></a></li>
							<li><a href="#"><img src="img/1f/1fli/3.jpg" /></a></li>
							<li><a href="#"><img src="img/1f/1fli/4.jpg" /></a></li>
							<li><a href="#"><img src="img/1f/1fli/5.jpg" /></a></li>
							<li><a href="#"><img src="img/1f/1fli/6.jpg" /></a></li>
						</ul>
						<div class="mccc-right1" style="display: none;"></div>
					</div>
				</div>
				
				<div id="mcbo2" class="mccc2" style="display: none;">
					<ul>
						<li><a href="#"><img src="img/1f/3/1.jpg" width="130" height="130" /><p class="p_name">魅蓝 6 全网通公开版 16GB 香槟金</p><p class="p_price"><span>￥</span>1299.00</p></a></li>
						<li><a href="#"><img src="img/1f/3/2.jpg" width="130" height="130" /><p class="p_name">vivo X20 64G  玫瑰金</p><p class="p_price"><span>￥</span>2998.00</p></a></li>
						<li><a href="#"><img src="img/1f/3/3.jpg" width="130" height="130" /><p class="p_name">荣耀9 尊享版 128GB 全网通版 魅海蓝</p><p class="p_price"><span>￥</span>2999.00</p></a></li>
						<li><a href="#"><img src="img/1f/3/4.jpg" width="130" height="130" /><p class="p_name">魅族 PRO 64G 香槟金</p><p class="p_price"><span>￥</span>2499.00</p></a></li>
						<li><a href="#"><img src="img/1f/3/5.jpg" width="130" height="130" /><p class="p_name">华为畅享7 32GB 全网通 双卡双待 红色</p><p class="p_price"><span>￥</span>1099.00</p></a></li>
						<li><a href="#"><img src="img/1f/3/6.jpg" width="130" height="130" /><p class="p_name">三星 Galaxy J3 J3308 2017 雪夜黑</p><p class="p_price"><span>￥</span>1399.00</p></a></li>
						<li><a href="#"><img src="img/1f/3/7.jpg" width="130" height="130" /><p class="p_name">OPPO R11 全网通 红色</p><p class="p_price"><span>￥</span>2999.00</p></a></li>
						<li><a href="#"><img src="img/1f/3/8.jpg" width="130" height="130" /><p class="p_name"> iPhone 8 64G 金色</p><p class="p_price"><span>￥</span>5588.00</p></a></li>
						<li><a href="#"><img src="img/1f/3/9.jpg" width="130" height="130" /><p class="p_name">摩托罗拉 Z2 Play 64GB 金色</p><p class="p_price"><span>￥</span>3299.00</p></a></li>
						<li><a href="#"><img src="img/1f/3/10.jpg" width="130" height="130" /><p class="p_name">三星Gal axy N8全网通 星河蓝 64G</p><p class="p_price"><span>￥</span>6988.00</p></a></li>
					</ul>
					<div class="mccc-right2" style="display: none;"></div>
				</div>
				
				<div id="mcbo3" class="mccc2" style="display: none;">
					<ul>
						<li><a href="#"><img src="img/1f/4/1.jpg" width="130" height="130" /><p class="p_name">三星 Galaxy S8  全网通  烟晶灰 64GB</p><p class="p_price">加5元得三重礼</p></a></li>
						<li><a href="#"><img src="img/1f/4/2.jpg" width="130" height="130" /><p class="p_name">OPPO R11 64G 全网通 玫瑰金色</p><p class="p_price">加2元得bong2s手环</p></a></li>
						<li><a href="#"><img src="img/1f/4/3.jpg" width="130" height="130" /><p class="p_name">三星S8 Plus 绮梦金 64G 全网通</p><p class="p_price">加5元得三重好礼</p></a></li>
						<li><a href="#"><img src="img/1f/4/4.jpg" width="130" height="130" /><p class="p_name">OPPO R9s 双卡双待 64G全网通版 黑色</p><p class="p_price">加1元得bong智能手环</p></a></li>
						<li><a href="#"><img src="img/1f/4/5.jpg" width="130" height="130" /><p class="p_name">vivo X9s 4G 64G 玫瑰金</p><p class="p_price">加1.1元得bong智能手环</p></a></li>
						<li><a href="#"><img src="img/1f/4/6.jpg" width="130" height="130" /><p class="p_name">vivo X9s Plus 4GB 64GB 全网通 双卡双待 玫瑰金</p><p class="p_price">加1.1元得体脂称</p></a></li>
						<li><a href="#"><img src="img/1f/4/7.jpg" width="130" height="130" /><p class="p_name">三星C9 Pro 64G 枫叶金 全网通</p><p class="p_price">加9.9元得空气净化器</p></a></li>
						<li><a href="#"><img src="img/1f/4/8.jpg" width="130" height="130" /><p class="p_name">三星Note8 64GB 全网通 星河蓝</p><p class="p_price">加3元得双重好礼</p></a></li>
						<li><a href="#"><img src="img/1f/4/9.jpg" width="130" height="130" /><p class="p_name">OPPO R9s 64G 全网通 金色</p><p class="p_price">加1元得bong智能手环</p></a></li>
						<li><a href="#"><img src="img/1f/4/10.jpg" width="130" height="130" /><p class="p_name">OPPO R9s Plus 全网通 64GB 黑</p><p class="p_price">加1元得bong智能手环</p></a></li>
					</ul>
					<div class="mccc-right3" style="display: none;"></div>
				</div>
				
				<div id="mcbo4" class="mccc2" style="display: none;">
					<ul>
						<li><a href="#"><img src="img/1f/5/1.jpg" width="130" height="130" /><p class="p_name">魅蓝E2 32GB 全网通公开版 月光银</p><p class="p_price"><span>￥</span>1299.00</p></a></li>
						<li><a href="#"><img src="img/1f/5/2.jpg" width="130" height="130" /><p class="p_name">荣耀8青春版 高配版 32GB 全网通  流光金</p><p class="p_price"><span>￥</span>1399.00</p></a></li>
						<li><a href="#"><img src="img/1f/5/3.jpg" width="130" height="130" /><p class="p_name">三星Galaxy J3 J3308 2017 雪夜黑</p><p class="p_price"><span>￥</span>1399.00</p></a></li>
						<li><a href="#"><img src="img/1f/5/4.jpg" width="130" height="130" /><p class="p_name">小米Max2 全网通 64GB 全网通 金色</p><p class="p_price"><span>￥</span>1699.00</p></a></li>
						<li><a href="#"><img src="img/1f/5/5.jpg" width="130" height="130" /><p class="p_name">vivo X9s 64G  全网通 玫瑰金</p><p class="p_price"><span>￥</span>2498.00</p></a></li>
						<li><a href="#"><img src="img/1f/5/6.jpg" width="130" height="130" /><p class="p_name">荣耀V9play 高配版 极光蓝</p><p class="p_price"><span>￥</span>1199.00</p></a></li>
						<li><a href="#"><img src="img/1f/5/7.jpg" width="130" height="130" /><p class="p_name">华为畅享7 Plus 32GB 双卡双待 银色</p><p class="p_price"><span>￥</span>1499.00</p></a></li>
						<li><a href="#"><img src="img/1f/5/8.jpg" width="130" height="130" /><p class="p_name">三星 Galaxy C9 Pro 64G 墨玉黑 全网通</p><p class="p_price"><span>￥</span>3199.00</p></a></li>
						<li><a href="#"><img src="img/1f/5/9.jpg" width="130" height="130" /><p class="p_name">畅玩6X 高配版 32G 铂光金</p><p class="p_price"><span>￥</span>1299.00</p></a></li>
						<li><a href="#"><img src="img/1f/5/10.jpg" width="130" height="130" /><p class="p_name">iPhone 8 Plus 64G 银色 全网通</p><p class="p_price"><span>￥</span>6488.00</p></a></li>
					</ul>
					<div class="mccc-right4" style="display: none;"></div>
				</div>
				
				<div id="mcbo5" class="mccc2" style="display: none;">
					<ul>
						<li><a href="#"><img src="img/1f/6/1.jpg" width="130" height="130" /><p class="p_name">雷翼Type-c转接头RY-CB-TP白</p><p class="p_price"><span>￥</span>12.00</p></a></li>
						<li><a href="#"><img src="img/1f/6/2.jpg" width="130" height="130" /><p class="p_name">优加 iPhone7plus/苹果7plus钢化膜手机保护套透明TPU软壳(5.5英寸)</p><p class="p_price"><span>￥</span>19.00</p></a></li>
						<li><a href="#"><img src="img/1f/6/3.jpg" width="130" height="130" /><p class="p_name">羽博2a充电头Y-721快速充电器头手机通用苹果安卓</p><p class="p_price"><span>￥</span>21.90</p></a></li>
						<li><a href="#"><img src="img/1f/6/4.jpg" width="130" height="130" /><p class="p_name">优加 iPhone7/苹果7钢化膜高清透明钢化玻璃手机保护贴膜(4.7英寸）</p><p class="p_price"><span>￥</span>19.00</p></a></li>
						<li><a href="#"><img src="img/1f/6/5.jpg" width="130" height="130" /><p class="p_name">哌佰客编织线苹果编织线金</p><p class="p_price"><span>￥</span>19.90</p></a></li>
						<li><a href="#"><img src="img/1f/6/6.jpg" width="130" height="130" /><p class="p_name">东芝（TOSHIBA） 32GB 90MB/s TF(micro SD) 存储卡 UHS-I U3 Class10 高速存储卡 支持4K拍摄  内存卡 存储卡 tf卡【国美自营 品质保证】东芝高端工艺精心打造，高达90MB/s的读取速度【新老包装随机发货】</p><p class="p_price"><span>￥</span>86.00</p></a></li>
						<li><a href="#"><img src="img/1f/6/7.jpg" width="130" height="130" /><p class="p_name">倍斯特Besiter0177特斯拉10400mAh移动电源</p><p class="p_price"><span>￥</span>59.00</p></a></li>
						<li><a href="#"><img src="img/1f/6/8.jpg" width="130" height="130" /><p class="p_name">羽博移动电源20000毫安LED数显屏双输入2A输出 白色</p><p class="p_price"><span>￥</span>89.00</p></a></li>
						<li><a href="#"><img src="img/1f/6/9.jpg" width="130" height="130" /><p class="p_name">羽博移动电源20000毫安双输入双输出LED照明灯 白色</p><p class="p_price"><span>￥</span>79.00</p></a></li>
						<li><a href="#"><img src="img/1f/6/10.jpg" width="130" height="130" /><p class="p_name">羽博移动电源15600毫安炫彩铝合金LED照明灯通用 银</p><p class="p_price"><span>￥</span>89.00</p></a></li>
					</ul>
					<div class="mccc-right5" style="display: none;"></div>
				</div>
				
				<div id="mcbo6" class="mccc2" style="display: none;">
					<ul>
						<li><a href="#"><img src="img/1f/7/1.jpeg" width="130" height="130" /><p class="p_name">vivo X9s 64G 全网通 玫瑰金</p><p class="p_price"><span>￥</span>2498.00</p></a></li>
						<li><a href="#"><img src="img/1f/7/2.jpg" width="130" height="130" /><p class="p_name">OPPO R11 64GB 全网通 红色</p><p class="p_price"><span>￥</span>2999.00</p></a></li>
						<li><a href="#"><img src="img/1f/7/3.jpg" width="130" height="130" /><p class="p_name">三星Galaxy S8 全网通 芭比粉</p><p class="p_price"><span>￥</span>5688.00</p></a></li>
						<li><a href="#"><img src="img/1f/7/4.jpg" width="130" height="130" /><p class="p_name">华为 nova2 64GB全网通 玫瑰金</p><p class="p_price"><span>￥</span>2499.00</p></a></li>
						<li><a href="#"><img src="img/1f/7/5.jpg" width="130" height="130" /><p class="p_name">魅族Pro 7 全网通公开版 静谧黑</p><p class="p_price"><span>￥</span>2899.00</p></a></li>
						<li><a href="#"><img src="img/1f/7/6.jpg" width="130" height="130" /><p class="p_name">vivo X9s 64GB  活力蓝</p><p class="p_price"><span>￥</span>2498.00</p></a></li>
						<li><a href="#"><img src="img/1f/7/7.jpg" width="130" height="130" /><p class="p_name">OPPO R11 64GB 全网通 黑色</p><p class="p_price"><span>￥</span>2799.00</p></a></li>
						<li><a href="#"><img src="img/1f/7/8.jpg" width="130" height="130" /><p class="p_name">三星Galaxy S8 全网通 谜夜黑</p><p class="p_price"><span>￥</span>5688.00</p></a></li>
						<li><a href="#"><img src="img/1f/7/9.jpg" width="130" height="130" /><p class="p_name">华为 nova2 64GB 全网通 流光金</p><p class="p_price"><span>￥</span>2499.00</p></a></li>
						<li><a href="#"><img src="img/1f/7/10.jpg" width="130" height="130" /><p class="p_name">魅族 PRO 7 Plus 6 64G 全网通公开版 静谧黑 </p><p class="p_price"><span>￥</span>3299.00</p></a></li>
					</ul>
					<div class="mccc-right6" style="display: none;"></div>
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
							<img src="img/foot/1.jpg">
							<i class="icon-triangle"></i>
						</div>
					</em>
					<em class="code-sm wap">
						<i></i>
						<p>手机站点</p>
						<div style="display: none;">
							<img src="img/foot/2.jpg">
							<i class="icon-triangle"></i>
						</div>
					</em>
					<em class="code-bg app">
						<i><a href="#"><img src="img/foot/3.jpg" /></a></i>
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
					<li class="gome-tab2"><img src="img/5.png" /><a>购物车</a><i></i></li>
					<li class="gome-tab3"><img src="img/6.png" /><i></i></li>
				</ul>
			</div>
		</div>
	</body>
</html>
