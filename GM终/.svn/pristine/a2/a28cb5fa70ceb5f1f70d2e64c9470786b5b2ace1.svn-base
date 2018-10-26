$(function  () {
	
	$(".or_look").bind("click",function(){
		if($(this).find("i").hasClass("xiala")){
			$(".address").show("fast");
			$(this).find("i").removeClass();
			$(this).find("i").addClass("shang");
		}else{
			$(".address").hide("fast");
			$(this).find("i").removeClass();
			$(this).find("i").addClass("xiala");
		}
		
	});
	$("#mf_yinlian").bind("mouseover",function(){
		$(this).find("input").css("opacity","1");
		$("#sure_button").css("background-color","#f85964");
		$(".bank_list").css("opacity","0.3");
	});
	
	
	
	$(".bank_list").bind("mouseout",function(){
		$(this).css("opacity","1");
		$("#mf_yinlian").find("input").css("opacity","0.2");
		$("#sure_button").css("background-color","#F0F0F0");
	});
	$(".or_lk").bind("click",function(){
		
		if($(this).find("i").hasClass("shang")){
			$(".bank_list").hide();
			$(this).find("i").removeClass();
			$(this).find("i").addClass("xiala");
		}else{
			$(".bank_list").show();
			$(this).find("i").removeClass();
			$(this).find("i").addClass("shang");
		}
	});
	
	$("#fast_bank li").bind("mouseover",function f1(e){
		$(this).css("border","1px solid #F53D42");
		$(this).children("div").css("display","block");
		
		//e.stopPropagation();
	}).bind("mouseout",function f2(){
		$(this).css("border","1px solid #E6E6E6");
		$(this).children("div").css("display","none");
	});

	$(".orderInfo .chuxu").bind("mouseover",function  () {
		$(this).find("input").prop("checked","checked");
		//alert("前面进去了");
	}).bind("mouseout",function(){
		$(this).find("input").prop("checked","false");
		//alert("前面出去了");
	}).bind("click",function(){
		$(".kjzf_con").hide();
		$(".kjzf_con1").show();
		$(".btn_1").css("background-color","#f85964");
		$(".palse_way").hide();
		
		$(".chooseBank>img").prop("src",$(this).parent().prev().prop("src"));
	});
	$(".orderInfo .xinyong").bind("mouseover",function  () {
		$(this).find("input").prop("checked","checked");
		//alert("后面进去了");
	}).bind("mouseout",function(){
		$(this).find("input").prop("checked","false");
		//alert("后面出去了");
	}).bind("click",function(){
		$(".kjzf_con").hide();
		$(".kjzf_con1").show();
		$(".btn_1").css("background-color","#f85964");
		$(".palse_way").hide();
		$(".typed").text("信用卡");
		$(".chooseBank>img").prop("src",$(this).parent().prev().prop("src"));
	});
	
	
	$(".hoverred").bind("click",function(){
		$(".kjzf_con1").hide();
		$(".kjzf_con").show();
		$(".btn_1").css("background-color","#ccc");
		$(".palse_way").show();
	});
	
	$("#cardID").bind("focus",function  () {
		$(this).prop("value","");
		$(this).css("border","1px solid #ccc");
		$("#message_tips").text("");
	}).bind("blur",function  () {
		$(this).prop("value","请输入银行卡号");
		$("#message_tips").text("请输入银行卡号");
		$(this).css("border","1px solid rgb(248, 89, 100)");
	});
	$("#otherPayType>li").bind("mouseover",function(){
	
		$(this).find(".name").css("color","#F85964");
		$(this).find("i").html("立即支付 >");
		$(this).find("i").removeClass().addClass("liji");
		$(this).find("i").before("<p id='payTypeMoneySpan'>应付金额<i class='heighlight1'>" + $(".heighlight").html() + "</i>元</p>");
	}).bind("mouseout",function(){
		$(this).find(".name").css("color","#333");
		$(this).find("i").html(">");
		$(this).find("i").removeClass().addClass("fuhao");
		$(this).find("i").siblings("p").remove();
	});
	$("#pay_xinyongka").bind("mouseover",function(){
		$(this).find(".name").css("color","#F85964");
		$(this).find("i").html("立即支付 >");
		$(this).find("i").removeClass().addClass("liji");
		$(this).find("i").before("<p id='payTypeMoneySpan'>应付金额<i class='heighlight1'>" + $(".heighlight").html() + "</i>元</p>");
	}).bind("mouseout",function(){
		$(this).find(".name").css("color","#333");
		$(this).find("i").html(">");
		$(this).find("i").removeClass().addClass("fuhao");
		$(this).find("i").siblings("p").remove();
	});;
	
	$(".orderInfo1 .chuxu").bind("mouseover",function  () {
		$(this).find("input").prop("checked","checked");
		//alert("前面进去了");
	}).bind("mouseout",function(){
		$(this).find("input").prop("checked","false");
		//alert("前面出去了");
	}).bind("click",function(){
		
		$(location).attr("href","http://jingyan.baidu.com/article/4b52d7028ea0cffc5c774bbc.html");
		
	});
	$(".orderInfo1 .xinyong").bind("mouseover",function  () {
		$(this).find("input").prop("checked","checked");
		//alert("后面进去了");
	}).bind("mouseout",function(){
		$(this).find("input").prop("checked","false");
		//alert("后面出去了");
	}).bind("click",function(){
		$(location).attr("href","http://jingyan.baidu.com/article/4b52d7028ea0cffc5c774bbc.html");
	});
	$(".more").bind("click",function(){
		$(this).hide();
		$(".moreBank").show();

		$(".bank_list").css("height","245px");
	});
	$(".more_wangyin").bind("click",function(){
		$(this).hide();
		$(".moreBank_wangyin").show();

		$(".bank_list_wangyin").css("height","245px");
	});
	//$(".moreBank").find("li").bind("mouseover",f1()).bind("mouseout",f2());
	
	
	
	
	
	$(".pay_kuaijie").bind("click",function(){
		$(".orderInfo1").hide();
		$(".orderInfo2").hide();
		$(".orderInfo3").hide();
		$(".orderInfo").show();
		
		
	});
	
	$(".pay_wangyin").bind("click",function(){
		$(".orderInfo").hide();
		$(".orderInfo2").hide();
		$(".orderInfo3").hide();
		$(".orderInfo1").show();
		
	});
	$(".pay_pingtai").bind("click",function(){
		$(".orderInfo1").hide();
		$(".orderInfo").hide();
		$(".orderInfo3").hide();
		$(".orderInfo2").show();
		
	});
	$(".pay_xinyongka").bind("click",function(){
		$(".orderInfo1").hide();
		$(".orderInfo2").hide();
		$(".orderInfo").hide();
		$(".orderInfo3").show();
		
	});
	
	
	$(".fqfk_choose>div").bind("click",function(){
		//alert(555)
		$(this).siblings().css("border","1px solid #ccc");
		$(this).css("border","2px solid #f85964");
		$(this).siblings().find("i").removeClass();
		$(this).find("i").addClass("check");
	});
	
});
