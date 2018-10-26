/**
 *   相关js
 *   弹框关闭,支付方式切换，广告位(加载固定广告位),短信验证码弹框,客服吐槽,埋码,禁止键盘后退操作,其他
 ***/

/*******-------- 弹框关闭，点击“x”或点击“关闭”------********/
   $('#alert .close,#alert .code_time a').on('click',function(){
	    clearInterval(setIntervalFun);//清理倒计时
        $('#phonecodeAlertDiv').hide();
        $("#alert #codeAlert").val("");//清空验证码输入框
        $("#alert .font-red").hide();//隐藏错误信息，显示正常样式
        $("#sendSuccessShow").show();
        $("#alert #codeAlert").css("border","1px solid #e1e1e1");
        if(typeof($("#mycards")[0]) != "undefined" && $("#mycards")[0].style.display != "none"){
	        $("#mycards #mycards_pay_checkway a").removeClass("btn_unable2").addClass("btn-gotopay").html("立即支付");
	        $("#mycards #mycards_checkway_errormsg").html("");//清除错误信息
        }
        
        if(typeof($("#platform-kjzf")[0]) != "undefined" && $("#platform-kjzf")[0].style.display != "none"){
	        $("#platform-kjzf #pay_checkway a").removeClass("btn_unable2").addClass("btn-gotopay").html("立即支付");
	        $("#platform-kjzf #pay_checkway b").text("");
        }
        
        if(typeof($("#platform-fqfk")[0]) != "undefined" && $("#platform-fqfk")[0].style.display != "none"){//分期
        	$("#platform-fqfk #gotopay-fqfk a").removeClass("btn_unable2").addClass("btn-gotopay").html("立即支付");
        	$("#platform-fqfk #gotopay-fqfk b").text("");
        }
        if(typeof($("#platform-kjzf")[0]) != "undefined" && $("#platform-kjzf")[0].style.display != "none" && $("#platform-kjzf #bank_message")[0].style.display != "none"){//易宝首次
        	$("#platform-kjzf .ag_kt a").removeClass("btn_unable2").addClass("btn-gotopay").html("同意开通并支付");
            $("#platform-kjzf #fastPay_yibao_errormsg").text("");       
        }
        if($("#myb-gotopay").css("display") != "none"){//美盈宝
        	$("#myb-gotopay a").removeClass("btn_unable2").addClass("btn-gotopay").html("立即支付");
        	$("#myb_checkway_errormsg").text("");
        }
    });

   $('#flowIe-payLayer .close,#flowIe-payLayerOther').on('click',function(){
	   //网银、平台弹层信息还原
       $("#flowIe-payLayer").find("p").html("请您在新打开的页面进行支付，支付完成前请不要关闭该窗口");
       $("#payLayer_common").show();
       $("#payLayer_myb").hide();
       $("#flowIe-payLayer .al_red2 a").html("支付遇到问题");
       $("#flowIe-payLayerOther-alipayScan").hide();
       $("#flowIe-payLayerOther").show();
	   $('#flowIe-payLayer').hide();
	   $("#flowIe-payLayer .al_red2 a").attr("href","http://help.gome.com.cn/question/33.html");
   });
   // 快捷支付广告的关闭
    $('.cl_posizion').on('click',function(){
        $('#kq_ad_id').removeClass("kq_ad");
        $('#kq_ad_id').hide();
        $(".xuan_check1").css("marginTop","-37px");//我的银行卡布局重置
        $(".platform-con").removeClass("platform-con").addClass("platform-con");//解决ie下银行列表样式错乱问题
    });
   /*查看限额hover效果*/
    $(".wyzf-check .texta").hover(function(){
        $(".wyzf-checkInfo").show();
    },function(){
         $(".wyzf-checkInfo").hide();
    });
   /*选中网银支付卡后效果*/
    $("#check_otr").click(function(){
        $("#bank-lst").css("display","block");
        $("#wyzf-chooseType").hide();
        $(".wyzx-otherType").hide();
    });

