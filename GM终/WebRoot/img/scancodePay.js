
$(function(){
     $(".back .hoverRed").click(function(){
    	 if($(this).attr("isPlatScan") != "isPlatScan"){
            $("#myb-pay").show();
            //显示所有支付方式-->
			$(".payTypeSelect").show();
			//隐藏触发动作的支付方式-->
			$(this).parent().parent().hide();
			$("#pay__platform").hide();
			$("#scancodePay").hide();
			clearInterval(scancodePayInterval);
			//关闭所有的支付方式大窗口-->
			platformCloseAll();
			//打开目标支付方式大窗口-->
			platform_open();
			//银盈通支付宝扫码
			$("#alipay_scancode_id").attr("style","z-index:1;*padding-top:33px;vertical-align: middle;padding-left:15px\\0;width:250px;height:250px");
    	    
			try{
			  var doc = document.getElementById("alipay_scancode_id").contentWindow.document; 
			  doc.body.innerHTML = "";
			  $("#scancode_div_id").show();
			} catch(e){
			  //支付宝扫码，夸域名访问不到document
			}
    	 } else{
 		    window.parent.location.href=$("#CASHIER_WEB_PATH").attr("attr_v")+'cashier/query.dhtml?ujm='+$("#ujm").val();
 		  }
 		$(this).attr("isPlatScan","");
     });
     $("#wx_outTime i").click(function(){
             var payUrl = $("#CASHIER_WEB_PATH").attr("attr_v")+"scanController/confirmPay.dhtml"+"?bankCode=WEIXINPAY&ujm=" + $("#ujm").val()+"&smWidth=265";
	         $("#wx_scancode_id").attr("src",payUrl);
	         $("#wx_outTime").hide();
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
     });
     
     $("#alipayGotopay").click(function(){
    	 $("#flowIe-payLayer .al_red2 a").attr("href","http://help.gome.com.cn/article/233-242-0.html");
         $("#flowIe-payLayer #payLayerHead").html("登录平台支付");
         $("#flowIe-payLayerOther-alipayScan").show();
         $("#flowIe-payLayerOther").hide();
		 $('#flowIe-payLayer,.thickdiv,.alert-box').show();
		 
         $("#cashierForm input[name='bankCode']").val("ALIPAY");
         $("#cashierForm input[name='payMode']").val("050");
         $("#cashierForm input[type='submit']").trigger("click");
     });
     //平台扫码支付中右侧  支付宝平台支付 “选择其他支付方式”
     $("#flowIe-payLayerOther-alipayScan").click(function(){
         $("#flowIe-payLayerOther").trigger("click");
         $(".back .hoverRed").trigger("click");
     });
     
   })
