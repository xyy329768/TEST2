var provinceArr = ["北京","陕西","山东","河北","福建","新疆"];

var cityArr = [["北京"],["西安","咸阳","汉中"],["济南","青岛","烟台","泰安","威海","日照"],["石家庄","保定","唐山","沧州","邯郸","承德"],["福州","厦门","漳州","龙岩","泉州"],["乌鲁木齐","阿勒泰","库尔勒","吐鲁番","喀什","伊犁"]];

//初始化数据到map中
var map = new HashMap();

for(var i=0;i<provinceArr.length;i++){
	map.put(provinceArr[i],cityArr[i]);
}

function createCitySelect(){


	//<select name="city" id="city">
		//<option value="beijing">北京</option>
		//<option value="shandong">..</option>

	//</select>

	//使用DOM技术创建城市的下拉框
	//1.创建dom对象
	var select = document.createElement("select");
	//2.设置属性
	select.name = "acity";
	select.id = "city";
	
	
	//根据选择的省份得到城市的信息
	var province = document.getElementById("province");
	var selectIdx = province.selectedIndex;//得到 用户  选择的 option 的下标 第一个option下标是0

	var provinceText = province.options[selectIdx].text;//山东
	
	var cityResultArr = map.get(provinceText);

	for(var i=0;i<cityResultArr.length;i++){
		var option = document.createElement("option");
		option.value = cityResultArr[i];
		var optionText = document.createTextNode(cityResultArr[i]);
	
		option.appendChild(optionText);
	
		select.appendChild(option);
	}
	
	//select创建完成
	
	//替换city下拉框
	var citySelect = document.getElementById("city");
	//alert(citySelect);
	citySelect.parentNode.replaceChild(select,citySelect);
	
}