/***********--------支付方式切换------------***********/
	function platformCloseAll(){
		$(".platform").hide();
	}
	//--支付方式切换-->
	$(function(){
		$(".payTypeSelect").click(function(){
		    var payTypeName = $(this).attr("payTypeName");
			var account = $("#siteAccount").val();
			if(payTypeName == "cyberbanking" && "1" == $("#financeBackCard").val()){//理财实名站点
				initBackCard(this);
			} else {
			    payTypeSelectClick(this);
			}
	    });
	});
	function  payTypeSelectClick(thisObj){
	    	var payTypeName = $(thisObj).attr("payTypeName");
	    	//--显示所有支付方式-->
			$(".payTypeSelect").show();
			//--隐藏触发动作的支付方式-->
			$(thisObj).hide();
			//--关闭所有的支付方式大窗口-->
			platformCloseAll();
			try{
				//--打开目标支付方式大窗口-->
				var evalStr=payTypeName+"_open()";
				eval(evalStr);
			}catch(e){
				alert("关闭时发生异常"+e)
			}
			$("#myb-open").find("i").eq(0).hide();//对勾去掉
			$("#myb-gotopay").hide();//隐藏美盈宝支付按钮
	        $("#myb_password").hide();//隐藏美盈宝密码输入框
	        $("#myb-pay").css({"border":"2px solid #fff"});//美盈宝样式还原
	        $(".myb-ndpay").hide();//支付金额
	 }

function afterAd(){
	//--支付方式鼠标悬浮效果-->
	$("#otherPayType li").hover(function(){
	    $(this).find(".ad_tips").hide();//广告
        $(this).children('b').css("color","#f85964");
        var after = $(this).children('after');
        after.html("立即支付  >");
        after.removeClass().addClass("jrlc-platforms-type-gotopay");
        after.before("<p id='payTypeMoneySpan'>应付金额<i id='payTypeMoney'>"+$("#yfPayMoney").html()+"</i>元</p>");
    },function(){
        $(this).find(".ad_tips").show();
        $(this).children('b').css("color","");
        var after = $(this).children('after');
        after.html(">");
        after.removeClass().addClass("jrlc-platforms-type-gt");
        after.siblings("p").remove();
    });
} 

var $beforeAfter = function(dom) {
	var content = dom.getAttribute("dataContent") || '';
	var after  = document.createElement("after");
	// 内部content
	after.innerHTML = content;
	$(after).addClass("jrlc-platforms-type-gt");
	// 前后分别插入节点
	dom.appendChild(after);
}; 

$(".jrlc-platforms-type li").each(function(index){
	$beforeAfter(this);
});


