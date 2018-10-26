var small = document.getElementById("mImg");
var slider = document.getElementById("slider");
var big = document.getElementById("big");
var bigImg = document.getElementById("bigimg");

//让slider跟随鼠标移动.给小的方块绑定事件
small.onmousemove = function(e) {
	
	var even = e || event;  //兼容火狐浏览器
	var x = even.clientX - small.offsetLeft - slider.offsetWidth/2;
	//var y = even.offsetY - small.offsetTop - slider.offsetHeight/2;
	var y = even.offsetY - slider.offsetHeight/2;
	//水平方向的最大值
	var maxX = small.clientWidth - slider.clientWidth;
	//竖直方向的最大值
	var maxY = small.clientHeight - slider.clientHeight;
	if(x<0){
	//相当于超出左侧,超出左侧时,拉回
	x=0;
	}
	//超出右侧时拉回
	if(x>maxX){
		x = maxX;
	}
	//顶部超出
	if(y<0){
		y=0;
	}
	//底部超出
	if(y>maxY){
		y = maxY;
	}
	slider.style.top = y +230+ "px";
	slider.style.left = x+160 + "px";
	//放大的图片的主要实现代码:一个比例计算
	big.scrollLeft = x/maxX*(bigImg.clientWidth - big.clientWidth);
	big.scrollTop = y/maxY*(bigImg.clientHeight - big.clientHeight);
}
//鼠标移入事件
small.onmouseenter = function(){
	//鼠标移入到原图时候实现,上面出现的小的方块
	slider.style.display = "block";
	//右侧的大图区域显示出来图片
	big.style.display = "block";
}
//添加鼠标移出事件,鼠标移出原图的时候,
small.onmouseleave = function(){
	slider.style.display = "none";
	big.style.display = "none";
}