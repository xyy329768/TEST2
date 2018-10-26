<%@ page language="java" import="java.util.*,com.vo.*,com.service.inter.*,com.service.impl.*,com.page.*,java.text.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<link rel="shortcut icon" type="image/x-icon" href="img/bit.ico" />
		<meta charset="UTF-8">
		<title>我的订单-国美</title>
		<link rel="stylesheet" href="css/myordercss(1)/myOrder.css" />
		<link rel="stylesheet" href="css/myordercss(1)/index.css" />
		<link rel="stylesheet" href="css/myordercss(1)/index1.css" />
		<link rel="stylesheet"  href="css/myordercss(1)/up.css"/>
		<link rel="stylesheet" type="text/css" href="css/jQuery-confirm/jquery-confirm.css"/>
		<script type="text/javascript" src="js/orderjs/bootstrap.js" ></script>
		<script type="text/javascript" src="js/orderjs/jquery-2.1.4.js" ></script>
		<script type="text/javascript" src="js/orderjs/index.js" ></script>
		<script type="text/javascript" src="js/orderjs/myOrder.js" ></script>
		<script src="css/jQuery-confirm/jquery-confirm.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			#pageDiv {
				position:absolute;
				right:0px;
			}
			#pageDiv a{
				padding:2px;
				border:1px solid ;
			}
			.jconfirm .jconfirm-box {							
				background: white;
			    border-radius: 4px;
				position: relative;
				left:560px;
				bottom:50px;
				outline: none;
				padding: 15px 15px 0;
			 	width:300px;
			 	height:90px;
			}
			.order-delete i{
				position:relative;
				left:21px
			}
			
			#requestListDiv.children{
				width:25px;
			}
		</style>
		
	</head>
	<body>
		<%
			PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
		
		 %>
		
		<!--页面顶部-->
		<div id="top">
			<!--最顶上的一条开始-->
		<div id="shortcut">
			<div class="w">
				<ul class="fl">
					<li class="dorpdown" id="ttbar-mycity">
						<div class="dt cw-icon area-text-wrap">
							<i class="ci-right"><s>◇</s></i> Hi,spring_breeze
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
						<a href="" class="link-login">首页</a>&nbsp;&nbsp;
					
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
									<a href=""><img src="img/myOrderImg/no-img_mid_.jpg" width="60" height="60"></a>
								</div>
								<div class="u-name u-login">
									<a href="" class="link-login">你好</a>
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
								<img src="img/myOrderImg/1.jpg" alt="关注国美">
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
			
			<div id="top2">
			<!--顶部红色背景部分-->
				<div class="headlist">
					
					<!--我的国美-->
					<div class="GMlogo"></div>
					
					<ul class="gomeNav">
						<li><a href="#">首页</a></li>
						<li id="gomeNav"><a href="#">账户设置<i></i></a></li>
						<li id="gomeNav1"><a href="#">会员俱乐部<i></i></a></li>
						<li id="gomeNav2"><a href="#">社区<i></i></a></li>
					</ul>
					<div id="sanjiao"></div>
					<ul id="gomeCur" class="gomeCur" style="display: none;">
						<li id="gomeCur-1"><a class="gomeCur1" href="#">账户设置<i></i></a></li>
						<li><a href="#">账户安全</a></li>
						<li><a href="#">基本资料</a></li>
						<li><a href="#">收货地址</a></li>
						<li><a href="#">增票认证</a></li>
						<li><a href="#">我的会员卡</a></li>
					</ul>
					
					<ul id="gomeCur1" class="gomeCur gomeCurgomeCur" style="display: none;">
						<li id="gomeCur-1"><a class="gomeCur1" href="#">会员俱乐部<i></i></a></li>
						<li><a href="#">会员俱乐部</a></li>
						<li><a href="#">会员等级</a></li>
						<li><a href="#">会员权益</a></li>
					</ul>
					
					<ul id="gomeCur2" class="gomeCur gomeCurgomeCur1" style="display: none;">
						<li id="gomeCur-1"><a class="gomeCur1 gomesss1" href="#">社区<i></i></a></li>
						<li><a href="#">我的话题</a></li>
						<li><a href="#">我的圈子</a></li>
					</ul>
					
					<!--右侧搜索框购物车部分-->
					<div class="GMtopright">
						<!--搜索框-->
						<div class="GMsearch">
							<form id="searchform">
								<input type="text" id="search" name="search" />
								
								<button class="searchbtn" ></button>
							</form>
						</div>
						<!--购物车框-->
						<div class="GMshopcar">
							<a class="shopcarlist">
								购物车<span>0</span>件
								<i></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--页面中部-->
		<div id="middle">
			<div class="middle-left">
				<!--订单中心-->
				<div class="left-text">订单中心</div>
				<ul>
					<li class>
						<a href="">我的订单</a>
					</li>
					<li class>
						<a href="">退换货单</a>
					</li>
					<li class>
						<a href="">评价晒单</a>
					</li>
					<li class>
						<a href="">服务单</a>
					</li>
					<li class>
						<a href="">以旧换新</a>
					</li>
					<li class>
						<a href="">延保服务</a>
					</li>
				</ul>
				<!--资产中心-->
				<div class="left-text">资产中心</div>
				<ul>
					<li class>
						<a href="">我的金融</a>
					</li>
					<li class>
						<a href="">美盈宝</a>
					</li>
					<li class>
						<a href="">国美币</a>
					</li>
					<li class>
						<a href="">美通卡</a>
					</li>
					<li class>
						<a href="">我的美豆</a>
					</li>
					<li class>
						<a href="">美通券</a>
					</li>
				</ul>
				<!--管理中心-->
				<div class="left-text">管理中心</div>
				<ul>
					<li class>
						<a href="">我的收藏</a>
					</li>
					<li class>
						<a href="">我的预约</a>
					</li>
					<li class>
						<a href="">我的咨询</a>
					</li>
					<li class>
						<a href="">投资管理</a>
					</li>
					
				</ul>
				<!--账户设置-->
				<div class="left-text">账户设置</div>
				<ul>
					<li class>
						<a  href="">账户安全</a>
					</li>
					<li class>
						<a  href="">基本资料</a>
					</li>
					<li class>
						<a  href="">收货地址</a>
					</li>
					<li class>
						<a  href="">增票认证</a>
					</li>
					<li class>
						<a  href="">我的会员卡</a>
					</li>
					
				</ul>
			</div>
			<!--订单详情-->
			<div class="middle-right">
				<!--我的订单-->
				<div class="right-top">
					<span style="font-size: 16px;color: #5E5E5E;">我的订单</span>
				</div>
				<!--订单分类-->
				<div class="right-top-orderlist">
					<!--实物订单-->
					<div class="orderlist-top">
						<div class="orderlist-left">实物订单：</div>
						<div class="orderlist-right" style="width: 650px;">
							<ul>
								<li>
									<a href="">全部</a>
								</li>
								<li>
									<a href="">团购订单</a>
								</li>
								<li>
									<a href="">抢购订单</a>
								</li>
								<li>
									<a href="">预售订单</a>
								</li>
								<li>
									<a href="">淘实惠订单</a>
								</li>
								<li>
									<a href="">海外购订单</a>
								</li>
								<li>
									<a href="">3D订单</a>
								</li>
								<li>
									<a href="">家装订单</a>
								</li>
								<li>
									<a href="">定向券订单</a>
								</li>
							</ul>
						</div>
					</div>
					<!--其他订单-->
					<div class="orderlist-bottom">
						<div class="orderlist-left">其他订单：</div>
						<div class="orderlist-right" style="width: 650px;">
							<ul>
								<li>
									<a href="">门店</a>
								</li>
								<li>
									<a href="">国美+</a>
								</li>
								<li>
									<a href="">美通卡</a>
								</li>
								<li>
									<a href="">白拿</a>
								</li>
								<li>
									<a href="">机票</a>
								</li>
								<li>
									<a href="">度假</a>
								</li>
								<li>
									<a href="">演出票</a>
								</li>
								<li>
									<a href="">电影票</a>
								</li>
								<li>
									<a href="">话费充值</a>
								</li>
								<li>
									<a href="">流量充值</a>
								</li>
								<li>
									<a href="">酒店</a>
								</li>
								<li>
									<a href="">火车票</a>
								</li>
							</ul>
							<span class="moreType">更多类型</span>
						</div>
					</div>
				</div>
				<!--订单主要内容-->
				<div class="middle-main">
					<!--订单分类表-->
					<!-- <div class="main-top">
						订单分类
						<div class="top-type">
							订单分类左侧
							<div class="type-left">
								待付款
								<div class="wait-pay">
									<span class="wait-text">待付款</span>
									<span class="pay-num">&nbsp;&nbsp;0</span>
								</div>
								<span class="line"></span>
								待收货
								<div class="wait-delivery">
									<span class="wait-text">待收货</span>
									<span class="pay-num">&nbsp;&nbsp;0</span>
								</div>
								<span class="line"></span>
								待评价
								<div class="wait-evaluate">
									<span class="wait-text">待评价晒单</span>
									<span class="pay-num">&nbsp;&nbsp;0</span>
									
								</div>
							</div>
							
							查找订单
							<div class="search-order">
								<input type="text" class="order-input" value="订单编号" />
								<input type="button" class="order-img" />
							</div>
						</div>
						最近订单
						<div class="recent-order">
							<select class="select-order">
								<option vlaue="">近三个月订单</option>
								<option vlaue="">今年内订单</option>
								<option vlaue="">2016年订单</option>
								<option vlaue="">2015年订单</option>
								<option vlaue="">2015年以前订单</option>
							</select>
							<div class="order-recycle">
								<a href="">我的订单回收站</a>
							</div>
						</div>
					</div> -->
					<!--商品详情列表-->
					<div class="main-box">
						<div class="category-desc">订单商品详情</div>
						<div class="space">&nbsp;</div>
						<div class="money-sum">金额</div>
						<div class="order-state">订单状态</div>
						<div class="receiver">收货人</div>
						<div class="opration">操作</div>
					</div>
					
					<!--商品详情-->
					<div class="main-bottom">
						
						<div class="bottom-details">
							
								
							<%				
											String isPaid="已付款";
											String notPaid = "未付款";
											List<Order> list = (List<Order>)request.getAttribute("list");
											for(Order order:list){
										%>
							
							
								<!--商品详情上半部分-->
							<table class="table-list">
								<tbody>
									<tr class="list-top">
										<td style="width: 40%; padding-left: 10px;" class="listtop-left" disabled>
											<input type="checkbox" class="list-left" disabled/>
											<span class="commen">普</span>
											
										
											<span class="time">
											<%
												SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
												String Time = sdf.format(order.getOdate()); 
											%>
												<%=Time %>      
												</span>
											<span class="number">订单编号：<%=order.getOid()%></span>
										</td>
										<td style="width: 20%;text-align: left;padding-left:75px;"class="listtop-right">
											<span>国美自营</span>
											<i></i>
										</td>
										<td style="width: 10%;"></td>
										<td style="width: 10%;"></td>
										<td style="width: 10%;"></td>
										<td style="width: 10%;padding-left: 15px;" class="delete">
											<div class="order-delete" onclick="deleteOrder1ByOid(<%=order.getOid() %>)">
												
												<i></i>
											</div>
											
										</td>
									</tr>
								</tbody>
								<!--商品详情下半部分-->
								<tbody>
									<tr class="list-bottom">
									<td colspan="2" style="width: 60%;border-right-width: 1px;
											border-right-style: solid;border-right-color: #E6E6E6;position: relative;">
											<%
																OrderService service = new OrderServiceImpl();
																List<Odetail> odetailList = service.getOdetailByOrder(order.getOid());
																
																for(Odetail odetail:odetailList){
														
															 %>
										
											<div class="order-category" style="width: 100%;height:100%;padding:0px;magin:0px;">
												<table style="width: 100%;">
													<tr class="tr-category">
														<td class="category" style="width: 40%;position: relative;
															border-bottom-style: none;border-right-style: none;">
															<div class="category-proImg" style="float: left;">
																<a href="">
																	<img src="img/myOrderImg/iPhone.jpg" style="width: 50px;height: 50px;"/>
																</a>
															</div>
															
													
															 
															<div class="category-proName" style="float: left;">
																<a href="">
																	<%=odetail.getPname()%>
																</a>
																<p class="same" style="margin-top: 10px;">
																	<i></i>
																	<span>找相似</span>
																</p>
															</div>
															
														</td>
														<td class="category-sum" style="width: 20%;border-bottom-style: none;
																border-right-style: none;">
															<div class="category-list-sum">
																x<span><%=odetail.getPsum()%></span>
														
															</div>
														</td>
													</tr>
												</table>
											</div>
										
											 <%
										}
										 %> 
										 </td>
										<td style="width: 10%;text-align: center;padding: 0 10px;">
											<p class="paySum" style="margin-top: 10px;">
												<em class="dollar-sign">￥</em>
												<span><%=order.getOprice()%></span>
											</p>
											<p class="pay-method" style="margin: 10px 0;">在线支付</p>
										</td>
										<td style="width: 10%;text-align: center">
											<p class="status">
											
											<%
												if(order.getStatus()==0 ){
											%>
													<%=notPaid%>
											<% 
												}else{
											%>	
												<%=isPaid%>
											<% 
												}
											%>		
											
											
											
											</p>
										</td>
										<td style="width: 10%;color: #888;padding-left: 15px;position: relative;text-align:center;vertical-align:middle;">
											<div class="user">
												<i></i>
												<span class="username"><%=order.getAname()%></span>
											</div>
										</td>
										<td style="width: 10%;">
											<div class="buy-again">
												<a href="">再次购买</a>
											</div>
											
								</td>
									</tr>
								</tbody>
							
									
							</table>
								<%
								}
						    %>
						    <div id="pageDiv">
					
				
			<form id="user1Form" action="myOrderServlet?action=getAllMyOrderByPage" method="post">
			<input type="hidden" name="searchCondition" value="${requestScope.searchCondition}"/>
	<a id="first" class="btn btn-default btn-sm" href="myOrderServlet?action=getAllMyOrderByPage&searchCondition=${requestScope.searchCondition}&requestPage=1">首页</a>
    
    
    <a id="previous" class="btn btn-default btn-sm" href="myOrderServlet?action=getAllMyOrderByPage&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getPreviousPage()%>"> 上一页</a>
      <div id = "requestListDiv" style="display:inline-block;"> </div>
      
      <a id="next" class="btn btn-default btn-sm" href="myOrderServlet?action=getAllMyOrderByPage&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getNextPage()%>"> 下一页</a>
    
    
     <a id="last" class="btn btn-default btn-sm" href="myOrderServlet?action=getAllMyOrderByPage&target=UserMain&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getTotalPageCount()%>">尾页</a>
    
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
							
							<div style="height: 30px;"></div>
							
							
						</div>
						
						
						
					</div>
					
			

					
					<!--猜你喜欢-->
					<div class="think-like">
						<div class="like-head">
							<span>猜你喜欢</span>
						</div>
						<div class="like-left" id="btn-left"><</div>
						<div class="like-right" id="btn-right">></div>
						<div class="like-category">
							<ul class="like-list">
								<div class="categorys1" id="categorys1" style="display: block;">
									<li id="cate">
										<a href="">
											<img src="img/myOrderImg/国美K1.jpg" width="130px" height="130px" 
												alt="国美 (GOME) K1 4GB+128GB 手机 虹膜解锁 墨韵灰"/>
										</a>
										<a href="">
											<span>国美 (GOME) K1 4GB+128GB 手机 虹膜解锁 墨韵灰</span>
										</a>
										<div class="price">￥1999.00</div>
									</li>
									<li>
										<a href="">
											<img src="img/myOrderImg/电风扇.jpg" width="130px" height="130px" 
												alt="美的（Midea）FS40-13CR遥控五叶落地扇/电风扇 （5片AS航空扇叶，7.5小时定时，节能环保，安静低噪）"/>
										</a>
										<a href="">
											<span>美的（Midea）FS40-13CR遥控五叶落地扇/电风扇 （5片AS航空扇叶，7.5小时定时，节能环保，安静低噪）</span>
										</a>
										<div class="price">￥199.00</div>
									</li>
									<li>
										<a href="">
											<img src="img/myOrderImg/电饭煲.jpg" width="130px" height="130px" 
												alt="苏泊尔电饭煲CFXB40FC8040-75"/>
										</a>
										<a href="">
											<span> 苏泊尔电饭煲CFXB40FC8040-75</span>
										</a>
										<div class="price">￥249.00</div>
									</li>
									<li>
										<a href="">
											<img src="img/myOrderImg/牙膏.jpg" width="130px" height="130px" 
												alt="【购买关注详情二维码送半年欧乐B牙膏！】博朗（Braun）欧乐B D16.523U 600 3D声波智能电动牙刷 蓝色版"/>
										</a>
										<a href="">
											<span>【购买关注详情二维码送半年欧乐B牙膏！】博朗（Braun）欧乐B D16.523U 600 3D声波智能电动牙刷 蓝色版</span>
										</a>
										<div class="price">￥259.00</div>
									</li>
									<li>
										<a href="">
											<img src="img/myOrderImg/蓝牙耳机.jpg" width="130px" height="130px" 
												alt="捷波朗（Jabra） BOOST G 蓝牙耳机 商务通话 通用型 耳挂式 黑色"/>
										</a>
										<a href="">
											<span> 捷波朗（Jabra） BOOST G 蓝牙耳机 商务通话 通用型 耳挂式 黑色</span>
										</a>
										<div class="price">￥249.00</div>
									</li>
									
								</div>
								
								
								<div class="categorys2" id="categorys2" style="display: none;">
									<li>
										<a href="">
											<img src="img/myOrderImg/蓝牙耳机.jpg" width="130px" height="130px" 
												alt="捷波朗（Jabra） BOOST G 蓝牙耳机 商务通话 通用型 耳挂式 黑色"/>
										</a>
										<a href="">
											<span> 捷波朗（Jabra） BOOST G 蓝牙耳机 商务通话 通用型 耳挂式 黑色</span>
										</a>
										<div class="price">￥249.00</div>
									</li>
									<li>
										<a href="">
											<img src="img/myOrderImg/电饭煲.jpg" width="130px" height="130px" 
												alt="苏泊尔电饭煲CFXB40FC8040-75"/>
										</a>
										<a href="">
											<span> 苏泊尔电饭煲CFXB40FC8040-75</span>
										</a>
										<div class="price">￥249.00</div>
									</li>
									<li>
										<a href="">
											<img src="img/myOrderImg/牙膏.jpg" width="130px" height="130px" 
												alt="【购买关注详情二维码送半年欧乐B牙膏！】博朗（Braun）欧乐B D16.523U 600 3D声波智能电动牙刷 蓝色版"/>
										</a>
										<a href="">
											<span>【购买关注详情二维码送半年欧乐B牙膏！】博朗（Braun）欧乐B D16.523U 600 3D声波智能电动牙刷 蓝色版</span>
										</a>
										<div class="price">￥259.00</div>
									</li>
									<li>
										<a href="">
											<img src="img/myOrderImg/国美K1.jpg" width="130px" height="130px" 
												alt="国美 (GOME) K1 4GB+128GB 手机 虹膜解锁 墨韵灰"/>
										</a>
										<a href="">
											<span>国美 (GOME) K1 4GB+128GB 手机 虹膜解锁 墨韵灰</span>
										</a>
										<div class="price">￥1999.00</div>
									</li>
									<li>
										<a href="">
											<img src="img/myOrderImg/电风扇.jpg" width="130px" height="130px" 
												alt="美的（Midea）FS40-13CR遥控五叶落地扇/电风扇 （5片AS航空扇叶，7.5小时定时，节能环保，安静低噪）"/>
										</a>
										<a href="">
											<span>美的（Midea）FS40-13CR遥控五叶落地扇/电风扇 （5片AS航空扇叶，7.5小时定时，节能环保，安静低噪）</span>
										</a>
										<div class="price">￥199.00</div>
									</li>
								</div>
								
								
								<div class="categorys3" id="categorys3" style="display: none;">
									<li>
										<a href="">
											<img src="img/myOrderImg/电风扇.jpg" width="130px" height="130px" 
												alt="美的（Midea）FS40-13CR遥控五叶落地扇/电风扇 （5片AS航空扇叶，7.5小时定时，节能环保，安静低噪）"/>
										</a>
										<a href="">
											<span>美的（Midea）FS40-13CR遥控五叶落地扇/电风扇 （5片AS航空扇叶，7.5小时定时，节能环保，安静低噪）</span>
										</a>
										<div class="price">￥199.00</div>
									</li>
									
									<li>
										<a href="">
											<img src="img/myOrderImg/电饭煲.jpg" width="130px" height="130px" 
												alt="苏泊尔电饭煲CFXB40FC8040-75"/>
										</a>
										<a href="">
											<span> 苏泊尔电饭煲CFXB40FC8040-75</span>
										</a>
										<div class="price">￥249.00</div>
									</li>
									<li>
										<a href="">
											<img src="img/myOrderImg/蓝牙耳机.jpg" width="130px" height="130px" 
												alt="捷波朗（Jabra） BOOST G 蓝牙耳机 商务通话 通用型 耳挂式 黑色"/>
										</a>
										<a href="">
											<span> 捷波朗（Jabra） BOOST G 蓝牙耳机 商务通话 通用型 耳挂式 黑色</span>
										</a>
										<div class="price">￥249.00</div>
									</li>
									<li>
										<a href="">
											<img src="img/myOrderImg/牙膏.jpg" width="130px" height="130px" 
												alt="【购买关注详情二维码送半年欧乐B牙膏！】博朗（Braun）欧乐B D16.523U 600 3D声波智能电动牙刷 蓝色版"/>
										</a>
										<a href="">
											<span>【购买关注详情二维码送半年欧乐B牙膏！】博朗（Braun）欧乐B D16.523U 600 3D声波智能电动牙刷 蓝色版</span>
										</a>
										<div class="price">￥259.00</div>
									</li>
									<li>
										<a href="">
											<img src="img/myOrderImg/国美K1.jpg" width="130px" height="130px" 
												alt="国美 (GOME) K1 4GB+128GB 手机 虹膜解锁 墨韵灰"/>
										</a>
										<a href="">
											<span>国美 (GOME) K1 4GB+128GB 手机 虹膜解锁 墨韵灰</span>
										</a>
										<div class="price">￥1999.00</div>
									</li>
									
								</div>
							</ul>
						</div>
					</div>
				</div>
				
			</div>
			
			<div style="clear: both;"></div>
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
							<img src="img/myOrderImg/foot/1.jpg">
							<i class="icon-triangle"></i>
						</div>
					</em>
					<em class="code-sm wap">
						<i></i>
						<p>手机站点</p>
						<div style="display: none;">
							<img src="img/myOrderImg/foot/2.jpg">
							<i class="icon-triangle"></i>
						</div>
					</em>
					<em class="code-bg app">
						<i><a href="#"><img src="img/myOrderImg/foot/3.jpg" /></a></i>
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
		
		
		
	<script type="text/javascript">
		
		$(function(){
			
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
			
		
		
			if(totalPageCount<10){
				
				for(var i =1; i<=totalPageCount;i++){
					$("#requestListDiv").append("<a  class='bootstroop1' id='pagelist'>"+ i +"</a>");
				}
			}else {
				if(currentPage<=5){
					for(var i =1; i<=currentPage+2;i++){
						$("#requestListDiv").append("<a  class='btn btn-default btn-sm' id='pagelist'>"+ i +"</a>");
					}
					$("#requestListDiv").append("<span> &nbsp;...&nbsp; </span>");
					
					$("#requestListDiv").append("<a  class='btn btn-default btn-sm' id='pagelist' >"+ totalPageCount +"</a>");
				}else if(currentPage<totalPageCount-3){
					$("#requestListDiv").append("<a  class='btn btn-default btn-sm' id='pagelist'>"+ 1 +"</a>");
					$("#requestListDiv").append("<span> &nbsp;...&nbsp; </span>");
					for(var i =currentPage-3; i<=currentPage+2;i++){
						$("#requestListDiv").append("<a  class='btn btn-default btn-sm' id='pagelist'>"+ i +"</a>");
					}
					
					$("#requestListDiv").append("<span> &nbsp;...&nbsp; </span>");
					$("#requestListDiv").append("<a  class='btn btn-default btn-sm' id='pagelist'>"+ totalPageCount +"</a>");
					
					
					
				}else{
					$("#requestListDiv").append("<a  class='btn btn-default btn-sm' id='pagelist'>"+ 1 +"</a>");
					
					$("#requestListDiv").append("<span> &nbsp;...&nbsp; </span>");
					for(var i =currentPage-3; i<=totalPageCount;i++){
						$("#requestListDiv").append("<a  class='btn btn-default btn-sm' id='pagelist'>"+ i +"</a>");
					}
				
				
				}
			
			}
			
			$("#requestListDiv").children().click(function(){	

				<%User user = (User)session.getAttribute("user");%>
				var userid = <%=user.getUserid() %>;											
				location.assign("myOrderServlet?action=getAllMyOrderByPage&requestPage="+ $(this).text() +"&userid="+ userid);
		
			});
			
			
		});
		
		
		
		
		//给删除div添加事件
		function deleteOrder1ByOid(oid){
			$.confirm({
				title: '',
				content: '您确认删除吗?',
				confirm: function() {
					
					location.assign("myOrderServlet?action=delete&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&oid=" + oid);
				},
				cancel: function() {
					
				}, 
			});
		}
		
	</script>
		
	</body>
	
		
</html>
