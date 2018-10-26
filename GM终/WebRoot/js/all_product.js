$(function(){
	
	$("#dao111").click(function(){
		$("#dao222").addClass("libeijing").removeClass("dao-li1");
		$("#dao333").addClass("libeijing").removeClass("dao-li1");
		$(this).removeClass("libeijing").toggleClass("dao-li5");
		
		$("#price").css("color","white");
		$("#pingjiaSum").css("color","#5E5E5E");
		$("#productSum").css("color","#5E5E5E");
	});
	
	$("#dao222").click(function(){
		$("#dao111").addClass("libeijing").removeClass("dao-li1");
		$("#dao333").addClass("libeijing").removeClass("dao-li1");
		$(this).removeClass("libeijing").addClass("dao-li1").toggleClass("dao-li5");
		
		$("#pingjiaSum").css("color","white");
		$("#price").css("color","#5E5E5E");
		$("#productSum").css("color","#5E5E5E");
		
	});
	
	$("#dao333").click(function(){
		$("#dao111").addClass("libeijing");
		$("#dao222").addClass("libeijing").removeClass("dao-li1");
		$(this).removeClass("libeijing").addClass("dao-li1").toggleClass("dao-li5");
		
		$("#productSum").css("color","white");
		$("#pingjiaSum").css("color","#5E5E5E");
		$("#price").css("color","#5E5E5E");
	});
	
});
