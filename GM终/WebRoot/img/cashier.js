
/**
 * 涉及js
 * 订单信息，异步刷新支付结果，ajax提交，发短信倒计时，自动离开页面，银行列表及“更多银行”，数据校验validForm，cardBin信息获取
 ***/

/****************-------订单信息--------**************/
$(document).ready(function(){
	//存在微信扫码
	if($("#scancode_id_weixin").length > 0 ){
		var orderInfo_interval = setInterval(function(){//<#--60秒刷新一次-->
		    var time = (new Date()).getTime();
		    payUrl = $("#CASHIER_WEB_PATH").attr("attr_v")+"scanController/confirmPay.dhtml"+"?isLittle=yes&bankCode=WEIXINPAY&ujm=" + $("#ujm").val()+"&smWidth=120&time="+time;
		    $("#scancode_id_weixin").attr("src",payUrl);
			    if($("#pay_zhifu_colse").css("display") != "block" || $("#scancode_id_weixin").css("display") != "block"){
			         clearInterval(orderInfo_interval);
			    }
		    },60*1000);
			toPayTimer_yinlian($("#ujm").val(),"#pay_zhifu_colse");//异步查询支付结果-->
	}
	
    var lookFlag = false;
    $('.or_look').click(function(){
        if(!lookFlag){
            $(".or_look").html('收起详情<i class="shangla1"></i>');
            if($('.or_dteail').html() === ''){
                parseOrderDetail();
            }
            $('.or_dteail').stop(true,false).slideDown(300,function(){
               $("#bankItem").find("div").removeClass("hover_li").addClass("hover_li");//解决ie7下样式问题
            });
            lookFlag = true;
            $(this).find("i").css("background-position","-168px -50px");
        }else{
            $(".or_look").html('订单详情<i class="xiala1"></i>');
            $('.or_dteail').slideUp(300);
            lookFlag = false;
            $(this).find("i").css("background-position","-168px -56px");
        }
    });
    
    //订单详情hover效果
    $('.or_look').hover(function(){
		$(this).css("color","#F85964");
		 if(!lookFlag){
		    $(this).find("i").css("background-position","-168px -56px");
		 }else{
		 	$(this).find("i").css("background-position","-168px -50px");
		 }
    },function(){
    	$(this).css("color","#006699");
    	 if(!lookFlag){
		    $(this).find("i").css("background-position","-240px -6px");
		 }else{
		 	$(this).find("i").css("background-position","-240px 0px");
		 }
    });
    
 });

 function parseOrderDetail(){
     var params = {
         isAsync : false,
         reqUrl : $("#CASHIER_WEB_PATH").attr("attr_v")+"orderInfoDetailController/showDetail.dhtml",
         parameters : {
             ujm:$("#ujm").val(),
             orderNo: $(".or_left").find("i").html()
         },
         callBack : function(returnData){
             var detailPage = returnData.detailPage;
             $(".or_dteail").html(detailPage);
         }
     };
     //解析订单详情
     sendRequest(params);
 }
 
 
 
 /*****************-----------异步刷新支付结果--------------********************/
 // 异步刷新支付结果，iframe打开时触发、微信扫码
function toPayTimer_yinlian(ujm,chooseBankAfter){
	var finalResCode = "";
	var finalResDesc = "";
	var intervalFun = setInterval(function(){
		var params = {
			isAsync : false,
			reqUrl : $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/toPayCashier.dhtml",
			parameters : {
				ujm:ujm
			},
			_this : this,
			callBack : function(returnData,_this,tipPos){
				var respFlag = returnData.resCode;
				var resDesc = returnData.resDesc;
				finalResCode = respFlag;
				finalResDesc = encodeURIComponent(encodeURIComponent(resDesc));
				if(respFlag =='0000'){
					clearInterval(intervalFun);
					top.location.href = $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/paySuccess.dhtml"+'?ujm='+$("#ujm").val();
				}else if(respFlag=='WAITING'){
					//Do nothing;
				}
			}
		};

		sendRequest(params);
		if($(chooseBankAfter).css("display") == "none"){
			clearInterval(intervalFun);
		}
}, 3000);
return intervalFun;
}

