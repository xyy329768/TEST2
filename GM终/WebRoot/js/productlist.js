window.onload = function(){
			//给筛选条件框绑定事件  随屏幕滚动
			var odao=document.getElementById('dao+chooise');			
			var top=odao.offsetTop;
			
			window.onscroll=function(){
				var wscroll = document.documentElement.scrollTop ||window.pageYOffset ||document.body.scrollTop;
				if(wscroll >= top){
					odao.style.position="fixed";
					odao.style.top="0";
					odao.style.left="10";
					odao.style.zIndex="100"
				}else{
					odao.style.position="";
					
				}
				
			}						

			$(function(){
			$("#kongzhi").toggle(function(){
				$("#kongzhi").html("收起")
				$("#option-color").show();
				$("#option-screen").show();
				$("#option-www").show();
			},function(){
				$("#kongzhi").html("更多选项 (网络制式，屏幕尺寸，颜色...)");
				$("#option-color").hide();
				$("#option-screen").hide();
				$("#option-www").hide();
				
			})
		})
			
		
		$(function(){
			$("#more").toggle(function(){
				$("#more").html("收起")
				$("#ul3").css("display","block")
				$("#option-logo").css("height","170px")
				
			},function(){
				$("#more").html("+更多");
				$("#ul3").css("display","none")
				$("#option-logo").css("height","118px")
				
				
			})
		})
			
			
		
			
			
			
		}