$(function () {
	
	$("#jiaodu1").hover(function(){
		$("#img111").show();
		$("#img222").hide();
		$("#img333").hide();
		$("#img444").hide();
		$("#img555").hide();
	},function(){
		$("#bigimg").prop("src",$("#img111").prop("src"));
	});	
	
	$("#jiaodu2").hover(function(){
		$("#img111").hide();
		$("#img222").show();
		$("#img333").hide();
		$("#img444").hide();
		$("#img555").hide();
	},function(){
		$("#bigimg").prop("src",$("#img222").prop("src"));
	});	
	
	$("#jiaodu3").hover(function(){
		$("#img111").hide();
		$("#img222").hide();
		$("#img333").show();
		$("#img444").hide();
		$("#img555").hide();
	},function(){
		$("#bigimg").prop("src",$("#img333").prop("src"));
	});
	
	$("#jiaodu4").hover(function(){
		$("#img111").hide();
		$("#img222").hide();
		$("#img333").hide();
		$("#img444").show();
		$("#img555").hide();
	},function(){
		$("#bigimg").prop("src",$("#img444").prop("src"));
	});
	
	$("#jiaodu5").hover(function(){
		$("#img111").hide();
		$("#img222").hide();
		$("#img333").hide();
		$("#img444").hide();
		$("#img555").show();
	},function(){
		$("#bigimg").prop("src",$("#img555").prop("src"));
	});
	
	
	
	
});