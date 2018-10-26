$(function(){
	
	$("#gomeNav").hover(function(){
		$("#gomeCur").show();
	},function(){
		$("#gomeCur").hide();
	});
	
	$("#gomeCur").hover(function(){
		$(this).show();
	},function(){
		$(this).hide();
	});
	
	$("#gomeNav1").hover(function(){
		$("#gomeCur1").show();
	},function(){
		$("#gomeCur1").hide();
	});
	
	$("#gomeCur1").hover(function(){
		$(this).show();
	},function(){
		$(this).hide();
	});
	
	$("#gomeNav2").hover(function(){
		$("#gomeCur2").show();
	},function(){
		$("#gomeCur2").hide();
	});
	
	$("#gomeCur2").hover(function(){
		$(this).show();
	},function(){
		$(this).hide();
	});
	
	$("#btn-left").click(function(){
		if($("#categorys1").is(":visible")){
			$("#categorys1").hide();
			$("#categorys3").fadeIn();
			$("#categorys2").hide();
		}else if($("#categorys3").is(":visible")){
			$("#categorys3").hide();
			$("#categorys2").fadeIn();
			$("#categorys1").hide();
		}else if($("#categorys2").is(":visible")){
			$("#categorys2").hide();
			$("#categorys1").fadeIn();
			$("#categorys3").hide();
		}
	});
	
	$("#btn-right").click(function(){
		if($("#categorys1").is(":visible")){
			$("#categorys1").hide();
			$("#categorys2").fadeIn();
			$("#categorys3").hide();
		}else if($("#categorys2").is(":visible")){
			$("#categorys2").hide();
			$("#categorys3").fadeIn();
			$("#categorys1").hide();
		}else if($("#categorys3").is(":visible")){
			$("#categorys3").hide();
			$("#categorys1").fadeIn();
			$("#categorys2").hide();
		}
	});
	
});
