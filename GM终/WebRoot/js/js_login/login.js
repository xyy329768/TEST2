$(function(){
	
	$("#more").click(function(){
		$(".borderLin").toggle();
		if ($(this).hasClass("active")) {
	    	$(this).removeClass("active");
	    	hidePlay();
		} else {
	    	$(this).addClass("active");
	   		showPlay();
  		}
	});
	
	$("#image1").hover(function(){
		$(this).stop().animate({
	    	left: '0px'
	  	}, function(){
	   		$("#image2").show();
	  	});
	},function(){
		$(this).stop().animate({
	    	left: '75px'
	  	},function(){
	  		$("#image2").hide();
	  	});
	});
	
	$("#cur1").click(function(){
		$("#loginBox1").show();
		$("#loginBox2").hide();
		$("#loginBox3").hide();
		$(this).addClass("cur-1").removeClass("cur-2");
		$("#cur2").removeClass("cur-1").addClass("cur-2");
	});
	$("#cur2").click(function(){
		$("#loginBox1").hide();
		$("#loginBox2").show();
		$("#loginBox3").hide();
		$(this).addClass("cur-1").removeClass("cur-2");
		$("#cur1").removeClass("cur-1").addClass("cur-2");
	});
	
	$("#phonenum").click(function(){
		$("#loginBox1").hide();
		$("#loginBox2").hide();
		$("#loginBox3").show();
	});
	$("#idpaw").click(function(){
		$("#loginBox1").hide();
		$("#loginBox2").show();
		$("#loginBox3").hide();
	});
	
	$("#loginName").focus(function(){
		$("#tips-2").show();
	});
	$("#loginName").blur(function(){
		$("#tips-2").hide();
	});
	$("#password").focus(function(){
		$("#tips-1").show();
	});
	$("#password").blur(function(){
		$("#tips-1").hide();
	});
	$("#loginName1").focus(function(){
		$("#err-tip1").show();
		$("#err-tip2").hide();
	});
	$("#loginName1").blur(function(){
		$("#err-tip1").hide();
		$("#err-tip2").hide();
	});
	$("#loginName2").focus(function(){
		$("#err-tip1").hide();
		$("#err-tip2").show();
	});
	$("#loginName2").blur(function(){
		$("#err-tip1").hide();
		$("#err-tip2").hide();
	});
	 $("#close").click(function(){
	    	$(".gui_modal").hide();
			$("#login").hide();
			
		});
	
});