/**********--------广告位----------**********/
// 发送Ajax请求,加载固定广告位
function loadFixedAd(loadUrl){
	$.ajax({
 		cache: false,
 		timeout: 6000,
 		type: 'POST',
 		async: true,
        dataType: 'JSON',
        url: loadUrl,
		data: '',
        success: function(resultData){
        	if(typeof(resultData.AD_FIXED_BROADCAST) != "undefined"){
        		$("#kq_ad_id").show();
        		$("#swapdiv").removeClass("code_swap").addClass("code_swap");//解决ie7下兼容问题(有公告时，绑卡信息下移)
        	    $("#platform-kjzf-con").removeClass("clearfix").addClass("clearfix");//解决ie7下兼容问题(有公告时，快捷银行卡列表下移)
        	}
			$.each(resultData,function(id,value) {
				if(id.indexOf("AD_FIXED_040_B_WEIXINPAY") > -1 && $("#AD_FIXED_040_B_WEIXINPAY").length > 0){//WEIXINPAY显示扫码支付广告
					$("#AD_FIXED_040_B_WEIXINPAY").parent().show();
					//$("#orderInfo_PTSYT .saoma_ad").show();
				}
				if(id.indexOf("AD_FIXED_040_B_ALIPAY") > -1 && $("#AD_FIXED_040_B_ALIPAY").length > 0){//ALIPAY显示扫码支付广告
					$("#AD_FIXED_040_B_ALIPAY").parent().show();
				}
				if ($("#"+id).length > 0 ) {
					$("#"+id).html(value);
				}
				if(id.indexOf("AD_FIXED_040_S_WEIXINPAY") > -1){//显示平台里扫码支付广告
					$("#wx-pay .zfb-gift").show();
				}
				if(id.indexOf("AD_FIXED_040_S_ALIPAY") > -1){//显示平台里扫码支付广告
					$("#alipay .zfb-gift").show();
				}
				if("AD_FIXED_050_SHOW" == id){//平台支付推荐位
					$(".AD_FIXED_050_SHOW").after(value);
					$(".payTypeSelect .direct_platform_pay").click(function(e){
						if($(this).attr("payType") == "040" && typeof(platScan) == "function"){
			            	platScan($(this).attr("paysuppliercode"));
			            	$(".back .hoverRed").attr("isPlatScan","isPlatScan");
			            } else if($(this).attr("payType") == "050"){
			            	$("#flowIe-payLayer .al_red2 a").attr("href","http://help.gome.com.cn/article/233-242-0.html");
				            $("#flowIe-payLayer #payLayerHead").html("登录平台支付");
				            $('#flowIe-payLayer,.thickdiv,.alert-box').show();
				            $("#cashierForm input[name='bankCode']").val($(this).attr("paysuppliercode"));
				            $("#cashierForm input[name='payMode']").val("050");
				            $("#cashierForm input[name='cardType']").val("010");
				            $("#cashierForm input[type='submit']").trigger("click");
			            }
						e.stopPropagation();
			        }).bind("mouseover",function() {
			            $(this).css("color", "red");
			        }).bind("mouseout",function(){
			            $(this).css("color", "");
					});
				}
			});
			try{
			  afterAd();
			} catch(e){
			}
		}
 	});
}

//加载固定广告位
loadFixedAd($("#CASHIER_WEB_PATH").attr("attr_v")+"loadAdvertisementController/"+"loadFixedAd.dhtml?ujm="+$("#ujm").val()+"&orderNo="+$(".or_left").find("i").html());

//发送Ajax请求加载分期浮动广告位
function loadFloatAdFq(loadUrl,supplierNo,payMode,bankCode){
	$('span[id^=AD_FLOAT_FQ]').each(function(i){
			$(this).html("");
	});
	$.ajax({
		cache: false,
		timeout: 6000,
		type: 'POST',
		async: true,
		dataType: 'JSON',
		url: loadUrl,
		data: {supplierNo : supplierNo, payMode : payMode, bankCode: bankCode},
		success: function(resultData){
			$.each(resultData,function(id,value) {
				if ($("#"+id).length > 0 ) {
					$("#"+id).html(value);
				}
			});
			floatAdFq();
		}
	});
}
//发送Ajax请求加载我的银行卡分期浮动广告位
function loadMyCardsFloatAdFq(loadUrl,supplierNo,payMode,bankCode){
	$('span[id^=AD_FLOAT_MYCARDS_FQ]').each(function(i){
		$(this).html("");
	});
	$.ajax({
		cache: false,
		timeout: 6000,
		type: 'POST',
		async: true,
		dataType: 'JSON',
		url: loadUrl,
		data: {supplierNo : supplierNo, payMode : payMode, bankCode: bankCode},
		success: function(resultData){
			$.each(resultData,function(id,value) {
				if ($("#"+id).length > 0 ) {
					$("#"+id).html(value);
				}
			});
			myCardsFloatAdFq();
		}
	});
}
//单笔付款或免手续费hover效果
function myCardsFloatAdFq(){
	$(".fq_fanq i,.fq_paymy i").hover(function(){
		$(this).parent().next().stop().show();
	},function(){
		$(this).parent().next().delay(200).hide(0);
	});
	$(".gmform-label .fq_fqtp").hover(function(){
		$(this).stop().show();
	},function(){
		$(this).delay(200).hide(0);
	});
	var firstMycardsFq = $("#mycards-bank .fqfk-fqs-choose").children(".gmform-label").first();
	firstMycardsFq.find("span p").removeClass("fq_fanq").addClass("fq_paymy");
	firstMycardsFq.find(".fq_check").attr("clicked","true");
};
// 单笔付款或免手续费hover效果
function floatAdFq(){
	$(".fq_fanq i,.fq_paymy i").hover(function(){
		$(this).parent().next().stop().show();
	},function(){
		$(this).parent().next().delay(200).hide(0);
	});
	$(".gmform-label .fq_fqtp").hover(function(){
		$(this).stop().show();
	},function(){
	    //$(this).delay(200).hide(0);
		$(this).hide(0);
	});
	var firstFq = $("#fqfk-bank .fqfk-fqs-choose").children(".gmform-label").first();
	firstFq.find("span p").removeClass("fq_fanq").addClass("fq_paymy");
	firstFq.find(".fq_check").attr("clicked","true");
};


