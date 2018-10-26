

    //分期输入银行卡号临时变量,用来判断是否修改，调用签约卡查询-->
    var fqfkCardNoTemp = '';
    var isBackLoadingFqfk = false;
    
    //分期回调
	function creditCardPreiodCallBack(){
	   clearFqzfForm();
       $("#platform-fqfk #bankCode-fqfk").val(arguments[0]);
		var bankId = arguments[0]+".png";
		//追加银行图片信息
		 $("#platform-fqfk .kjzf-choosedBank img").attr("src",$("#RESOURCE_PATH").attr("attr_v")+"temp/"+bankId+"");
		$("input[name='cardType']").val("020");
		
		$("#transNo-fqfk").val("");
	}
	
	$(function(){
		checkBank();
	});
	function checkBank(){
		$("#bank-fqfkId").children("li").attr("clicked","false");//初始化 先把所有银行置为没选中
		$("#bank-fqfkId").children("li").first().css("border","1px solid #f85964").attr("clicked","true");
        var cc = $("#bank-fqfkId").children("li").first().attr("id");
        var nn = $("#bank-fqfkId").children("li").first().attr("name");
        $("#bankCode-fqfk").val(cc);
        $("#bankName-fqfk").val(nn);
        if(cc === '' || cc === null || cc === undefined){
           return;
        }
        $("#isCheckChannel-fqfk").val("0");//不进行支付渠道限制校验
        firstPartQuery($("#CASHIER_WEB_PATH").attr("attr_v")+"creditCardFQController/firstPartQuery.dhtml",$("#CASHIER_WEB_PATH").attr("attr_v")+"loadAdvertisementController/");
	}
	//选中银行卡   切换图片内容
	$("#platform-fqfk .ygbx-pay-bank").bind("click",function(){
		clearFqzfForm();
	    $("#platform-fqfk #bankCode-fqfk").val($(this).attr("id"));
	    $("#platform-fqfk #bankName-fqfk").val($(this).attr("name"));
		var bankId = $(this).attr("id")+".png";
		//追加银行图片信息
		$("#platform-fqfk .kjzf-choosedBank img").attr("src",$("#RESOURCE_PATH").attr("attr_v")+"temp/"+bankId+"");
		$("input[name='cardType']").val("020");
		$("#transNo-fqfk").val("");
		
		$("#fqfk_checkway_errormsg").text("");//清空错误信息
	    $("#platform-fqfk .ygbx-pay-bank").css("border","1px solid #e6e6e6").attr("clicked","");
        $(this).css("border","1px solid #F85964").attr("clicked","true");
        //点击银行图片  切换银行分期数
        $('#fqfk-frame').attr("src","");
        $("#isCheckChannel-fqfk").val("1");
        firstPartQuery($("#CASHIER_WEB_PATH").attr("attr_v")+"creditCardFQController/firstPartQuery.dhtml",$("#CASHIER_WEB_PATH").attr("attr_v")+"loadAdvertisementController/");
	}).bind("mouseover",function(){
		$(this).css("border","1px solid #F85964");
	}).bind("mouseout",function(){
		if($(this).attr("clicked") != "true"){
		 $(this).css("border","1px solid #e6e6e6");
		}
	});
	
	$("#platform-fqfk #byerCardNo-fqfk").bind("keyup",function(event){
	    var bankCardNum = $("#byerCardNo-fqfk").val();
	    bankCardNum = bankCardNum.replace(/[ ]/g,"");
	    var numReg = /^\d*$/; 
		if (!numReg.exec(bankCardNum)) {
			$("#byerCardNo-fqfk").val('');
			return false;
		}
	});
	var errorBackup_fqfk = "";//备份错误信息
	function clearError_fqfk(obj){
		errorBackup_fqfk = $("#byerCardNo-fqfk-span").text();
		if($("#byerCardNo-fqfk-span").hasClass("heighlight")){//如果是错误信息提示，清除错误样式及错误信息
			$(obj).css("border","1px solid #e0e0e0");
			$("#byerCardNo-fqfk-span").text("").hide();
		}
	}
	//银行号是否签约  焦点事件
	$("#platform-fqfk #byerCardNo-fqfk").bind("blur",function(){
	    appendDefaultValue('#platform-fqfk #byerCardNo-fqfk','请输入银行卡号');
	    $("#platform-fqfk #cardNumHidden-fqfk").val($("#platform-fqfk #byerCardNo-fqfk").val());//保存卡号
	    //如果卡号字段值没有改变,则不进行卡校验查询
	    if( $(this).val() === '' || $(this).val() === '请输入银行卡号' ){
		   if($(this).val() === '请输入银行卡号'){
		      $("#platform-fqfk #byerCardNo-fqfk").removeClass("cardID-failed");
		      $(this).css("border","1px solid #f85964");
		      $("#byerCardNo-fqfk-span").removeClass("color_gray").addClass("heighlight").text("请输入银行卡号").show();
		   }
		   fqfkCardNoTemp = $(this).val();
		   //把“立即支付按钮置灰”，如果显示的是开通按钮则隐藏，显示立即支付按钮
		   $("#gotopay-fqfk a").removeClass("btn-gotopay");
      	   $("#gotopay-fqfk a").addClass("btn_unable");
      	   $("#gotopay-fqfk-zf").css("display","none");
  	       $("#gotopay-fqfk-zf a").css("display","none");
      	   $("#gotopay-fqfk").css("display","block");
	       return;
	    }else if(fqfkCardNoTemp === $(this).val() ){
	    	$("#byerCardNo-fqfk-span").show().text(errorBackup_fqfk);//如果卡号没变，把备份的错误信息拿来
		       if($("#byerCardNo-fqfk-span").hasClass("heighlight")){
		    	   $(this).css("border","1px solid #f85964");
		       }
	    	 return;
	    }else{
	       fqfkCardNoTemp = $(this).val();
	    }
	    
	    //卡号合法性校验
	    $("#byerCardNo-fqfk-span").removeClass("color_gray").addClass("heighlight");
	    var validate = fqfkBankNoLuhmCheck("#byerCardNo-fqfk","#byerCardNo-fqfk-span");
	    if(!validate){
	    	//把“立即支付按钮置灰”，如果显示的是开通按钮则隐藏，显示立即支付按钮
			$("#gotopay-fqfk a").removeClass("btn-gotopay");
	      	$("#gotopay-fqfk a").addClass("btn_unable");
	      	$("#gotopay-fqfk-zf").css("display","none");
	  	    $("#gotopay-fqfk-zf a").css("display","none");
	      	$("#gotopay-fqfk").css("display","block");
	        return;
	    }
	    //cardBin校验
	    validate = fqfkCardBinValidate("#bankCode-fqfk","#byerCardNo-fqfk","#byerCardNo-fqfk-span");
	    if(validate){
		    cardBindQueryReady();
		}else{
			//把“立即支付按钮置灰”，如果显示的是开通按钮则隐藏，显示立即支付按钮
			$("#gotopay-fqfk a").removeClass("btn-gotopay");
	      	$("#gotopay-fqfk a").addClass("btn_unable");
	      	$("#gotopay-fqfk-zf").css("display","none");
	  	    $("#gotopay-fqfk-zf a").css("display","none");
	      	$("#gotopay-fqfk").css("display","block");
		}
	});
	function cardBindQueryReady(){
	     $("#isCheckChannel-fqfk").val("1");
		 cardBindQuery($("#CASHIER_WEB_PATH").attr("attr_v")+"creditCardFQController/firstPartQuery.dhtml");
	}
	
    //签约并支付
    $("#platform-fqfk #pay-fqfk-zf").click(function(){
    	var bankCode= $("#byerCardNo-fqfk").val();
	     if(bankCode==null || bankCode==""){
	    	 $("#byerCardNo-fqfk-span").removeClass("color_gray").addClass("heighlight").css("display","inline-block");
	    	 $("#byerCardNo-fqfk-span").html("请输入银行卡号");
	    	 return;
	     }
	     if($(this).text().indexOf("支付中") > -1) return false;
	     var srcStr = $("#RESOURCE_PATH").attr("attr_v")+"image/paying.gif";
	     $(this).hide();
	     $('#fqfk-bank').hide();
	     $('#platform-fqfk #chooseBankDiv').hide();
	     $("#isCheckChannel-fqfk").val("0");
	     $('#fqfk-frame').attr("src","");
	     var url = "?bankCode=" + $("#bankCode-fqfk").val() + "&ujm=" + $("#ujm").val();
	     url += "&payMode=030&cardType=020&cardNo=" + $("#byerCardNo-fqfk").val().replace(/[ ]/g,"") + "&installmentsNo=" + $("#installmentsNo-fqfk").val() ;
	     url += "&isCheckChannel=" + $("#isCheckChannel-fqfk").val()+"&cardSerila="+$("#bindSerila-fqfk").val();
	     $("#fqfk-moduleId").css("display","none");
	     $('#fqfk-choosedBankId').show();
	     $('#fqfk-chooseBank-after').show();
	     var payUrl = $("#CASHIER_WEB_PATH").attr("attr_v")+"quicksController/iframe.dhtml"+url;
	     $('#fqfk-frame').attr("src",payUrl);
	     toPayTimer_yinlian($("#ujm").val(),"#fqfk-chooseBank-after");
    });  
	
    //使用其他银行选择卡按钮效果 6221 6399 0305 5015
    $("#otherBank-fqfk").click(function(){
     	clearFqzfForm();
    	$("#platform-fqfk .ygbx-pay-bank").css("border","1px solid #E6E6E6");
    	checkBank();
        $("#fqfk-choosedBankId").hide();
        $("#fqfk-chooseBank-after").hide();
        $("#byerCardNo-fqfk-span").hide();
        $("#fqfk-moduleId,#platform-fqfk #chooseBankDiv").show();
        $("#gotopay-fqfk").css("display","block");
    });
    
    //立即支付  发送验证码
	$("#platform-fqfk #pay-fqfk").click(function(){
		var pageCallMode_New = $("#platform-fqfk #pageCallMode").val();
		if(pageCallMode_New=="020"){
			 $("#flowIe-payLayer .al_red2 a").attr("href","http://help.gome.com.cn/article/234-0-0.html");
		     $("#flowIe-payLayer #payLayerHead").html("登录网上银行支付");
		     $('#flowIe-payLayer,.thickdiv,.alert-box').show();
		     $("#cashierForm input[name='bankCode']").val($("#bankCode-fqfk").val());
		     $("#cashierForm input[name='payMode']").val("030");
		     $("#cashierForm input[name='cardType']").val("020");
		     $("#cashierForm input[name='installmentsNo']").val($("#installmentsNo-fqfk").val());
		     $("#cashierForm input[type='submit']").trigger("click");
		}else{
			
			if($("#platform-fqfk #cardNumHidden-fqfk").val() != $("#platform-fqfk #byerCardNo-fqfk").val()){//点立即支付前卡号有变动
			       $("#transNo-fqfk").val("");
			}
				
			if($("#byerCardNo-fqfk-span").html() != "" && $("#byerCardNo-fqfk-span").hasClass("heighlight")){//如果有错误提示
				return false;
			}
			
		    if(!isBackLoadingFqfk){//如果还没查出是否绑卡
		    	return false;
		    }
			    
			var $this = $(this);
			if($this.text().indexOf("支付中") > -1) return false;
			$this.removeClass("btn-gotopay").addClass("btn_unable2").html('<span style="padding-left:16px;"/>支付中<img style="margin-left:2px;vertical-align:middle" src="'+$("#RESOURCE_PATH").attr("attr_v")+'image/paying.gif"/>');    
		    var params = {
					isAsync : false,
					reqUrl : $("#CASHIER_WEB_PATH").attr("attr_v")+"quicksController/sends.dhtml",
					parameters : {
						ujm : $("#ujm").val(),
						supplierNo : $("#platform-fqfk #supplierNo-fqfk").val(),
						cardSerila : $("#bindSerila-fqfk").val()
					},
					_this : "#alert #downtimeAlert",
					callBack : function(returnData,_this,tipPos){
						var respFlag=returnData.resCode;
		          	    var transNo=returnData.transNo;
		          	    //var cardSerila=returnData.cardSerila;
						if(respFlag=='0000'){
							$("#transNo-fqfk").val(transNo);
							//$("#bindSerila-fqfk").val(cardSerila);
							countDownFun=countDownTimer(returnData.time);
							$("#fqfk_checkway_errormsg").text("");//清空错误信息
							
						}else{
							$this.removeClass("btn_unable2").addClass("btn-gotopay").html("立即支付").attr("disabled",false);;
							$(tipPos)[0].style.display="inline-block";
			                $(tipPos).text(returnData.resDesc);
			            }
					},
					tipPos : "#fqfk_checkway_errormsg"
				};
				//发送验证码
				sendRequest(params);
				return false;
		
		}
	});	
    //我的银行卡
    $("#creditCardFQ_mycards").click(function(){
	     //显示所有支付方式
		 $(".payTypeSelect").show();
	     //关闭所有的支付方式大窗口
		 platformCloseAll();
		 mycards_open();
		 $("#check-unit-mycards").trigger("click");//触发点击我的银行卡事件
	});





    
    
    $(function(){
    	clearFqzfForm();
    	//银行卡号格式化
    	$("#platform-fqfk #byerCardNo-fqfk").bind('keyup',function(event){ 
    		if(!(event.keyCode>=48 && event.keyCode<=57)){ 
    			this.value=this.value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,''); 
    		} 
    			this.value = this.value.replace(/\s/g,'').replace(/(\d{4})(?=\d)/g,"$1"+" "); 
    		}).bind('dragenter',function(){
    			return false; 
    		}).bind('onpaste',function(){ 
    			this.value=this.value.replace(/\D/g,''); 
    			return !clipboardData.getData('text').match(/\D/); 
    		}).bind('blur',function(){
    			if (this.value == "") {
                    this.value = "";
                }
    		});
    	//分期切换
    	$("#platform-fqfk .gmform-label").bind("click",function(){
    		$("#platform-fqfk").find(".fq_check").hide().attr("clicked","");
    		fenqi();
    		$(this).find(".fq_check").show().attr("clicked","true");
    		if($(this).find(".fq_check").attr("clicked")=="true"){
    			$(this).removeClass("gmform_brgray").addClass("gmform_brred");
    			$(this).find("span p").removeClass("fq_fanq").addClass("fq_paymy");
    		}
           changeStaging($(this).attr("value"));
    	}).bind("mouseover",function(e){
    		$(this).removeClass("gmform_brgray").addClass("gmform_brred");
    		$(this).find("span p").removeClass("fq_fanq").addClass("fq_paymy");
    		stopBubble(e);
    	}).bind("mouseout",function(e){
    		if($(this).find(".fq_check").attr("clicked")!="true"){
    			$(this).removeClass("gmform_brred").addClass("gmform_brgray");
    			$(this).find(".fq_check").hide();
    			$(this).find("span p").removeClass("fq_paymy").addClass("fq_fanq");
    		}
    		stopBubble(e);
    	});
    });
    function fenqi(){
    	if($("#platform-fqfk .gmform-label").find(".fq_check").attr("clicked")!="true"){
    		$("#platform-fqfk .gmform-label").removeClass("gmform_brred").addClass("gmform_brgray");
    		$("#platform-fqfk .gmform-label").find(".fq_check").hide();
    		$("#platform-fqfk .gmform-label").find("span p").removeClass("fq_paymy").addClass("fq_fanq");
    	}
    }
    function creditCardFQ_open(){
    	$("#platform-fqfk").show();
    }
    //清理表单信息
    function  clearFqzfForm(){
    	$("#platform-fqfk #transNo-fqfk").val("");
    	$("#platform-fqfk #fqfk_error_message").hide();
    	$("#platform-fqfk #byerCardNo-fqfk").val("请输入银行卡号");
    	$("#platform-fqfk #byerCardNo-fqfk").css('color','#8B8378');
    	$("#platform-fqfk #byerCardNo-fqfk").css("border","1px solid #e0e0e0");
    	$("#byerCardNo-fqfk").removeClass("cardID-failed");
    	fqfkCardNoTemp = '';
        clearInterval(setIntervalFun);
    }

    /**
     * 判断期数是否为空
     * @param obj
     * @returns {Boolean}
     */
    function isFqStagNotEmpty(stagingCount){
    	if(stagingCount != null && stagingCount != undefined && stagingCount != '' && stagingCount != 'null'){
    		return true;
    	}else{
    		return false;
    	}
    }
    /**
     * method 分期支付首次加载分期信息
     * param returnData json对象
     */
    function parseStaging(returnData){
    	if($("#fqfk-bank").css("display") == "none"){
    	   $("#fqfk-bank").show();
    	}
    	//期数
    	var stagingArray = returnData.stagingArray;
    	var stagin = [3,6,9,12,18,24];

    	var defaultCheck = false;

    	$("#platform-fqfk").find(".fq_check").hide();
    	$("#platform-fqfk").find(".fq_check").attr("clicked","");
    	$("#platform-fqfk").find(".fq_paymy").hide();
    	$("#platform-fqfk").find(".gmform-label").removeClass("gmform_brred").addClass("gmform_brgray");
    	
    	for(var i = 0; i < stagingArray.length; i++){
    		var stagingCount = stagingArray[i].stagingCount;
    		if(isFqStagNotEmpty(stagingCount)){
    			if(!defaultCheck){
        			$("#installmentsNo-fqfk").val(stagin[i]);
        			$("#bankfq"+stagin[i]).removeClass("gmform_brgray").addClass("gmform_brred");
        			$("#bankfq"+stagin[i]+" .fq_check").show();
        			$("#detail"+stagin[i]).show();
        			defaultCheck = true;
        		}else{
        			$("#detail"+stagin[i]).hide();
        		}
        		
        		$("#bankfq"+stagin[i]).show();
        		var pay = stagingArray[i].stagingCount_full_fee*1 + $("#order"+stagin[i]).text()*1;
        		$("#pay"+stagin[i]).text(pay.toFixed(2));
        		$("#fee"+stagin[i]).text(stagingArray[i].stagingCount_full_fee);
        		$("#first"+stagin[i]).text(stagingArray[i].stagingCount_first_money);
        		$("#poundage"+stagin[i]).text("("+returnData.poundageMode+")");
        		$("#bankfq"+stagin[i]+" .lb_right").html(stagingArray[i].stagingCount_every_money + "元/期");
    	  	}else{
    	  		$("#bankfq"+stagin[i]).hide();
        		$("#detail"+stagin[i]).hide();
    	  	}
    	}
    }
    /**
     * method 分期详细信息切换
     * param staging 分期数
     */
    function changeStaging(staging){
    	$("#detail3").hide(); 
    	$("#detail6").hide();
    	$("#detail9").hide();
    	$("#detail12").hide();
    	$("#detail18").hide();
    	$("#detail24").hide();
    	if(staging === '3'){//3期
    		$("#installmentsNo-fqfk").val("3");
    		$("#detail3").show();
    	}else if(staging === '6'){//6期
    		$("#installmentsNo-fqfk").val("6");
    		$("#detail6").show();
    	}else if(staging === '9'){
    		$("#installmentsNo-fqfk").val("9");
    	    $("#detail9").show();
    	}else if(staging === '12'){//12期
    		$("#installmentsNo-fqfk").val("12");
    		$("#detail12").show();
    	}else if(staging === '18'){//18期
    		$("#installmentsNo-fqfk").val("18");
    		$("#detail18").show();
    	}else if(staging === '24'){//24期
    		$("#installmentsNo-fqfk").val("24");
    		$("#detail24").show();
    	}
    	
    }
    /**
     * 首次选择选择银行进行供应商适配并查询分期信息,初始化支付渠道  调用分流接口
     * @param url
     * @param cashierCode
     */
    function firstPartQuery(url,adUrl){
    	 var params = {
    		isAsync : false,
    		reqUrl : url,
    		parameters : {
    			bankCode : $("#bankCode-fqfk").val(),
    			bankName : $("#bankName-fqfk").val(),
    			ujm : $("#ujm").val(),
    			cardNo : $("#cardNo").val(),
    			isFirst: '1',
    			isCheckChannel: $("#platform-fqfk #isCheckChannel-fqfk").val() //是否进行支付渠道限制校验
    		},
    		callBack : function(returnData,_this,tipPos){
    			var resCode = returnData.resCode;
    			var resDesc = returnData.resDesc;
    			if(resCode === 'FAIL0000'){
    				$("#platform-fqfk #fqfk_error_message").show();
    				$("#platform-fqfk #fqfk_error_message").html(resDesc);
    				$("#fqfk-bankCardNum-id").hide();
    				$("#gotopay-fqfk-zf").hide();
    				$("#gotopay-fqfk").show();
    				$("#gotopay-fqfk a").removeClass("btn-gotopay").addClass("btn_unable");
    				$("#platform-fqfk #fqfk-bank").hide();
    			}else{
    				$("#platform-fqfk #fqfk_error_message").hide();
    				$("#platform-fqfk #fqfk-bank").show();
    				$("#platform-fqfk #supplierNo-fqfk").val(returnData.supplierNo);
    				$("#gotopay-fqfk-zf").css("display","none");
    	       		$("#gotopay-fqfk-zf a").css("display","none");
    				parseStaging(returnData);//显示分期信息
    				loadFloatAdFq(adUrl+'loadFloatAdFq.dhtml?ujm='+$("#ujm").val(),returnData.supplierNo,'030',$("#bankCode-fqfk").val());//加载分期广告
    				var pageCallMode = returnData.pageCallMode;
    				$("#platform-fqfk #pageCallMode").val(pageCallMode);
    				$("#platform-fqfk #fqfk-reminder").html(returnData.reminder);
    				if(pageCallMode=="020"){
    					$("#fqfk-bankCardNum-id").hide();
    					$("#gotopay-fqfk-zf").hide();
    					$("#gotopay-fqfk").show();
    					$("#gotopay-fqfk a").removeClass("btn_unable").addClass("btn-gotopay");
    				}else{
    					$("#fqfk-bankCardNum-id").show();
    					$("#byerCardNo-fqfk-span").hide();
    					$("#gotopay-fqfk").show();
    					$("#gotopay-fqfk-zf").hide();
    					$("#gotopay-fqfk a").removeClass("btn-gotopay").addClass("btn_unable");
    				}
    			}
    		},
    		tipPos : "#platform-fqfk #byerCardNo"
    	};
    	//调用接口查询是否已绑卡
    	sendRequest(params); 
    }
    /**
     * 银行号是否签约查询
     * @param url
     * @param cashierCode
     * @returns {Boolean}
     */
    function cardBindQuery(url){
    	var bankCode=$("#platform-fqfk #byerCardNo-fqfk").val().replace(/[ ]/g,"");
    	isBackLoadingFqfk = false;
    	var params = {
    		isAsync : false,
    		reqUrl : url,
    		parameters : {
    			bankCode : $("#platform-fqfk #bankCode-fqfk").val(),
    			ujm : $("#ujm").val(),
    			supplierNo : $("#platform-fqfk #supplierNo-fqfk").val(),
    			cardNo : bankCode,
    			isCheckChannel: $("#platform-fqfk #isCheckChannel-fqfk").val() //是否进行支付渠道限制校验
    		},
    		callBack : function(returnData,_this,tipPos){ 
    			$('#fqfk-imageId').hide();
    			//是否绑卡
    	       	var isBindCard = returnData.isCard;
    	       	isBackLoadingFqfk = true;//已查询出是否绑卡
    	       	//是否已绑卡
    	       	if(isBindCard=="020"){
    	       		//切换支付按钮
    	       		$("#byerCardNo-fqfk").removeClass("cardID-failed");
    	       		$("#gotopay-fqfk").css("display","block");
    	       		$("#gotopay-fqfk-zf").css("display","none");
    	       		$("#gotopay-fqfk-zf a").css("display","none");
    	       		$("#gotopay-fqfk a").removeClass("btn_unable");
    	       		$("#gotopay-fqfk a").addClass("btn-gotopay");
    	       		
    	       		$("#byerCardNo-fqfk-span").removeClass("heighlight").addClass("color_gray").html("此银行卡已开通分期付款").show();
    	       		//绑卡成功  卡的序号
    	       		$("#bindSerila-fqfk").val(returnData.cardSerila);
    	       		if(returnData.telphone != "" && typeof(returnData.telphone) != "undefined"){//是否有手机号
    					 $("#alert #currentTelAlert").html(returnData.telphone);
    					 $('#alert .put_code').css("margin-top", "");
    				     $('#alert .al_send').css("visibility","visible");
    				} else {
    					 $('#alert .put_code').css("margin-top", "20px");
    				     $('#alert .al_send').css("visibility","hidden");
    			    }
    	       	}else{
    	       		//切换同意开通并支付按钮，切换到银联的ifrme
    	       		bankCode = "****"+ bankCode.substring(bankCode.length-4,bankCode.length);
    	       		$("#fqfk-bankCodeId").html(bankCode);
    	       		$("#byerCardNo-fqfk").addClass("cardID-failed");
    	       		$("#byerCardNo-fqfk").attr("style","");
    	       		$("#byerCardNo-fqfk-span").removeClass("color_gray").addClass("heighlight").html("未开通分期付款，请开通后支付");
    	       		$("#byerCardNo-fqfk-span").css("display","inline-block");
    	       		$("#gotopay-fqfk").css("display","none");
    	       		$("#gotopay-fqfk-zf").css("display","block");
    	       		$("#gotopay-fqfk-zf a").css("display","block");
    	       		$("#bindSerila-fqfk").val(returnData.cardSerila);
    	       	}
    		}
    	}; 
    	//调用接口查询是否已绑卡
    	$("#fqfk-imageId").show();
    	setTimeout(function(){sendRequest(params);},10); 
    }

    /**
     * 卡号有效性校验
     * @param bankCardId 银行卡ID
     * @param errorId 错误显示ID
     * @returns {Boolean}
     */
    function fqfkBankNoLuhmCheck(bankCardId,errorId){
    	var bankCardNum =$(bankCardId).val();
    	if(bankCardNum === ''){
    		$(bankCardId).attr("style","");
    		$(bankCardId).addClass("cardID-failed");
    		$(errorId).html("请输入银行卡号");
    		$(errorId).show();
    	    $(errorId).addClass('heighlight');
    	    $(bankCardId).css("border","1px solid #f85964");//红色边框
    		return false;
    	}
    	//去除中间字符串空格
    	bankCardNum=bankCardNum.replace(/[ ]/g,"");

    	var num = /^\d*$/;  //全数字
    	if (!num.exec(bankCardNum)) {
    		$(bankCardId).attr("style","");
    		$(bankCardId).addClass("cardID-failed");
    		$(errorId).html("卡号格式不正确");
    		$(errorId).show();
    	    $(errorId).addClass('heighlight');
    	    $(bankCardId).css("border","1px solid #f85964");//红色边框
    		return false;
    	}
    	//开头6位
    	var strBin="10,18,30,35,37,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,58,60,62,65,68,69,84,87,88,94,95,98,99";    
    	if (strBin.indexOf(bankCardNum.substring(0, 2))== -1) {
    		$(bankCardId).attr("style","");
    		$(bankCardId).addClass("cardID-failed");
    		$(errorId).html("银行卡校验有误");
    		$(errorId).show();
    	    $(errorId).addClass('heighlight');
    	    $(bankCardId).css("border","1px solid #f85964");//红色边框
    		return false;
    	}
    	//取出最后一位（与luhm进行比较）
    	var lastNum=bankCardNum.substr(bankCardNum.length-1,1);
    	//前15或18位
    	var first15Num=bankCardNum.substr(0,bankCardNum.length-1);
    	var newArr=new Array();
    	//前15或18位倒序存进数组
    	for(var i=first15Num.length-1;i>-1;i--){    
    	    newArr.push(first15Num.substr(i,1));
    	}
    	//奇数位*2的积 <9
    	var arrJiShu=new Array(); 
    	//奇数位*2的积 >9
    	var arrJiShu2=new Array();
    	//偶数位数组
    	var arrOuShu=new Array(); 
    	for(var j=0;j<newArr.length;j++){
    	    if((j+1)%2==1){//奇数位
    	        if(parseInt(newArr[j])*2<9)
    	        arrJiShu.push(parseInt(newArr[j])*2);
    	        else
    	        arrJiShu2.push(parseInt(newArr[j])*2);
    	    } else //偶数位
    	    arrOuShu.push(newArr[j]);
    	}
    	//奇数位*2 >9 的分割之后的数组个位数
    	var jishu_child1=new Array();
    	//奇数位*2 >9 的分割之后的数组十位数
    	var jishu_child2=new Array();
    	for(var h=0;h<arrJiShu2.length;h++){
    	    jishu_child1.push(parseInt(arrJiShu2[h])%10);
    	    jishu_child2.push(parseInt(arrJiShu2[h])/10);
    	}
    	//奇数位*2 < 9 的数组之和
    	var sumJiShu=0;
    	//偶数位数组之和
    	var sumOuShu=0;
    	//奇数位*2 >9 的分割之后的数组个位数之和
    	var sumJiShuChild1=0;
    	//奇数位*2 >9 的分割之后的数组十位数之和
    	var sumJiShuChild2=0; 
    	var sumTotal=0;
    	for(var m=0;m<arrJiShu.length;m++){
    	    sumJiShu=sumJiShu+parseInt(arrJiShu[m]);
    	}
    	for(var n=0;n<arrOuShu.length;n++){
    	    sumOuShu=sumOuShu+parseInt(arrOuShu[n]);
    	}
    	for(var p=0;p<jishu_child1.length;p++){
    	    sumJiShuChild1=sumJiShuChild1+parseInt(jishu_child1[p]);
    	    sumJiShuChild2=sumJiShuChild2+parseInt(jishu_child2[p]);
    	}      
    	//计算总和
    	sumTotal=parseInt(sumJiShu)+parseInt(sumOuShu)+parseInt(sumJiShuChild1)+parseInt(sumJiShuChild2);
    	//计算Luhm值
    	var k= parseInt(sumTotal)%10==0?10:parseInt(sumTotal)%10;        
    	var luhm= 10-k;
    	if(lastNum==luhm){
    		$(errorId).html("");
    		$(errorId).hide();
    	    return true;
    	}else{
    		$(bankCardId).attr("style","");
    		$(bankCardId).addClass("cardID-failed");
    		$(errorId).html("银行卡校验有误");
    		$(errorId).show();
    	    $(errorId).addClass('heighlight');
    	    $(bankCardId).css("border","1px solid #f85964");//红色边框
    	    return false;
    	}        
    }
    /**
     * 卡bin校验
     * @param bankCodeId 银行编码ID
     * @param bankCardId 银行卡号ID
     * @param errorId 错误显示ID
     * @returns {Boolean}
     */
    function fqfkCardBinValidate(bankCodeId,bankCardId,errorId){
    	
    	var cardNo = $(bankCardId).val().replace(/[ ]/g,"");
        var bankCode = $(bankCodeId).val();
        var cardBin = getCardBinInfo(cardNo,bankCode);
        
        if(cardBin === null || cardBin === '' || cardBin === undefined){
        	$("#byerCardNo-fqfk").attr("style","");
        	$("#byerCardNo-fqfk").addClass("cardID-failed");
    		$(errorId).show();
            $(errorId).addClass('heighlight');
            $(errorId).html("银行卡校验有误"); 
            $(bankCardId).css("border","1px solid #f85964");//红色边框
            return false;
        }else{
        	if(cardBin.bankCode != bankCode){
        		$("#byerCardNo-fqfk").attr("style","");
        		$("#byerCardNo-fqfk").addClass("cardID-failed");
        		$(errorId).show();
                $(errorId).addClass('heighlight');
                $(errorId).html("输入的卡号与选择的银行不一致");
                $(bankCardId).css("border","1px solid #f85964");//红色边框
                return false;
        	}
        	if(cardBin.cardType != "020"){
        		$("#byerCardNo-fqfk").attr("style","");
        		$("#byerCardNo-fqfk").addClass("cardID-failed");
        		$(errorId).show();
                $(errorId).addClass('heighlight');
                $(errorId).html("该卡为储蓄卡，请用信用卡支付"); 
                $(bankCardId).css("border","1px solid #f85964");//红色边框
                return false;
        	}
        	
        }
        
        if(cardBin.cardLength != null && cardNo.length > cardBin.cardLength){
        	$("#byerCardNo-fqfk").attr("style","");
        	$("#byerCardNo-fqfk").addClass("cardID-failed");
            $(errorId).show();
            $(errorId).addClass('heighlight');
            $(errorId).html("输入的卡号长度不能大于"+realCardLength+"位"); 
            $(bankCardId).css("border","1px solid #f85964");//红色边框
            return false;  
        }
        
        return true;
    }
    /**
     * 只能输入数字和空格
     */
    function onlyNumAndBlank(){
    	if(event.shiftKey){
    		event.returnValue=false;
    	}
    	if(!(event.keyCode == 46) && !(event.keyCode == 8) && !(event.keyCode == 37) && !(event.keyCode == 39) && !(event.keyCode == 32) && !(event.keyCode == 17) && !(event.keyCode == 67) && !(event.keyCode == 86)){
    	  if(!((event.keyCode >= 48 && event.keyCode <= 57)||(event.keyCode >= 96 && event.keyCode <= 105)) ){
    	   	event.returnValue=false;
    	  }
    	}
    }
    
    
    
    
    
