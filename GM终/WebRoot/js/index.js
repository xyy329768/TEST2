$(function(){

	$("#navbox #lisnav li").hover(function(){
		$(this).next().show();
	},function(){
		$(this).next().hide();
	});
	
	$("#lisnav > div").hover(function(){
		$(this).show();
		$(this).prev().addClass("showLi");
	},function(){
		$(this).hide();
		$(this).prev().removeClass("showLi");
	});
	
	//右侧电脑满5000减200轮播图
	$("#down-1").click(function(){
		if($("#down3").is(":visible")){
			$("#down3").css("display","none");
			$("#down1").fadeIn();
		}else if($("#down1").is(":visible")){
			$("#down1").css("display","none");
			$("#down2").fadeIn();
		}else if($("#down2").is(":visible")){
			$("#down2").css("display","none");
			$("#down1").fadeIn();
		}
	});
	$("#down-2").click(function(){
		if($("#down3").is(":visible")){
			$("#down3").css("display","none");
			$("#down2").fadeIn();
		}else if($("#down2").is(":visible")){
			$("#down2").css("display","none");
			$("#down1").fadeIn();
		}else if($("#down1").is(":visible")){
			$("#down1").css("display","none");
			$("#down3").fadeIn();
		}
	});
	
	setInterval(function(){
		if($("#down3").is(":visible")){
			$("#down3").css("display","none");
			$("#down2").fadeIn();
		}else if($("#down2").is(":visible")){
			$("#down2").css("display","none");
			$("#down1").fadeIn();
		}else if($("#down1").is(":visible")){
			$("#down1").css("display","none");
			$("#down3").fadeIn();
		}
	},2000);
	
	
	//首页轮播图
	$("#myphotos-left1").click(function(){
		if($(".myphotos1").is(":visible")){
			$(".myphotos1").css("display","none");
			$(".myphotos4").fadeIn();
			$("#myphotos-bottom-span1").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span2").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span3").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span4").css({"background-color":"#F5004B","opacity":"1"});
			$("#beijing").css("background-color","#0D0630");
		}else if($(".myphotos4").is(":visible")){
			$(".myphotos4").css("display","none");
			$(".myphotos3").fadeIn();
			$("#myphotos-bottom-span1").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span2").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span3").css({"background-color":"#F5004B","opacity":"1"});
			$("#myphotos-bottom-span4").css({"background-color":"black","opacity":"0.4"});
			$("#beijing").css("background-color","#D0974A");
		}else if($(".myphotos3").is(":visible")){
			$(".myphotos3").css("display","none");
			$(".myphotos2").fadeIn();
			$("#myphotos-bottom-span1").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span2").css({"background-color":"#F5004B","opacity":"1"});
			$("#myphotos-bottom-span3").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span4").css({"background-color":"black","opacity":"0.4"});
			$("#beijing").css("background-color","#DA0068");
		}else if($(".myphotos2").is(":visible")){
			$(".myphotos2").css("display","none");
			$(".myphotos1").fadeIn();
			$("#myphotos-bottom-span1").css({"background-color":"#F5004B","opacity":"1"});
			$("#myphotos-bottom-span2").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span3").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span4").css({"background-color":"black","opacity":"0.4"});
			$("#beijing").css("background-color","#8191FF");
		}
	});
	
	$("#myphotos-left2").click(function(){
		if($(".myphotos1").is(":visible")){
			$(".myphotos1").css("display","none");
			$(".myphotos2").fadeIn();
			$("#myphotos-bottom-span1").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span2").css({"background-color":"#F5004B","opacity":"1"});
			$("#myphotos-bottom-span3").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span4").css({"background-color":"black","opacity":"0.4"});
			$("#beijing").css("background-color","#DA0068");
		}else if($(".myphotos2").is(":visible")){
			$(".myphotos2").css("display","none");
			$(".myphotos3").fadeIn();
			$("#myphotos-bottom-span1").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span2").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span3").css({"background-color":"#F5004B","opacity":"1"});
			$("#myphotos-bottom-span4").css({"background-color":"black","opacity":"0.4"});
			$("#beijing").css("background-color","#D0974A");
		}else if($(".myphotos3").is(":visible")){
			$(".myphotos3").css("display","none");
			$(".myphotos4").fadeIn();
			$("#myphotos-bottom-span1").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span2").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span3").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span4").css({"background-color":"#F5004B","opacity":"1"});
			$("#beijing").css("background-color","#0D0630");
		}else if($(".myphotos4").is(":visible")){
			$(".myphotos4").css("display","none");
			$(".myphotos1").fadeIn();
			$("#myphotos-bottom-span1").css({"background-color":"#F5004B","opacity":"1"});
			$("#myphotos-bottom-span2").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span3").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span4").css({"background-color":"black","opacity":"0.4"});
			$("#beijing").css("background-color","#8191FF");
		}
	});
	
	$("#myphotos-bottom-span1").click(function(){
		$(".myphotos1").css("display","block");
		$("#beijing").css("background-color","#8191FF");
		$(".myphotos2").css("display","none");
		$(".myphotos3").css("display","none");
		$(".myphotos4").css("display","none");
		$("#myphotos-bottom-span1").css({"background-color":"#F5004B","opacity":"1"});
		$("#myphotos-bottom-span2").css({"background-color":"black","opacity":"0.4"});
		$("#myphotos-bottom-span3").css({"background-color":"black","opacity":"0.4"});
		$("#myphotos-bottom-span4").css({"background-color":"black","opacity":"0.4"});
	});
	$("#myphotos-bottom-span2").click(function(){
		$(".myphotos1").css("display","none");
		$(".myphotos2").css("display","block");
		$("#beijing").css("background-color","#DA0068");
		$(".myphotos3").css("display","none");
		$(".myphotos4").css("display","none");
		$("#myphotos-bottom-span1").css({"background-color":"black","opacity":"0.4"});
		$("#myphotos-bottom-span2").css({"background-color":"#F5004B","opacity":"1"});
		$("#myphotos-bottom-span3").css({"background-color":"black","opacity":"0.4"});
		$("#myphotos-bottom-span4").css({"background-color":"black","opacity":"0.4"});
	});
	$("#myphotos-bottom-span3").click(function(){
		$(".myphotos1").css("display","none");
		$(".myphotos2").css("display","none");
		$(".myphotos3").css("display","block");
		$("#beijing").css("background-color","#D0974A");
		$(".myphotos4").css("display","none");
		$("#myphotos-bottom-span1").css({"background-color":"black","opacity":"0.4"});
		$("#myphotos-bottom-span2").css({"background-color":"black","opacity":"0.4"});
		$("#myphotos-bottom-span3").css({"background-color":"#F5004B","opacity":"1"});
		$("#myphotos-bottom-span4").css({"background-color":"black","opacity":"0.4"});
	});
	$("#myphotos-bottom-span4").click(function(){
		$(".myphotos1").css("display","none");
		$(".myphotos2").css("display","none");
		$(".myphotos3").css("display","none");
		$(".myphotos4").css("display","block");
		$("#beijing").css("background-color","#0D0630");
		$("#myphotos-bottom-span1").css({"background-color":"black","opacity":"0.4"});
		$("#myphotos-bottom-span2").css({"background-color":"black","opacity":"0.4"});
		$("#myphotos-bottom-span3").css({"background-color":"black","opacity":"0.4"});
		$("#myphotos-bottom-span4").css({"background-color":"#F5004B","opacity":"1"});
	});
	
	setInterval(function(){
		if($(".myphotos1").is(":visible")){
			$(".myphotos1").css("display","none");
			$(".myphotos2").fadeIn();
			$("#myphotos-bottom-span1").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span2").css({"background-color":"#F5004B","opacity":"1"});
			$("#myphotos-bottom-span3").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span4").css({"background-color":"black","opacity":"0.4"});
			$("#beijing").css("background-color","#DA0068");
		}else if($(".myphotos2").is(":visible")){
			$(".myphotos2").css("display","none");
			$(".myphotos3").fadeIn();
			$("#myphotos-bottom-span1").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span2").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span3").css({"background-color":"#F5004B","opacity":"1"});
			$("#myphotos-bottom-span4").css({"background-color":"black","opacity":"0.4"});
			$("#beijing").css("background-color","#D0974A");
		}else if($(".myphotos3").is(":visible")){
			$(".myphotos3").css("display","none");
			$(".myphotos4").fadeIn();
			$("#myphotos-bottom-span1").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span2").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span3").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span4").css({"background-color":"#F5004B","opacity":"1"});
			$("#beijing").css("background-color","#0D0630");
		}else if($(".myphotos4").is(":visible")){
			$(".myphotos4").css("display","none");
			$(".myphotos1").fadeIn();
			$("#myphotos-bottom-span1").css({"background-color":"#F5004B","opacity":"1"});
			$("#myphotos-bottom-span2").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span3").css({"background-color":"black","opacity":"0.4"});
			$("#myphotos-bottom-span4").css({"background-color":"black","opacity":"0.4"});
			$("#beijing").css("background-color","#8191FF");
		}
	},3000);
	

	//猜你喜欢轮播图
	var $ul1 = $("#ulles1");
	var $ul2 = $("#ulles2");
	var $ul3 = $("#ulles3");
	
	$(".right").click(function(){
		if($ul1.is(":visible")){ //是显示的
			$ul1.css("display","none");
			$ul2.fadeIn();
		}else if($ul2.is(":visible")){
			$ul2.css("display","none");
			$ul3.fadeIn();
		}else if($ul3.is(":visible")){
			$ul3.css("display","none");
			$ul1.fadeIn();
		}
	});
		
	$(".left").click(function(){
		if($ul1.is(":visible")){ //是显示的
			$ul1.css("display","none");
			$ul3.fadeIn();
		}else if($ul2.is(":visible")){
			$ul2.css("display","none");
			$ul1.fadeIn();
		}else if($ul3.is(":visible")){
			$ul3.css("display","none");
			$ul2.fadeIn();
		}
	});
	
	setInterval(function(){
		if($ul1.is(":visible")){ //是显示的
			$ul1.css("display","none");
			$ul2.fadeIn();
		}else if($ul2.is(":visible")){
			$ul2.css("display","none");
			$ul3.fadeIn();
		}else if($ul3.is(":visible")){
			$ul3.css("display","none");
			$ul1.fadeIn();
		}
	},5000);
	
	
	//手机通讯
	$("#m4").click(function(){
		if($("#m1").is(":visible")){
			$("#m1").css("display","none");
			$("#mccoli1").css({"background-color":"#efefef","opacity":"0.5"});
			$("#mccoli2").css({"background-color":"#efefef","opacity":"0.5"});
			$("#mccoli3").css({"background-color":"#f5004b","opacity":"1"});
			$("#m3").fadeIn();
			$("#mcc77").css("display","none");
			$("#mcc88").css("display","none");
			$("#mcc99").css("display","block");
		}else if($("#m3").is(":visible")){
			$("#m3").css("display","none");
			$("#mccoli1").css({"background-color":"#efefef","opacity":"0.5"});
			$("#mccoli2").css({"background-color":"#f5004b","opacity":"1"});
			$("#mccoli3").css({"background-color":"#efefef","opacity":"0.5"});
			$("#m2").fadeIn();
			$("#mcc77").css("display","none");
			$("#mcc88").css("display","block");
			$("#mcc99").css("display","none");
		}else if($("#m2").is(":visible")){
			$("#m2").css("display","none");
			$("#mccoli1").css({"background-color":"#f5004b","opacity":"1"});
			$("#mccoli2").css({"background-color":"#efefef","opacity":"0.5"});
			$("#mccoli3").css({"background-color":"#efefef","opacity":"0.5"});
			$("#m1").fadeIn();
			$("#mcc77").css("display","block");
			$("#mcc88").css("display","none");
			$("#mcc99").css("display","none");
		}
	});
	
	$("#m5").click(function(){
		if($("#m1").is(":visible")){
			$("#m1").css("display","none");
			$("#mccoli1").css({"background-color":"#efefef","opacity":"0.5"});
			$("#mccoli2").css({"background-color":"#f5004b","opacity":"1"});
			$("#mccoli3").css({"background-color":"#efefef","opacity":"0.5"});
			$("#m2").fadeIn();
			$("#mcc77").css("display","none");
			$("#mcc88").css("display","block");
			$("#mcc99").css("display","none");
		}else if($("#m2").is(":visible")){
			$("#m2").css("display","none");
			$("#mccoli1").css({"background-color":"#efefef","opacity":"0.5"});
			$("#mccoli2").css({"background-color":"#efefef","opacity":"0.5"});
			$("#mccoli3").css({"background-color":"#f5004b","opacity":"1"});
			$("#m3").fadeIn();
			$("#mcc77").css("display","none");
			$("#mcc88").css("display","none");
			$("#mcc99").css("display","block");
		}else if($("#m3").is(":visible")){
			$("#m3").css("display","none");
			$("#mccoli1").css({"background-color":"#f5004b","opacity":"1"});
			$("#mccoli2").css({"background-color":"#efefef","opacity":"0.5"});
			$("#mccoli3").css({"background-color":"#efefef","opacity":"0.5"});
			$("#m1").fadeIn();
			$("#mcc77").css("display","block");
			$("#mcc88").css("display","none");
			$("#mcc99").css("display","none");
		}
	});
	
	$("#mccoli1").hover(function(){
		$("#m1").fadeIn();
		$("#m2").css("display","none");
		$("#m3").css("display","none");
		$("#mccoli1").css({"background-color":"#f5004b","opacity":"1"});
		$("#mccoli2").css({"background-color":"#efefef","opacity":"0.5"});
		$("#mccoli3").css({"background-color":"#efefef","opacity":"0.5"});
	},function(){
		$("#m1").fadeIn();
		$("#m2").css("display","none");
		$("#m3").css("display","none");
		$("#mccoli1").css({"background-color":"#f5004b","opacity":"1"});
		$("#mccoli2").css({"background-color":"#efefef","opacity":"0.5"});
		$("#mccoli3").css({"background-color":"#efefef","opacity":"0.5"});
	});
	
	$("#mccoli2").hover(function(){
		$("#m2").fadeIn();
		$("#m1").css("display","none");
		$("#m3").css("display","none");
		$("#mccoli2").css({"background-color":"#f5004b","opacity":"1"});
		$("#mccoli1").css({"background-color":"#efefef","opacity":"0.5"});
		$("#mccoli3").css({"background-color":"#efefef","opacity":"0.5"});
	},function(){
		$("#m2").fadeIn();
		$("#m1").css("display","none");
		$("#m3").css("display","none");
		$("#mccoli2").css({"background-color":"#f5004b","opacity":"1"});
		$("#mccoli1").css({"background-color":"#efefef","opacity":"0.5"});
		$("#mccoli3").css({"background-color":"#efefef","opacity":"0.5"});
	});
	
	$("#mccoli3").hover(function(){
		$("#m3").fadeIn();
		$("#m1").css("display","none");
		$("#m2").css("display","none");
		$("#mccoli3").css({"background-color":"#f5004b","opacity":"1"});
		$("#mccoli1").css({"background-color":"#efefef","opacity":"0.5"});
		$("#mccoli2").css({"background-color":"#efefef","opacity":"0.5"});
	},function(){
		$("#m3").fadeIn();
		$("#m1").css("display","none");
		$("#m2").css("display","none");
		$("#mccoli3").css({"background-color":"#f5004b","opacity":"1"});
		$("#mccoli1").css({"background-color":"#efefef","opacity":"0.5"});
		$("#mccoli2").css({"background-color":"#efefef","opacity":"0.5"});
	});
	
	$("#mccc").hover(function(){
		$(".mccc-al").css("display","block")
		$(".mccc-right1").css("display","block");
	},function(){
		$(".mccc-al").css("display","none");
		$(".mccc-right1").css("display","none");
	});
	$("#mcc-right").hover(function(){
		$(".mccc-right1").css("display","block");
	},function(){
		$(".mccc-right1").css("display","none");
	});
	$("#mcbo2").hover(function(){
		$(".mccc-right2").css("display","block");
	},function(){
		$(".mccc-right2").css("display","none");
	});
	$("#mcbo3").hover(function(){
		$(".mccc-right3").css("display","block");
	},function(){
		$(".mccc-right3").css("display","none");
	});
	$("#mcbo4").hover(function(){
		$(".mccc-right4").css("display","block");
	},function(){
		$(".mccc-right4").css("display","none");
	});
	$("#mcbo5").hover(function(){
		$(".mccc-right5").css("display","block");
	},function(){
		$(".mccc-right5").css("display","none");
	});
	$("#mcbo6").hover(function(){
		$(".mccc-right6").css("display","block");
	},function(){
		$(".mccc-right6").css("display","none");
	});
	
	$("#right1").hover(function(){
		$("#mcbo1").css("display","block");
		$("#mcbo2").css("display","none");
		$("#mcbo3").css("display","none");
		$("#mcbo4").css("display","none");
		$("#mcbo5").css("display","none");
		$("#mcbo6").css("display","none");
		$("#right1").css("background-color","#719EF7");
		$(".mt-right ul li a.right1").css("color","white");
		$("#right2").css("background-color","white");
		$(".mt-right ul li a.right2").css("color","#333333");
		$("#right3").css("background-color","white");
		$(".mt-right ul li a.right3").css("color","#333333");
		$("#right4").css("background-color","white");
		$(".mt-right ul li a.right4").css("color","#333333");
		$("#right5").css("background-color","white");
		$(".mt-right ul li a.right5").css("color","#333333");
		$("#right6").css("background-color","white");
		$(".mt-right ul li a.right6").css("color","#333333");
		
	},function(){
		$("#mcbo1").css("display","block");
		$("#mcbo2").css("display","none");
		$("#mcbo3").css("display","none");
		$("#mcbo4").css("display","none");
		$("#mcbo5").css("display","none");
		$("#mcbo6").css("display","none");
	});
	
	$("#right2").hover(function(){
		$("#mcbo1").css("display","none");
		$("#mcbo2").css("display","block");
		$("#mcbo3").css("display","none");
		$("#mcbo4").css("display","none");
		$("#mcbo5").css("display","none");
		$("#mcbo6").css("display","none");
		$("#right1").css("background-color","white");
		$(".mt-right ul li a.right1").css("color","#333333");
		$("#right2").css("background-color","#719EF7");
		$(".mt-right ul li a.right2").css("color","white");
		$("#right3").css("background-color","white");
		$(".mt-right ul li a.right3").css("color","#333333");
		$("#right4").css("background-color","white");
		$(".mt-right ul li a.right4").css("color","#333333");
		$("#right5").css("background-color","white");
		$(".mt-right ul li a.right5").css("color","#333333");
		$("#right6").css("background-color","white");
		$(".mt-right ul li a.right6").css("color","#333333");
	},function(){
		$("#mcbo1").css("display","none");
		$("#mcbo2").css("display","block");
		$("#mcbo3").css("display","none");
		$("#mcbo4").css("display","none");
		$("#mcbo5").css("display","none");
		$("#mcbo6").css("display","none");
	});
	
	$("#right3").hover(function(){
		$("#mcbo1").css("display","none");
		$("#mcbo3").css("display","block");
		$("#mcbo2").css("display","none");
		$("#mcbo4").css("display","none");
		$("#mcbo5").css("display","none");
		$("#mcbo6").css("display","none");
		$("#right1").css("background-color","white");
		$(".mt-right ul li a.right1").css("color","#333333");
		$("#right3").css("background-color","#719EF7");
		$(".mt-right ul li a.right3").css("color","white");
		$("#right2").css("background-color","white");
		$(".mt-right ul li a.right2").css("color","#333333");
		$("#right4").css("background-color","white");
		$(".mt-right ul li a.right4").css("color","#333333");
		$("#right5").css("background-color","white");
		$(".mt-right ul li a.right5").css("color","#333333");
		$("#right6").css("background-color","white");
		$(".mt-right ul li a.right6").css("color","#333333");
	},function(){
		$("#mcbo1").css("display","none");
		$("#mcbo3").css("display","block");
		$("#mcbo2").css("display","none");
		$("#mcbo4").css("display","none");
		$("#mcbo5").css("display","none");
		$("#mcbo6").css("display","none");
	});
	
	$("#right4").hover(function(){
		$("#mcbo1").css("display","none");
		$("#mcbo4").css("display","block");
		$("#mcbo2").css("display","none");
		$("#mcbo3").css("display","none");
		$("#mcbo5").css("display","none");
		$("#mcbo6").css("display","none");
		$("#right1").css("background-color","white");
		$(".mt-right ul li a.right1").css("color","#333333");
		$("#right4").css("background-color","#719EF7");
		$(".mt-right ul li a.right4").css("color","white");
		$("#right2").css("background-color","white");
		$(".mt-right ul li a.right2").css("color","#333333");
		$("#right3").css("background-color","white");
		$(".mt-right ul li a.right3").css("color","#333333");
		$("#right5").css("background-color","white");
		$(".mt-right ul li a.right5").css("color","#333333");
		$("#right6").css("background-color","white");
		$(".mt-right ul li a.right6").css("color","#333333");
	},function(){
		$("#mcbo1").css("display","none");
		$("#mcbo4").css("display","block");
		$("#mcbo2").css("display","none");
		$("#mcbo3").css("display","none");
		$("#mcbo5").css("display","none");
		$("#mcbo6").css("display","none");
	});
	
	$("#right5").hover(function(){
		$("#mcbo1").css("display","none");
		$("#mcbo5").css("display","block");
		$("#mcbo2").css("display","none");
		$("#mcbo3").css("display","none");
		$("#mcbo4").css("display","none");
		$("#mcbo6").css("display","none");
		$("#right1").css("background-color","white");
		$(".mt-right ul li a.right1").css("color","#333333");
		$("#right5").css("background-color","#719EF7");
		$(".mt-right ul li a.right5").css("color","white");
		$("#right2").css("background-color","white");
		$(".mt-right ul li a.right2").css("color","#333333");
		$("#right3").css("background-color","white");
		$(".mt-right ul li a.right3").css("color","#333333");
		$("#right4").css("background-color","white");
		$(".mt-right ul li a.right4").css("color","#333333");
		$("#right6").css("background-color","white");
		$(".mt-right ul li a.right6").css("color","#333333");
	},function(){
		$("#mcbo1").css("display","none");
		$("#mcbo5").css("display","block");
		$("#mcbo2").css("display","none");
		$("#mcbo3").css("display","none");
		$("#mcbo4").css("display","none");
		$("#mcbo6").css("display","none");
	});
	
	$("#right6").hover(function(){
		$("#mcbo1").css("display","none");
		$("#mcbo6").css("display","block");
		$("#mcbo2").css("display","none");
		$("#mcbo3").css("display","none");
		$("#mcbo4").css("display","none");
		$("#mcbo5").css("display","none");
		$("#right1").css("background-color","white");
		$(".mt-right ul li a.right1").css("color","#333333");
		$("#right6").css("background-color","#719EF7");
		$(".mt-right ul li a.right6").css("color","white");
		$("#right2").css("background-color","white");
		$(".mt-right ul li a.right2").css("color","#333333");
		$("#right3").css("background-color","white");
		$(".mt-right ul li a.right3").css("color","#333333");
		$("#right4").css("background-color","white");
		$(".mt-right ul li a.right4").css("color","#333333");
		$("#right5").css("background-color","white");
		$(".mt-right ul li a.right5").css("color","#333333");
	},function(){
		$("#mcbo1").css("display","none");
		$("#mcbo6").css("display","block");
		$("#mcbo2").css("display","none");
		$("#mcbo3").css("display","none");
		$("#mcbo4").css("display","none");
		$("#mcbo5").css("display","none");
	});
	
	$(".mccc-right1").click(function(){
		$("#mcbo1").css("display","none");
		$("#mcbo2").css("display","block");
		$("#mcbo3").css("display","none");
		$("#mcbo4").css("display","none");
		$("#mcbo5").css("display","none");
		$("#mcbo6").css("display","none");
		$("#right1").css("background-color","white");
		$(".mt-right ul li a.right1").css("color","#333333");
		$("#right2").css("background-color","#719EF7");
		$(".mt-right ul li a.right2").css("color","white");
		$("#right3").css("background-color","white");
		$(".mt-right ul li a.right3").css("color","#333333");
		$("#right4").css("background-color","white");
		$(".mt-right ul li a.right4").css("color","#333333");
		$("#right5").css("background-color","white");
		$(".mt-right ul li a.right5").css("color","#333333");
		$("#right6").css("background-color","white");
		$(".mt-right ul li a.right6").css("color","#333333");
	});
	
	$(".mccc-right2").click(function(){
		$("#mcbo1").css("display","none");
		$("#mcbo3").css("display","block");
		$("#mcbo2").css("display","none");
		$("#mcbo4").css("display","none");
		$("#mcbo5").css("display","none");
		$("#mcbo6").css("display","none");
		$("#right1").css("background-color","white");
		$(".mt-right ul li a.right1").css("color","#333333");
		$("#right3").css("background-color","#719EF7");
		$(".mt-right ul li a.right3").css("color","white");
		$("#right2").css("background-color","white");
		$(".mt-right ul li a.right2").css("color","#333333");
		$("#right4").css("background-color","white");
		$(".mt-right ul li a.right4").css("color","#333333");
		$("#right5").css("background-color","white");
		$(".mt-right ul li a.right5").css("color","#333333");
		$("#right6").css("background-color","white");
		$(".mt-right ul li a.right6").css("color","#333333");
	});
	
	$(".mccc-right3").click(function(){
		$("#mcbo1").css("display","none");
		$("#mcbo4").css("display","block");
		$("#mcbo3").css("display","none");
		$("#mcbo2").css("display","none");
		$("#mcbo5").css("display","none");
		$("#mcbo6").css("display","none");
		$("#right1").css("background-color","white");
		$(".mt-right ul li a.right1").css("color","#333333");
		$("#right4").css("background-color","#719EF7");
		$(".mt-right ul li a.right4").css("color","white");
		$("#right3").css("background-color","white");
		$(".mt-right ul li a.right3").css("color","#333333");
		$("#right2").css("background-color","white");
		$(".mt-right ul li a.right2").css("color","#333333");
		$("#right5").css("background-color","white");
		$(".mt-right ul li a.right5").css("color","#333333");
		$("#right6").css("background-color","white");
		$(".mt-right ul li a.right6").css("color","#333333");
	});
	
	$(".mccc-right4").click(function(){
		$("#mcbo1").css("display","none");
		$("#mcbo5").css("display","block");
		$("#mcbo3").css("display","none");
		$("#mcbo2").css("display","none");
		$("#mcbo4").css("display","none");
		$("#mcbo6").css("display","none");
		$("#right1").css("background-color","white");
		$(".mt-right ul li a.right1").css("color","#333333");
		$("#right5").css("background-color","#719EF7");
		$(".mt-right ul li a.right5").css("color","white");
		$("#right3").css("background-color","white");
		$(".mt-right ul li a.right3").css("color","#333333");
		$("#right2").css("background-color","white");
		$(".mt-right ul li a.right2").css("color","#333333");
		$("#right4").css("background-color","white");
		$(".mt-right ul li a.right4").css("color","#333333");
		$("#right6").css("background-color","white");
		$(".mt-right ul li a.right6").css("color","#333333");
	});
	
	$(".mccc-right5").click(function(){
		$("#mcbo1").css("display","none");
		$("#mcbo6").css("display","block");
		$("#mcbo3").css("display","none");
		$("#mcbo4").css("display","none");
		$("#mcbo5").css("display","none");
		$("#mcbo2").css("display","none");
		$("#right1").css("background-color","white");
		$(".mt-right ul li a.right1").css("color","#333333");
		$("#right6").css("background-color","#719EF7");
		$(".mt-right ul li a.right6").css("color","white");
		$("#right3").css("background-color","white");
		$(".mt-right ul li a.right3").css("color","#333333");
		$("#right4").css("background-color","white");
		$(".mt-right ul li a.right4").css("color","#333333");
		$("#right5").css("background-color","white");
		$(".mt-right ul li a.right5").css("color","#333333");
		$("#right2").css("background-color","white");
		$(".mt-right ul li a.right2").css("color","#333333");
	});
	
	$(".mccc-right6").click(function(){
		$("#mcbo2").css("display","none");
		$("#mcbo1").css("display","block");
		$("#mcbo3").css("display","none");
		$("#mcbo4").css("display","none");
		$("#mcbo5").css("display","none");
		$("#mcbo6").css("display","none");
		$("#right2").css("background-color","white");
		$(".mt-right ul li a.right2").css("color","#333333");
		$("#right1").css("background-color","#719EF7");
		$(".mt-right ul li a.right1").css("color","white");
		$("#right3").css("background-color","white");
		$(".mt-right ul li a.right3").css("color","#333333");
		$("#right4").css("background-color","white");
		$(".mt-right ul li a.right4").css("color","#333333");
		$("#right5").css("background-color","white");
		$(".mt-right ul li a.right5").css("color","#333333");
		$("#right6").css("background-color","white");
		$(".mt-right ul li a.right6").css("color","#333333");
	});
	
	$(".wx").hover(function(){
		$(".wx>div").css("display","block");
	},function(){
		$(".wx>div").css("display","none");
	});
	
	$(".wap").hover(function(){
		$(".wap>div").css("display","block");
	},function(){
		$(".wap>div").css("display","none");
	});
	
});