// 异步刷新支付结果
function toPayTimer(){
	var currentOper = arguments[0];
	var isBind = arguments[1];
	var transNo = arguments[2];
	var supplierNo = arguments[3];
	var mouldId = arguments[4];
	var errormsg = arguments[5];
	var phonecode = arguments[6];
	
	var count=15;
	var finalResCode = "";
	var finalResDesc = "";
	var intervalFun = setInterval(function(){
		var params = {
			isAsync : false,
			reqUrl : $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/toPayResult.dhtml",
			parameters : {
				transNo : transNo,
				remainInvokeTime : count,
				supplierNo : supplierNo
			},
			_this : this,
			callBack : function(returnData,_this,tipPos){
				var respFlag = returnData.resCode;
				var resDesc = returnData.resDesc;
				finalResCode = respFlag;
				finalResDesc = encodeURIComponent(encodeURIComponent(resDesc));
				if(respFlag =='0000'){
					clearInterval(intervalFun);
					top.location.href = $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/paySuccess.dhtml" + '?ujm='+$("#ujm").val();
				}else if(respFlag=='WAITING'){
					//Do nothing;
				}else{//此分支不会走，后台controller指向了正在处理页面
					clearInterval(intervalFun);
					return false;
				}
			}
		};
		//异步获取支付请求结果
		sendRequest(params);
		if (count == 0) {
	        clearInterval(intervalFun);
	        if(finalResCode == "WAITING" || finalResCode == ""){
	        	top.location.href = $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/payClz.dhtml" + '?ujm='+$("#ujm").val();
	        }else{
		    	top.location.href = $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/exceptionTip.dhtml" + '?ujm='+$("#ujm").val()+'&resDesc=' + finalResDesc;
	    	}
	    }
	    count--;
    }, 2000);
    return intervalFun;
}

/**
 * ajax提交,发送Ajax请求，并进行回调处理
 * 参数说明：	
 * 		isAsync	————是否异步
 * 		reqUrl	————请求地址
 * 		parameters——请求参数
 * 		_this	————当前操作dom节点
 * 		callBack————请求成功回调函数
 * 		orderNo	————————【加密】订单编号
 * 		orderAccessUrl——【加密】订单查看地址
 * 		strollAroundUrl—【加密】站点访问地址
 * 		supplierNo——供应商编码
 * 		reqInfo	————请求收银台原始参数
 * 		tipPos	————提示位置（dom节点）
 */
function sendRequest(params){
	$.ajax({
 		cache: false,
 		timeout: 6000,
 		type: 'POST',
 		async: params.isAsync,
        dataType: 'JSON',
        url: params.reqUrl,
        data: params.parameters,
        success: function(resultData,textStatus){
        	var resDesc = resultData.resDesc ? resultData.resDesc : "支付过程异常，请您查看订单状态！";
        	var ujm = $("#ujm").val();
        	resDesc = encodeURIComponent(encodeURIComponent(resDesc));
			switch(resultData.handleType){
				//当前页面提示/处理
				case "010":
					params.callBack(resultData,params._this,params.tipPos,params.isBind);
					break;
				//支付成功
				case "000":
					top.location.href = $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/paySuccess.dhtml" + '?ujm='+$("#ujm").val();
					break;
				//支付失败
				case "020":
					top.location.href = $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/payFail.dhtml" + '?ujm='+$("#ujm").val()+'&resDesc=' + resDesc;
					break;
				//支付异常
				case "030":
					top.location.href = $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/exceptionTip.dhtml" + '?ujm='+$("#ujm").val()+'&resDesc=' + resDesc;
					break;
				//处理当中
				case "040":
					top.location.href = $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/payClz.dhtml" + '?ujm='+$("#ujm").val();
					break;
				//订单异常
				case "050":
					top.location.href = $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/payCancel.dhtml" + '?ujm='+$("#ujm").val();
					break;
				//系统维护页
				case "060":
					top.location.href = $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/payMaintain.dhtml" + '?ujm='+$("#ujm").val()+'&bankName='+resultData.bankName+'&limitCode='+resultData.limitCode;
					break;
				//分支全覆盖
				default:
				top.location.href = $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/exceptionTip.dhtml" + '?ujm='+$("#ujm").val()+'&resDesc=' + resDesc;
			}
        },        
        error: function(XMLHttpRequest,textStatus,errorThrown){
        	if(typeof(params.error)=="function"){
        		//如果params.error是一个函数，则执行该函数
        		params.error();
        	}else{
        		var resDesc = encodeURIComponent(encodeURIComponent("支付过程异常，请您查看订单状态！"));
        		top.location.href = $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/exceptionTip.dhtml" + '?ujm='+$("#ujm").val()+'&resDesc=' + resDesc;
        	}
        },
        complete: function(XMLHttpRequest,textStatus){
        	if(textStatus == "timeout"){
        		if(typeof(params.complete)=="function"){
            		//如果params.complete是一个函数，则执行该函数
            		params.complete();
            	}else{
	        		XMLHttpRequest.abort();
	        		var resDesc = encodeURIComponent(encodeURIComponent("请求超时！"));
	        		top.location.href = $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/exceptionTip.dhtml" + '?ujm='+$("#ujm").val()+'&resDesc=' + resDesc;
            	}
            }
     	}
 	});
	
}