/*******************--------------------短信验证码弹框--------------------**********************/
//输入验证码-->
$("#alert #codeAlert").keyup(function(){
  var value = this.value.replace(/[^0-9]/g,"");
  this.value = value.replace(/\s/g,'').replace(/(\d{4})(?=\d)/g,"$1");
  var val = $(this).val();
  var valsize = val.length;
  if(valsize == 6){
      if(!alert_checkBindMobileCode(this)){
         return false;
      }
      $("#alert .put_code").hide();
      $("#alert .pay_wait").show();
      
      var url = null;
      var params = {};
      var parameters = {};
      if(typeof($("#mycards")[0]) != "undefined" && $("#mycards")[0].style.display != "none" && $("#myb-gotopay").css("display") == "none"){//我的银行卡
         url = $("#CASHIER_WEB_PATH").attr("attr_v")+"quicksController/toPay.dhtml";
         parameters = {
							validateCode : $("#alert #codeAlert").val(),
							idKey : $("#mycards #bankItem .hover_li").attr("idKey"),
							ujm : $("#ujm").val(),
							transNo : $("#mycards_transNo").val(),
			                installmentsNo:$("#mycards_installmentsNo_fqfk").val()
			                };
      }
      
      if(typeof($("#platform-kjzf")[0]) != "undefined" && $("#platform-kjzf")[0].style.display != "none"){//快捷
         url = $("#CASHIER_WEB_PATH").attr("attr_v")+"quicksController/toPay.dhtml";
         parameters = {                   
                           validateCode : $("#alert #codeAlert").val(),
							 cardSerila : $("#cardSerila").val(),
							 ujm : $("#ujm").val(),
							 transNo : $("#transNo").val()
                          }
      }

      if(typeof($("#platform-fqfk")[0]) != "undefined" && $("#platform-fqfk")[0].style.display != "none"){//分期
        url = $("#CASHIER_WEB_PATH").attr("attr_v")+"quicksController/toPay.dhtml";
        parameters = {
			                validateCode : $("#alert #codeAlert").val(),
							cardSerila : $("#platform-fqfk #bindSerila-fqfk").val(),
							ujm : $("#ujm").val(),
							transNo : $("#transNo-fqfk").val(),
							installmentsNo:$("#installmentsNo-fqfk").val(),
							payMode:"030"
                      }
      }
      
      if($("#myb-gotopay").css("display") != "none"){//美盈宝
         url = $("#CASHIER_WEB_PATH").attr("attr_v")+"meiybController/toPay.dhtml";
         parameters = {
			                validateCode : $("#alert #codeAlert").val(),
							ujm : $("#ujm").val()
                      }
      }
      
		setTimeout(function(){//google如果不延迟发送会连续请求-->
			   params.isAsync = false;
			   params.reqUrl = url;
			   params.parameters = parameters;
			   params.callBack = alert_payCallBack;
			   params.isBind = "bind";
			   params._this = "";
			   params.tipPos = "";
			   //立即支付
			   sendRequest(params);
	     }, 500)
	    
  }
});

