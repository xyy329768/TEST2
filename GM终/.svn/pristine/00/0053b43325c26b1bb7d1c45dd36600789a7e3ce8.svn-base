$(function(){
	/*给加号框绑定事件*/
	$(".jia").click(function(){
		var shuzinumber=document.getElementById("shuzi");
		if(shuzi.value<=9){
			shuzi.value=parseInt(shuzinumber.value)+1;
		}else{
			alert("每日数量有限哦！");
		}
		
		
	});
	
	/*给减号框绑定事件*/
	$(".jian").click(function(){
		var shuzinumber=document.getElementById("shuzi");
		if(shuzi.value>=2){
			shuzi.value=parseInt(shuzinumber.value)-1;
		}else{
			alert("已是最低商品数");
		}
		
	});
	
	//获取id为shuzi的文本框里的值
	$("#InitCartUrl").on("click",function(){
		var num=$("#shuzi").val();
	});
})
