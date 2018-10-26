<%@ page language="java" import="java.util.*,com.vo.*,com.service.inter.*,com.service.impl.*,com.page.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<link rel="shortcut icon" type="image/x-icon" href="img/bit.ico" />
		<link rel="shortcut icon" type="image/x-icon" href="img/bit.ico" />
		<meta charset="utf-8" />
		<title>国美(GOME)-手机</title>
		<link rel="stylesheet" type="text/css" href="css/productlist.css"/>
		<script type="text/javascript" src="js/jquery-2.1.4.js" ></script>
		<script type="text/javascript" src="js/all_product.js" ></script>
		<!-- <link rel="stylesheet" type="text/css" href="css/up.css"/> -->
		<style type="text/css">
			.bootstroop1{
				  color: #333;
				  background-color: #fff;
				  border-color: #ccc;
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
				  padding: 5px 10px;
				  font-size: 12px;
				  line-height: 1.5;
				  border-radius: 3px;
			}
		
		</style>
		<script src="js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/productlist.js" type="text/javascript" charset="utf-8"></script>
		
	</head>
	<body>
		<%
			OrderCondition orderCondition =(OrderCondition)request.getAttribute("orderConditionObj");
			if(orderCondition.getOrderCondition().equals("price")&&orderCondition.getAscOrDesc().equals("desc")){
		%>	
				<script type="text/javascript">
							$(function(){
							
								$("#dao111").trigger("click");
							});
						</script>	
		<%
		}else if(orderCondition.getOrderCondition().equals("pingjiaSum")&&orderCondition.getAscOrDesc().equals("desc")){
			%>	
				<script type="text/javascript">
							$(function(){
							
								$("#dao222").trigger("click");
							});
						</script>	
		<%
		}else if(orderCondition.getOrderCondition().equals("pingjiaSum")&&orderCondition.getAscOrDesc().equals("asc")){
		%>	
				<script type="text/javascript">
							$(function(){
							
								$("#dao222").trigger("click").trigger("click");
							});
						</script>	
		<%
		
		}else if(orderCondition.getOrderCondition().equals("productSum")&&orderCondition.getAscOrDesc().equals("desc")){
		%>	
				<script type="text/javascript">
							$(function(){
							
								$("#dao333").trigger("click");
							});
						</script>	
		<%
		
		
		}else if(orderCondition.getOrderCondition().equals("productSum")&&orderCondition.getAscOrDesc().equals("asc")){
		
		%>	
				<script type="text/javascript">
							$(function(){
							
								$("#dao333").trigger("click").trigger("click");
							});
						</script>	
		<%
		}
		 %>
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
		<div id="txt">
			<div id="logo">
				<a href="#"></a>
			</div>
			<div id="sousuo">
				<form id="searchForm" action="UserProductServlet?action=getPageByQuery" method="post">
					<div class="d1">
						<div id="d1-name">
							<span>商品</span>
							<i></i>
						</div>
					</div>
					<div id="d2">
						<input type="hidden" class="text" id="orderCondition"
							name="orderCondition" value="<%=orderCondition.getOrderCondition() %>" />
						<input type="hidden" class="text" id="ascOrDesc"
							name="ascOrDesc" value="<%=orderCondition.getAscOrDesc() %>" />
						<input type="text" name="searchCondition" id="searchCondition" placeholder="iphone 8" value='${requestScope.searchCondition}'/>
						<button type="submit" id="btn-search" onclick="doSearch()" >搜索</button>
					</div>
				</form>
				
			
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
		<div id="shopping">
			<div id="shopping-top">
			<div id="shopping-top-left">
				
				<h2>
					<span></span>
					<a href="#">全部商品分类</a>
				</h2>
				
			</div>
			
				<ul>
					<li><a href="#"><span>首页</span></a></li>
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
					<span class="tag_newpic"></span>
				</ul>
			
			
			<div id="shopping-top-right">
				<div id="images">
					<ul>
						<li><a href=""><img src="img/T1EGDvBsZg1RCvBVdK.png" /></a></li>
						<!-- 上下轮播图，预留 -->
					</ul>
				</div>
				<div id="images-right">
					<a class="down"><i></i></a>
					<a class="up"><i></i></a>
				</div>
			</div>
		</div>
		</div>
		<!-- 热卖商品栏 -->
		<div id="hotware">
			<div id="hotware-logo"></div>
			<div id="hotware-message">
				<ul class="hotlist">
					<li>
						<p class="h-pic"><a href=""><img src="img/T1Z6AvB_x_1RCvBVdK.jpg"/></a></p>
						<p class="h-name"><a href="">魅族 PRO 7 4+64G 全网通公开版 香槟金 移动联通电信4G手机 双卡双待</a></p>
						<p class="h-price">￥2880.00</p>
						<p class="h-btn"><a href="" class="buy">立即抢购</a></p>
					</li>
					<li>
						<p class="h-pic"><a href=""><img src="img/T1QkWvBmWQ1RCvBVdK.jpg"/></a></p>
						<p class="h-name"><a href="">荣耀（honor）荣耀9 高配版 6GB+64GB 全网通版 魅海蓝</a></p>
						<p class="h-price">￥2699.00</p>
						<p class="h-btn"><a href="" class="buy">立即抢购</a></p>						
					</li>
					<li>
						<p class="h-pic"><a href=""><img src="img/T1T6LvBvCv1RCvBVdK.jpg"/></a></p>
						<p class="h-name"><a href="">OPPO R11 4GB+64GB 全网通 4G手机 双卡双待手机 红色</a></p>
						<p class="h-price">￥2999.00</p>
						<p class="h-btn"><a href="" class="buy">立即抢购</a></p>
					</li>
					<li>
						<p class="h-pic"><a href=""><img src="img/T1L6JvBjYv1RCvBVdK.jpg"/></a></p>
						<p class="h-name"><a href="">华为畅享7 (SLA-AL00) 3GB+32GB 全网通 双卡双待 香槟金</a></p>
						<p class="h-price">￥1099.00</p>
						<p class="h-btn"><a href="" class="buy">立即抢购</a></p>
					</li>
				</ul>
			</div>
		</div>
		<!-- 手机>手机通讯>手机 -->
		<div id="phonetext">
			<span class="phonetext-1">手机</span>
			
			<div class="phonetext-2">
				<dt class="phonetext-2d"></dt>
				<dt class="phonetext-2dt">手机通讯</dt>
			</div>
			
			<div class="phonetext-3">
				<dt class="phonetext-3d"></dt>
				<dt class="phonetext-3dt">手机</dt>				
			</div>
		</div>
		<!-- 手机>商品筛选 -->
		<div id="phoneselect">
			<span class="select">
				<b>手机</b>
				商品筛选
			</span>
			<span class="number">
				共3397个商品
			</span>
		</div>
		<!-- 选显卡-筛选条件 -->
		<div id="chooise-tab">
			<div id="option-logo">
				
				<span id="pinpai">
					品牌:
				</span>
				
		
					<ul id="ul1">
						<li><a href=""><img src="img/T1H.bTBsJv1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T1OUbTBvbT1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T1tUWTBXKT1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T1t.CvBXWT1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T14cATBmdT1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T1uEbTBybv1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T1JoETBjbv1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T1KZ_TB5Av1RCvBVdK.jpg"/></a></li>
					</ul>
				
					<ul id="ul2">
						<li><a href=""><img src="img/T1EUKTBgYT1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T1omYTBjYT1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T1O5JTBvEv1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T1cZVTBshv1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T10.ZTByW_1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T1x5ZTB4h_1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T11khTB7d_1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T1QGCTBsDj1RCvBVdK.png"/></a></li>
					</ul>	
					
					<ul id="ul3">
						<li><a href=""><img src="img/T10.ZTByW_1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T1x5ZTB4h_1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T1tUWTBXKT1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T1H.bTBsJv1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T1OUbTBvbT1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T1tUWTBXKT1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T1t.CvBXWT1RCvBVdK.jpg"/></a></li>
						<li><a href=""><img src="img/T10.ZTByW_1RCvBVdK.jpg"/></a></li>
					</ul>

				<span id="more">
					+更多
				</span>
				
				
			</div>
			
			<div id="option-price">
				
				<p id="price-name">价格:</p>
				
				<a >
					0-499
				</a>
				
				<a >
					500-999
				</a>
				
				<a >
					1000-1699
				</a>
				
				<a >
					1700-2799
				</a>
				
				<a >
					2800-4499
				</a>
				
				<a >
					4500-11999
				</a>
				
				<a >
					12000以上
				</a>
				
				<p id="price-more">+更多</p>
			</div>
			
			<div id="option-xitong">
				<p id="xitong-name">操作系统:</p>
				
				<span id="">
					安卓(Android)
				</span>
				
				<span id="">
					微软(WindowsPhone)
				</span>
				
				<span id="">
					苹果(IOS)
				</span>
				
				<span id="">
					无
				</span>
				
				<span id="">
					其他
				</span>
				
				<p id="xitong-more">+更多</p>
			</div>
					
			<div id="option-www">
				<p id="www-name">网络制式:</p>
				
				<span id="">
					全网通4G
				</span>
				
				<span id="">
					移动4G
				</span>
				
				<span id="">
					联通4G
				</span>
				
				<span id="">
					电信4G
				</span>
				
				<span id="">
					双卡
				</span>
				
				<span id="">
					双卡单4G
				</span>
				
				<span id="">
					双卡双4G
				</span>
				
				<span id="">
					其他
				</span>
				<p id="www-more">+更多</p>
			</div>
			
			<div id="option-screen">
				<p id="screen-name">屏幕尺寸:</p>
				
				<span id="">
					5.6英寸及以上
				</span>
				
				<span id="">
					5.5-5.1英寸
				</span>
				
				<span id="">
					5.0-4.6英寸
				</span>
				
				<span id="">
					4.5-3.1英寸
				</span>
				
				<span id="">
					其他
				</span>
				
				<p id="screen-more">+更多</p>
			</div>
		
			<div id="option-color">
				<p id="color-name">颜色:</p>
				
				<span id="">
					黑色
				</span>
				
				<span id="">
					白色
				</span>
				
				<span id="">
					金色
				</span>
				
				<span id="">
					粉色
				</span>
				
				<span id="">
					红色
				</span>
				
				<span id="">
					黄色
				</span>
				
				<span id="">
					灰色
				</span>
				
				<span id="">
					蓝色
				</span>
				
				<span id="">
					紫色
				</span>
				
				<span id="">
					其它
				</span>
				
				<p id="color-more">+更多</p>
			</div>
		
			<div id="kongzhi" >
				<span id="">
					更多选项 (网络制式，屏幕尺寸，颜色...)
				</span>
			</div>
		</div>
		<!-- 商品展示 -->
		<div id="show">
			<!-- 商品展示左侧区域 -->
			<div id="show-left">
				<div id="store">
					<h3>
						<i>广告</i>
						店铺精选
					</h3>
					
					<ul>
						
						
						<li>
							<div class="pic">
								<a href=""><img src="img/T1.ZWTBCYv1RCvBVdK_210-210.jpg"/></a>
							</div>
							
							<div class="price">
								￥<span>3199.00</span>
							</div>
							
							<div class="name">
								<a href="">OPPO R9s Plus 6GB+64GB 全网通 4G手机 双卡双待手机 黑色</a>
							</div>
							
							<div class="adver">
								6.0英寸大屏，前后1600万像素！光学防抖！R11Plus热销中！
							</div>
						</li>
										
						<li>
							<div class="pic">
								<a href=""><img src="img/T1_cEvBjKj1RCvBVdK_210.jpg"/></a>
							</div>
							
							<div class="price">
								￥<span>2999.00</span>
							</div>
							
							<div class="name">
								<a href="">荣耀（honor）荣耀9 尊享版 6GB+128GB 全网通版 海鸥灰</a>
							</div>
							
							<div class="adver">
								“一眼一世界，开启你的虹膜空间”，荣获2017年IF设计大奖，5.2英寸屏幕，虹膜安全手机，安全快充
							</div>
						</li>
										
						<li>
							<div class="pic">
								<a href=""><img src="img/T1f6ZvBXhg1RCvBVdK_210.jpg"/></a>
							</div>
							
							<div class="price">
								￥<span>1799.00</span>
							</div>
							
							<div class="name">
								<a href="">国美 (GOME K1 4GB+64GB 移动联通电信 手机 虹膜解锁  墨韵灰</a>
							</div>
							
							<div class="adver">
								一眼一世界，开启你的虹膜空间”，荣获2017年IF设计大奖，5.2英寸屏幕，虹膜安全手机，安全快充
							</div>
						</li>
												
					</ul>
				</div>
				
				<div id="volume">
					<h3>
						一周销量排行榜
					</h3>
					
					<ul>
						<li>
							<p class="volume-num">1</p>
							
							<div class="volume-show">
								<p class="show-pic">
									<a href=""><img src="img/T1sKYvB4Ks1RCvBVdK_160.jpg"/></a>
								</p>
								<p class="volume-name">
									<a href="">荣耀（honor）荣耀V9play 高配版 4GB+32GB 全网通版 极光蓝</a>
								</p>
								<p class="volume-price">
									<em>￥<span>1199.00</span></em>
								</p>
							</div>
						</li>
						
						<li>
							<p class="volume-num">2</p>
							
							<div class="volume-show">
								<p class="show-pic">
									<a href=""><img src="img/T1bSxTBjEb1RCvBVdK_160.jpg"/></a>
								</p>
								<p class="volume-name">
									<a href="">小米(MI)红米Note4X 高配版 手机 4GB+64GB 磨砂黑</a>
								</p>
								<p class="volume-price">
									<em>￥<span>1299.00</span></em>
								</p>
							</div>
						</li>
						
						<li>
							<p class="volume-num">3</p>
							
							<div class="volume-show">
								<p class="show-pic">
									<a href=""><img src="img/T1FUCvBXZg1RCvBVdK_160.jpg"/></a>
								</p>
								<p class="volume-name">
									<a href="">小米(MI) 红米4A 2GB+16GB 全网通版 4G手机 双卡双待</a>
								</p>
								<p class="volume-price">
									<em>￥<span>599.00</span></em>
								</p>
							</div>
						</li>
						
						<li>
							<p class="volume-numm">4</p>
							
							<div class="volume-show">
								<p class="show-pic">
									<a href=""><img src="img/T1KIETByL_1RCvBVdK_160.jpg"/></a>
								</p>
								<p class="volume-name">
									<a href="">Apple iPhone 6 32G 金色 移动联通电信4G手机</a>
								</p>
								<p class="volume-price">
									<em>￥<span>2398.00</span></em>
								</p>
							</div>
						</li>
						
						<li style="border-bottom: none">
							<p class="volume-numm">5</p>
							
							<div class="volume-show">
								<p class="show-pic">
									<a href=""><img src="img/T1LcZvBvVg1RCvBVdK_160.jpg"/></a>
								</p>
								<p class="volume-name">
									<a href="">荣耀（honor）荣耀9 高配版 6GB+64GB 全网通版 琥珀金</a>
								</p>
								<p class="volume-price">
									<em>￥<span>2699.00</span></em>
								</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!-- 商品展示右侧区域 -->
			<div id="show-right">
				<div id="dao+chooise">
					<!-- 上面导航栏 -->
					<div id="dao">	
						<!-- 类型 -->
						<ul class="dao-ul">
							<li id="dao111" class="dao-li1"><a id="price"  href="javascript:void(0);">价格</a><i></i></li>
							<li id="dao222" class="dao-li"><a id="pingjiaSum" href="javascript:void(0);" >评价</a><i></i></li>
							<li id="dao333" class="dao-li"><a id="productSum" href="javascript:void(0);" >库存</a><i></i></li>

						</ul>
						<!-- 价格区间 -->
						<ul class="dao-ull">
							<li>
								<input type="text" name="" id="" value="￥" />
							</li>
							<li class="dao-ull-li2">-</li>
							<li>
								<input type="text" name="input2" id="input2" value="￥" />
							</li>
						</ul>
						<!-- 翻页 -->
						<div class="dao-page">
							<span >
								1/71
							</span>
							<a href="" class="dao-page-a1"> > </a>
							<a href="" class="dao-page-a2"> < </a>
						</div>
					
					</div>
					<!-- 送货地址 其他选项 -->
					<div id="chooise">
						<div class="chooise-addres">
							<span id="addres-span1">送至：</span>
							<span id="addres-span2">
								<a href="">北京市朝阳区朝外街道</a>
								<i></i>
							</span>
						</div>
						<div class="chooise-check">
							<a href="" class="chooise-check-a"><i></i>国美自营</a>
							<a href="" class="chooise-checked"><i></i>仅显示有货</a>
							<a href="" class="chooise-check-a"><i></i>真划算</a>
							<a href="" class="chooise-check-a"><i></i>返利</a>
							<label class="chooise-check-label"><i></i><img src="img/T1SPYvBg_j1RCvBVdK.png"/></label>
						</div>
					</div>
				</div>
			<% Product product = (Product)request.getAttribute("product");
				PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
				
		 %>
		 	
				<div id="product">
					<ul>
						<% 
							List<Product> list = (List<Product>)request.getAttribute("list");
							for(Product productlist:list){
								System.out.println("productlist="+productlist);
						%>
						<li>
							<a href="UserProductServlet?action=getOneProduct&pid=<%=productlist.getPid()%>">
								<img src="img/T1qgZvB5Ej1RCvBVdK_210.jpg"/>
					
								<div class="product-price">
									<p>
										<span class="product-price-1"><%=productlist.getPrice() %></span>
										<span class="product-price-2">返利</span>
									</p>
								</div>
								<p class="product-ite1"><a href=""><%=productlist.getPname()%></a></p>
								<p class="product-ite2"><%=productlist.getPdesc() %></p>
								<p class="product-ite3">
									<a href="">
										<span>已有</span>
										<%=productlist.getPingjiaSum() %>
										<span>人评价</span>
									</a>					
								</p>
								<p >
									<span><%=productlist.getDianpuName() %></span>
								</p>
								<p class="product-ite5">
									<span class="ite5-s1"><i></i></span>
									<span class="ite5-s2"><i></i></span>
									<span class="ite5-s3"><i></i></span>
									<span class="ite5-s4"><i></i></span> 
								</p>
							</a>	
						</li>
						
						
									<%	
									}
								 %>
						
						
				
					
					</ul>
				</div>
			
				<div id="tiaozhuan" style="float:right; padding-top:40px;padding-bottom:30px">
			<form id="categoryForm2" action="UserProductServlet?action=getPageByQuery&cid=<%=product.getCid()%>&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}" method="post">
				<input type="hidden" name="searchCondition" value="${requestScope.searchCondition}"/>
				<a id="previous" class="bootstroop1" href="UserProductServlet?action=getPageByQuery&requestPage=<%=pageInfo.getPreviousPage()%>&cid=<%=product.getCid()%>&searchCondition=${requestScope.searchCondition}&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}"> 上一页</a>
				<div id = "requestListDiv" style="display:inline-block;"> </div>
				
				<a id="next" class="bootstroop1" href="UserProductServlet?action=getPageByQuery&requestPage=<%=pageInfo.getNextPage()%>&cid=<%=product.getCid()%>&searchCondition=${requestScope.searchCondition}&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}"> 下一页</a>
				  <span class="mySpan">
    
    				<span>共<%=pageInfo.getTotalPageCount()%>页</span>
   					 <span>到第<input id ="requestPage" type="text" value ="<%=pageInfo.getCurrentPage()%>" style="width:20px;padding-left:5px"> 页</span>	
    
    	
    				<input id="sure" class="bootstroop1"  value="确定" style="width:28px"/> 
  			 </span>
			</form>
			</div>
				
				
				
				
			</div>
		
			
			
		</div>
		<!-- 底层商品栏 -->
		<div id="hotware1">
			<div id="hotware-logo"></div>
			<div id="hotware-message">
				<ul class="hotlist">
					<li>
						<p class="h-pic"><a href=""><img src="img/T1Z6AvB_x_1RCvBVdK.jpg"/></a></p>
						<p class="h-name"><a href="">魅族 PRO 7 4+64G 全网通公开版 香槟金 移动联通电信4G手机 双卡双待</a></p>
						<p class="h-price">￥2880.00</p>
						<p class="h-btn"><a href="" class="buy">立即抢购</a></p>
					</li>
					<li>
						<p class="h-pic"><a href=""><img src="img/T1QkWvBmWQ1RCvBVdK.jpg"/></a></p>
						<p class="h-name"><a href="">荣耀（honor）荣耀9 高配版 6GB+64GB 全网通版 魅海蓝</a></p>
						<p class="h-price">￥2699.00</p>
						<p class="h-btn"><a href="" class="buy">立即抢购</a></p>						
					</li>
					<li>
						<p class="h-pic"><a href=""><img src="img/T1T6LvBvCv1RCvBVdK.jpg"/></a></p>
						<p class="h-name"><a href="">OPPO R11 4GB+64GB 全网通 4G手机 双卡双待手机 红色</a></p>
						<p class="h-price">￥2999.00</p>
						<p class="h-btn"><a href="" class="buy">立即抢购</a></p>
					</li>
					<li>
						<p class="h-pic"><a href=""><img src="img/T1L6JvBjYv1RCvBVdK.jpg"/></a></p>
						<p class="h-name"><a href="">华为畅享7 (SLA-AL00) 3GB+32GB 全网通 双卡双待 香槟金</a></p>
						<p class="h-price">￥1099.00</p>
						<p class="h-btn"><a href="" class="buy">立即抢购</a></p>
					</li>
				</ul>
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
		<!-- 右侧竖条 -->
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
		
	<script type="text/javascript">
		
			$(function(){
				
				$("#sure").click(function(){
					var requestPage = $("#requestPage").val();
					location.assign("UserProductServlet?action=getPageByQuery&requestPage="+ requestPage+"&cid=<%=product.getCid()%>&searchCondition=${requestScope.searchCondition}&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}");
				
				});
				
				var currentPage = <%=pageInfo.getCurrentPage() %>
				var totalPageCount = <%=pageInfo.getTotalPageCount()%>;
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
						location.assign("UserProductServlet?action=getPageByQuery&requestPage="+ $(this).text() +"&cid=<%=product.getCid()%>&searchCondition=${requestScope.searchCondition}&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}");
				
					});
				//第一页时 "首页"和上一页不能用
				if(currentPage==1){
					$("#previous").addClass("disabled");
				}else if(currentPage==totalPageCount){
					//最后一页时 "下一页"和"尾页"不能能用
					$("#next").addClass("disabled");
				} 
				
				
				
				var  lastAscOrDesc = "${orderConditionObj.ascOrDesc}";
				//给价格超链接绑定事件   第一次点击降序 第二次点击升序  第三次降序 第四次 升序  依次类推
				$("#price").click(function(){
				
				
					
					if(lastAscOrDesc=="asc"){//先降序
						
						var target = "UserProductServlet?action=getPageByQuery&cid=<%=product.getCid()%>&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&orderCondition=price&ascOrDesc=desc";
						
						location.assign(target);
					}else if(lastAscOrDesc=="desc"){
					
						var target = "UserProductServlet?action=getPageByQuery&cid=<%=product.getCid()%>&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&orderCondition=price&ascOrDesc=asc";
					
						location.assign(target);
					}
					
				});
				
				//给评价超链接绑定事件  
				$("#pingjiaSum").click(function(){
				
				
					
					if(lastAscOrDesc=="asc"){//先降序
						
						var target = "UserProductServlet?action=getPageByQuery&cid=<%=product.getCid()%>&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&orderCondition=pingjiaSum&ascOrDesc=desc";
						
						location.assign(target);
					}else if(lastAscOrDesc=="desc"){
					
						var target = "UserProductServlet?action=getPageByQuery&cid=<%=product.getCid()%>&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&orderCondition=pingjiaSum&ascOrDesc=asc";
					
						location.assign(target);
					}
					
				});
				
				//给库存超链接绑定事件  
				$("#productSum").click(function(){
				
				
					
					if(lastAscOrDesc=="asc"){//先降序
						
						var target = "UserProductServlet?action=getPageByQuery&cid=<%=product.getCid()%>&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&orderCondition=productSum&ascOrDesc=desc";
						
						location.assign(target);
					}else if(lastAscOrDesc=="desc"){
					
						var target = "UserProductServlet?action=getPageByQuery&cid=<%=product.getCid()%>&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&orderCondition=productSum&ascOrDesc=asc";
					
						location.assign(target);
					}
					
				});
				
				/*按价格筛选  */
				$("#option-price a").each(function(){
					 $(this).attr("href", "UserProductServlet?action=screenProductByPrice&price="+$(this).text());
				})
			});
			
			
			
		</script>
	
	</body>
</html>
