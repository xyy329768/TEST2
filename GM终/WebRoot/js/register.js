$(function(){
	var oldpassword;
	//非空
	function trim (txt) {
		var afterText = txt.replace(/^\s*/,"").replace(/\s*$/,"");
		return afterText;
	}
	function f1(value){
		if(isNaN(value) &&  /[0-9]+/.test(value) && /[/*#%^&]+/.test(value) && /[a-zA-Z_]+/.test(value)){
			$("#safe").show();
			$("#zhong").css("background-color","#CC0000");
			$("#gao").css("background-color","#CC0000");
		}else if((isNaN(value) &&  /[0-9]+/.test(value)) || (/[/*#%^&]+/.test(value) && /[a-zA-Z_]+/.test(value))   ){
			$("#safe").show();
			$("#zhong").css("background-color","#CC0000");
			$("#gao").css("background-color","#A5A5A5");		
		}else if(!isNaN(value)){
			
			$("#safe").show();
			$("#zhong").css("background-color","#A5A5A5");
			$("#gao").css("background-color","#A5A5A5");
		}else if( /[a-zA-Z_]+/.test(value)){
			$("#safe").show();
			$("#zhong").css("background-color","#A5A5A5");
			$("#gao").css("background-color","#A5A5A5");

		}
	};
//	用户名验证
	$("#username").bind("focus",function  () {
		this.value.length<26
		$("#name_yanzheng").show();
		$("#name_yanzheng").text("4-20个字符，支持汉字、字母、数字及'-'、'_'组合");
		$(this).css("border","1px solid #ccc");
		$("#name_yanzheng").css("color","#a5a5a5");
		
	}).bind("blur",function  () {
		if(this.value =="" ){
			$(this).css("border","1px solid #FF5757");
			$("#name_yanzheng").text("请输入用户名");
			$("#name_yanzheng").css("color","#FF5757");
			$(this).next().hide();
		}else if(this.value.length<4 || this.value.length>20){
			$(this).css("border","1px solid #FF5757");
			$("#name_yanzheng").text("用户名长度只能在4-20个字符之间");
			$("#name_yanzheng").css("color","#FF5757");
			$(this).next().hide();
		} else if (!/^[\u4E00-\u9FA5A-Za-z0-9_]+$/.test(this.value)) { 
			$(this).css("border","1px solid #FF5757");
            $("#name_yanzheng").text("用户名只能由中文，英文，数字及_组成");
            $("#name_yanzheng").css("color","#FF5757");
            $(this).next().hide();
        } 
        else if(!isNaN(this.value)){
			$(this).css("border","1px solid #FF5757");
			$("#name_yanzheng").text("不能是纯数字，请重新输入");
			$("#name_yanzheng").css("color","#FF5757");
			$(this).next().hide();
		}else{
			$("#name_yanzheng").hide();
			$(this).next().show();
		}
	});
//	密码验证
	$("#password").bind("focus",function  () {
		$("#password_yanzheng").show();
		$("#password_yanzheng").text("6-20个字符，建议由字母、数字和字符两种以上组合");
		$(this).css("border","1px solid #ccc");
		$("#password_yanzheng").css("color","#a5a5a5");
		if(!this.value==""){
			$("#safe").show();
			
		}
	}).bind("keyup",function (e) {
		f1(this.value);
		if(e.keyCode == 8){
			f1();
		}
		//alert(e.keyCode);
		
	}).bind("blur",function  () {
		$("#safe").hide();
		if(this.value =="" ){
			$(this).css("border","1px solid #FF5757");
			$("#password_yanzheng").text("请输入密码");
			$("#password_yanzheng").css("color","#FF5757");
			$(this).next().hide();
			$('#confirmPass').attr("disabled","disabled");
		}else if(this.value.length<6 || this.value.length>20){
			$(this).css("border","1px solid #FF5757");
			$("#password_yanzheng").text("长度应为6-20个字符");
			$("#password_yanzheng").css("color","#FF5757");
			$(this).next().hide();
			$('#confirmPass').attr("disabled","disabled");
		}else if(/^[0-9]*$/.test(this.value)){
			$(this).css("border","1px solid #FF5757");
			$("#password_yanzheng").text("不能全为数字");
			$("#password_yanzheng").css("color","#FF5757");
			$(this).next().hide();
			$('#confirmPass').attr("disabled","disabled");
		}else{
			oldpassword = this.value;
			//alert(oldpassword);
			$("#password_yanzheng").hide();
			$(this).next().show();
			$("#confirmPass").removeAttr("disabled");
			
		}

	});
	

//	确认密码验证
	$("#confirmPass").bind("focus",function  () {
		$("#surepassword_yanzheng").show();
		$("#surepassword_yanzheng").text("请再次输入密码");
		$(this).css("border","1px solid #ccc");
		$("#surepassword_yanzheng").css("color","#a5a5a5");
		
	}).bind("blur",function  () {
		
    	if(this.value =="" ){
			$(this).css("border","1px solid #FF5757");
			$("#surepassword_yanzheng").text("请输入密码");
			$("#surepassword_yanzheng").css("color","#FF5757");
		}else if(this.value==oldpassword ){
			$("#surepassword_yanzheng").hide();
			$(this).next().show();
		}else{
			
			$(this).css("border","1px solid #FF5757");
			$("#surepassword_yanzheng").text("两次密码不一致");
			$("#surepassword_yanzheng").css("color","#FF5757");
		}
	});
	
//	手机号验证
	$("#phoneNumber").bind("focus",function(){
		
		$(this).css("border","1px solid #ccc");
	}).bind("blur",function(){
		if(this.value =="" ){
			$("#phonenumber_yanzheng").show();
			$(this).css("border","1px solid #FF5757");
			$("#phonenumber_yanzheng").text("手机号不能为空");
			$("#phonenumber_yanzheng").css("color","#FF5757");
			$(this).next().hide();
		}else if(isNaN(this.value)){
			$("#phonenumber_yanzheng").show();
			$(this).css("border","1px solid #FF5757");
			$("#phonenumber_yanzheng").text("手机号必须为数字");
			$("#phonenumber_yanzheng").css("color","#FF5757");
			$(this).next().hide();
		}else if(this.value!="" && ! /^1(3|4|5|7|8)\d{9}$/.test(this.value)){
//								/^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$/
			$("#phonenumber_yanzheng").show();
			$(this).css("border","1px solid #FF5757");
			$("#phonenumber_yanzheng").text("手机号码格式不正确");
			$("#phonenumber_yanzheng").css("color","#FF5757");
			$(this).next().hide();
		}else{
			$("#phonenumber_yanzheng ").hide();
			$(this).next().show();
		}
	});
	
//	短信验证码验证
	$("#writeMsg").bind("focus",function  () {
		$("#phone_yanzheng").show();
		$("#phone_yanzheng").text("	请输入短信验证码");
		$(this).css("border","1px solid #ccc");
		$("#phone_yanzheng").css("color","#a5a5a5");
	}).bind("blur",function(){
		if(this.value =="" ){
			
			$(this).css("border","1px solid #FF5757");
			$("#phone_yanzheng").text("请输入验证码");
			$("#phone_yanzheng").css("color","#FF5757");
		}else if (isNaN(this.value)){
			$(this).css("border","1px solid #FF5757");
			$("#phone_yanzheng").text("验证码错误");
			$("#phone_yanzheng").css("color","#FF5757");
		}else if (this.value.length<6 ){
			$(this).css("border","1px solid #FF5757");
			$("#phone_yanzheng").text("验证码错误");
			$("#phone_yanzheng").css("color","#FF5757");
		}else{
			$("#phone_yanzheng").hide();
		}
	});
	
//	推荐码验证
	$("#referralCode").bind("focus",function  () {
		$(this).css("border","1px solid #ccc");
	}).bind("blur",function(){
		if(this.value ==""){
			$("#tuijian_yanzheng ").hide();
			
		}else if(this.value.length<2 || this.value.length>4){
			$("#tuijian_yanzheng").show();
			$(this).css("border","1px solid #FF5757");
			$("#tuijian_yanzheng").text("推荐码错误");
			$("#tuijian_yanzheng").css("color","#FF5757");
		}else{
			$("#tuijian_yanzheng ").hide();
			$(this).next().show();
		}
	});
	
	
});
