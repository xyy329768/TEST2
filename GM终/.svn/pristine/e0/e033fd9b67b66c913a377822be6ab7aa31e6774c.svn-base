$(function () {
/*	var $messagebody = $("#messagebody");
	$messagebody.hover(function(){
		$(this).find("span.xiugai").show();
		$(this).find("div.jutidizhi").css("background","#F8F8F8");
	},function(){
		$(this).find("span.xiugai").hide();
		$(this).find("div.jutidizhi").css("background","#fff");
	});*/



	var $content_div = $(".content>div");
	$content_div.bind("click" , function(){
		$(this).css("border","2px solid #e3101e").siblings().css("border","1px solid #E6E6E6").siblings().children().removeClass("duihao"); 
		$(this).children().addClass("duihao");
	});




	var $check_show = $(".chooseDay>label");
	$check_show.bind("click",function () {
		$(this).parent().children().find("span").removeClass();
		$(this).siblings().find("span").addClass("yuanxin");
		$(this).find("span").addClass("redyuanxin");
		
	});
	var $c_i = $(".title_color");
	$c_i.bind("click",function () {
	
		if($(this).find("em").hasClass("c_i")){
			$(this).find("em").removeClass().addClass("c_ii");
			$(".info_bd").show();

		}else{
			$(this).find("em").removeClass().addClass("c_i");
			$(".info_bd").hide();
		};

	});
	$(".backStyle li").bind("click",function () {

		$(this).siblings().removeClass("active")
		$(this).addClass("active");
		
	});
	$(".gomeactivate").bind("click",function () {
		if($(this).find("em").hasClass("jiahao")){
			$(this).find("em").removeClass();
			$(this).find("em").addClass("jianhao");
			$(".redCard_box").show();
		}else{
			$(this).find("em").removeClass();
			$(this).find("em").addClass("jiahao");
			$(".redCard_box").hide();
		}
		
	});
	$("#newAddress_btn a").bind("click",function  () {
		$(".gui_modal").show();
		$(".addchuangkou").show();
	});
	$("#closeaddress").bind("click",function  () {
		
		$(".gui_modal").hide();
		$(".addchuangkou").hide();
	
	});
	$("#closeaddress1").bind("click",function  () {
		
		$(".gui_modal").hide();

		$(".addxiugaichuangkou").hide();
	});
	$("#id_addtab li").bind("click",function  () {
		if($(this).hasClass("mlf6")){
			$(this).removeClass("unactive").addClass("addtab_active")
			$(this).find("span").removeClass()
			$(this).find("span").addClass("mianbian")
			$(this).find("b").removeClass();
			$(this).find("b").addClass("sanjiaobian");
			$(this).siblings().removeClass().addClass("unactive");
			$(".contentTab").hide();
		}else{
			$(this).removeClass("unactive").addClass("addtab_active");
			$(this).siblings().removeClass().addClass("unactive");
			$(this).siblings().addClass("mlf6");
			$(this).siblings().find("span").removeClass();
			$(this).siblings().find("span").addClass("mian")
			$(this).siblings().find("b").removeClass();
			$(this).siblings().find("b").addClass("sanjiao");
			$(this).siblings().find("b").removeClass("sanjiaobian");
			$(".contentTab").show();
		}	
	});
	
	

	
	
});



//window.onload=function(){
//	username = document.getElementById("username");
//	username.onfocus=
//	
//	
//	
//	$("#username").bind("focus",function(){
//		$(this).css("border", "1px solid #ccc");
//	}).bind("blur",function(){
//		
//		if($(this).value == ""){
//			$(this).css("border", "1px solid #f00");
//			$(this).next().text("请输入收货人姓名");
//			alert("失去焦点");
//		}
//		
//	});
//	
//	function trim(txt){
//	var afterTrimTxt = txt.replace(/^\s*/,"").replace(/\s*$/,"");
//	return afterTrimTxt;
//	}
//}
