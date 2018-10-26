
/**
 * 我的银行卡、美盈宝相关js 
***/

   $(document).ready(function(){  
		var firstCard = $("#mycards .qc_check li").eq(1);
		$("#mycards #bankItem").html(firstCard.html());//把最新的绑定银行放在当前
		$("#currentBank").html(firstCard.html());//添加到绑卡列表头部
		firstCard.hide();//隐藏列表中的该银行
		var idkeys = firstCard.find("div").attr("idKey");
		$("#mycards .qc_check li").hover(function(){
			$(this).addClass("qc_hover");
		},function(){
			$(this).removeClass("qc_hover");
		});
		$("<span class='old_check'></span>").appendTo($("#currentBank div"));//在绑卡列表头部追加选中的对号
		if(typeof(idkeys) != "undefined" && idkeys != "DEFAULT"){//分期快捷，银联、易宝快捷
		     mycards_fenliu(firstCard.find("div").attr("idKey"));
		}else{
			 if("030" == firstCard.find("div").attr("payMode")){
	    	    //分期直连
	    	    fqzl_fenliu(firstCard.find("div").attr("bankCode"),$("#ujm").val(),"1");
	    	    mycards_payMode = firstCard.find("div").attr("payMode");
	    	 }else{   
	    	   changePayModle(firstCard.find("div").attr("payMode"));//平台，网银支付方式
	    	   mycards_payMode = firstCard.find("div").attr("payMode");
	    	 }	
		}
		//显示“使用新银行卡”
		$("#mycards #useUewCard").show();
		//二次支付下拉事件
		//选定下拉绑卡触发动作
		var xuanB=$('#mycards .xuan_check1').find('.xiala_k');
		var checkUl = $('#mycards .qc_check');//银行卡绑卡列表
		var slddiv=$("#mycards #swapdiv #bankItem");//显示位置
    	checkUl.delegate(".hover_li","click",function(e){
    		  if($(this).parent().attr("id") != "currentBank"){//如果点击的是绑卡列表头部的银行不做切换处理
			      $(this).parent().siblings().show();//显示所有的银行
			      slddiv.html($(this).parent().html());//添加到显示位置
			      $("#currentBank").html($(this).parent().html());//添加到绑卡列表头部
			      $(this).parent().hide();//隐藏列表中的该银行 
			      $("<span class='old_check'></span>").appendTo($("#currentBank div"));//把对号放在当前选中的银行上
    		  }
		      checkUl.hide();
		      if("DEFAULT" == $(this).attr("idKey")){
		    	 if("030" == $(this).attr("payMode")){
		    	    //分期直连
		    	    fqzl_fenliu($(this).attr("bankCode"),$("#ujm").val(),"1");
		    	    mycards_payMode = $(this).attr("payMode");
		    	 }else{   
		    	   changePayModle($(this).attr("payMode"));//平台，网银支付方式
		    	   mycards_payMode = $(this).attr("payMode");
		    	 }
		       }else{
		    	 mycards_fenliu($(this).attr("idKey"));//分期快捷，银联、易宝快捷
	           }
  	     });
		//点击二次支付展开箭头
		xuanB.click(function(){
			  if($(this).children(".xiala1").length == 0){
				  checkUl.hide();
				  return false;
			  }
		      checkUl.show();
		});
		//银行显示区域的点击事件
		slddiv.delegate(".hover_li","click",function(e){
			  if(xuanB.children(".xiala1").length == 0){
				  checkUl.hide();
				  return false;
			  }
			  checkUl.show();
		 });
		$("#mycards .qc_check").mouseleave(function(){
			$(this).hide();
		});
		 //使用新银行卡
		 $("#mycards #newBank").click(function(){
			 //显示所有支付方式
			 $(".payTypeSelect").show();
			 //关闭所有的支付方式大窗口
			 if(mycards_payMode != "030"){//解决火狐下信用卡分期点“使用新银行卡”闪现问题
			    platformCloseAll();
			 }
			 if(mycards_payMode == "020"){
				 $("#pay__fastPay").hide();//隐藏打开的支付方式大窗口的支付方式入口
				 $("#platform-kjzf #otherBank").trigger("click")//触发“使用其他银行卡”,初始化页面布局
				 fastPay_open();//打开相应的支付方式大窗口
			 }else if(mycards_payMode == "030"){//分期
				 $("#pay__creditCardFQ").hide();
				 $("#platform-fqfk #otherBank-fqfk").trigger("click");//触发“使用新银行卡”,初始化页面布局
				 platformCloseAll();
				 creditCardFQ_open();
			 }else if(mycards_payMode == "050"){//平台支付
				 $("#pay__platform").hide();
				 $("#platform-zfpt .ygbx-pay-bank").attr("style","");//模块样式初始化
				 $("#gotopay-zfpt a").removeClass("btn-gotopay").addClass("btn_unable");
				 platform_open();
			 }else if(mycards_payMode == "010"){//网银
				 $("#pay__cyberbanking").hide();
				 $("#platform-wyzx .ygbx-pay-bank").css({"border":"1px solid rgb(230, 230, 230)","z-index":"auto"});//模块样式初始化
				 $("#gotopay-wyzx a").removeClass("btn-gotopay").addClass("btn_unable");
				 cyberbanking_open();
			 }
		 });
   });

  /**
   * 显示相应支付方式
   */
  function changePayModle(payModle){
	  $("#mycards #mycards-bank").hide();//分期信息
	  $("#mycards #mycards_pay_checkway").hide();//分期支付、快捷支付  支付按钮
	  $("#mycards #mycards_pay").hide();//平台，普通网银支付按钮
	  $("#mycards #mycards_bind_errormsg").html("");//错误信息
	  if(payModle == "030"){//分期
		  $("#mycards #mycards-bank").show();//分期信息
		  $("#mycards #mycards_pay_checkway").show();//支付按钮
	  }else if(payModle == "020"){//快捷
		  $("#mycards #mycards_pay_checkway").show();//支付按钮
	  } else {
		  $("#mycards #mycards_pay").show();
		  $("#mycards #mycards_pay").attr("paymodle",payModle);
		  if(payModle == "050"){//平台
			  $("#mycards #mycards_pay a").html("立即支付");
			  $("#mycards #mycards_pay").removeClass("pay_checkway_zl").addClass("pay_checkway2");
		  } else if(payModle == "010"){//普通网银
			  $("#mycards #mycards_pay a").html("跳转至网银支付");
			  $("#mycards #mycards_pay").removeClass("pay_checkway_zl").addClass("pay_checkway2");
		  } else if(payModle == "fqzl"){//直连分期
			  $("#mycards #mycards-bank").show();//分期信息
			  $("#mycards #mycards_pay a").html("立即支付");
			  $("#mycards #mycards_pay").removeClass("pay_checkway2").addClass("pay_checkway_zl");
		  }
	  }
	  $("#mycards").removeClass("platform1-top").addClass("platform1-top");//解决ie8下支付按钮下沉问题
  }
   
  //二次支付 获取分流标示
  var mycards_pageCallMode = null;
  var mycards_payMode = null;
  var mycards_supplierNo = null;
  var mycards_cardSerila = null;
  function mycards_fenliu(){
	   var url = $("#CASHIER_WEB_PATH").attr("attr_v")+"secondsFacadeController/query.dhtml";
	   var idkey = arguments[0];
	   var bankCode = arguments[1];
	   var isCheckChannel = "1";
	   var params = {
			isAsync : false,
			reqUrl : url,
			parameters : {
				idKey : "" + idkey,
				ujm:$("#ujm").val(),
				isCheckChannel : ""+ isCheckChannel//是否校验支付渠道限制：0 否；1 是。
			},
			callBack : function(returnData,_this,tipPos){
				clearErrorMsgMycard();//清理错误信息
			   if(typeof(returnData.limitShow) != "undefined")
			     $("#mycards #bankItem .moy_unit .money_yuan").html(returnData.limitShow);//分流后限额重新赋值
			   if(returnData.telphone != "" && typeof(returnData.telphone) != "undefined"){//易宝
				 var phone = returnData.telphone;
				 phone = phone.substring(0,3)+"****"+phone.substring(phone.length-4,phone.length);
				 $("#alert #currentTelAlert").html(phone);
				 $('#alert .put_code').css("margin-top", "");
			     $('#alert .al_send').css("visibility","visible");
			   } else {
				 $('#alert .put_code').css("margin-top", "20px");
			     $('#alert .al_send').css("visibility","hidden");
			   }
			   $("#mycards_supplierNo").val(returnData.supplierNo);
			   $("#mycards #bankItem .hover_li").attr("idKey",returnData.idKey);//卡序号,卡类型,银行编码,供应商编码   重新赋值
			   mycards_payMode = returnData.payMode;
			   changePayModle(returnData.payMode);
			   if(mycards_payMode == "030"){//信用卡分期
				   mycards_parseStaging(returnData);
				   loadMyCardsFloatAdFq($("#CASHIER_WEB_PATH").attr("attr_v")+"loadAdvertisementController/"+'loadMyCardsFloatAdFq.dhtml?ujm='+$("#ujm").val(),returnData.supplierNo,'030',returnData.bankCode);//加载分期广告
			   }
			}
		};
		sendRequest(params);
	}
  function clearErrorMsgMycard(){
	  $("#mycards_checkway_errormsg").text("").hide();
  }
  //分期直连
  function fqzl_fenliu(bankCode,ujm,isCheckChannel){
	   var url = $("#CASHIER_WEB_PATH").attr("attr_v")+"secondsFacadeController/querys.dhtml";
	   var idkey = arguments[0];
	   var isCheckChannel = "1";
	   var params = {
			isAsync : false,
			reqUrl : url,
			parameters : {
				bankCode : bankCode,
				ujm:ujm,
				isCheckChannel : isCheckChannel//是否校验支付渠道限制：0 否；1 是。
			},
			callBack : function(returnData,_this,tipPos){
			   $('.static_ph').hide();
			   $("#mycards_supplierNo").val(returnData.supplierNo);
			   $("#mycards #bankItem .hover_li").attr("idKey",returnData.idKey);//卡序号,卡类型,银行编码,供应商编码   重新赋值
			   mycards_payMode = returnData.payMode;
			   changePayModle("fqzl");
			   if(mycards_payMode == "030"){//信用卡分期
				   mycards_parseStaging(returnData);
				   loadMyCardsFloatAdFq($("#CASHIER_WEB_PATH").attr("attr_v")+"loadAdvertisementController/"+'loadMyCardsFloatAdFq.dhtml?ujm='+$("#ujm").val(),returnData.supplierNo,'030',bankCode);//加载分期广告
			   }
			}
		};
		sendRequest(params);
  }
  
  /**
   * method 分期支付首次加载分期信息
   * param returnData json对象
   */
  function mycards_parseStaging(returnData){
	var stagingArray = returnData.stagingArray;
	var stagin = [3,6,9,12,18,24];
	var defaultCheck = false;
	$("#mycards").find(".fq_check").hide();
	$("#mycards").find(".fq_check").attr("clicked","");
	$("#mycards").find(".fq_paymy").hide();
	$("#mycards").find(".gmform-label").removeClass("gmform_brred").addClass("gmform_brgray");
	for(var i = 0; i < stagingArray.length; i++){
		var stagingCount = stagingArray[i].stagingCount;
		if(isFqStagNotEmpty(stagingCount)){
	  		if(!defaultCheck){
				$("#mycards_installmentsNo_fqfk").val(stagin[i]);
				$("#mycards_labelfq"+stagin[i]).removeClass("gmform_brgray").addClass("gmform_brred");
				$("#mycards_labelfq"+stagin[i]+" .fq_check").show();
	  			$("#mycards_detail"+stagin[i]).show();
	  			defaultCheck = true;
	  		}else{
	  			$("#mycards_detail"+stagin[i]).hide();
	  		}
	  		
	  		$("#mycards_labelfq"+stagin[i]).show();
	  		var pay = stagingArray[i].stagingCount_full_fee*1 + $("#mycards_order"+stagin[i]).text()*1;
	  		$("#mycards_pay"+stagin[i]).text(pay.toFixed(2));
	  		$("#mycards_fee"+stagin[i]).text(stagingArray[i].stagingCount_full_fee);
	  		$("#mycards_first"+stagin[i]).text(stagingArray[i].stagingCount_first_money);
	  		$("#mycards_poundage"+stagin[i]).text("("+returnData.poundageMode+")");
			$("#mycards_labelfq"+stagin[i]+" .lb_right").html(stagingArray[i].stagingCount_every_money + "元/期");
	  	}else{
	  		$("#mycards_labelfq"+stagin[i]).hide();
	  		$("#mycards_detail"+stagin[i]).hide();
	  	}
	}
  }
  
  /**
   * 判断期数是否为空
   * @param obj
   * @returns {Boolean}
   */
  function isFqStagNotEmpty(stagingCount){
  	if(stagingCount != null && stagingCount != undefined && stagingCount != '' && stagingCount != 'null'){
  		return true;
  	}else{
  		return false;
  	}
  }
	//分期切换
	$("#mycards .gmform-label").bind("click",function(){
		$("#mycards").find(".fq_check").hide().attr("clicked","");
		mycardsfenqi();
		$(this).find(".fq_check").show().attr("clicked","true");
		if($(this).find(".fq_check").attr("clicked")=="true"){
			$(this).removeClass("gmform_brgray").addClass("gmform_brred");
			$(this).find("span p").removeClass("fq_fanq").addClass("fq_paymy");
		}
		mycards_changeStaging($(this).attr("value"));
	}).bind("mouseover",function(){
		$(this).removeClass("gmform_brgray").addClass("gmform_brred");
		$(this).find("span p").removeClass("fq_fanq").addClass("fq_paymy");
		window.event.cancelBubble = true;
	}).bind("mouseout",function(){
		if($(this).find(".fq_check").attr("clicked")!="true"){
			$(this).removeClass("gmform_brred").addClass("gmform_brgray");
			$(this).find(".fq_check").hide();
			$(this).find("span p").removeClass("fq_paymy").addClass("fq_fanq");
		}
		window.event.cancelBubble = true;
	});
	function mycardsfenqi(){
		if($("#mycards .gmform-label").find(".fq_check").attr("clicked")!="true"){
			$("#mycards .gmform-label").removeClass("gmform_brred").addClass("gmform_brgray");
			$("#mycards .gmform-label").find(".fq_check").hide();
			$("#mycards .gmform-label").find("span p").removeClass("fq_paymy").addClass("fq_fanq");
		}
	}
	/**
	 * method 分期详细信息切换
	 * param staging 分期数
	 */
	function mycards_changeStaging(staging){
		$("#mycards #mycards_detail3").hide(); 
		$("#mycards #mycards_detail6").hide();
		$("#mycards #mycards_detail9").hide();
		$("#mycards #mycards_detail12").hide();
		$("#mycards #mycards_detail18").hide();
		$("#mycards #mycards_detail24").hide();
		if(staging === '3'){//3期
			$("#mycards_installmentsNo_fqfk").val("3");
		    $("#mycards #mycards_detail3").show();
		}else if(staging === '6'){//6期
			$("#mycards_installmentsNo_fqfk").val("6");
		    $("#mycards #mycards_detail6").show();
		}else if(staging === '9'){
			$("#mycards_installmentsNo_fqfk").val("9");
		    $("#mycards #mycards_detail9").show();
		}else if(staging === '12'){//12期
			$("#mycards_installmentsNo_fqfk").val("12");
		    $("#mycards #mycards_detail12").show();
		}else if(staging === '18'){//18期
			$("#mycards_installmentsNo_fqfk").val("18");
		    $("#mycards #mycards_detail18").show();
		}else if(staging === '24'){//24期
			$("#mycards_installmentsNo_fqfk").val("24");
		    $("#mycards #mycards_detail24").show();
		}
		
	}
	
	//平台，网银支付，招商直连   立即支付
	$("#mycards #mycards_pay a").click(function(){
		    var paymodle = $(this).parent().attr("paymodle");
		    $("#cashierForm input[name='bankCode']").val($("#mycards #bankItem .hover_li").attr("bankCode"));
		    if(paymodle == "010"){//网银
			    var cardType = $("#mycards #bankItem .quike_way").attr("cardType");
			    $("#flowIe-payLayer .al_red2 a").attr("href","http://help.gome.com.cn/article/233-241-0.html");
			    $("#flowIe-payLayer #payLayerHead").html("登录网上银行支付");
				$("#cashierForm input[name='payMode']").val("010");
		        $("#cashierForm input[name='cardType']").val(cardType);
		    } else if(paymodle == "050"){//平台
		    	$("#flowIe-payLayer .al_red2 a").attr("href","http://help.gome.com.cn/article/233-242-0.html");
			    $("#flowIe-payLayer #payLayerHead").html("登录平台支付");
				$("#cashierForm input[name='cardType']").val("010");
				$("#cashierForm input[name='payMode']").val("050");
		    } else if(paymodle == "fqzl"){//招商直连
		    	 $("#flowIe-payLayer .al_red2 a").attr("href","http://help.gome.com.cn/article/234-0-0.html");
		    	 $("#flowIe-payLayer #payLayerHead").html("登录网上银行支付");
			     $("#cashierForm input[name='payMode']").val("030");
			     $("#cashierForm input[name='cardType']").val("020");
			     $("#cashierForm input[name='installmentsNo']").val($("#mycards_installmentsNo_fqfk").val());
		    }
		    $("#cashierForm input[type='submit']").trigger("click");
		    $('#flowIe-payLayer,.thickdiv,.alert-box').show();
	});	
	
	//快捷，分期 立即支付
	$("#mycards #mycards_pay_checkway a").click(function(){
		var url = $("#CASHIER_WEB_PATH").attr("attr_v")+"quicksController/sends.dhtml";
	    var idKey = $("#mycards #bankItem .hover_li").attr("idKey");
	    var bankName = $("#mycards #bankItem .way_1 img").attr("alt");
	    var ujm = $("#ujm").val();
	    var $this = $(this);
	    if($this.text().indexOf("支付中") > -1) return false;
		$this.removeClass("btn-gotopay").addClass("btn_unable2").html('<span>支付中</span><img style="margin-left:2px;vertical-align:middle" src="'+$("#RESOURCE_PATH").attr("attr_v")+'image/paying.gif"/>');
		var params = {
			isAsync : false,
			reqUrl : url,
			parameters :{bankName:bankName,idKey : idKey,ujm : ujm,installmentsNo:$("#mycards_installmentsNo_fqfk").val()},
			_this : "#alert #downtimeAlert",
			callBack : function(returnData,_this,tipPos){
				var respFlag=returnData.resCode;
          	    var transNo=returnData.transNo;
          	    var cardSerila=returnData.cardSerila;
				if(respFlag=='0000'){
					$("#mycards_transNo").val(transNo);
					countDownFun=countDownTimer(returnData.time);
					$("#mycards #mycards_checkway_errormsg").text("");//清空错误信息
				}else{
					$this.removeClass("btn_unable2").addClass("btn-gotopay").html("立即支付").attr("disabled",false);
					$(tipPos)[0].style.display="block";
	                $(tipPos).text(returnData.resDesc);
	            }
			},
			tipPos : "#mycards #mycards_checkway_errormsg"
		};
		//发送验证码
		sendRequest(params);
		return false;	
	});
	
	//支付方式大窗口的打开和关闭
	function mycards_open(){
	    $("#mycards").show();
	}

	
	
   /**美盈宝**/
   var myb_query_url = $("#CASHIER_WEB_PATH").attr("attr_v")+"meiybController/query.dhtml";
   var myb_sends_url = $("#CASHIER_WEB_PATH").attr("attr_v")+"meiybController/sends.dhtml";
   var hasmycards = true;
   if($("#mycards").css("display") == "none"){
       hasmycards = false;
   }
   
   //我的银行卡   
   $("#check-unit-mycards").click(function(){
       $("#myb-open").find("i").eq(0).hide();
	   $(this).find("i").eq(0).show();
	   $("#myb-gotopay").hide();//隐藏美盈宝支付按钮
	   $("#myb_password").hide();//隐藏美盈宝密码输入框
	   $("#mycards-gotopay").show();//显示我的银行卡支付按钮
	   $("#mycards-fq").show();//显示分期信息
	   $("#mycards-bank").hide();//隐藏分期信息
	   $("#border_cg").css("border","2px solid #F85964");//我的银行卡选中样式
	   $("#myb-pay").css({"border":"2px solid #fff"});//美盈宝样式还原,"border-top":"2px solid #f3f3f3"
	   $(".myb-ndpay").hide();//支付金额
	   $(".pr_pay").show();
	   //点击我的银行卡，重新分流
	   var obj = "#mycards #bankItem .hover_li";
	   if("DEFAULT" == $(obj).attr("idKey")){
    	 if("030" == $(obj).attr("payMode")){
    	    //分期直连
    	    fqzl_fenliu($(obj).attr("bankCode"),$("#ujm").val(),"1");
    	    mycards_payMode = $(obj).attr("payMode");
    	  }else{   
    	    changePayModle($(obj).attr("payMode"));//平台，网银支付方式
    	    mycards_payMode = $(obj).attr("payMode");
    	  }
		}else{
		   mycards_fenliu($(obj).attr("idKey"));//分期快捷，银联、易宝快捷
	    }
   });
   
   //美盈宝
   $("#check-unit-myb").click(function(){
       $("#border_cg").find("i").eq(0).hide();
	   $(this).find("i").eq(0).show();
	   $("#mycards-gotopay").hide();//隐藏我的银行卡支付按钮
	   $("#mycards-fq").hide();//隐藏分期信息
	   $("#myb_password").show();//显示没盈宝密码输入框
	   $("#myb-gotopay").show();//显示美盈宝支付按钮
	   $("#myb-gotopay a").removeClass("btn_unable").addClass("btn-gotopay");//美盈宝支付按钮置为可点
	   $("#myb-pay").css("border","2px solid #F85964");//美盈宝选中样式
	   $("#border_cg").css({"border":"2px solid #fff"});//我的银行卡样式还原
	   $(".myb-ndpay").show();
	   $(".pr_pay").hide();
	   
	   platformCloseAll();  //关闭所有的支付方式大窗口-->
	   //显示我的银行卡里美盈宝支付按钮-->
	   $("#mycards").show();
	   //显示所有支付方式-->
	   $(".payTypeSelect").show();
	   //针对只有美盈宝没有我的银行卡的情况-->
	   if(!hasmycards){
		   $("#border_cg").hide();
		   $("#myb_gotopay").css("padding-top","30px");
	   }
       if(hasmycards){
	       $("#border_cg").show();//显示我的银行卡
	   }
   });
   
   $("#mycards .xuan_check1").click(function(){//切换银行卡、使用新银行卡，触发选中
       $("#check-unit-mycards").trigger("click");
   });
 
   
   function focus_common(id,message){
        $("#myb_password .myb-prompt").hide();
        $(".pay-pswd input").css("border","1px solid #ccc");
        $("#myb_checkway_errormsg")[0].style.display="none";
	    $("#myb_checkway_errormsg").text("");
   }
   function blur_common(id,message){
      var value = $.trim($("#"+id).val());
      if(value == ""){
        $("#myb_password .myb-prompt").show();
      }
      if(value == "" || value.length < 6){
        $(".pay-pswd input").css("border","1px solid #f85964");
        $("#myb_checkway_errormsg")[0].style.display="block";
	    $("#myb_checkway_errormsg").text("支付密码应为6-20位，请重新输入!");
      }
   }
   
   //开通美盈宝
   $("#myb_openaccount").click(function(){
        var url = $(this).attr("url");
        $("#flowIe-payLayer .al_red2 a").attr("href","http://help.gome.com.cn/article/269-0-0.html");
        $("#flowIe-payLayer #payLayerHead").html("美盈宝开通");
        $("#flowIe-payLayer").find("p").html("请您在弹出的页面完成美盈宝开通");
        $("#payLayer_common").hide();
        $("#payLayer_myb").html("已完成开通").show();
        $("#flowIe-payLayer .al_red2 a").html("遇到问题");
		$('#flowIe-payLayer,.thickdiv,.alert-box').show();
		window.open(url);
   });
   $("#payLayer_myb").click(function(){
        $("#flowIe-payLayerOther").trigger("click");//关闭窗口
        //初始化美盈宝信息
        $("#myb-open,#not-open,#mybException,#mybNotOpen,#mybMoney,#mybNotEnough,#myb_password span").hide();
        $("#myb_telephone").val("");
        myb_ready();
   });
   
   //美盈宝充值
   $("#myb_purchase").click(function(){
        var url = $(this).attr("url");  
        $("#flowIe-payLayer .al_red2 a").attr("href","http://help.gome.com.cn/article/269-0-0.html");
        $("#flowIe-payLayer #payLayerHead").html("美盈宝充值");
        $("#flowIe-payLayer").find("p").html("请您在弹出的页面完成美盈宝充值");
        $("#payLayer_common").hide();
        $("#payLayer_myb").html("已完成充值").show();
        $("#flowIe-payLayer .al_red2 a").html("遇到问题");
		$('#flowIe-payLayer,.thickdiv,.alert-box').show();
		window.open(url); 
   });
   
   //查询美盈宝状态
   $(document).ready(function(){
	   if($("#myb-platform").length > 0){
		   myb_ready();
	   }
   }); 
   function myb_ready(){
        var params = {
			isAsync : true,
			reqUrl : myb_query_url,
			parameters : {
				ujm : $("#ujm").val()
			},
			callBack : function(returnData,_this,tipPos){
			   $("#mybonly").hide();//开通、支付按钮隐藏
			   $("#mybonlyopen,#mybonlypurchase").hide();
			   if("0002" == returnData.resCode){//未查询到账户信息，或账户状态异常
			      $("#not-open").show();
			      $("#mybException").show();
			   }
			   if("0000" == returnData.resCode){
			      if(returnData.frozenState == "010"){//已冻结
			        $("#not-open").show();
			        $("#mybException").show();
			      } else {
				      if("N" == returnData.isOpen){//未开通
				        $("#not-open").show();
				        $("#mybNotOpen").show();
				        if($("#payModeArrays").val() == "070"){//如果只有美盈宝  添加开通按钮-->
				          $("#mybonly,#mybonlyopen").show();
				        }
				      } else if("Y" == returnData.isOpen && 100*returnData.balance >= returnData.payMoney){//已开通，余额大于支付金额
				        $("#myb-open").show();
				        $("#mybMoney").show().children("i").html(returnData.balance);
				        if("Y" == returnData.isNotPass){//需要密码
				          $("#myb_password span").show();
				        }else{
				          $("#myb_password span").hide();
				        }
				        $("#myb_telephone").val(returnData.telephone);
				        if($("#payModeArrays").val() == "070"){//如果只有美盈宝 默认选中-->
				           $("#check-unit-myb").trigger("click");
				        }
				      } else {//已开通，余额小于支付金额
				        $("#not-open").show();
				        $("#mybNotEnough").show().children("i").html(returnData.balance);
				        if($("#payModeArrays").val() == "070"){//如果只有美盈宝  添加充值按钮-->
				          $("#mybonly,#mybonlypurchase").show();
				        }
				      }
				  }     
			   }
			   $("#swapdiv").removeClass("code_swap").addClass("code_swap");//解决ie7下兼容问题(有公告时，绑卡信息下移)
        	   $("#platform-kjzf-con").removeClass("clearfix").addClass("clearfix");//解决ie7下兼容问题(有公告时，快捷银行卡列表下移)
			},
			error:function(){
				mybError();
			},
			complete:function(){
			    mybError();
			}
		}
        sendRequest(params);
   }

   function mybError(){
	     $("#mybonly").hide();//开通、支付按钮隐藏
		 $("#mybonlyopen,#mybonlypurchase").hide();
		  //账户状态异常
	      $("#not-open").show();
	      $("#mybException").show();
	      $("#swapdiv").removeClass("code_swap").addClass("code_swap");//解决ie7下兼容问题(有公告时，绑卡信息下移)
  	      $("#platform-kjzf-con").removeClass("clearfix").addClass("clearfix");//解决ie7下兼容问题(有公告时，快捷银行卡列表下移)
   }
   
   //美盈宝发送短信验证码
   $("#myb-gotopay a").click(function(){
        var pass = $.trim($("#myb_password_text").val());
        if($("#myb_password span").css("display") != "none" && (pass == "" || pass.length < 6)){//需要密码验证
           $(".pay-pswd input").css("border","1px solid #f85964");
           $("#myb_checkway_errormsg")[0].style.display="block";
           $("#myb_checkway_errormsg").text("支付密码应为6-20位，请重新输入!");
           return;
        }
	    var $this = $(this);
	    if($this.text().indexOf("支付中") > -1) return false;
		$this.removeClass("btn-gotopay").addClass("btn_unable2").html('<span>支付中</span><img style="margin-left:2px;vertical-align:middle" src="'+$("#RESOURCE_PATH").attr("attr_v")+'image/paying.gif"/>');
		var params = {
			isAsync : false,
			reqUrl : myb_sends_url,
            parameters : {
			    pwd : pass,
			    ujm : $("#ujm").val()
			},
			_this : "",
			callBack : function(returnData,_this,tipPos){
				var respFlag=returnData.resCode;
				if(respFlag=='0000'){
				    $("#alert #currentTelAlert").html($("#myb_telephone").val());
				    $('#alert .put_code').css("margin-top", "");
			        $('#alert .al_send').css("visibility","visible");
			        $("#myb_transNo").val(returnData.transNo);
					countDownFun=countDownTimer(returnData.time);
					$("#mycards #myb_checkway_errormsg").text("");//清空错误信息
				} else if(respFlag=='5555'){//非法时间段
				    var payUrl = encodeURI($("#CASHIER_WEB_PATH").attr("attr_v")+"resultController/payMaintain.dhtml?ujm="+$("#ujm").val()+"&bankName="+returnData.bankName+"&limitCode="+returnData.limitCode);
				    window.location = payUrl;
				} else {
					$this.removeClass("btn_unable2").addClass("btn-gotopay").html("立即支付").attr("disabled",false);
					$(tipPos)[0].style.display="block";
					$(".pay-pswd input").css("border","1px solid #f85964");
	                $(tipPos).text(returnData.resDesc);
	            }
			},
			tipPos : "#myb_checkway_errormsg"
		};
		//发送验证码
		sendRequest(params);
		return false;
   });

	//支付方式选择悬停效果
	$("#myb-pay,#border_cg").hover(function(){
		$(this).find(".check-unit").css("border","1px solid #F85964");
	},function(){
		$(this).find(".check-unit").css("border","1px solid #a5a5a5");
	});

	//未开通提示
	$("#myb_optips").hover(function(){
		$(".op_cjquestion").show();
	},function(){
		$(".op_cjquestion").hide();
	});
		
    function promptClick(){
      $("#myb_password_text").focus();
    }
	
	
	