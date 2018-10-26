<%@ page language="java" import="java.util.*,com.vo.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<link rel="shortcut icon" type="image/x-icon" href="img/bit.ico" />
		<title>订单信息_国美</title>
		<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
		<link href = "css/html.css" type = "text/css" rel = "stylesheet"/>
		<link href = "css/up.css" type = "text/css" rel = "stylesheet"/>
		<style type="text/css">
			.xuanzhong{
				border:2px solid #e3101e;
			}
			
		</style>
		<script type="text/javascript" src = "js/jquery-2.1.4.js"></script>
		<script type="text/javascript" src="js/hashMap.js"></script>
		<script type="text/javascript" src = "js/jquery.validate.js"></script>
		<script type="text/javascript" src = "js/javascriptaddress.js"></script>
		<script src="js/provinceSelect.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/orderCheck.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body class = "w">
		
		<%
             User user = (User)session.getAttribute("user");
             Address address=(Address)request.getAttribute("address");
           
        %>

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
						<%
						
					
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
							<a target="_blank"  href="myOrderServlet?action=getAllMyOrderByPage&requestPage=1&userid=<%=user.getUserid() %>">我的订单</a>
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
									<a href=""><img src="img/orderimg/no-img_mid_.jpg" width="60" height="60"></a>
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
								<img src="img/orderimg/1.jpg" alt="关注国美">
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



		<div id = "gome-head">
			<div id = "logo">
				<a href = "" ><div class = "pianyi"></div></a>
			</div>
			<div id = "head-title">
				订单信息
			</div>
		</div>
		<div id = "address">
			<div class= "customerMessage">
				<h3 class = "titleh3">收货人信息</h3>
				<div id = "newAddress_btn">
					<a href="javascript:void(0)" >
						
						+&nbsp;&nbsp;新增收货人地址
					</a>
				</div>
				<div style="clear: both;"></div>
			</div>
			<%
			
			
   					List<Address> list1 = (List<Address>)request.getAttribute("list1");
					if(list1.size()==0){
					%>
						<script type="text/javascript">
							$(function(){
							
								$('#newAddress_btn').find("a").trigger("click");
							});
						</script>					
					<% 
					}else{
		
    					for(Address address1:list1){
    			
   					%>
			<div class = "dizhi" onclick="chanceAddress(<%=address1.getAid()%>)" style="cursor:pointer">
			
				<div class="pepolemessage">
				
				
					<div class = "messagebody" id = "messagebody">
					
	
					
						<div id = "peoplename" style="border: 2px solid #E6E6E6;">
							<%=address1.getAname()%>
							
						</div>
						
						<div class="jutidizhi">
							<span id="address1"><%=address1.getAprovince()%>省</span>
							<span id="address2"><%=address1.getAcity()%>市</span>
							<span id="address3"><%=address1.getAdetailed()%></span>
							<span id="phone"><%=address1.getAphone()%></span>
						
							<div id="caozuo">
								<span class = "xiugai" ><a  href ="javascript:void(0)" onclick="xiugaiaddress(<%=address1.getAid()%>)">修改</a></span>
								<span class = "shanchu"><a  href ="AddressServlet?action=delete&aid=<%=address1.getAid()%>">删除</a></span>
							</div>
						</div>
					
						
					
					</div>
					
				
				</div>
					<div class="" id="duihao"></div>
			</div>
			<%} %>
			
			<%} %>
		</div>
	
		
		<div id = "payment">
			<div>
				<h3 class = "titleh3">支付方式</div></h3>
				<div style = "clear:both;"></div>
			</div>
			
			<div class="content">
				<div id = "content1" class= "checkedstyle">在线支付 <div class = "duihao"></div></div>
				<div id = "content2">货到付款 <div ></div></div>
				<div id = "content3">信用卡分期 <div ></div></div>
				<div id = "content4">公司转账 <div ></div></div>
				<div id = "content5">邮局汇款 <div ></div></div>
				<div id = "content6">门店付款 <div ></div></div>
				
				
			</div>
		</div>
		<div id = "listOfItem" class = "container listOfItem">
			<div class="clearfix">
				<h3 class = "titleh3">送货清单</h3>
				<p class ="f1tip">
					大家电配送时部分偏远地区需额外收取远程费
					<a href="//help.gome.com.cn/question/9.html" target="query" style ="color: #069;text-decoration: none;" id = "f1tipa">
					     查看详情 >        
					 </a>
				</p>
				<div id = "goback_btn">
					<a href="ShoppingCartServlet?action=queryShoppingCart" >
						
						返回购物车修改
					</a>
				</div>
				<div class = "priceshuoming">
					<div id = "tanhao"></div>
					价格说明
				</div>
				<div style = "clear:both"></div>
			</div>
	
			<div class = "infoH">
				<%
   					List<Product> list = (List<Product>)request.getAttribute("list");
						
					double productTotalPrice = 0;
					
					int productTotalSum = 0;					
   					if(list!=null){
   					
   		
    					for(Product product:list){
    					
    						int shoppingCarSum = product.getShoppingCarSum();
    						productTotalSum = productTotalSum + shoppingCarSum;
    						
    						double price = product.getPrice();
    						double singleProductTotalPrice = price * shoppingCarSum;
    						productTotalPrice = productTotalPrice + singleProductTotalPrice;
   				%>
				<div class = "info-bd" >
				
					
					<div class = "backStyle0">
						<span class = "hcon">配送信息</span>
						<div class = "fr"><span class = "shipfee">运费：¥0.00</span></div>
						<span class = "fomesend"><%=product.getDianpuName() %></span>
						
					</div>
					<div class ="dilivery">
						<div class = "sideleft">
							<div class = "all_listpay">
								<div class = "mb15">
									<h4 class= "send_way">配送方式</h4>
									<div class = "priceshuoming" id = "duiying">
										<a href = ""><div id = "tanhao" class = "send_wayimage"></div>
											<span class= "f1">对应商品</span>
										</a>
									</div>

									<div style ="clear: both;"></div>
								</div>
							</div>
							<div class = "Express">
								<div class = "dispatfont">
									<div class = "h28">
											国美快递
											<div class = "duihao"></div>
									</div>
								</div>
							</div>
							<div class = "otherTime">
								<div class ="f1">配送时间：</div>
								<div class = "chooseTime" style="margin-left:60px ">
									<div class="chooseDay">
										<label class= "check_show">
											<span class = "redyuanxin"></span>
											工作日送
										</label>
										<label class= "check_show">
											<span class = "yuanxin"></span>
											双休日、假日送
										</label>
										<label class= "check_show">
											<span class = "yuanxin"></span>
											工作日、双休日、假日送
										</label>
									</div>
								</div>
							 </div>
							<p class = "beizhu">
								<span class= "remarks" id="beizhu" >备注：</span>
								<label class ="remarklabel">
									<input class  ="form-control" type= "text" style="width: 250px;height: 30px" mouseover="beizhu()" placeholder="最多输入30个字"></input>
								</label>
							</p>

						</div>
						<div class = "sideright">

							<ul class  ="gmlist">
							
							
								
							
							
							
								<li class= "gmlist_li">
									<div class ="clearfix">
										<a class  ="imgLink" target="blank" href = "">
											<img src = "img/productImage/<%=product.getDetailSmallImg1()%>"/>
										</a>
										<div class ="commoditycon">
											<p>
												<a class ="p-name" href="" target="blank" title="小米(MI)红米Note4X 高配版 手机 4GB+64GB 磨砂黑">
													<%=product.getPname()%>
												</a>
											</p>
											<p class ="p-ins">
												<span class="fontRed">￥<%=price%></span>
												<span class="fontGray">x <%=shoppingCarSum%></span>
												<span class="fontGray1">有货</span>
											</p>
											<p class="">
												<span class="support-server">
													<i class="x-i"></i>
													<span class="c449">支持7天无理由退货</span>
												</span>
											</p>
											<p style="clear: both"></p>
										</div>
									</div>
								</li>
								
								
												     
								
							</ul>
						</div>
					</div>
					<div style="clear: both"></div>
				</div>
				<%		}
								}
				%>
			</div>
			
		</div>
		
		
		
		<div id = "invoice" class  ="container">
			<div class="invoice">
				<h3 class  ="invoice_h3" style = "padding-top:10px;">发票信息</h3>
				<ul class= "invoice-lists">
					<li>
						<span class ="mr15" id="faPiaoName">陈行</span>
						<span class ="mr15">电子发票</span>
						<span class ="mr15">明细</span>
						<a class ="ml20" href="javascript:void 0">修改</a>
					</li>
				</ul>
			</div>
		</div>
		<div id ="preferential" class="container">
			<div class="yonghu">
				<div class="yhzc_title">
					<h3 class="title_color">
						使用优惠 / 抵用
						<em class="c_i"></em>
					</h3>
					<div class="huodong">
						<span class="hdtip">美口令</span>
						<div class="triangle"></div>
					</div>
				</div>
				<div class="info_bd">
					<ul class= "backStyle">
						<li class = "active">优惠券</li>
						<li>美通卡</li>
						<li>美豆</li>
						<li>美口令</li>
						<li>推荐号</li>
					</ul>
					<div class="coupon_box">
						<div class="redCard_act">
							<div class="activyhq">
								<span class="gomeactivate">
									<em class  ="jiahao"></em>
									激活优惠券
								</span>
								<span class="fontGray2">国美或者国美合作方发放的优惠券</span>
							</div>
						</div>
						<div class="redCard_box">
							<form class="active_form">
								<table>
									<tr>
										<td style="font:14px arial;">请输入兑换码：</td>
										<td>
											<input class="form_control" style="width: 135px;" placeholder="编码" />
											-
										</td>
										<td>
											<input class="form_control" placeholder="激活码" />
											-
										</td>
										<td>
											<input class="form_control" style="width: 75px;"placeholder="验证码" />
										</td>
										<td>
											<span class="nVa">
												<img src="https://imgcode.gome.com.cn/getimage.no?type=gome_cart&capCd=1505980450528">
											</span>
										</td>
										<td>
											<a  class="changeOne" href="javascript:void(0)">换一张</a>
										</td>
										<td>
											<a  class="jihuo" href="javascript:void(0)"> 激活</a>
										</td>
									</tr>
								</table>
							</form>
						</div>
						<div class="nocoupontip">
							您暂无优惠券可以使用
						</div>
					</div>
					<div class="jedy">
						金额抵用:
						<em style="color: #e3101e;font-size: 16px; font-style: normal;">¥0.00</em>
					</div>
				</div>
			</div>
			
		</div>
		<div id="commitOrder">
			<div class="commitOrderbody">
				<p class="text_right">
					<span class="allprice">¥<%=productTotalSum%></span>
					<span class="fr">
						<em class="acount"><%=list.size()%></em>件商品，总金额：
					</span>
				</p><br/>
				<p class="text_right">
					<span class="allprice">-¥0.00</span>
					<span class="fr">
						优惠卷：
					</span>
				</p><br/>
				<p class="text_right">
					<span class="allprice">-¥0.00</span>
					<span class="fr">
						美通卡：
					</span>
				</p><br/>
				<p class="text_right">
					<span class="allprice">-¥0.00</span>
					<span class="fr">
						美豆 ：
					</span>
				</p><br/>
				<p class="text_right">
					<span class="allprice">-¥0.00</span>
					<span class="fr">
						美口令 ：
					</span>
				</p><br/>
				<p class="text_right">
					<span class="allprice">+¥0.00</span>
					<span class="fr">
						 运费 ：
					</span>
				</p><br/>
				<div style="height: 28px;"></div>

			</div>
			
		</div>
		<div class="sure">
			<div class="text_pay">
					<div class="paybuttom">
						<a id = "id_commit"href="javascript:void(0)" onclick="tijiao()">
							提交订单
						</a>
					</div>
					<span class="fr">
						应付款总金额：
						<em class ="allacount">¥<%=productTotalPrice%></em>
					</span>
					<span class="f1m120"></span>
			</div>
		</div>
		<div class="ds">
			<div style="float: right;">
				<div class="text_right">
					<div class="i_block">送货地址：</div>
					<div class=" i_block2 "  id="sureAddress">大族企业湾</div>
				</div>
				<p class="text_right" style="padding-bottom:10px">
					<span class="mr10" id="sureNname"></span>
					<span class="mr10" id="sureNumber"></span>
				</p>
			</div>
		</div>
		
		<div id ="gome_foot">
			<div id="gome_foot_box">
				<ul>
            	<li><a href="http://igome.com/" target="_blank" rel="nofollow">国美集团</a></li>
            	<li><a  href="//www.gomegj.com/" target="_blank" rel="nofollow">国美管家</a></li>
            	<li><a  href="//help.gome.com.cn/about/company.html" target="_blank" rel="nofollow">关于国美</a></li>
           	 	<li><a  href="//zp.gome.com.cn" target="_blank" rel="nofollow">加入我们</a></li><li>|</li>
            	<li><a  href="//brand.gome.com.cn/" target="_blank" rel="nofollow">品牌大全</a></li>
            	<li><a  href="//www.gome.com.cn/topic/" target="_blank" rel="nofollow">商品专题</a></li>
            	<li><a  href="//www.gome.com.cn/pifa/" target="_blank" rel="nofollow">批发大全</a></li>
           		<li><a  href="//www.gome.com.cn/hotwords/" target="_blank" rel="nofollow">热词搜索</a></li>
            	<li><a  href="//www.gome.com.cn/links/" target="_blank" rel="nofollow">友情链接</a></li>
           		<li><a  href="//news.gome.com.cn/4-8ef49f4b-1-8.html" target="_blank" rel="nofollow">风险监测</a></li><li>|</li>
           		<li><a  href="//cps.gome.com.cn/" target="_blank" rel="nofollow">销售联盟</a></li>
           		<li><a  href="//www.gome.com.cn/join/" target="_blank" rel="nofollow">商家入驻</a></li>
        		</ul>
        		<p>
        			本公司游戏产品适合18岁以上成年人使用&nbsp;&nbsp;违法和不良信息举报电话：021-60766055&nbsp;&nbsp;
        			<a class="interDrug" href="http://gfs13.gomein.net.cn/T1cPYvBmYT1RCvBVdK.jpg" target="_blank">
        				互联网药品信息服务资格证编号（京）-经营性-2013-0011
        			</a>
        		</p>
        		<p>
        			国美在线电子商务有限公司  办公地址:上海市嘉定区沪宜公路3163-3199号一楼A区  客服电话:4008708708       			
        		</p>
        		<p>
        			©2000-2017  国美在线电子商务有限公司版权所有  京公安网备11010502027062  沪ICP备11009419号  沪B2-20120004号
        		</p>
        		<div class="gome-foot-credit">
           			<a class="credit-baxx" href="https://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&amp;entyId=dov73ne26zbqpugb8ivnfez35upwknav4n" target="_blank" rel="nofollow"><i></i><b>经营性网站备案信息</b></a>
           			<a class="credit-xypj" href="https://ss.knet.cn/verifyseal.dll?sn=2011071100100011373&amp;comefrom=trust" target="_blank" rel="nofollow"><i></i><b>可信网站信用评价</b></a>
        		    <a class="credit-cxwz" href="http://search.cxwz.org/cert/l/CX20111018000607000618" target="_blank" rel="nofollow"><i></i><b>诚信网站</b></a>
            		<a class="credit-hdjc" href="http://www.bj.cyberpolice.cn/index.do" target="_blank" rel="nofollow"><i></i><b>朝阳网络警察</b></a>
            		<a class="credit-wgdj" href="http://shwg.dianping.com/index.html" target="_blank" rel="nofollow"><i></i><b>网购大家评</b></a>
            		<a class="credit-report" href="http://www.shjbzx.cn/" target="_blank" rel="nofollow"><i></i><b>上海市互联网违法和不良信息举报中心</b></a>
        </div>
			</div>
		</div>
		<div class="gui_modal"></div>
		<div class="addchuangkou">
			<div id ="add_newAddress">
				<!--<div class="addmoreAddress">
					<em class="pads"></em>
					<div class="moreCity">
						
					</div>
				</div>-->
			<form action="AddressServlet" method="post" id="form-address">
				<input type="hidden" name="action" value="add"/>
				<div class="addInput">
					<a id="closeaddress" href="javascript:void(0)"></a>
					<ul id ="id_addtab">
						<li class="addtab_active">配送上门</li>
						<li class="mlf6 unactive">
							门店自提
							<span class="mian">
								免运费
								<b class="sanjiao"></b>
							</span>
						</li>
					</ul>
					<div class="contentTab" style="display: block;">
						<div class="add_table">
							<table width="100%">
								<tbody>
									<tr>
										<td  align="right" id="td1">
											<i style="color:#e3101e; list-style: none;">*</i>
											收货人：
										</td>
										<td colspan="4">
											<input class="form_control_tan" type="text"  id="username" name="aname" maxlength="24"/>
											<span class="position1" id="name_yanzheng"></span>
										</td>
									</tr>
									<tr>
										<td align="right">
											<i style="color:#e3101e; list-style: none;">*</i>
											所在地：
										</td>
										<td colspan="4">
											<select name="aprovince" id="province" onchange="createCitySelect();">
												<option value="北京">北京</option>
												<option value="山东">山东</option>
												<option value="河北">河北</option>
												<option value="福建">福建</option>
												<option value="新疆">新疆</option>
											</select>
											
										
											<select name="acity" id="city">
												<option value="beijing">北京</option>
												<option value="shandong">..</option>
												
											</select>
	
										</td>
									</tr>
									<tr>
										<td  align="right" id="td1">
											<i style="color:#e3101e; list-style: none;">*</i>
											详细地址：
										</td>
										<td colspan="4">
											<input class="form_control_tan" type="text" style="width: 520px;" name="adetailed" maxlength="80" id="detailAddress"/>
											<span class="position1"  id="detailAddress_yanzheng"></span>
										</td>
									</tr>
									<tr>
										<td  align="right" id="td1">
											<i style="color:#e3101e; list-style: none;">*</i>
											手机号码：
										</td>
										<td >
											<input class="form_control_tan" type="text" style="width: 209px;" name="aphone" maxlength="11" id="phoneNumber"/>
											
										</td>
										<td  align="right" id="td1" style="width: 100px;">
											固定电话：
										</td>
										<td colspan="4">
											<input class="form_control_tan" type="text" style="width: 209px;"maxlength="16" id="telephone"/>
											<span class="position2"  id="phoneNumber_yanzheng" style="top:6px"></span> <br />
											<span class="position2"  id="telephone_yanzheng"></span>
										</td>
									</tr>
									<tr>
										<td  align="right" id="td1">
											<!--<i style="color:#e3101e; list-style: none;">*</i>-->
											邮件：
										</td>
										<td colspan="4">
											<input class="form_control_tan" type="text" style="width: 209px;"maxlength="35" id="email"/>
											<p class="ntishi">
												<span class="nLowLeight">
													方便您实时接收订单状态提醒
												</span> 
												<span id="email_yanzheng" class="nLowLeight">
													
												</span>
											</p>
										</td>
										
									</tr>
									</tr>
										<td align="right"></td>
										<td colspan="4">
											<span class="default_address">   
												<b class="fangkuai" name="defaultAddress" ></b>  
												<em class="fl">设置默认地址</em>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						
						</div>
						<a herf="javascript:void(0)" id="id_saveAddress" class="btnred">保存收货信息</a>
					</div>
				</div>
			
			</form>
			</div>
		</div>
		
		
		
		
	
		
		<div class="addxiugaichuangkou">
			<div id ="add_newAddress">
				<!--<div class="addmoreAddress">
					<em class="pads"></em>
					<div class="moreCity">
						
					</div>
				</div>-->
			<form action="AddressServlet" method="post" id="form-addressud">
				<input type="hidden" name="action" value="update"/>
				<input type="hidden" name="changeaid" value="" id="changeaid"/>
				<div class="addInput">
					<a id="closeaddress1" href="javascript:void(0)"></a>
					<ul id ="id_addtab">
						<li class="addtab_active">配送上门</li>
						<li class="mlf6 unactive">
							门店自提
							<span class="mian">
								免运费
								<b class="sanjiao"></b>
							</span>
						</li>
					</ul>
					<div class="contentTab" style="display: block;">
						<div class="add_table">
							<table width="100%">
								<tbody>
									<tr>
										<td  align="right" id="td1">
											<i style="color:#e3101e; list-style: none;">*</i>
											收货人：
										</td>
										<td colspan="4">
											<input value="" class="form_control_tan" type="text"  id="username" name="aname" maxlength="24"/>
											<span class="position1" id="name_yanzheng"></span>
										</td>
									</tr>
									<tr>
										<td align="right">
											<i style="color:#e3101e; list-style: none;">*</i>
											所在地：
										</td>
										<td colspan="4">
											<select name="aprovince" id="province" onchange="createCitySelect();">
												<option value="北京">北京</option>
												<option value="山东">山东</option>
												<option value="河北">河北</option>
												<option value="福建">福建</option>
												<option value="新疆">新疆</option>
											</select>
											
										
											<select name="acity" id="city">
												<option value="北京">北京</option>
												<option value="略">..</option>
												
											</select>
	
										</td>
									</tr>
									<tr>
										<td  align="right" id="td1">
											<i style="color:#e3101e; list-style: none;">*</i>
											详细地址：
										</td>
										<td colspan="4">
											<input class="form_control_tan" type="text" style="width: 520px;" name="adetailed" maxlength="80" id="detailAddress"/>
											<span class="position1"  id="detailAddress_yanzheng"></span>
										</td>
									</tr>
									<tr>
										<td  align="right" id="td1">
											<i style="color:#e3101e; list-style: none;">*</i>
											手机号码：
										</td>
										<td >
											<input class="form_control_tan" type="text" style="width: 209px;" name="aphone" maxlength="11" id="phoneNumber"/>
											
										</td>
										<td  align="right" id="td1" style="width: 100px;">
											固定电话：
										</td>
										<td colspan="4">
											<input class="form_control_tan" type="text" style="width: 209px;"maxlength="16" id="telephone"/>
											<span class="position2"  id="phoneNumber_yanzheng" style="top:6px"></span> <br />
											<span class="position2"  id="telephone_yanzheng"></span>
										</td>
									</tr>
									<tr>
										<td  align="right" id="td1">
											<!--<i style="color:#e3101e; list-style: none;">*</i>-->
											邮件：
										</td>
										<td colspan="4">
											<input class="form_control_tan" type="text" style="width: 209px;"maxlength="35" id="email"/>
											<p class="ntishi">
												<span class="nLowLeight">
													方便您实时接收订单状态提醒
												</span> 
												<span id="email_yanzheng" class="nLowLeight">
													
												</span>
											</p>
										</td>
										
									</tr>
									</tr>
										<td align="right"></td>
										<td colspan="4">
											<span class="default_address">   
												<b class="fangkuai" name="defaultAddress" ></b>  
												<em class="fl">设置默认地址</em>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						
						</div>
						<a herf="javascript:void(0)" id="id_saveAddress1" class="btnred">保存收货信息</a>
					</div>
				</div>
			
			</form>
			</div>
		</div>
		
		
		
		
		
		
		
		
		<div id="gome_bar">
			<div class="gome_aside" style="background: rgba(0,0,0,0) none repeat scroll 0% 0%;">
				<ul>
					<li id="gome_aside_survey">
						<a  href="//survey.gome.com.cn/wj/dfe09aacc3.html" target="_blank">
							<i></i>
						</a>
					</li>

				</ul>
			</div>
		</div>
		
		<script type="text/javascript">
			var  addressid;
			var changeaid;
			$(function(){
			
			$("#id_saveAddress").click(function(){
			
			$("#form-address").submit()
			})
			
			})
			
			$(function(){
			
			$("#id_saveAddress1").click(function(){
			
			$("#form-addressud").submit()
			})
			
			})
			
			$(function(){
			$(".customerMessage").next().trigger("click");
			var $moren = $(".customerMessage").next();
				$(".customerMessage").next().addClass("xuanzhong");
				$(".customerMessage").next().find("#duihao").addClass("duihao");
				$("#sureAddress").text($moren.find("#address1").text().trim()+" "+$moren.find("#address2").text().trim()+" "+$moren.find("#address3").text().trim());
				$("#sureNname").text($moren.find("#peoplename").text().trim());
				$("#faPiaoName").text($moren.find("#peoplename").text().trim());
				$("#sureNumber").text($moren.find("#phone").text().trim());
			})
			function chanceAddress(aid){
			 addressid= aid;
				$xuanzhong = $("[onclick='chanceAddress("+aid+")']");
				$xuanzhong.addClass("xuanzhong");
				
				$xuanzhong.find("#duihao").addClass("duihao");
				$xuanzhong.siblings().removeClass("xuanzhong");
				$xuanzhong.siblings().find("#duihao").removeClass("duihao");
				$("#sureAddress").text($xuanzhong.find("#address1").text().trim()+" "+$xuanzhong.find("#address2").text().trim()+" "+$xuanzhong.find("#address3").text().trim());
				$("#sureNname").text($xuanzhong.find("#peoplename").text().trim());
				$("#faPiaoName").text($xuanzhong.find("#peoplename").text().trim());
				$("#sureNumber").text($xuanzhong.find("#phone").text().trim());
			}
			function tijiao(){
		
					if(typeof(addressid)==="undefined"){
						alert("请填写您的收货地址")
					
					}else{
						 location.assign("OrderServlet?action=placeOrder&aid="+addressid);
					}
			
			
			
			}
			
			function xiugaiaddress(aid){
			changeaid=aid;
			$("#changeaid").val(changeaid); 
			$(".gui_modal").show();
			$(".addxiugaichuangkou").show();
		/* 	location.assign("AddressServlet?action=updateAddress&aid="+aid);
			 */
			}
			
			
	
	
			
		</script>
	</body>
</html>