/**
 * 分期比价 
 ***/    
    var credit_compare_url = $("#CASHIER_WEB_PATH").attr("attr_v")+"creditCardFQController/creditCompare.dhtml";
    $(".layer .close,.layer .i-know").click(function(){
       $(".layer").hide();
    });  
    //点击比价后默认选中三期--> 
    $(".fqbj-btn").click(function(){
       $(".nper-list li").removeClass("check").remove(".nper-list li i");
       $(".nper-list li[nm='3']").addClass("check").append("<i></i>").trigger("click");
       $(".layer").show();
    });
    
    //点击期数-->
    $(".nper-list li").click(function(){
        $(this).addClass("check").append("<i></i>");
        $(this).siblings().removeClass("check").remove(".nper-list li i");
        var nm = $(this).attr("nm");//获取期数-->
        //隐藏所有银行费率-->
        $("div[id^='tab-overflow-']").hide();
        //判断该期数银行费率是否存在-->
        $("#tab-overflow-"+nm).css("display","inline-block");
        if($("#tab-overflow-"+nm+" table").text() == "" || $("#tab-overflow-"+nm+" table tr").hasClass("bjException")){//查询异常会重新发送请求
	             var parames = {
	             isAsync : true,
	             reqUrl : credit_compare_url,
	             parameters : {ujm:$("#ujm").val(),fqNm:nm},
	             callBack : function(returnData,_this,tipPos){
	                if("0000" == returnData.resCode){
	                   var fqCompareList = returnData.fqCompareList;
	                   var bank = null;
	                   for(var i = 0; i < fqCompareList.length; i++){
	                       bank = fqCompareList[i];
	                       var innerHtml = "<tr><td class=\'pay-ad\'>"+bank.bankName;
	                       if("1" == bank.prefer){//有活动
	                         innerHtml += "<b></b>";
	                       }
	                       innerHtml += "</td><td class=\'number\'><i>"+bank.stagingCountNumber+"%</i></td><td class=\'number\'><i>"+(bank.stagingCount_full_fee / 100).toFixed(2)+"</i>元</td><td><a href=\'javascript:void(0)\' bankCode="+bank.bankCode+">立即支付</a></td></tr>";
	                       $("#tab-overflow-"+nm+" table").append(innerHtml);
	                   }
	                   if(fqCompareList.length < 1){
	                      var innerHtml = "<tr><td class=\'pay-ad\'>暂无支持银行</td></tr>";
	                      $("#tab-overflow-"+nm+" table").append(innerHtml);
	                   }
	                   if(fqCompareList.length >= 8){
	                     $("#tab-overflow-"+nm).css({"border-right":"1px solid #ddd ","width":"556px"});
	                   } 
	                } else {
	                       $("#tab-overflow-"+nm+" table tr").remove();
	                       var innerHtml = "<tr class=\'bjException\'><td class=\'pay-ad\'>"+returnData.resDesc+"</td></tr>";
	                       $("#tab-overflow-"+nm+" table").append(innerHtml);
	                }
	              }
                }
           sendRequest(parames);
          }
    });
    
    //点击分期比价中的立即支付-->
    $(".tab-overflow a").live("click",function(){
       var fqNm = $(".nper-list .check").attr("nm");
       var bankCode = $(this).attr("bankCode");
       //关闭弹层，触发银行、分期数,如果是开通页面先返回银行列表页面-->
       $(".layer").hide();
       if("none" == $("#fqfk-moduleId").css("display")){
         $("#otherBank-fqfk").trigger("click");
       }
       if($(".ygbx-pay-bank[id='"+bankCode+"']").css("display") == "none"){//展开更多-->
         $(".bank-lists .more").trigger("click");
       }
       $(".ygbx-pay-bank[id='"+bankCode+"']").trigger("click");
       $(".gmform-label[id='bankfq"+fqNm+"']").trigger("click");
    });
    
    
    
    