//支付回调处理-->
function alert_payCallBack(returnData,_this,tipPos,isBind){//支付失败提示失败信息，支付成功异步查询支付结果
	var respFlag=returnData.resCode;
	if(respFlag=='0000'){
		//异步刷新支付结果
		if(typeof($("#mycards")[0]) != "undefined" && $("#mycards")[0].style.display != "none" && $("#myb-gotopay").css("display") == "none"){
		 toPayTimer("#mycards .btn-gotopay",isBind,$("#mycards_transNo").val(),$("#mycards_supplierNo").val(),"mycards","#mycards_bind_errormsg","mycards_bind_phonecode");
	    }
	    if(typeof($("#platform-kjzf")[0]) != "undefined" && $("#platform-kjzf")[0].style.display != "none"){
	     toPayTimer("#platform-kjzf .btn_unable",isBind,$("#transNo").val(),$("#supplierNo").val(),"platform-kjzf","#platform-kjzf .plase_way","bind_phonecode");
	    }
	    if(typeof($("#platform-fqfk")[0]) != "undefined" && $("#platform-fqfk")[0].style.display != "none"){
	     toPayTimer("#platform-fqfk .btn_unable",isBind,$("#transNo-fqfk").val(),$("#supplierNo-fqfk").val(),"platform-fqfk","#fqfk_checkway_errormsg","fqfk-bind_phonecode");
	    }
	    if($("#myb-gotopay").css("display") != "none"){//美盈宝
		 top.location.href = $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/paySuccess.dhtml" + '?ujm='+$("#ujm").val();
	    }
	}else{
		$("#alert .pay_wait").hide();//隐藏支付中
		$("#alert .put_code").show();//显示验证码输入框
		$("#alert #sendSuccessShow").hide();//发送成功提示信息隐藏
		$("#alert #codeAlert").css("border","1px solid #f85964");//输入框错误样式
		$("#alert .font-red").show().text(returnData.resDesc);//显示错误信息
	}
}

