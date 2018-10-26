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
		<title>国美收银台</title>
		<link href = "css/收银台/html.css" type = "text/css" rel = "stylesheet"/>
		<link href = "css/收银台/html1.css" type = "text/css" rel = "stylesheet"/>
		<script type="text/javascript" src = "js/jquery-2.1.4.js"></script>
		<script type="text/javascript" src = "css/收银台/javascript.js"></script>
	</head>
	<body id="mainBody">
	<%  
	User user = (User)session.getAttribute("user"); 
	String orderNo = (String)request.getAttribute("orderNo");
	Address address = (Address)request.getAttribute("address");
	Double orderTotalPrice=(Double)request.getAttribute("orderTotalPrice");
	%>
		<div class = "top">
			<div class = "top-body">
			 	<ul id = "top-right">
			 		<li> <a class="guser"  href =""> <%=user.getUsername() %>  </a></li>
			 		<li> <a href =""> [退出]</a></li>
			 		<li> <a href ="">| 支付帮助</a></li>
			 		<li> <a href ="">| 在线客服</a></li>
			 		<li > 4008-708-708 （9:00-21:00）</li>
			 		
			 	</ul>
			</div>
		</div>
		<div class="jrlc_tip">
			<div class="jrlc_warp">
				<h1 class="jrlc_logo">
					<img id="logoimg" src="img/收银台/1041.png" />
				</h1>
				<div style="clear: both;"></div>
			</div>
		</div>
		<div class="jrlc_cen">
			<div class="orderInfo">
				<div id="ptsyt">
					<div class="or_left">
						<h3>订单提交成功，请您尽快付款。 支付单号：<%=orderNo %></h3>
					</div>
					<div class="pay_zhifu">
						<iframe id="scancode_id" style="display:block;z-index:1;" src="img/index.png" scrolling="no" width="100" height="100" frameborder="0">	
	                    </iframe>
	                    <img id="saoma" class="saoma" src="img/ALIPAYSCANN.png"/>
					</div>
					<div class="or_right">
						<p class="or_allpay">
							应付金额
							<i id="payMoney"><%=orderTotalPrice%></i>元
						</p>
						<b class="or_look">
							订单详情
							<i class="xiala"></i>
						</b>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="address">
					<div class="address_mess">
						<span class="or_addss">
							收货地址
							<i title="<%=address.getAprovince() %> <%=address.getAcity() %> <%=address.getAdetailed() %>"><%=address.getAprovince() %> <%=address.getAcity() %> <%=address.getAdetailed() %></i>
						
							收货人：
							<b class="get_name"><%=address.getAname() %></b>
							<i><%=address.getAphone() %></i>
						</span>
					</div>
					<div class="or_list">
						<span  class="or_coding">
							订单号：
							<i title="11443948978"><%=orderNo %></i>
						</span>
						<div class="shop_g">
							<b class="shop_name">国美自营</b>
							<ul class="or_goodname">
				
								<li>
									<!-- <b title="小米(MI) 小米Max2 全网通 4GB+64GB 金色 移动联通电信4G手">小米(MI) 小米Max2 全网通 4GB+64GB 金色 移动联通电信4G手</b> -->
									<i><%=orderTotalPrice%>元</i>
								</li>
							</ul>
							
						</div>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div id="kjzf" class="kjzf">
					<div id="border_cg" class="platform_box">
						<div class="platform_title">
							<span class="price_pr">
								支付
								<b class="heighlight">1,699.00</b>
								元
							</span>
							<span id="pay_kjzf">
								<span class="type_ch">
									<i class="duihao"></i>
									快捷支付
								</span>
								<span class="sm">支付更快捷，一步验证，无需网银便捷！</span>
							</span>
						</div>
						<div class="kjzf_con1">
							<div class="afterBankName">
								<div class="duochongbaozhang">
									<p>
										<b>多重安全保障</b>
									</p>
									<p>
										快捷支付服务由国美联合第三方提供，保障您的资金安全。
									</p>
								</div>
								<div class="chooseBank">
									<img src="img/收银台/ICBC.png"/>
									<span class="typed">储蓄卡</span>
									<span class="money_yuan">单笔限额1.5万 日累计限额1.5万</span>
								</div>
								<div id="otherBank">
									<a class="hoverred" href="javascript:void(0);">使用其他银行卡</a>
								</div>
								
							</div>
							<div style="clear: both;"></div>
							<div class="bankNum">
								<input type="text"  id="cardID" value="请输入银行卡号" />
								<span id="message_tips">请输入银行卡号</span>
							</div>
							<div style="clear: both;"></div>
						</div>
						<div class="kjzf_con">
							<div class="ul_psion">
								<div class="mf_check">
									<div id="mf_yinlian">
										<input type="text"  id="input_yinlian"  placeholder="直接输入银行卡号识别" />
	
									</div>
									<input class="btn-gotopay" value="确定" id="sure_button" type="button">
									<b class="or_lk">
										按银行选择
										<i class="shang"></i>
									</b>
								</div>
							</div>
							<div class="BanksDiv">
								<div class="bank_list">
									<ul id="fast_bank">
										<li class="bank">
											<img src="img/收银台/CCB.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/ICBC.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa2" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa2" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/CMBCHINA.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa3" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa3" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/ABC.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/BOCO.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/BOC.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/POST.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/CGB.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/ECITIC.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/PINGAN.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/HBB.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="more" style="z-index: 100;">
											更多银行&nbsp;&gt;
										</li>
										<div  class="moreBank">
											<li class="bank">
												<img src="img/收银台/SDB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>
											<li class="bank">
												<img src="img/收银台/SPDB_002.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>
											<li class="bank">
												<img src="img/收银台/NJCB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											<li class="bank">
												<img src="img/收银台/ECITIC.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											<li class="bank">
												<img src="img/收银台/CQRCB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											<li class="bank">
												<img src="img/收银台/DLB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											<li class="bank">
												<img src="img/收银台/SHB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											<li class="bank">
												<img src="img/收银台/HZBANK.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											
											<li class="bank">
												<img src="img/收银台/CEB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											<li class="bank">
												<img src="img/收银台/NBCB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											<li class="bank">
												<img src="img/收银台/ZJCCB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											<li class="bank">
												<img src="img/收银台/SZRCB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											
											<li class="bank" style="margin-bottom: 20px;">
												<img src="img/收银台/JSB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											
											
										</div>
										
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div id="get_kjzf">
						<p id="pay_checkway">
							<a href="PaymentServlet?action=payment&orderNo=<%=orderNo %>" class="btn_1">
								立即支付
							</a>
							<b class="palse_way">请选择银行支付</b>
						</p>
					</div>
					<div style="clear: both;"></div>
				</div>
				<ul id="otherPayType">
					<li class="pay_wangyin">
						<b class="name">网银支付</b>
						<b class="wy_de">大额支付更安全</b>
						<i class="fuhao">></i>
					</li>
					<li class="pay_pingtai">
						<b class="name">平台支付</b>
						<span>(</span>
						<a>美付宝、</a>
						<a>微信支付、</a>
						<a>支付宝、</a>
						<a>银联在线</span>
						<span>)</span>
						<i class="fuhao">></i>
					</li>
				
					<li class="pay_xinyongka">
						<b class="name">信用卡分期</b>
						<i class="fuhao">></i>
						
					</li>
				</ul>
			</div>
		</div>
		<div class="orderInfo1">
				<div id="ptsyt">
					<div class="or_left">
						<h3>订单提交成功，请您尽快付款。 支付单号：2825562684</h3>
					</div>
					<div class="pay_zhifu">
						<iframe id="scancode_id" style="display:block;z-index:1;" src="img/index.png" scrolling="no" width="100" height="100" frameborder="0">	
	                    </iframe>
	                    <img id="saoma" class="saoma" src="img/ALIPAYSCANN.png"/>
					</div>
					<div class="or_right">
						<p class="or_allpay">
							应付金额
							<i id="payMoney">1,699.00</i>元
						</p>
						<b class="or_look">
							订单详情
							<i class="xiala"></i>
						</b>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="address">
					<div class="address_mess">
						<span class="or_addss">
							收货地址
							<i title="北京 北京市 朝阳区 建外街道 陈行">北京 北京市 朝阳区 建外街道 </i>
						
							收货人：
							<b class="get_name">陈行</b>
							<i>138****0947</i>
						</span>
					</div>
					<div class="or_list">
						<span  class="or_coding">
							订单号：
							<i title="11443948978">11443948978</i>
						</span>
						<div class="shop_g">
							<b class="shop_name">国美自营</b>
							<ul class="or_goodname">
								<li>
									<b title="小米(MI) 小米Max2 全网通 4GB+64GB 金色 移动联通电信4G手">小米(MI) 小米Max2 全网通 4GB+64GB 金色 移动联通电信4G手</b>
									<i>¥1699.0</i>
								</li>
							</ul>
							
						</div>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div id="kjzf" class="kjzf">
					<div id="border_cg" class="platform_box">
						<div class="platform_title">
							<span class="price_pr">
								支付
								<b class="heighlight">1,699.00</b>
								元
							</span>
							<span id="pay_kjzf">
								<span class="type_ch">
									<i class="duihao"></i>
									网银支付
								</span>
								
							</span>
						</div>

						<div class="kjzf_con_wangyin">
							
							<div class="BanksDiv">
								<div class="bank_list_wangyin">
									<ul id="fast_bank">
										<li class="bank">
											<img src="img/收银台/CCB.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/ICBC.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa2" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa2" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/CMBCHINA.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa3" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa3" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/ABC.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/BOCO.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/BOC.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/POST.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/CGB.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/ECITIC.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/PINGAN.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="bank">
											<img src="img/收银台/HBB.png">
											<div id="leibie">
												<div class="chuxu">
													<input name="bankTypeRa" checked="" type="radio">
													存储卡
												</div>
												<div class="xinyong">
													<input name="bankTypeRa" checked="" type="radio">
													信用卡
												</div>
											</div>
										</li>
										<li class="more_wangyin" style="z-index: auto;">
											更多银行&nbsp;&gt;
										</li>
										<div  class="moreBank_wangyin">
											<li class="bank">
												<img src="img/收银台/SDB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>
											<li class="bank">
												<img src="img/收银台/SPDB_002.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>
											<li class="bank">
												<img src="img/收银台/NJCB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											<li class="bank">
												<img src="img/收银台/ECITIC.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											<li class="bank">
												<img src="img/收银台/CQRCB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											<li class="bank">
												<img src="img/收银台/DLB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											<li class="bank">
												<img src="img/收银台/SHB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											<li class="bank">
												<img src="img/收银台/HZBANK.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											
											<li class="bank">
												<img src="img/收银台/CEB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											<li class="bank">
												<img src="img/收银台/NBCB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											<li class="bank">
												<img src="img/收银台/ZJCCB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											<li class="bank">
												<img src="img/收银台/SZRCB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											
											<li class="bank" style="margin-bottom: 20px;">
												<img src="img/收银台/JSB.png">
												<div id="leibie">
													<div class="chuxu">
														<input name="bankTypeRa" checked="" type="radio">
														存储卡
													</div>
													<div class="xinyong">
														<input name="bankTypeRa" checked="" type="radio">
														信用卡
													</div>
												</div>
											</li>	
											
											
										</div>
									</ul>
								</div>
							</div>
						</div>
					</div>
					
					<div style="clear: both;"></div>
				</div>
				<ul id="otherPayType">
					<li class="pay_kuaijie">
						<b class="name">快捷支付</b>
						<b class="wy_de">支付更快捷，一步验证，无需网银！</b>
						<i class="fuhao">></i>
					</li>
					<li class="pay_pingtai">
						<b class="name">平台支付</b>
						
						<i class="fuhao">></i>
					</li>
				
					<li class="pay_xinyongka">
						<b class="name">信用卡分期</b>
						<i class="fuhao">></i>
						
					</li>
				</ul>
			</div>
		</div>
		<div class="orderInfo2">
				<div id="ptsyt">
					<div class="or_left">
						<h3>订单提交成功，请您尽快付款。 支付单号：2825562684</h3>
					</div>
					<div class="pay_zhifu">
						<iframe id="scancode_id" style="display:block;z-index:1;" src="img/index.png" scrolling="no" width="100" height="100" frameborder="0">	
	                    </iframe>
	                    <img id="saoma" class="saoma" src="img/ALIPAYSCANN.png"/>
					</div>
					<div class="or_right">
						<p class="or_allpay">
							应付金额
							<i id="payMoney">1,699.00</i>元
						</p>
						<b class="or_look">
							订单详情
							<i class="xiala"></i>
						</b>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="address">
					<div class="address_mess">
						<span class="or_addss">
							收货地址
							<i title="北京 北京市 朝阳区 建外街道 陈行">北京 北京市 朝阳区 建外街道 </i>
						
							收货人：
							<b class="get_name">陈行</b>
							<i>138****0947</i>
						</span>
					</div>
					<div class="or_list">
						<span  class="or_coding">
							订单号：
							<i title="11443948978">11443948978</i>
						</span>
						<div class="shop_g">
							<b class="shop_name">国美自营</b>
							<ul class="or_goodname">
								<li>
									<b title="小米(MI) 小米Max2 全网通 4GB+64GB 金色 移动联通电信4G手">小米(MI) 小米Max2 全网通 4GB+64GB 金色 移动联通电信4G手</b>
									<i>¥1699.0</i>
								</li>
							</ul>
							
						</div>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div id="kjzf" class="kjzf">
					<div id="border_cg" class="platform_box">
						<div class="platform_title">
							<span class="price_pr">
								支付
								<b class="heighlight">1,699.00</b>
								元
							</span>
							<span id="pay_kjzf">
								<span class="type_ch">
									<i class="duihao"></i>
									平台支付
								</span>
								
							</span>
						</div>
						
						<div class="kjzf_con_pingtai">
							
							<div class="BanksDiv">
								<div class="bank_list">
									<ul id="fast_bank">
										
										
										
										<li class="bank">
											<img src="img/收银台/ALIPAY.png">
											
										</li>
										<li class="bank">
											<img src="img/收银台/BILLPAY.png">
											
										</li>
										<li class="bank">
											<img src="img/收银台/BESTPAY.png">
											
										</li>
										<li class="bank">
											<img src="img/收银台/WEIXINPAY.png">
											
										</li>
										<li class="bank" id="chaxun">
											<img src="img/收银台/loading.gif">
										</li>
										
										
									</ul>
								</div>
							</div>
						</div>
					</div>
					
					<div style="clear: both;"></div>
				</div>
				<ul id="otherPayType">
					<li class="pay_kuaijie">
						<b class="name">快捷支付</b>
						<b class="wy_de">支付更快捷，一步验证，无需网银！</b>
						<i class="fuhao">></i>
					</li>
					<li class="pay_wangyin">
						<b class="name">网银支付</b>
						<b class="wy_de">大额支付更安全</b>
						<i class="fuhao">></i>
					</li>
				
					<li class="pay_xinyongka">
						<b class="name">信用卡分期</b>
						<i class="fuhao">></i>
						
					</li>
				</ul>
			</div>
		</div>
		<div class="orderInfo3">
				<div id="ptsyt">
					<div class="or_left">
						<h3>订单提交成功，请您尽快付款。 支付单号：2825562684</h3>
					</div>
					<div class="pay_zhifu">
						<iframe id="scancode_id" style="display:block;z-index:1;" src="img/index.png" scrolling="no" width="100" height="100" frameborder="0">	
	                    </iframe>
	                    <img id="saoma" class="saoma" src="img/ALIPAYSCANN.png"/>
					</div>
					<div class="or_right">
						<p class="or_allpay">
							应付金额
							<i id="payMoney">1,699.00</i>元
						</p>
						<b class="or_look">
							订单详情
							<i class="xiala"></i>
						</b>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="address">
					<div class="address_mess">
						<span class="or_addss">
							收货地址
							<i title="北京 北京市 朝阳区 建外街道 陈行">北京 北京市 朝阳区 建外街道 </i>
						
							收货人：
							<b class="get_name">陈行</b>
							<i>138****0947</i>
						</span>
					</div>
					<div class="or_list">
						<span  class="or_coding">
							订单号：
							<i title="11443948978">11443948978</i>
						</span>
						<div class="shop_g">
							<b class="shop_name">国美自营</b>
							<ul class="or_goodname">
								<li>
									<b title="小米(MI) 小米Max2 全网通 4GB+64GB 金色 移动联通电信4G手">小米(MI) 小米Max2 全网通 4GB+64GB 金色 移动联通电信4G手</b>
									<i>¥1699.0</i>
								</li>
							</ul>
							
						</div>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div id="kjzf" class="kjzf">
					<div id="border_cg_fenqi" class="platform_box">
						<div class="platform_title">
							<span class="price_pr">
								支付
								<b class="heighlight">1,699.00</b>
								元
							</span>
							<span id="pay_kjzf">
								<span class="type_ch">
									<i class="duihao"></i>
									信用卡分期
								</span>
								
							</span>
						</div>
						
						<div class="kjzf_con_xinyong">
							
							<div class="BanksDiv">
								<div class="bank_list">
									<ul id="fast_bank">
										
										<li class="bank">
											<img src="img/收银台/CMBCHINA.png">
											
										</li>
										<li class="bank">
											<img src="img/收银台/ECITIC.png">
											
										</li>
										<li class="bank">
											<img src="img/收银台/CCB.png">
											
										</li>
										<li class="bank">
											<img src="img/收银台/ABC.png">
											
										</li>
										<li class="bank" id="chaxun">
											<img src="img/收银台/GZB.png">
										</li>
										
										<li class="bank">
											<img src="img/收银台/CMBC.png">
											
										</li>
										<li class="bank">
											<img src="img/收银台/CIB.png">
											
										</li>
										<li class="bank">
											<img src="img/收银台/BCCB.png">
											
										</li>
										<li class="bank" id="chaxun">
											<img src="img/收银台/ICBC.png">
										</li>
										
										
									</ul>
								</div>
							</div>
							<div id="fqfk_bank">
								<div class="fqfk_choose">
									<div id="bankfq3" class="fq_check">
										<b class="1b_left">3期</b>
										<em>|</em>
										<b class="1b_right">566.33元/期</b>
										<i class="check"></i>
									</div>
									<div id="bankfq6">
										<b class="1b_left">6期</b>
										<em>|</em>
										<b class="1b_right">283.17元/期</b>
										<i class=""></i>
									</div>
									<div id="bankfq12">
										<b class="1b_left">12期</b>
										<em>|</em>
										<b class="1b_right">141.58元/期</b>
										<i class=""></i>
									</div>
								</div>
							</div>
							<div style="clear: both;"></div>
							<div class="fenqi" >
                           		 <p>
                           		 	付款金额：
                           		 	<b id="pay_12" class="redcolor">1783.95</b>元&nbsp;=&nbsp;订单应付金额：<b id="order_12" class="redcolor">1699.00</b>元&nbsp;+&nbsp;分期付款手续费：<b id="fee_12" class="redcolor">84.95</b>元（分期手续费具体以银行收取为准）</p>
                            	<p>
                              		  首期还款：
                              		  <b id="first_12" class="redcolor">226.53</b>元<b id="poundage_12">(一次性支付手续费)</b>
                           		 </p>
                      	  </div>
							
							<div style="clear: both;"></div>
						</div>
						
					</div>
					<div id="get_kjzf">
							<p id="pay_checkway">
							<a href="javascript:void(0)" class="btn_2" style="rgb(248, 89, 100)">
								立即支付
							</a>
							
							</p>
					</div>
					
					<div style="clear: both;"></div>
				</div>
				<ul id="otherPayType">
					<li class="pay_kuaijie">
						<b class="name">快捷支付</b>
						<b class="wy_de">支付更快捷，一步验证，无需网银！</b>
						<i class="fuhao">></i>
					</li>
					<li class="pay_wangyin">
						<b class="name">网银支付</b>
						<b class="wy_de">大额支付更安全</b>
						<i class="fuhao">></i>
					</li>
				
					<li class="pay_pingtai">
						<b class="name">平台支付</b>
						<i class="fuhao">></i>
						
					</li>
				</ul>
			</div>
		</div>
		<div class="footer" >
  			  <p>©2000-2017 国美在线电子商务有限公司 版权所有</p>
		</div>
	</body>
</html>
