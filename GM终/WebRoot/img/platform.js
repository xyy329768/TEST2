
	function platform_open(){
		$("#platform-zfpt").show();
	}
	
	//选中银行卡   切换图片内容-->
	var scancodePayInterval  = null;
	$("#platform-zfpt .ygbx-pay-bank").bind("click",function(){
		var bankCode = $(this).attr("id");
	    if($(this).attr("payMode") == "040"){
	       platScan(bankCode);
	       return;
	    }
        
	    $("#flowIe-payLayer .al_red2 a").attr("href","http://help.gome.com.cn/article/233-242-0.html");
        $("#flowIe-payLayer #payLayerHead").html("登录平台支付");
		$('#flowIe-payLayer,.thickdiv,.alert-box').show();
        $("#cashierForm input[name='bankCode']").val(bankCode);
        $("#cashierForm input[name='payMode']").val("050");
        $("#cashierForm input[name='cardType']").val("010");
        $("#cashierForm input[type='submit']").trigger("click");
	});
	
	function platScan(id){
		//隐藏所有支付方式-->
		   if(id == "ALIPAY"){
		     var payUrl = $("#CASHIER_WEB_PATH").attr("attr_v")+"scanController/confirmPay.dhtml"+"?bankCode=ALIPAY&ujm=" + $("#ujm").val()+"&smWidth=250&isPlatform=true&bankName=支付宝";
	         payUrl = encodeURI(payUrl);
	         $("#alipay_scancode_id").attr("src",payUrl);
	         
	         $("#alipay_scancode_id").load(function(){
		         $("#scancode_div_id").hide();
		     });
	         
		     setTimeout(function(){//延迟切换 防止二维码加载失败跳转失败页时 闪现
		    	platformCloseAll();//关闭支付方式大窗口
		        $(".payTypeSelect").hide();
		        $("#scancodePay").show();
		        $("#myb-pay").hide();
		        $("#alipay").show();  
		     },500); 
		   };
		   if(id == "WEIXINPAY"){
		     var payUrl = $("#CASHIER_WEB_PATH").attr("attr_v")+"scanController/confirmPay.dhtml"+"?bankCode=WEIXINPAY&ujm=" + $("#ujm").val()+"&smWidth=265&isPlatform=true&bankName=微信";
	         payUrl = encodeURI(payUrl);
	         $("#wx_scancode_id").attr("src",payUrl);
	         $("#wx_outTime").hide();
		     $("#wx-pay").show();
		     setTimeout(function(){
		    	platformCloseAll();
		        $(".payTypeSelect").hide();
		        $("#scancodePay").show();
		        $("#myb-pay").hide();
		        $("#wx-pay").show();  
		     },500); 
		     var browserVersion = window.navigator.userAgent.toLowerCase();
		     if(browserVersion.indexOf("chrome") > -1){//谷歌浏览器
		        $("#wx_scancode_id").attr("width","265").attr("height","265");
		     }
		     if(browserVersion.indexOf("msie") > -1){//ie
		        $("#wx_scancode_id").css("padding-bottom","10px");
		     }
		     //微信支付倒计时-->
		     $(".weixin-time").show().children("i").html(60);
		         var scancodePayI = 60;
			     scancodePayInterval = setInterval(function(){
			        $(".weixin-time").children("i").html(--scancodePayI);
			        if(scancodePayI == 0){
			          $(".weixin-time").hide();
			          $("#wx_outTime").show();
			          clearInterval(scancodePayInterval);
			        }
			     },1000);
		   }

		   toPayTimer_yinlian($("#ujm").val(),"#scancodePay");//异步查询支付结果-->
	}
	//我的银行卡-->
	$("#platform_mycards").click(function(){
	     //显示所有支付方式-->
		 $(".payTypeSelect").show();
	     //关闭所有的支付方式大窗口-->
		 platformCloseAll();
		 mycards_open();
		 $("#check-unit-mycards").trigger("click");//触发点击我的银行卡事件-->
	});
	
	