//重新获取验证码-->
$("#alert #repeatGet").click(function(){
 var params = {};
 var url = null;
 
 if(typeof($("#mycards")[0]) != "undefined" && $("#mycards")[0].style.display != "none" && $("#myb-gotopay").css("display") == "none"){//我的银行卡
		url = $("#CASHIER_WEB_PATH").attr("attr_v")+"quicksController/sends.dhtml";
	    var idKey = $("#mycards #bankItem .hover_li").attr("idKey");
	    var ujm = $("#ujm").val();
		
		params.parameters = {idKey : idKey,ujm : ujm};		
	}
  if(typeof($("#platform-kjzf")[0]) != "undefined" && $("#platform-kjzf")[0].style.display != "none"){
        if($("#platform-kjzf #bank_message").css("display") != "none" || $("#platform-kjzf #bank_message").css("display") == ""){//易宝首次
	       url = $("#CASHIER_WEB_PATH").attr("attr_v")+"fastPaysController/oneNoteValidation.dhtml";
		   var parameters = {
					ujm : $("#ujm").val(),
					supplierNo : $("#supplierNo").val(),
					cardType : "010",
					cardNo : $("#byerCardNo").val().replace(/[ ]/g,""),
					idCard : $("#byerIdCard").val(),
					phone : $("#byerMobileNo").val(),
					owner : Base64.encode($("#byerName").val()),
					bankCode : $("#bankCode").val()
				                };
		   params.parameters = parameters;
		} else {//快捷
		   var supplierNo = null;
		   var parameters = {};
		      url = $("#CASHIER_WEB_PATH").attr("attr_v")+"quicksController/sends.dhtml";
		      parameters = {
					ujm : $("#ujm").val(),
					cardSerila : $("#cardSerila").val(),
					supplierNo : $("#supplierNo").val()
			  };
		   params.parameters = parameters;
		}  
  }
  
  if(typeof($("#platform-fqfk")[0]) != "undefined" && $("#platform-fqfk")[0].style.display != "none"){//分期
      url = $("#CASHIER_WEB_PATH").attr("attr_v")+"quicksController/sends.dhtml";
      var parameters = {
			ujm : $("#ujm").val(),
			supplierNo : $("#platform-fqfk #supplierNo-fqfk").val(),
			cardSerila : $("#bindSerila-fqfk").val()
		};
		params.parameters = parameters;
  }
  
  if($("#myb-gotopay").css("display") != "none"){//美盈宝
     url =  $("#CASHIER_WEB_PATH").attr("attr_v")+"meiybController/sends.dhtml";
     var parameters = {
          pwd:$.trim($("#myb_password_text").val()),
			ujm : $("#ujm").val()
	   };
	   params.parameters = parameters;
  }
	params.isAsync = false;
	params.reqUrl = url;
	params._this = "#alert #downtimeAlert";
	params.callBack = function(returnData,_this,tipPos){
							var respFlag=returnData.resCode;
			          	    var transNo=returnData.transNo;
			          	    var cardSerila=returnData.cardSerila;
							if(respFlag=='0000'){
							    if(typeof($("#platform-kjzf")[0]) != "undefined" && $("#platform-kjzf")[0].style.display != "none"){//快捷
							       $("#transNo").val(transNo);
							    }
							    if(typeof($("#mycards")[0]) != "undefined" && $("#mycards")[0].style.display != "none"){//我的银行卡
							       $("#mycards_transNo").val(transNo);
							    }
								if(typeof($("#platform-fqfk")[0]) != "undefined" && $("#platform-fqfk")[0].style.display != "none"){//分期
								   $("#transNo-fqfk").val(transNo);
								}
								if($("#myb-gotopay").css("display") != "none"){//美盈宝
								  $("#myb_transNo").val(returnData.transNo);
								}
								$(tipPos).hide();//错误信息隐藏
								$("#alert #codeAlert").css("border","1px solid #e1e1e1");//输入框样式还原
								$("#alert #sendSuccessShow").show();//发送成功提示信息					
								countDownFun=countDownTimer(returnData.time);
							}else{
								$("#alert #sendSuccessShow").hide();//发送成功提示信息隐藏
								$("#codeAlert").css("border","1px solid #f85964");//输入框错误样式
				                $(tipPos).show().text(returnData.resDesc);//展示错误信息
				            }
			          };
	params.tipPos = "#alert .font-red";	
	
	//发送验证码
	sendRequest(params);
	return false;
});

//校验已绑定的手机验证码-->
function alert_checkBindMobileCode(bindMobileCodeId){
	var verfyCode=$(bindMobileCodeId).val().toString();
	if (!/^\d*$/g.test(verfyCode)){
		$("#alert #sendSuccessShow").hide();//发送成功提示信息隐藏
      $("#alert .font-red").show().text("短信验证码错误，请您核对或重新获取");//展示错误信息
		$(bindMobileCodeId).css("border","1px solid #f85964");//输入框错误样式
		return false;
	}
	return true;
}

//鼠标悬停叹号-->
$("#alert .al_send b,#alert .ph_wrong").hover(function(){
 $("#alert .ph_wrong").show();
},function(){
 $("#alert .ph_wrong").hide();
});

//清空-->
$("#alert .code_tip b").click(function(){
   $("#alert #codeAlert").val("");
});


/**************------------客服吐槽-------------****************/
// 在线客服、吐槽 
$(".say_first").hover(function(){
    $(".yj_tc").css("display","block");
    $(this).removeClass("say_first").addClass("say_firsther");
},function(){
    $(".yj_tc").hide();
    $(this).removeClass("say_firsther").addClass("say_first");
});
$(".serve_second").hover(function(){
    $(this).removeClass("serve_second").addClass("second_hover");
    $(".live800").children().html("<b>在线客服</b>");
     $(".live800 a").attr("hidefocus","hidefocus");
},function(){
    $(this).removeClass("second_hover").addClass("serve_second");
    $(".live800").children().empty();
});



