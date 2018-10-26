function HashMap(){
	var i = 0;
	this.keyArr = new Array();
	this.valueArr = new Array();
	
	this.getKeyIndex = function(keyArr,key){
		var keyIndex = -1;
	
		for(var i=0;i<keyArr.length;i++){
			if(keyArr[i]==key){
				keyIndex = i;
				break;
			}	
		
		}
	
		return keyIndex;
	
	}
	
	this.put = function(key,value){
		this.keyArr[i] = key;
		this.valueArr[i] = value;
		i++;
	}
	
	this.get = function(key){
		
		//找到key所在下标
		var keyIndex = this.getKeyIndex(this.keyArr,key);
		return this.valueArr[keyIndex];
		
	}
	
}