/*****************-------------发短信倒计时--------------*******************/
var setIntervalFun;
function countDownTimer(time){
	var count = time;
	var countdownStr = "";
	if(typeof(time) == "undefined"){//缓存里没取出时间，证明离上次发短信已过60秒，重新从60秒计时
	  $("#alert #repeatGet").hide();
	  $("#alert #downtimeAlert").text("60秒后重新获取").show();
	  count = 60;
	}
    setIntervalFun = setInterval(function(){
    	if(count >= 10){
    		countdownStr = count;
    	}else{
    		countdownStr = "0" + count;
    	}
    	$("#alert #repeatGet").hide();
        $("#alert #downtimeAlert").text(countdownStr+"秒后重新获取").show();
        if($("#alert #phonecodeAlertDiv")[0].style.display == "none"){
           $("#alert #phonecodeAlertDiv").show();//验证码输入弹层
        }
	    if (count <= 0) {
	    	    $("#alert #downtimeAlert").hide();
	    	    $("#alert #downtimeAlert").text("");
	    	 	$("#alert #repeatGet").show().val("重新获取验证码");
	            clearInterval(setIntervalFun);
	        }
	   count--;
    }, 1000);
    return setIntervalFun;
}


/*****************-----------自动离开页面-----------********************/
var toPay_repeat_url_s = $("#CASHIER_WEB_PATH").attr("attr_v")+"cashier/query.dhtml?ujm="+$("#ujm").val();
if($("#NeedlessLogin").val() == ""){
	setTimeout(function(){
		window.parent.location.href= $("#GloginURI").val()+"?orginURI=" + encodeURI(toPay_repeat_url_s);
	}, 1800000);
}
var curTimes = Number($("#curTimes").val());
if(curTimes>1800000){
	curTimes = 1860000;
}
if(curTimes>0){
	setTimeout(function(){
		window.parent.location.href= $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/payCancel.dhtml" + '?ujm='+$("#ujm").val();
	},curTimes);
};



/********************--------------银行列表及“更多银行”-------------------**********************/
//默认展示11个网银支付的银行，其他银行默认隐藏，点击 更多银行再展示
$(function(){
	var banklist = $(".bank-lists");
	banklist.each(function(){
		var bankIndex = 0,
		bankCount = 0,
        bankMore = $(this).find(".more"),
        _this = this;
		$(this).find(".ygbx-pay-bank").each(function(){
			bankCount ++;
		});
		$(this).find(".ygbx-pay-bank").each(function(){
			if(bankIndex++ >=11 && bankCount!=12){
				$(this).addClass("banklistHide");
			}
			if(bankIndex>11 && bankCount!=12){//出现“更多”
				bankMore.show();
				$(_this).parent().css({height:"163px",overflow:"hidden","padding-bottom":"11px"});
			}
			if(bankCount<=12){
			  $(_this).parent().css({"padding-bottom":"18px"});
		    }
		});
		bankMore.toggle(
				function(){
					if(typeof($(this).attr("id")) != "undefined" && $(this).attr("id") == "wyzx-more"){
						$(".wyzx-otherType").show();
					}
					$(_this).find(".banklistHide").show();
					bankMore.hide();
					if(bankCount <= 16){
						$(_this).parent().css({height:"184px","padding-bottom":"42px"});
					}else{
						$(_this).parent().css({"paddingBottom":"30px","marginBottom":"20px"});
						$(_this).parent().css({height:"230px",overflow:"auto",position:"relative"});
					}
				},
				function(){
					$(".banklistHide").hide();
				} 
		)
	});

    $(".ygbx-pay-bank").live("hover",function(event){
    	if(event.type=='mouseenter'||event.type=='mouseover'){
    		$(this).find(".discount").css("display","block");
		}else{
			$(this).find(".discount").css("display","none");
		} 
    });
})

