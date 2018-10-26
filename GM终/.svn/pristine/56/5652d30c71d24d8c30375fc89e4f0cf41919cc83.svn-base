
function cyberbanking_open(){
	$("#platform-wyzx").show();
}

if($("#wyzx-more").html() == null){
    $(".wyzx-otherType").show();
}

//鼠标悬浮到银行卡下部卡类型上
$("#platform-wyzx .pbc-info-box span").mouseover(function(){
    $(this).find("input").attr("checked",true);
});
$("#platform-wyzx .pbc-info-box span").click(function(){
   $("#platform-wyzx .ygbx-pay-bank").css("border","1px solid #e6e6e6").attr("clicked","");
   
   var cardTypeHtml = $(this).attr("l");
   var cardType = null;
   if("a" == cardTypeHtml){
     cardType = "010";
   } else {
     cardType = "020";
   }
   var bankCode = $(this).attr("id");
   var bankName = $(this).attr("name");
   
    $("#flowIe-payLayer .al_red2 a").attr("href","http://help.gome.com.cn/article/233-241-0.html");
    $("#flowIe-payLayer #payLayerHead").html("登录网上银行支付");
	$('#flowIe-payLayer,.thickdiv,.alert-box').show();
	$("#cashierForm input[name='bankCode']").val(bankCode);
    $("#cashierForm input[name='cardType']").val(cardType);
    $("#cashierForm input[name='payMode']").val("010");
    $("#cashierForm input[type='submit']").trigger("click");
});

$("#platform-wyzx .ygbx-pay-bank").bind("mouseover",function(){
	$(this).css("border","1px solid #F85964");
}).bind("mouseout",function(){
	$(this).css("border","1px solid #e6e6e6");
});
//我的银行卡-->
$("#cyberbanking_mycards").click(function(){
     //显示所有支付方式-->
	 $(".payTypeSelect").show();
     //关闭所有的支付方式大窗口-->
	 platformCloseAll();
	 mycards_open();
	 $("#check-unit-mycards").trigger("click");//触发点击我的银行卡事件-->
 });