/**********************----------------埋码-------------------*************************/
try{
    if($("#isDataCount").val() == "0"){//需要大数据记录
		var siteName = $("#siteName").val();//站点名称
		var products =  $("#products").val();//产品信息
		var products2 =  $("#products2").val();//产品信息
		var isNormalPay =  $("#isNormalPay").val();//是否正常流程支付
		var orderId =  $("#orderId").val();
		var orderMoney = (Number( $("#orderMoney").val())/Number(100)).toFixed(2);;
	    
		if(isNormalPay == "0"){//正常支付流程，非我的订单页支付流程
			s.pageName="购物流程:"+siteName+"流程:订单成功页";
			s.channel="购物流程";
			s.prop1="购物流程:"+siteName+"流程";
			s.prop2="购物流程:"+siteName+"流程:订单成功页";
			s.prop3="购物流程:"+siteName+"流程:订单成功页";
			s.prop4="购物流程:"+siteName;
			s.events="purchase";
			s.products=products;
			s.eVar11=orderId;
			s.transactionID=orderId;
			s.purchaseID=orderId;
			s.eVar5="在线支付";
			s.eVar6=$("#eVar6").val();
	        gomeClicki('send', 'event', '订单', '订单监测', orderId, {
			    'customActionId': 52,
			    'customActionLabel1': orderId, // 订单ID - orderid
			    'customActionLabel2': orderMoney,     // 订单总金额
			    'customActionLabel3': siteName,       // 站点名称
			    'customActionValue1': '1'
			});
	
			gomeClicki('send', 'event', '订单', '订单产品', orderId, {
			    'customActionId': 54,
			    'customActionLabel1': orderId, 
			    'customActionLabel2': products2, 
			    'customActionValue1': '1'
			});
	    } else {
	        s.pageName="购物流程:"+siteName+"流程:收银台页";
			s.channel="购物流程";
			s.prop1="购物流程:"+siteName+"流程";
			s.prop2="购物流程:"+siteName+"流程:收银台页";
			s.prop3="购物流程:"+siteName+"流程:收银台页";
			s.prop4="购物流程:"+siteName;
	    }
		    
	}
	      var s_code=s.t();if(s_code)document.write(s_code); 
}catch(e){
   //alert(e);
}
	


/******************-------------禁止键盘后退操作-------------******************/
//处理键盘事件 禁止后退键（Backspace）密码或单行、多行文本框除外
function banBackSpace(e){
    var ev = e || window.event;//获取event对象
    var obj = ev.target || ev.srcElement;//获取事件源
    var t = obj.type || obj.getAttribute('type');//获取事件源类型
    //获取作为判断条件的事件类型
    var vReadOnly = obj.getAttribute('readonly');
    var vEnabled = obj.getAttribute('enabled');
    //处理null值情况
    vReadOnly = (vReadOnly == null) ? false : vReadOnly;
    vEnabled = (vEnabled == null) ? true : vEnabled;
    //当敲Backspace键时，事件源类型为密码或单行、多行文本的，
    //并且readonly属性为true或enabled属性为false的，则退格键失效
    var flag1=(ev.keyCode == 8 && (t=="password" || t=="text" || t=="textarea") && (vReadOnly==true || vEnabled!=true))?true:false;

    //当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效
    var flag2=(ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea")?true:false;
    //当alt+方向键，失效
    var flag3=(ev.keyCode == 18 || ev.keyCode == 37 || ev.keyCode == 39)?true:false;
    //判断
    if(flag1){
        return false;
    }
    if(flag2){
        return false;
    }
    if(flag3){
        return false;
    }
}
//禁止后退键 作用于Firefox、Opera
document.onkeypress=banBackSpace;
//禁止后退键 作用于IE、Chrome
document.onkeydown=banBackSpace;


/******************-------------其他-------------******************/
window.history.forward(1);//禁止网页后退，只针对后退一次有效

$(document).ready(function(){
	if($("#isCyberOpen").val() == "1"){//易宝网银默认打开网银支付
		$("#pay__cyberbanking").trigger("click");
	}
});