//鼠标悬浮银行卡显示银行卡类型
$(".bank-lists li").mouseover(function(e){
	$(this).css("z-index","12").find(".pbc-info-box").show();
	stopBubble(e); //ie阻止事件冒泡
});
$(".bank-lists li").mouseout(function(e){
	$(this).css("z-index","auto").find(".pbc-info-box").hide();
	stopBubble(e);
});

// 阻止事件冒泡
function stopBubble(e){
    if (e && e.stopPropagation)
        e.stopPropagation()
    else
        window.event.cancelBubble=true
}


/** 
* 数据校验validForm，数据验证框架.增加了对id字段检查出错时,直接在对应后面添加一<b>元素来显示错误信息. 
*/ 
	/** 
	 * 在对应id后面错误信息 
	 * id:需要显示错误信息的id元素 
	 * str:显示错误信息 
	 */ 
	function appendError(id, str) {
		if($(id).nextAll().filter("b[color='#d10311']").length!=0){
		   $(id).nextAll().filter("b[color='#d10311']").text("");
		   $(id).nextAll().filter("b[color='#d10311']").text(str);
		   $(id).nextAll().filter("b[color='#d10311']").show();
		   $(id).parent().addClass("mg_rong");
		}else{
		   $(id).after("<b color='#d10311'>"+str+"</b>");
		   $(id).nextAll().filter("b['#d10311']").show();
		   $(id).parent().addClass("mg_rong");
		}
		
	}
	
	// 清理错误信息
	function clearError(id){
		$(id).nextAll().filter("b[color='#d10311']").text("");
		$(id).nextAll().filter("b[color='#d10311']").hide();
		$(id).parent().removeClass("mg_rong");
		$("#platform-kjzf #nobind_errormsg").hide();
	}
	// 清理文本框默认值
	function clearDefaultValue(id,defaultValue){
		var value=$(id).val();
		if (value == defaultValue) {
			$(id).val("");
			$(id).css("color","#000000");
        }
	}
	// 添加文本框默认值
	function appendDefaultValue(id,defaultValue){
		var value=$(id).val();
		if (value == "") {
			$(id).val(defaultValue+"");
			$(id).css("color","#8B8378");
        }else{
			$(id).css("color","#000000");
        }
	}
	//检查字符是否为空 
	function isEmpty(objId,errorMsg) {
		var value=$(objId).val().toString();
		value=value.replace(/[ ]/g,""); 
		var defaultValue=$(objId)[0].defaultValue;
		if(value==defaultValue){
			appendError(objId, errorMsg);
			return false;
		}
		if(value==""){
			appendError(objId, errorMsg);
			return false;
		}
		clearError(objId);
		return true;
   }
	//校验姓名
	function checkByerName(userId){
		var errorMsg="请输入姓名";
		if(!isEmpty(userId,errorMsg)){
			return false;
		}
		//初始化用户名必须为英文或者中文
	 	var userName=$(userId).val();
		 	if(/[^a-zA-Z\u4e00-\u9fa5\·]/g.test(userName)){
		 	    appendError(userId, "姓名格式不正确");
				return false;
		 	}
		clearError(userId);
 		return true;
	}
	// 验证身份证函数
	function checkIdcard(cardId){
		var idcardval= $(cardId).val().toString();
		var errorMsg="请输入身份证号码";
		if(!isEmpty(cardId,errorMsg)){
			return false;
		}
		var ErrorsMsg=new Array("验证通过","请输入15或18位正确身份证号码","身份证号格式不正确","身份证号格式不正确","身份证号格式不正确");
		var Errors=new Array(true,false,false,false,false);
		var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}
		var Y,JYM;
		var S,M;
		var idcard_array = new Array();
		idcard_array = idcardval.split("");
		//身份号码位数及格式检验
		switch(idcardval.length){
			case 15:
				//地区检验
				if(area[parseInt(idcardval.substr(0,2))]==null){
					appendError(cardId,ErrorsMsg[4]);
					return Errors[4];
				}
				if ((parseInt(idcardval.substr(6,2))+1900) % 4 == 0 || ((parseInt(idcardval.substr(6,2))+1900) % 100 == 0 && (parseInt(idcardval.substr(6,2))+1900) % 4 == 0 )){
					ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//测试出生日期的合法性
				} else {
					ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//测试出生日期的合法性
				}
				if(ereg.test(idcardval)){
					return idCardRealValidate(cardId,idcardval);
				} else {
					appendError(cardId,ErrorsMsg[2]);
					return Errors[2];
				}
				break;
			case 18:
				//地区检验
				if(area[parseInt(idcardval.substr(0,2))]==null){
					appendError(cardId,ErrorsMsg[4]);
					return Errors[4];
				}
				//18 位身份号码检测
				//出生日期的合法性检查
				//闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
				//平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))
				if ( parseInt(idcardval.substr(6,4)) % 4 == 0 || (parseInt(idcardval.substr(6,4)) % 100 == 0 && parseInt(idcardval.substr(6,4))%4 == 0 )){
					ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式
				} else {
					ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式
				}
				if(ereg.test(idcardval)) {//测试出生日期的合法性
					//计算校验位
					S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7
						+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9
						+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10
						+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5
						+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8
						+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4
						+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2
						+ parseInt(idcard_array[7]) * 1
						+ parseInt(idcard_array[8]) * 6
						+ parseInt(idcard_array[9]) * 3 ;
					Y = S % 11;
					M = "F";
					JYM = "10X98765432";
					M = JYM.substr(Y,1);//判断校验位
					if(M == idcard_array[17] || M == idcard_array[17].toUpperCase()){
						return idCardRealValidate(cardId,idcardval); 
					} else {
						appendError(cardId,ErrorsMsg[3]);
						return Errors[3];
					}
				} else {
					appendError(cardId,ErrorsMsg[2]);
					return Errors[2];
				}
				break;
			default:
				appendError(cardId,ErrorsMsg[1]);
				return Errors[1];
				break;
			}
	}
	// 身份证是否已作实名认证
	function idCardRealValidate(cardId,idcardval){
		if($("#byerIdCardAuth").text() != "" && $("#byerIdCardAuth").css("display").toUpperCase()  != "NONE"){
			return true;
		}
		if($.trim($("#preSendCodeIdCard").val()) != idcardval) {
			$("#preSendCodeIdCard").val(idcardval);
			clearError(cardId);				
		}else{
			if($("#realNameVeriryTip").val() == "SUCCESS"){
				clearError(cardId);
				return true;
			}
			appendError(cardId,$("#realNameVeriryTip").val());
			return false;
		}
		var params = {
			isAsync : false,
			reqUrl : $("#CASHIER_WEB_PATH").attr("attr_v")+"fastPaysController/idCardValidate.dhtml",
			parameters : {
				ujm : $("#ujm").val(),
				idCard : idcardval
			},
			_this : this,
			callBack : function(returnData,_this,tipPos){
				if(returnData.resCode == "0000"){
					$("#realNameVeriryTip").val(returnData.resDesc);
					return true;
				}
				else{
					appendError(cardId,returnData.resDesc);
					$("#realNameVeriryTip").val(returnData.resDesc);
					return false;
				}
			}
		};
		//立即支付
		sendRequest(params);
		return false;
	}
	
	// 手机号码
	function checkMobilNumber(mobileId,str)
	{  
		if(!isEmpty(mobileId,"请输入手机号")){
			return false;
		}
		var mobileNumber=$(mobileId).val().toString();
		var length = mobileNumber.length;
		if (length == 11){
			if (!/^\d*$/g.test(mobileNumber)){
				appendError(mobileId, "您输入的手机号不合法");
				return false;
			}
			clearError(mobileId);
			return true;
		}else if(length>11){
			
			appendError(mobileId, "请输入11位手机号");
			return false;
		}
		appendError(mobileId, "您输入的手机号不合法");
		return false;
	};
	
	// 银行卡号验证
	function bankNoLuhmCheck(bankCardId){
		if(!isEmpty(bankCardId,"请输入银行卡号")){
			return false;
		}
		var bankCardNum=$(bankCardId).val();
		//去除中间字符串空格
		bankCardNum=bankCardNum.replace(/[ ]/g,"");
		if (bankCardNum.length > 19) {
			//$("#banknoInfo").html("银行卡号长度必须在16到19之间");
			appendError(bankCardId,"输入的卡号长度不能大于19位。");
			return false;
		}
		var num = /^\d*$/;  //全数字
		if (!num.exec(bankCardNum)) {
			appendError(bankCardId,"卡号格式不正确");
			return false;
		}
		//开头6位
		var strBin="10,18,30,35,37,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,58,60,62,65,68,69,84,87,88,94,95,98,99";    
		if (strBin.indexOf(bankCardNum.substring(0, 2))== -1) {
			//$("#banknoInfo").html("银行卡号开头6位不符合规范");
			appendError(bankCardId,"输入有误");
			return false;
		}
		//取出最后一位（与luhm进行比较）
        var lastNum=bankCardNum.substr(bankCardNum.length-1,1);
        //前15或18位
        var first15Num=bankCardNum.substr(0,bankCardNum.length-1);
        var newArr=new Array();
        //前15或18位倒序存进数组
        for(var i=first15Num.length-1;i>-1;i--){    
            newArr.push(first15Num.substr(i,1));
        }
        //奇数位*2的积 <9
        var arrJiShu=new Array(); 
        //奇数位*2的积 >9
        var arrJiShu2=new Array();
        //偶数位数组
        var arrOuShu=new Array(); 
        for(var j=0;j<newArr.length;j++){
            if((j+1)%2==1){//奇数位
                if(parseInt(newArr[j])*2<9)
                arrJiShu.push(parseInt(newArr[j])*2);
                else
                arrJiShu2.push(parseInt(newArr[j])*2);
            } else //偶数位
            arrOuShu.push(newArr[j]);
        }
        //奇数位*2 >9 的分割之后的数组个位数
        var jishu_child1=new Array();
        //奇数位*2 >9 的分割之后的数组十位数
        var jishu_child2=new Array();
        for(var h=0;h<arrJiShu2.length;h++){
            jishu_child1.push(parseInt(arrJiShu2[h])%10);
            jishu_child2.push(parseInt(arrJiShu2[h])/10);
        }
        //奇数位*2 < 9 的数组之和
        var sumJiShu=0;
        //偶数位数组之和
        var sumOuShu=0;
        //奇数位*2 >9 的分割之后的数组个位数之和
        var sumJiShuChild1=0;
        //奇数位*2 >9 的分割之后的数组十位数之和
        var sumJiShuChild2=0; 
        var sumTotal=0;
        for(var m=0;m<arrJiShu.length;m++){
            sumJiShu=sumJiShu+parseInt(arrJiShu[m]);
        }
        for(var n=0;n<arrOuShu.length;n++){
            sumOuShu=sumOuShu+parseInt(arrOuShu[n]);
        }
        for(var p=0;p<jishu_child1.length;p++){
            sumJiShuChild1=sumJiShuChild1+parseInt(jishu_child1[p]);
            sumJiShuChild2=sumJiShuChild2+parseInt(jishu_child2[p]);
        }      
        //计算总和
        sumTotal=parseInt(sumJiShu)+parseInt(sumOuShu)+parseInt(sumJiShuChild1)+parseInt(sumJiShuChild2);
        //计算Luhm值
        var k= parseInt(sumTotal)%10==0?10:parseInt(sumTotal)%10;        
        var luhm= 10-k;
        if(lastNum==luhm){
	        //$("#banknoInfo").html("Luhm验证通过");
        	clearError(bankCardId);
	        return true;
        }else{
        	appendError(bankCardId,"输入有误");
	        return false;
        }        
	}
	
	// 校验验证码
	function checkVerfyCode(verfyCodeId)
	{  
		if(!isEmpty(verfyCodeId,"请输入验证码")){
			return false;
		}
		var verfyCode=$(verfyCodeId).val().toString();
		var length = verfyCode.length;
		if (length == 6){
			if (!/^\d*$/g.test(verfyCode)){
				appendError(verfyCodeId, "请输入正确验证码");
				return false;
			}
			clearError(verfyCodeId);
			return true;
		}
		appendError(verfyCodeId, "请输入6位验证码");
		return false;
	};
	
	//清理手机验证码框格式
	function clearSpecialError(bindMobileCodeId){
		$(bindMobileCodeId).css("border","1px solid #e0e0e0");
		$("#platform-kjzf #bind_errormsg").hide();
	}

	// 校验信息是否被串改
	function validateFormConsistency(param){
		var msg = "";
		if($("#preByerName").val() != param.byerName) return msg = "姓名与获取验证码前信息不一致！";
		if($("#preByerIdCard").val() != param.byerIdCard) return msg = "身份证号码与获取验证码前信息不一致！";
		if($("#preByerCardNo").val() != param.byerCardNo) return msg = "银行卡号与获取验证码前信息不一致！";
		if($("#preByerMobileNo").val() != param.byerMobileNo) return msg = "手机号码与获取验证码前信息不一致！";
		return msg;
	}

	
	/********************-----------cardBin信息获取-----------------***********************/
	//	获取卡信息
	var global_resultCardBinSearch = null;
	var global_cardNo = null;
	function getCardBinInfo(cardNo,bankCode){
	    if(cardNo.length < 13){
	       return null;
	    }
		var reqCardBinData = "";
		if(bankCode !=undefined && bankCode!=null){
			reqCardBinData="cardNo="+cardNo+"&bankCode="+bankCode;
		}else{
			reqCardBinData="cardNo="+cardNo;
		}
		
		var resultCardBinSearch = null;
		if(global_cardNo != cardNo){//当传的卡号有变化时才调异步请求，否则直接返回上次查询结果
			$.ajax({
				"url":  $("#CASHIER_WEB_PATH").attr("attr_v")+"bankCardController/search.dhtml",
				"type": "get",
				"dataType": "json",
				"data": reqCardBinData,
				"async":false,
				"error": function(XMLHttpRequest, textStatus, errorThrown) {
				  var resDesc = encodeURIComponent(encodeURIComponent("支付过程异常，请您查看订单状态！"));
    		      top.location.href = $("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/exceptionTip.dhtml" + '?ujm='+$("#ujm").val()+'&resDesc=' + resDesc;
				},
				"success": function(data) {
					if(data.result=='0000'||data.result=='0001'){
						resultCardBinSearch = data.resultObj;
					}else if(data.result=='0002'){
						resultCardBinSearch = null;
					}
					global_cardNo = cardNo;
			        global_resultCardBinSearch = resultCardBinSearch;
				}
			});
		} else{
		    resultCardBinSearch = global_resultCardBinSearch;
		}
		return resultCardBinSearch;
	}
	
	//校验卡bin是否合法，应传入卡bin的6位，兼容传入全量银行卡号
	function checkCardBin(cardNo,bankCode){
		try{
			if(cardNo==undefined || cardNo == null){
				return false;
			}
			var cardData = getCardBinInfo(cardNo,bankCode);
	        if(cardData != undefined && cardData != null){
		        return true;
			}else{
				return false;
			}
		}catch(e){
			alert(e);
			return false;
		}
	}
	
	//	是否是借记卡，是返回true,否返回false，未知返回undefined
	function isDebitCard(cardNo){
		if(cardNo==undefined || cardNo == null){
			return false;
		}
		var cardData = null;
		try{
			cardData = getCardBinInfo(cardNo,bankCode);
	        if(cardData != undefined && cardData != null){
	        	//卡bin存在
			}else{
				return undefined;
			}
		}catch(e){
			alert(e);
			return false;
		}
		if(cardData.cardType == '010'){
			return true;
		}else{
			return false;
		}
	}
	
	//是否是贷记卡
	function isCreditCard(){
		if(cardNo==undefined || cardNo == null){
			return false;
		}
		var cardData = null;
		try{
			cardData = getCardBinInfo(cardNo,bankCode);
	        if(cardData != undefined && cardData != null){
	        	//卡bin存在
			}else{
				return undefined;
			}
		}catch(e){
			alert(e);
			return false;
		}
		if(cardData.cardType == '020'){
			return true;
		}else{
			return false;
		}
	}
	/*解决ie11兼容性问题*/
	if (/*@cc_on!@*/false) {
	document.documentElement.className += ' ie' + document.documentMode;
	}
	if (/*@cc_on!@*/true) {
	document.documentElement.className += ' ie' + document.documentMode;
	}
	