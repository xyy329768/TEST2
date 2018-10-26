$(function(){
	//收货人验证
	$("#username").bind("blur",function  () {
		if(this.value =="" ){
			$(this).css("border","1px solid #FF5757");
			$("#name_yanzheng").text("请输入收货人姓名");
			$("#name_yanzheng").css("color","#FF5757");
		} else if (!/^[\u4E00-\u9FA5A-Za-z0-9]+$/.test(this.value)) { 
			$(this).css("border","1px solid #FF5757");
	        $("#name_yanzheng").text("请输入正确的收货人姓名");
	        $("#name_yanzheng").css("color","#FF5757");
	   } else{
	   		$(this).css("border","1px solid #ccc");
			$("#name_yanzheng").text("");
	   }
	});
	
	//收货地址验证
	$("#detailAddress").bind("blur",function  () {
		if(this.value =="" ){
			$(this).css("border","1px solid #FF5757");
			$("#detailAddress_yanzheng").text("请填写详细地址");
			$("#detailAddress_yanzheng").css("color","#FF5757");
		}else if (!/^[\u4E00-\u9FA5A-Za-z0-9]+$/.test(this.value)) {
			$(this).css("border","1px solid #FF5757");
	        $("#detailAddress_yanzheng").text("输入格式不正确");
	        $("#detailAddress_yanzheng").css("color","#FF5757");
	   } else{
	   		$(this).css("border","1px solid #ccc");
			$("#detailAddress_yanzheng").text("");
	   }
	});
	
	//手机号验证
	$("#phoneNumber").bind("blur",function(){
		if(this.value =="" ){
			$(this).css("border","1px solid #FF5757");
			$("#phoneNumber_yanzheng").text("请输入手机号");
			$("#phoneNumber_yanzheng").css("color","#FF5757");
		}else if(isNaN(this.value)){
			$(this).css("border","1px solid #FF5757");
			$("#phoneNumber_yanzheng").text("请输入正确的手机号");
			$("#phoneNumber_yanzheng").css("color","#FF5757");
		}else if(this.value!="" && ! /^1(3|4|5|7|8)\d{9}$/.test(this.value)){
			$(this).css("border","1px solid #FF5757");
			$("#phoneNumber_yanzheng").text("请输入正确的手机号");
			$("#phoneNumber_yanzheng").css("color","#FF5757");
		}else{
			$(this).css("border","1px solid #ccc");
			$("#phoneNumber_yanzheng").text("");
		}
	});
	
	//固定电话验证
	$("#telephone").bind("blur",function(){
		if(isNaN(this.value)){
			$(this).css("border","1px solid #FF5757");
			$("#telephone_yanzheng").text("请输入正确的固定电话");
			$("#telephone_yanzheng").css("color","#FF5757");
		}else if(this.value!="" && ! /^(\(\d{3,4}\)|\d{3,4}-)?\d{7,8}$/.test(this.value)){
//								^\d{3,4}-\d{7,8}$ 
			$(this).css("border","1px solid #FF5757");
			$("#telephone_yanzheng").text("请输入正确的固定电话");
			$("#telephone_yanzheng").css("color","#FF5757");
		}else{
			$(this).css("border","1px solid #ccc");
			$("#telephone_yanzheng").text("");
		}
	});
	
	//邮箱验证
	$("#email").bind("blur",function(){
		if(this.value!="" && ! /^[a-zA-Z0-9]([a-zA-Z0-9]|_+[a-zA-Z0-9]|[a-zA-Z0-9]*\.[a-zA-Z0-9])+@\w+\.[a-zA-Z]{1,4}\.{0,1}[a-zA-Z]{0,4}$/.test(this.value)){
			$(this).css("border","1px solid #FF5757");
			$("#email_yanzheng").text("请输入正确的邮箱");
			$("#email_yanzheng").css("color","#FF5757");
		}else{
			$(this).css("border","1px solid #ccc");
			$("#email_yanzheng").text("");
		}
	});
});
