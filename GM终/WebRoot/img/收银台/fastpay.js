
    $("#mf-input-yinlian").val("");//解决BUG85378 快捷支付首页，后退时，存在银行卡号与输入银行简码默认文字重叠情况
    var isBackLoading = false;
    var errorMessage_yinlian = null;
    var cardNo_yinlian = null;//同一卡号鼠标失去焦点不进行重复查询
    
    $(function(){
	    //鼠标悬浮到银行卡下部卡类型上
	    $("#platform-kjzf .pbc-info-box span").mouseover(function(){
	    	$(this).find("input").attr("checked",true);
	    });
	
	    if($("#myb-platform").length < 1){//没有美盈宝时，银行输入框自动获取焦点
	    	$("#mf-input-yinlian").focus();
	    }
	    
		//银行卡号检验是否已绑卡
		$("#platform-kjzf #byerCardNo").bind("blur",function(){
			if(!bankNoLuhmCheck('#platform-kjzf #byerCardNo')) return false;
			var params = {
				isAsync : false,
				reqUrl : $("#CASHIER_WEB_PATH").attr("attr_v")+"fastPaysController/initInfoQueryFacade.dhtml",
				parameters : {
					bankCode : $("#platform-kjzf #bankCode").val(),
					ujm : $("#ujm").val(),
					cardNo : $(this).val().replace(/[ ]/g,""),
					supplierNo : $("#supplierNo").val(),
					cardType : "010"
				},
				callBack : function(returnData,_this,tipPos){
					//是否绑卡
	            	var isBindCard=returnData.isCard;
	            	//是否已绑卡
	            	if(isBindCard=="020"){
	            		appendError(tipPos,"该银行卡号已绑卡");
	            		$("#phone_code").attr("disabled", true);
	            		$("#phone_code").css({color:"#a5a5a5",border:"1px solid #e6e6e6",background:"#f0eeee",cursor:"default"});
	            		return false;
	            	}else{
	            		clearError(tipPos);
	            		return true;
	            	}
				},
				tipPos : "#platform-kjzf #byerCardNo"
			};
			//调用接口查询是否已绑卡
			sendRequest(params);
		});
	});
	
	//银行点击事件
	$('#platform-kjzf .pbc-info-box').children("span").bind("click",function(e){
		 var cardTypeHtml = $(this).attr("l");
	     var cardType = null;
	     if("a" == cardTypeHtml){
	         cardType = "010";
	     } else {
	         cardType = "020";
	     }
	     fastPayCallBack($(this).attr("id"),cardType,$(this).attr("name"));
     });

	//输入框  确定按钮
 	$('#mf-button-yinlian').bind('click',function(){
 	    var str = /[A-Za-z]+/;
	 	var value = $("#mf-input-yinlian").val().toUpperCase();
	 	value = value.replace(/\s+/g,""); 
	 	var bankName = $('.mf-ipbk > span').html();
	 	if(value == ""){
	 	  	bankNoLuhmCheck_input(".mf-input","appendError_input");//走校验逻辑
	 	  	return false;
	 	}
	 	$('#confirmTip').show();
	    setTimeout(function(){		    
	  		//卡号,卡类型   
		 	var cardNo = $('.mf-input').val().replace(/[ ]/g,"");
		 	var card = getCardBinInfo(cardNo);
 	  		fastPayCallBack_input(cardNo,card,5);
	 	  	$('#confirmTip').hide();
		},500); 
 	});  
	
	//校验form表单
	function checkForm(){
		var errors=[];
		if(!checkByerName('#platform-kjzf #byerName')){
			errors.push(false);
		}
		if(!checkIdcard('#platform-kjzf #byerIdCard')){
			errors.push(false);
		}
		if(!bankNoLuhmCheck('#platform-kjzf #byerCardNo')){
			errors.push(false);
		}
		if(!checkMobilNumber('#platform-kjzf #byerMobileNo')){
			errors.push(false);
		}
		if(errors.length==0){
			return true;
		}
		return false;
	}
	
	//开通并支付
	$("#platform-kjzf .btn-gotopay.mr10.mr_flt").click(function(){
	    if($(this).attr("pagemodle") == "yl" && "您还未开通快捷支付，请开通后支付" == $("#message_tips").html()){//如果点击的是银联 “同意协议并开通”
	       gotopay_yinlian();
	       return;
	    }
   
	    if($("#byerCardNoem").text() != ""){//银行卡后台校验出已绑卡
	    	return false;
	    }
	    
	    var errors=[];
		if(!checkForm()){
			errors.push(false);
		}
		
		if(errors.length>0){
			return false;
		}
		 //手机号
		 $("#alert #currentTelAlert").html($("#byerMobileNo").val().substring(0,3)+"****"+$("#byerMobileNo").val().substring($("#byerMobileNo").val().length-4),$("#byerMobileNo").val().length);
		 $('#alert .put_code').css("margin-top", "");
		 $('#alert .al_send').css("visibility","visible");
		var $this = $(this);
		if($this.text().indexOf("支付中") > -1) return false;
		$this.removeClass("btn-gotopay").addClass("btn_unable2").html('<span style="padding-left:16px;"/>支付中<img style="margin-left:2px;vertical-align:middle" src="'+$("#RESOURCE_PATH").attr("attr_v")+'image/paying.gif"/>');
		setTimeout(function(){
			$("#preByerName").val($("#byerName").val());
			$("#preByerIdCard").val($("#byerIdCard").val());
			$("#preByerCardNo").val($("#byerCardNo").val());
			$("#preByerMobileNo").val($("#byerMobileNo").val());
			var params = {
				isAsync : false,
				reqUrl : $("#CASHIER_WEB_PATH").attr("attr_v")+"fastPaysController/oneNoteValidation.dhtml",
				parameters : {
					ujm : $("#ujm").val(),
					supplierNo : $("#supplierNo").val(),
					cardType : "010",
					cardNo : $("#byerCardNo").val().replace(/[ ]/g,""),
					idCard : $("#byerIdCard").val(),
					phone : $("#byerMobileNo").val(),
					owner : Base64.encode($("#byerName").val()),
					bankCode : $("#bankCode").val()
				},
				callBack : function(returnData,_this,tipPos){
					var respFlag=returnData.resCode;
	            	var transNo=returnData.transNo;
	            	var cardSerila=returnData.cardSerila;
					if(respFlag=='0000'){
						$("#transNo").val(transNo);
						$("#cardSerila").val(cardSerila);
						countDownTimer(returnData.time);
						$("#fastPay_yibao_errormsg").text("");//清空错误信息
					}else{
						$this.removeClass("btn_unable2").addClass("btn-gotopay").html("同意开通并支付").attr("disabled",false);;
						$(tipPos).css("display","block");
						$(tipPos).text(returnData.resDesc);
		            }
				},
				tipPos : "#platform-kjzf #fastPay_yibao_errormsg"
			};
			//发送验证码
			sendRequest(params);
			return false;
		}, 1000)
	});
	
	//立即支付
	$("#platform-kjzf .btn_unable.mr10.mr_flt").click(function(){
	    if($("#platform-kjzf .fqfk-bankCardNum")[0].style.display != "none" && $("#cardID-input-yinlian").val() == "请输入银行卡号"){//银联快捷首次支付，显示出输入框后，点击”立即支付“处理
			$("#platform-kjzf #message_tips").show().removeClass('color_gray').addClass('heighlight').html("请输入银行卡号");
			$("#cardID-input-yinlian").css("border","1px solid #f85964");
			return false;
	    }
	    if($("#message_tips").html() != "" && $("#message_tips").html() != "该银行卡已在银联在线支付实现认证"){//验证不通过
	    	return false;
	    }
	    if(!isBackLoading){//还没查出分流结果
	    	return false;
	    }
	    
	    var url = null;
	    var supplierNo = null;
	    var parameters = {};
	    var $this = $(this);
	    if($this.text().indexOf("支付中") > -1) return false;
		$this.removeClass("btn-gotopay").addClass("btn_unable2").html('<span style="padding-left:16px;"/>支付中<img style="margin-left:2px;vertical-align:middle" src="'+$("#RESOURCE_PATH").attr("attr_v")+'image/paying.gif"/>');
        url = $("#CASHIER_WEB_PATH").attr("attr_v")+"quicksController/sends.dhtml";
        parameters = {
			ujm : $("#ujm").val(),
			cardSerila : $("#cardSerila").val(),
			supplierNo : $("#supplierNo").val()
	    };
	    //点击“发送验证码”后输入框内容不可更改,输入框显示出来时才置为不可更改
	    if($('#platform-kjzf .fqfk-bankCardNum')[0].style.display != "none"){
	      $("#cardID-input-yinlian").attr("readonly",true);
	    }
	   
		var params = {
			isAsync : false,
			reqUrl : url,
			parameters :parameters,
			callBack : function(returnData,_this,tipPos){
				var respFlag=returnData.resCode;
            	var transNo=returnData.transNo;
            	//var cardSerila=returnData.cardSerila;
				if(respFlag=='0000'){
					$("#transNo").val(transNo);
					//$("#cardSerila").val(cardSerila);
					countDownTimer(returnData.time);
					$("#pay_checkway .plase_way").text("");//清空错误信息
				}else{
					$this.removeClass("btn_unable2").addClass("btn-gotopay").html("立即支付").attr("disabled",false);
	                $(tipPos).text(returnData.resDesc).show();
	            }
			},
			tipPos : "#pay_checkway .plase_way"
		};
		sendRequest(params);
		return false;
	    
	});
	
	
	$('#cardID-input-yinlian').bind('focus',function(){
	    var cardNo = $('#cardID-input-yinlian').val().replace(/[ ]/g,"");
	    if(!(cardNo_yinlian == cardNo)){//如果输入框里的内容没变就不清除错误信息
	       $("#message_tips").html("");
	    }
	});
	var errorBackup_fastPay = "";//备份错误信息
	function clearError_yl(obj){
		errorBackup_fastPay = $("#platform-kjzf #message_tips").text();
		if($("#platform-kjzf #message_tips").hasClass("heighlight")){//如果是错误信息提示，清除错误样式及错误信息
			$(obj).css("border","1px solid #e0e0e0");
			$("#platform-kjzf #message_tips").text("").hide();
		}
	}
	//卡号校验及是否绑定    点银行卡进入卡号输入页面，输入卡号后鼠标 移出事件
	$('#cardID-input-yinlian').bind('blur',function(){
	    if($('#cardID-input-yinlian').val() == "请输入银行卡号"){
	      $(this).css("border","1px solid #f85964");
	      $("#platform-kjzf #message_tips").removeClass('color_gray').addClass('heighlight').text("请输入银行卡号").show();
	      cardNo_yinlian = "请输入银行卡号";
	      return false;
	    }
	   
	    var cardNo = $('#cardID-input-yinlian').val().replace(/[ ]/g,"");
	    if(cardNo_yinlian == cardNo){
	       $("#platform-kjzf #message_tips").show().text(errorBackup_fastPay);//如果卡号没变，把备份的错误信息拿来
	       if($("#platform-kjzf #message_tips").hasClass("heighlight")){//如果是错误信息，显示红边框
	    	   $(this).css("border","1px solid #f85964");
	       }
	       return;
	    }else{
	       cardNo_yinlian = cardNo;  
	    }
	    isBackLoading = false;
	    //卡号合法性校验
	    var validate = bankNoLuhmCheck_input("#cardID-input-yinlian","appendError_input2");
	    if(!validate){
	    	$(this).css("border","1px solid #f85964");
	    }
	    //cardBin校验
	    var cardBinValidate = true;
	    var cardBank = true;
	    var realCardLength = null;
	    var card = getCardBinInfo(cardNo);
	    if(validate){
		    if(card != null){
			    if(card.bankCode != $("#platform-kjzf #bankCode").val()){
		    		$("#message_tips").show();
			        $("#message_tips").removeClass('color_gray').addClass('heighlight');
			        $("#message_tips").html("输入的卡号与选择的银行不一致");
			        $(this).css("border","1px solid #f85964");
			        cardBinValidate = false; 
			        cardBank = false;
		        } else if($("#platform-kjzf #cardType").val() != card.cardType){
		            $("#message_tips").show();
			        $("#message_tips").removeClass('color_gray').addClass('heighlight');
			        $("#message_tips").html("不支持此卡");
			        $(this).css("border","1px solid #f85964");
			        cardBinValidate = false; 
			        cardBank = false;
		        }
		        realCardLength = card.cardLength;
	        } else {//cardbin里没该种卡的信息
	                $("#message_tips").show();
			        $("#message_tips").removeClass('color_gray').addClass('heighlight');
			        $("#message_tips").html("银行卡校验有误"); 
			        $(this).css("border","1px solid #f85964");
	                cardBinValidate = false;  
	        }
		    if(cardBank && (cardNo.length != realCardLength) && realCardLength != null){
		            $("#message_tips").show();
			        $("#message_tips").removeClass('color_gray').addClass('heighlight');
			        $("#message_tips").html("银行卡校验有误"); 
			        $(this).css("border","1px solid #f85964");
			        cardBinValidate = false;  
		    }
		}
	    //是否绑卡
		checkByerCardNo(5,card,cardNo,validate,cardBinValidate);
	});

	/*银行签约信息查询函数，参数errorCount为*/
	function checkByerCardNo(errorCount,card,cardNo,validate,cardBinValidate){
	    var resCode = null;
		var params = {
			isAsync : false,
			reqUrl : $("#CASHIER_WEB_PATH").attr("attr_v")+"fastPaysController/initInfoQueryFacade.dhtml",
			parameters : {
				bankCode : "" + $("#platform-kjzf #bankCode").val(),
				ujm : $("#ujm").val(),
				cardType : card == null ? "010":card.cardType,
				cardNo : cardNo,
				supplierNo:$("#supplierNo").val()
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				//alert("超时"+ errorCount)
				errorCount = errorCount-1;
				checkByerCardNo(errorCount,card,cardNo,validate,cardBinValidate);
			},
			callBack : function(returnData,_this,tipPos){
			resCode = returnData.resCode;
			isBackLoading = true;//是否查询出绑卡结果
			if(returnData.resCode == "0000"){
				if(returnData.isCard == "010"){//未绑卡
				    $("#platform-kjzf #pay_checkway").hide();//立即支付
				    $("#platform-kjzf #pay_Open").find(".btn-gotopay").attr("pagemodle","yl").html("同意协议并开通");
			        $("#platform-kjzf #pay_Open").show(); //是否同意开通条款
			        $("#platform-kjzf #pay_TelCheck").hide();
			        $("#message_tips").show();
			        $("#cardID-input-yinlian").css("border","1px solid #f85964");//边框红色
			        $("#message_tips").removeClass('color_gray').addClass('heighlight');
			        $("#message_tips").html("您还未开通快捷支付，请开通后支付");
			        $("#platform-kjzf #cardType").val(returnData.cardType);
			        $("#cardSerila").val(returnData.cardSerila);
				} else if(returnData.isCard == "020"){//已绑卡
				    $("#platform-kjzf #pay_Open").hide();//是否同意开通条款
				    $("#platform-kjzf #pay_checkway").show();//立即支付
			        $("#message_tips").show();
			        $("#message_tips").removeClass('heighlight').addClass('color_gray');
			        $("#message_tips").html("该银行卡已在银联在线支付实现认证");//此银行卡已开通快捷支付
				    $("#cardSerila").val(returnData.cardSerila);//如果已绑过卡保留绑卡序号
				    $("#supplierNo").val(returnData.supplierNo);//保存供应商编码
				    if(returnData.telphone != "" && typeof(returnData.telphone) != "undefined"){//是否有手机号
						 $("#alert #currentTelAlert").html(returnData.telphone);
						 $('#alert .put_code').css("margin-top", "");
						 $('#alert .al_send').css("visibility","visible");
					} else {
						 $('#alert .put_code').css("margin-top", "20px");
						 $('#alert .al_send').css("visibility","hidden");
				    }
				}
			} else if (returnData.resCode == "FAIL0000"){
				$("#message_tips").show();
			    $("#message_tips").removeClass('color_gray').addClass('heighlight');
			    $("#message_tips").html(returnData.resDesc); 
			}
			$('.card_loading').hide();  
			},
			tipPos : "#platform-kjzf #byerCardNo"
		};
		//如果错误次数<=0，则停止触发事件
		if(errorCount<=0){
			params.error=undefined;
		}
		if(validate && cardBinValidate){
		    $("#message_tips").html("");
	    	$('.card_loading').show();
			setTimeout(function(){		    
		    	sendRequest(params);
			},500); 
		}
	}
	
	//支付回调方法
	function fastPayCallBack(){
	   $('.bank-lists li').mouseout();
	   var bankCode = arguments[0];//银行编码  例：CCB
	   var resCode = null;
	   var cardType = arguments[1];//银行类型   010 储蓄卡  020 信用卡
	   var params = {
			isAsync : false,
			reqUrl : $("#CASHIER_WEB_PATH").attr("attr_v")+"fastPaysController/initInfoQueryFacade.dhtml",
			parameters : {
				bankCode : "" + arguments[0],
			    bankName : arguments[2],
				ujm : $("#ujm").val(),
				cardType:cardType,//点银行卡或输入编码点确定时，默认银行卡类型为储蓄卡
				cardNo : ""
			},
			callBack : function(returnData,_this,tipPos){
	           resCode = returnData.resCode;
	           if(returnData.resCode == "0000"){
	           $('#bankErrorMessage').hide();//错误银行提示信息的区域
	           //隐藏输入框
	           $('.ul_psion').slideUp(300);
			   if(returnData.pageCallMode == "030"){//易宝
			           $("#platform-kjzf .fqfk-bankCardNum").hide();//隐藏银联卡号输入框	
			              $("#platform-kjzf .kjzf-afterBankName").show();
				          //解决ie兼容问题，父级隐藏子级图片没隐藏掉
				          $("#kjzf-anquanbz-id").addClass("kjzf-anquanbz");
					      $("#kjzf-choosedBank-id").addClass("kjzf-choosedBank");
					   $("#platform-kjzf #bank_message").slideDown(300,function(){
				         $("#platform-kjzf .kjzf-anquanbz").show();
				       });//显示卡号输入框
					   $("#platform-kjzf #otherBank").show();
				       $("#platform-kjzf .kjzf-choosedBank").show();
				       $("#platform-kjzf #pay_Open").find(".btn-gotopay").attr("pagemodle","yb").html("同意开通并支付");
				       $("#platform-kjzf #pay_Open").show();
				       $("#platform-kjzf #pay_checkway").hide();
				       $("#platform-kjzf #pay_TelCheck").hide();
				       $("#platform-kjzf #pykj_oth").hide();
				       $("#platform-kjzf #bankCode").val(bankCode);
				       selectBank_hide("platform-kjzf");
				       clearForm();
				       
					var respFlag=returnData.resCode;
					if(respFlag=='0000'){
						$("#platform-kjzf .kjzf-choosedBank .xianzhi").html(returnData.limitShow);
						$("#supplierNo").val(returnData.supplierNo);
						//是否实名认证
						var isValidate=returnData.isValidate;
						if(isValidate=='020' && returnData.idCard){
							$("#platform-kjzf #byerNameAuth").text(returnData.trueName);
							$("#platform-kjzf #byerNameAuth").show();
							$("#platform-kjzf #byerName").val(returnData.trueNameReal);
							$("#platform-kjzf #byerName").hide();
							$("#platform-kjzf #byerIdCardAuth").text(returnData.idCard);
							$("#platform-kjzf #byerIdCardAuth").show();
							$("#platform-kjzf #byerIdCard").val(returnData.idCardReal);
							$("#platform-kjzf #byerIdCard").hide();
						}
					}
					if(cardType == "010"){
					    $('.kjzf-choosedBank .typed').html("储蓄卡");
					}else if(cardType == "020"){
					    $('.kjzf-choosedBank .typed').html("信用卡");
					}
			   } else if (returnData.pageCallMode == "010"){//银联
				         $("#platform-kjzf .kjzf-afterBankName").show();
			             //解决ie兼容问题，父级隐藏子级图片没隐藏掉
			             $("#kjzf-anquanbz-id").addClass("kjzf-anquanbz");
				         $("#kjzf-choosedBank-id").addClass("kjzf-choosedBank");
				       $("#platform-kjzf .kjzf-choosedBank").slideDown(300);
				       $("#platform-kjzf .fqfk-bankCardNum").slideDown(300,function(){
				         $("#platform-kjzf .kjzf-anquanbz").show();
				       });//显示卡号输入框
				       $("#platform-kjzf #otherBank").show();
				       $("#platform-kjzf #pay_checkway").show();//立即支付
				       $("#platform-kjzf .pay_checkway .mr10").removeClass("btn_unable").addClass("btn-gotopay");
				       $("#platform-kjzf .pay_checkway b").hide();//隐藏“请选择银行支付”
				       $("#platform-kjzf #pay_TelCheck").hide();//短信验证码
				       $("#platform-kjzf #pykj_oth").hide();//返回我的银行卡
				       $("#platform-kjzf #bankCode").val(bankCode);
				       selectBank_hide("platform-kjzf");
				       clearForm();
				       var respFlag=returnData.resCode;
					   if(respFlag=='0000'){
							$("#platform-kjzf .kjzf-choosedBank .xianzhi").html(returnData.limitShow);
							$("#supplierNo").val(returnData.supplierNo);
					   }
					   
					   if(cardType == "010"){
					       $('.kjzf-choosedBank .typed').html("储蓄卡");
					   }else if(cardType == "020"){
					       $('.kjzf-choosedBank .typed').html("信用卡");
					   }
			   }
			   } else if(returnData.resCode == "FAIL0000"){
			      $('#bankErrorMessage').show();
			      $('#bankErrorMessage').html(returnData.resDesc);
			   }
			},
			tipPos : "#platform-kjzf #byerCardNo"
		};
		//初始化支付渠道
		sendRequest(params);
		if(resCode == "0000"){
			var bankId = arguments[0]+".png";
			//追加银行图片信息
			$("#platform-kjzf .kjzf-choosedBank img").attr("src",$("#RESOURCE_PATH").attr("attr_v")+"temp/"+bankId+"");
			selectBank_hide("platform-kjzf");
		    $("#platform-kjzf #cardType").val(cardType);		
			$("#transNo").val("");
		}	
	}
	//初始化扩展事件
	fastPay_init();
	if($("#mf-input-yinlian").val()){
		$('#mf-mrinput-yinlian').hide();
	}
	//我的银行卡
	$("#fastPay_mycards").click(function(){
	     //显示所有支付方式
		 $(".payTypeSelect").show();
	     //关闭所有的支付方式大窗口
		 platformCloseAll();
		 mycards_open();
		 $("#check-unit-mycards").trigger("click");//触发点击我的银行卡事件
	});
	
	
	
	/***
	 * 首次支付输入框中输入银行卡号，易宝、银联分流及如果是银联判断是否绑卡
	 */
	function fastPayCallBack_input(cardNo,card,errorCount){
		   var bankCode = card.bankCode;
		   var cardType = card.cardType;
		   var resCode = null;
		   var params = {
				isAsync : false,
				reqUrl : $("#CASHIER_WEB_PATH").attr("attr_v")+"fastPaysController/initInfoQueryFacade.dhtml",
				parameters : {
					bankCode : ""+bankCode,
					ujm : $("#ujm").val(),
					cardType:""+cardType,
					cardNo : ""+arguments[0]//银行卡号
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					errorCount = errorCount-1;
					fastPayCallBack_input(cardNo,card,errorCount);
				},
				callBack : function(returnData,_this,tipPos){
				   isBackLoading = true;
				   resCode = returnData.resCode;
				   if(returnData.resCode == "0000"){
				   $('#cardID-input-yinlian').css("color","#000000");//输入框代填后文本样式
				   $('#bankErrorMessage').hide();//错误银行提示信息的区域
				   //隐藏输入框
		           $('.ul_psion').hide();
				   if(returnData.pageCallMode == "030"){//易宝
			           $("#platform-kjzf .fqfk-bankCardNum").hide();//隐藏银联卡号输入框	
			              $("#platform-kjzf .kjzf-afterBankName").show();
				          //解决ie兼容问题，父级隐藏子级图片没隐藏掉
				          $("#kjzf-anquanbz-id").addClass("kjzf-anquanbz");
					      $("#kjzf-choosedBank-id").addClass("kjzf-choosedBank");
				       $("#platform-kjzf #bank_message").slideDown(300,function(){
				         $("#platform-kjzf .kjzf-anquanbz").show();
				       });//显示卡号输入框
				       $("#platform-kjzf #otherBank").show();
					   $("#platform-kjzf .kjzf-choosedBank").show();
					   $("#platform-kjzf #pay_Open").find(".btn-gotopay").attr("pagemodle","yb").html("同意开通并支付");
				       $("#platform-kjzf #pay_Open").show();
				       $("#platform-kjzf #pay_checkway").hide();
				       $("#platform-kjzf #pay_TelCheck").hide();
				       $("#platform-kjzf #bankCode").val(bankCode);
				       selectBank_hide("platform-kjzf");
				       clearForm();
				       $("#platform-kjzf #byerCardNo").val(cardNo);
				       $("#platform-kjzf #byerCardNo").trigger("blur");//校验是否已绑过
				       
					var respFlag=returnData.resCode;
					if(respFlag=='0000'){
						$("#platform-kjzf .kjzf-choosedBank .xianzhi").html(returnData.limitShow);
						$("#supplierNo").val(returnData.supplierNo);
						//是否实名认证
						var isValidate=returnData.isValidate;
						if(isValidate=='020' && returnData.idCard){
							$("#platform-kjzf #byerNameAuth").text(returnData.trueName);
							$("#platform-kjzf #byerNameAuth").show();
							$("#platform-kjzf #byerName").val(returnData.trueNameReal);
							$("#platform-kjzf #byerName").hide();
							$("#platform-kjzf #byerIdCardAuth").text(returnData.idCard);
							$("#platform-kjzf #byerIdCardAuth").show();
							$("#platform-kjzf #byerIdCard").val(returnData.idCardReal);
							$("#platform-kjzf #byerIdCard").hide();
						}
					}
			   } else if (returnData.pageCallMode == "010"){//银联
				       $("#platform-kjzf .kjzf-afterBankName").show();
			            //解决ie兼容问题，父级隐藏子级图片没隐藏掉
			            $("#kjzf-anquanbz-id").addClass("kjzf-anquanbz");
				        $("#kjzf-choosedBank-id").addClass("kjzf-choosedBank");
				       $("#platform-kjzf .kjzf-choosedBank").slideDown(300);
				       $("#platform-kjzf .fqfk-bankCardNum").slideDown(300,function(){
				         $("#platform-kjzf .kjzf-anquanbz").show();
				       });//显示卡号输入框
				       $("#platform-kjzf #otherBank").show();
				       $("#platform-kjzf #pay_checkway").show();//立即支付
				       $("#platform-kjzf .pay_checkway .mr10").removeClass("btn_unable").addClass("btn-gotopay");
				       $("#platform-kjzf .pay_checkway b").hide();
				       $("#platform-kjzf #pay_TelCheck").hide();//短信验证码
				       $("#platform-kjzf #bankCode").val(bankCode);
				       $("#cardID-input-yinlian").val(cardNo.replace(/\s/g,'').replace(/(\d{4})(?=\d)/g,"$1"+" "));//把银行卡号带到本页输入框
				       $("#cardID-input-yinlianHidden").val(cardNo.replace(/\s/g,'').replace(/(\d{4})(?=\d)/g,"$1"+" "));//为了防止显示在页面上的数据被开发者工具修改
				       $("#cardID-input-yinlian").attr("readonly",true);//卡号带到第二个页面输入框时数据不可改
				       cardNo_yinlian = cardNo;//保存一份输入的内容，下次输入相同内容不发请求
				       selectBank_hide("platform-kjzf");
				       clearForm();
					   $("#platform-kjzf .kjzf-choosedBank .xianzhi").html(returnData.limitShow);
					   $("#supplierNo").val(returnData.supplierNo);//保存供应商编码
					   if(cardType == "010"){
					       $('.kjzf-choosedBank .typed').html("储蓄卡");
					   }else if(cardType == "020"){
					       $('.kjzf-choosedBank .typed').html("信用卡");
					   }
					   //校验是否绑卡
					   if(returnData.isCard == "010"){//未绑卡
					        $("#platform-kjzf #pay_checkway").hide();//立即支付
					        $("#platform-kjzf #pay_Open").find(".btn-gotopay").attr("pagemodle","yl").html("同意协议并开通");
					        $("#platform-kjzf #pay_Open").show(); //是否同意开通条款
					        $("#platform-kjzf #pay_TelCheck").hide();
					        $("#message_tips").show();
					        $("#cardID-input-yinlian").css("border","1px solid #f85964");//边框红色
					        $("#message_tips").removeClass('color_gray').addClass('heighlight');
					        $("#platform-kjzf #cardSerila").val(returnData.cardSerila);
					        $("#message_tips").html("您还未开通快捷支付，请开通后支付");
						} else if(returnData.isCard == "020"){//已绑卡
						    $("#platform-kjzf #pay_Open").hide();
						    $("#platform-kjzf #bind_errormsg").hide();//验证码错误信息隐藏
					        $("#platform-kjzf #message_tips").show();
					        $("#platform-kjzf #message_tips").removeClass('heighlight').addClass('color_gray');
					        $("#platform-kjzf #message_tips").html("该银行卡已在银联在线支付实现认证");//此银行卡已开通快捷支付
					        $("#platform-kjzf #cardSerila").val(returnData.cardSerila);//如果已绑过卡保留绑卡序号
						    $('#alert .put_code').css("margin-top", "20px");//不显示手机
						    $('#alert .al_send').css("visibility","hidden");
						}
				   }
				   } else if (returnData.resCode == "FAIL0000"){
					      $('#bankErrorMessage').show();
					      $('#bankErrorMessage').html(returnData.resDesc);
				   }
				},
				tipPos : "#platform-kjzf #byerCardNo"
			};
		   //如果错误次数<=0，则停止触发事件
			if(errorCount<=0){
				params.error=undefined;
			}
			//初始化支付渠道
			sendRequest(params);
			if(resCode == "0000"){
			var bankId = bankCode +".png";
			//追加银行图片信息
			$("#platform-kjzf .kjzf-choosedBank img").attr("src",$("#RESOURCE_PATH").attr("attr_v")+"temp/"+bankId+"");
			selectBank_hide("platform-kjzf");
			$("#platform-kjzf #cardType").val(cardType);
			$("#transNo").val("");
			}
		}	
	
	
	//输入框键入值时触发事件
 	$("#mf-input-yinlian").bind("contextmenu",function(event){
 		return false;
 	});
 	$("#mf-input-yinlian").bind("keyup",function(event){
 		errorMessage_yinlian = null;
 		if($('.mf-ipbk > span').html() != null){
 			$('.mf-ipbk > span').html("");//输入框键入值时  框内银行信息去掉
 		}
 		
 		//开始输入时按钮置灰
 		if($(this).val() != null && $("#mf-button-yinlian").hasClass("btn-gotopay")){
 			$("#mf-button-yinlian").removeClass("btn-gotopay").addClass("btn_unable").attr("disabled",true);
 		}

 		var value = this.value.replace(/[^0-9]/g,"");	 		
	    inputValidate(value);//输入框校验，验证通过后确定按钮置为可点
 		var str = /[A-Za-z]+/;
 		if(value!=""){
 			$("#mf-mrinput-yinlian").hide();
 			//输入卡号后根据cardBin信息获取银行编码、银行名称、银行卡类型
    		var card = null;
    		card = getCardBinInfo(value);
    		if(card != null){
	    		$('.mf-ipbk > span').html(card.bankName);
    		}
 		}else{
 			$("#mf-mrinput-yinlian").show();
 		}
		this.value = value.replace(/\s/g,'').replace(/(\d{4})(?=\d)/g,"$1"+" ");
		if(this.value!= ""){
			$(this).css({opacity:"0.8"});
		}else{
			$(this).css({opacity:"0.2"});
		}
 	});
 	//鼠标失去焦点时显示错误信息
 	$("#mf-input-yinlian").bind("blur",function(event){
 		$('#bankErrorMessage').hide();//错误银行提示信息的区域
 		inputValidate($(this).val().replace(/\s+/g,""),"firstInput");//输入框校验
 		if(errorMessage_yinlian != null && errorMessage_yinlian != "" ){
 		 $('#mf-ipbk-yinlian').addClass("bder-red");
		 $('.mf-check > p').html(errorMessage_yinlian);
 	    }
 	});
 	//鼠标获取焦点时清除错误信息
 	$("#mf-input-yinlian").bind("focus",function(event){
 		$('#bankErrorMessage').hide();//错误银行提示信息的区域
 		$('#mf-ipbk-yinlian').removeClass("bder-red");
		$('.mf-check > p').html("");
 	});
 	//模糊搜索粘贴事件
 	$("#mf-input-yinlian").bind("paste",function(event){
 		//开始输入时按钮置灰
 		if($(this).val() != null && $("#mf-button-yinlian").attr("class") == "btn-gotopay"){
 			$("#mf-button-yinlian").removeClass("btn-gotopay").addClass("btn_unable");
	 		$("#mf-button-yinlian").attr("disabled",true);
 		}
 		var pastedText = undefined||"";
        if (window.clipboardData && window.clipboardData.getData) { // IE
        	pastedText = window.clipboardData.getData('Text');
        	
        } else {
        	pastedText = event.originalEvent.clipboardData.getData('Text');
        }
        if(!pastedText){
        	return false;
        }
        if(String(pastedText).length > 23){
        	alert("粘贴内容太多！");
        	return false;				
        }
        pastedText = pastedText.replace(/\s+/g,"").toUpperCase();
        var value = this.value.toUpperCase().replace(/\s+/g,""); 
 		var flag = value.charAt(0) || pastedText.charAt(0);
 		if(/^[0-9]/g.test(flag)){
 			pastedText = pastedText.replace(/[^0-9]/g,"");
 		}
 		if(value==""){
			this.value = pastedText;
 		}else{
 			this.value = (value + pastedText).substr(0,23);  
 		}
 		if(this.value){
 			$("#mf-mrinput-yinlian").hide();
 		}else{
 			$("#mf-mrinput-yinlian").show();
 		}
 		value = this.value;
		if(value!= ""){
			$(this).css({opacity:"0.8"});
			$('.mf-ipbk > span').html("");//输入框键入值时  框内银行信息去掉
	    	    //输入卡号后根据cardBin信息获取银行编码、银行名称、银行卡类型
	    		var card = getCardBinInfo(value);
	    		if(card != null){
		    		$('.mf-ipbk > span').html(card.bankName);	
	    		}
		}else{
			$(this).css({opacity:"0.2"});
		}
		this.value = this.value.replace(/\s/g,'').replace(/(\d{4})(?=\d)/g,"$1"+" ");
        return false;
 	});
 	
 	//鼠标点击“按银行选择”相当于触发了输入框blur事件，为了解决其影响做以下解绑和绑定操作
    $("#zx_bank,#qx_bank").bind('mouseover',function(){
 		$("#mf-input-yinlian").unbind("blur");
 	});
 	$("#zx_bank,#qx_bank").bind('mouseout',function(){
 		$("#mf-input-yinlian").bind("blur",function(){
 			var tmp = $(this).val().replace(/\s+/g,"");
 			inputValidate(tmp,"firstInput");//输入框校验
 			if(errorMessage_yinlian != null && errorMessage_yinlian != "" ){
 				$('#mf-ipbk-yinlian').addClass("bder-red");
 				$('.mf-check > p').html(errorMessage_yinlian);
 			}
 		});
 	});
 	
 	//点击“取消银行选择” 隐藏银行列表
 	$("#qx_bank").bind('click',function(){
 		$('#bankErrorMessage').hide();//错误银行提示信息的区域
 		$("#mf-button-yinlian").show();
 		$('.mf-check > p').html("");
        selectBank_hide("platform-kjzf");
        $("#qx_bank").hide();
        $("#zx_bank").show();
        $('#platform-kjzf .bank-lists li').addClass("mf-opcity");
  	    $("#mf-ipbk-yinlian").removeClass("mf-opcity").css("border","#a5a5a5 1px solid");
  	    if($('#mf-input-yinlian').val() == ""){
	       $("#mf-button-yinlian").removeClass().addClass("btn-gotopay").attr("disabled",false);
	    }else{
	    	$("#mf-button-yinlian").addClass("btn_unable").attr("disabled",true);
	    }
  	    $("#mf-input-yinlian").trigger("keyup").width("390px");
  	//按银行选择hover效果
	     $(this).hover(function(){
	 		$(this).css("color","#F85964");
	 		$(this).find("i").removeClass("jt_shang").addClass("jt_shanghover");
	     },function(){
	     	$(this).css("color","#006699");
	     	$(this).find("i").removeClass("jt_shanghover").addClass("jt_shang");
	     });
 	});
 	//点击“按银行选择” 显示银行列表
 	$("#zx_bank").bind('click',function(){
 		$('.mf-check > p').html("");
 		selectBank_show("platform-kjzf");
 		$("#zx_bank").hide();
 		$("#qx_bank").show();
 		$('#platform-kjzf .bank-lists li').removeClass("mf-opcity");
		$("#mf-ipbk-yinlian").addClass("mf-opcity");
 		$("#mf-button-yinlian").removeClass().addClass("btn_unable,mf-opcity").attr("disabled",true);
 		if($("#mf-input-yinlian").val()==""){
 			$("#mf-input-yinlian").width(0);
 		}
 		//按银行选择hover效果
	     $(this).hover(function(){
	 		$(this).css("color","#F85964");
	 		$(this).find("i").removeClass("jt_xia").addClass("jt_xiahover");
	     },function(){
	     	$(this).css("color","#006699");
	     	$(this).find("i").removeClass("jt_xiahover").addClass("jt_xia");
	     });
 	});
 	//按银行选择hover效果
     $("#qx_bank").hover(function(){
 		$(this).css("color","#F85964");
 		$(this).find("i").removeClass("jt_shang").addClass("jt_shanghover");
     },function(){
     	$(this).css("color","#006699");
     	$(this).find("i").removeClass("jt_shanghover").addClass("jt_shang");
     });
   //按银行选择hover效果
     $("#zx_bank").hover(function(){
 		$(this).css("color","#F85964");
 		$(this).find("i").removeClass("jt_xia").addClass("jt_xiahover");
     },function(){
     	$(this).css("color","#006699");
     	$(this).find("i").removeClass("jt_xiahover").addClass("jt_xia");
     });
 	//输入框信息div鼠标悬浮，银行卡列表有遮罩层
 	$("#mf-ipbk-yinlian").bind("mouseover",function(){
 		$("#mf-input-yinlian").focus().width("390px");
 		if((window.navigator.userAgent.toLowerCase()).indexOf("msie") > -1){//ie下取消模糊效果
 		}else{
         $('#platform-kjzf .bank-lists li').addClass("mf-opcity");
 	    } 
  	     $(this).css("border","#a5a5a5 1px solid");
	     $("#mf-button-yinlian").removeClass();
	     $("#mf-ipbk-yinlian").removeClass("mf-opcity");
	     $("#mf-button-yinlian").removeClass("mf-opcity");
	     if($('#mf-input-yinlian').val() == ""){
	    	 $("#mf-button-yinlian").addClass("btn-gotopay").attr("disabled",false);
	     }
	     else{
	    	 $("#mf-button-yinlian").addClass("btn_unable").attr("disabled",true);
	    	 $("#mf-input-yinlian").trigger("keyup")
	     }
 	});
 	//银行列表鼠标悬浮
 	$("#platform-kjzf .bank-lists ,#platform-kjzf .bank-lists li").bind("mouseover",function(){//银行卡列表鼠标悬浮
 		$("#mf-input-yinlian").unbind("blur");
 		if($("#mf-input-yinlian").val()==""){
 			$("#mf-input-yinlian").width(0);
 		}else{
 			$("#mf-input-yinlian").width("390px");
 		}
 		$('#platform-kjzf .bank-lists li').removeClass("mf-opcity");
 			$('#mf-ipbk-yinlian').addClass("mf-opcity")
		    $('#mf-ipbk-yinlian').removeClass("bder-red");//清除错误样式
 	        $("#mf-button-yinlian").removeClass().addClass("btn_unable").attr("disabled",true);// .addClass("btn_unable,mf-opcity")
 	        $("#mf-button-yinlian").addClass("mf-opcity");
 	    
 	});
 	
 	$("#platform-kjzf .bank-lists,#platform-kjzf .bank-lists li").bind("mouseout",function(){
 		$("#mf-input-yinlian").bind("blur",function(){
 			var tmp = $(this).val().replace(/\s+/g,"");
 			inputValidate(tmp,"firstInput");//输入框校验
 			if(errorMessage_yinlian != null && errorMessage_yinlian != "" ){
 				$('#mf-ipbk-yinlian').addClass("bder-red");
 				$('.mf-check > p').html(errorMessage_yinlian);
 			}
 		});
 	});
	$('#cardID-input-yinlian').bind('keyup',function(event){ 
		if(!(event.keyCode>=48 && event.keyCode<=57)){ 
			this.value=this.value.replace(/[^0-9]/g,'');
		} 
			this.value = this.value.replace(/\s/g,'').replace(/(\d{4})(?=\d)/g,"$1"+" "); 
		}).bind('dragenter',function(){
			return false; 
		}).bind('onpaste',function(){ 
			this.value=this.value.replace(/[^0-9]/g,''); 
			return !clipboardData.getData('text').match(/\d/); 
		}).bind('blur',function(){
			if (this.value == "") {
                this.value = "";
        }
	});
	
 	//银行卡号格式化
	$("#platform-kjzf #byerCardNo").bind('keyup',function(event){ 
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
   //使用其他银行选择卡按钮效果
   $("#platform-kjzf #otherBank").click(function(){
      $(this).hide();
      $('.ul_psion').show();//显示银行卡输入框
      $("#message_tips").html("");//清除错误信息
      $('#mf-ipbk-yinlian').removeClass("bder-red");//清除错误样式
      if($('#mf-input-yinlian').val() == ""){//输入框里没值按钮置灰
	      $("#mf-button-yinlian").removeClass("btn-gotopay").addClass("btn_unable");//确定按钮置为可用
	 	  $("#mf-button-yinlian").attr("disabled",true);
      }
      $("#platform-kjzf #pay_Open").hide(); //隐藏 "是否同意开通条款"按钮
      $('#ylkj-chooseBank-after').hide();//隐藏银联iframe
      $('#zx_bank').hide();
      $('#qx_bank').show();//把取消按银行选择箭头显示出来
      //清除本页输入框里的内容
      $("#cardID-input-yinlian").val("请输入银行卡号");
	  $("#cardID-input-yinlian").css({"color":"#8B8378","border":"1px solid #e0e0e0"});
      cardNo_yinlian = null;//清除被保存过得卡号
      $("#cardID-input-yinlian").attr("readonly",false);//清除设置的输入框不可用属性
      $("#platform-kjzf #cardSerila").val("");//清除保留的绑卡序号
	  $("#platform-kjzf #supplierNo").val("");//清除保存供应商编码
	  $("#platform-kjzf .pay_checkway .mr10").removeClass("btn-gotopay").addClass("btn_unable");//“立即支付”按钮置灰
	  $("#platform-kjzf .pay_checkway b").text("请选择银行支付").show();
      $('#cardID-input-yinlianHidden').val("");//清空隐藏域中卡号  
      $("#platform-kjzf #bank_message").hide();
      $("#platform-kjzf .kjzf-afterBankName").hide();
      //解决ie兼容问题，父级隐藏子级图片没隐藏掉
      $("#kjzf-anquanbz-id").removeClass("kjzf-anquanbz");
      $("#kjzf-choosedBank-id").removeClass("kjzf-choosedBank");
      $("#platform-kjzf .fqfk-bankCardNum").hide();
      $("#platform-kjzf #pay_Open").hide();
      $("#fastPay_yibao_errormsg").html("");//同意开通并支付  错误信息清除
      $("#platform-kjzf #pay_checkway").show();
      $("#platform-kjzf #pay_TelCheck").hide();
      //显示行头
      $("#platform-kjzf #pay_kjzf").show();
      $("#platform-kjzf .bank-lists").show();//显示银行列表
      $("#platform-kjzf").find("#chooseBankDiv").show();
	  });
	
 
    //首次支付输入框内容校验
    function inputValidate(value,firstInput){
	var validate = null;
    var isValidate = true;
    var result_validate = null;
     if(isValidate){//输入的是卡号
       validate = bankNoLuhmCheck_input(".mf-input","appendError_input",firstInput);//格式校验  firstInput是否为第一个输入框校验
       if(validate){
            //cardBin校验
	   	    var cardBinValidate = true;
	   	    var realCardLength = null;
	   	    	var card = getCardBinInfo(value);
	   	    	if(card != null){ //cardBin信息里有输入的卡
	   	    		var has = false;
	   	    		var pageCardType = "010";
	   	    		$("#fast_bank_code").find("span").each(function(){
	   	    			if($(this).attr("l") == 'b' ){
	   	    				pageCardType="020";
	   	    			}
	   	    			if(this.id != "" && this.id==card.bankCode&&pageCardType==card.cardType){
	   	    				realCardLength = card.cardLength;
	   	    				has = true;
	   	    			}
	   	    			pageCardType = "010";
					});
	   				if(!has){
	   					errorMessage_yinlian = "不支持此卡，请手动选择银行";
	   				} else {
	   					//校验长度
	   					if((value.length != realCardLength) && realCardLength != null){
	   						errorMessage_yinlian = "银行卡校验有误，请手动选择银行";
	   					}
	   				}
                    if(errorMessage_yinlian == null){
                    	$("#mf-button-yinlian").removeClass("btn_unable").addClass("btn-gotopay");//确定按钮置为可用
	    		 		$("#mf-button-yinlian").attr("disabled",false);
                    } else {
                    	$("#mf-button-yinlian").removeClass("btn-gotopay").addClass("btn_unable");//确定按钮置为不可用
	    		 		$("#mf-button-yinlian").attr("disabled",true);	 		
                    }
	            } else{//cardBin里没有该种卡信息
	            	errorMessage_yinlian = "银行卡校验有误，请手动选择银行";
	            }
	   	    	if("firstInput" == firstInput){//如果是鼠标失去焦点触发的该校验
	   	    		  if(errorMessage_yinlian != null && errorMessage_yinlian != "" && $("#platform-kjzf #qx_bank")[0].style.display == "none"){
	   					  $("#platform-kjzf #qx_bank").show();
	   					  $("#platform-kjzf #zx_bank").hide();
	   					  selectBank_show("platform-kjzf");
	   				      }
		   	    	}
	        }
	     }
    }
 
/**
 * 银行卡号验证,参数为(校验位置，错误信息显示所调用方法)
 */
function bankNoLuhmCheck_input(bankCardId,errorMessageFunc,firstInput){
	var bankCardNum=$(bankCardId).val();
	bankCardNum = bankCardNum.replace(/\s+/g,""); 
	if(bankCardNum == ""){
		eval(""+errorMessageFunc+"('请输入银行卡号')");
		return false;
	}
	//去除中间字符串空格
	bankCardNum=bankCardNum.replace(/[ ]/g,"");
	var num = /^\d*$/;  //全数字
	if (!num.exec(bankCardNum)) {
		if("firstInput" == firstInput){
		  eval(""+errorMessageFunc+"('银行卡校验有误，请手动选择银行')");
		  if($("#platform-kjzf #qx_bank")[0].style.display == "none"){
			  $("#platform-kjzf #qx_bank").show();
			  $("#platform-kjzf #zx_bank").hide();
			  selectBank_show("platform-kjzf");
		  }
		} else {
		  eval(""+errorMessageFunc+"('银行卡校验有误')");	
		}
		return false;
	}
	//开头6位
	var strBin="10,18,30,35,37,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,58,60,62,65,68,69,84,87,88,94,95,98,99";    
	if (strBin.indexOf(bankCardNum.substring(0, 2))== -1) {
		if("firstInput" == firstInput){
			  eval(""+errorMessageFunc+"('银行卡校验有误，请手动选择银行')");
			  if($("#platform-kjzf #qx_bank")[0].style.display == "none"){
				  $("#platform-kjzf #qx_bank").show();
				  $("#platform-kjzf #zx_bank").hide();
				  selectBank_show("platform-kjzf");
			  }
		} else {
			  eval(""+errorMessageFunc+"('银行卡校验有误')");	
		}
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
        //$("#banknoInfo").html("Luhm验证通过");
    	clearError(bankCardId);
        return true;
    }else{
    	if("firstInput" == firstInput){
		  eval(""+errorMessageFunc+"('银行卡校验有误，请手动选择银行')");
		  if($("#platform-kjzf #qx_bank")[0].style.display == "none"){
			  $("#platform-kjzf #qx_bank").show();
			  $("#platform-kjzf #zx_bank").hide();
			  selectBank_show("platform-kjzf");
		  }
		} else {
		  eval(""+errorMessageFunc+"('银行卡校验有误')");	
		}
        return false;
    }        
}
//银联快捷   点击同意协议并开通后  获取银联iframe页面
function gotopay_yinlian(){
	$("#platform-kjzf #pay_Open").hide(); //隐藏同意协议并开通按钮
	$("#platform-kjzf .fqfk-bankCardNum").hide();//隐藏输入框
	$('#message_tips').hide();//隐藏错误信息
	$('#ylkj-frame').attr("src","");
	var value =  $('#cardID-input-yinlianHidden').val().replace(/[ ]/g,"") == "" ? $('#cardID-input-yinlian').val().replace(/[ ]/g,"") : $('#cardID-input-yinlianHidden').val().replace(/[ ]/g,"");
	var url = "?bankCode=" +$("#platform-kjzf #bankCode").val() + "&ujm=" + $("#ujm").val();
     url += "&payMode=020&cardType=" + $("#platform-kjzf #cardType").val() + "&cardNo=" + value +"&supplierNo="+$("#supplierNo").val()+"&cardSerila="+$("#cardSerila").val();
     $('#ylkj-frame').attr("src",$("#CASHIER_WEB_PATH").attr("attr_v")+"quicksController/iframe.dhtml"+""+url);
     $('#ylkj-chooseBank-after').show();
     toPayTimer_yinlian($("#ujm").val(),"#ylkj-chooseBank-after");
}

//判断是否绑定银行卡历史信息
function fastPay_init(){
 	$('#ul_psion_yinlian').show();
 	$("#platform-kjzf .platform-title .pr_pay").show();
}

function fastPay_open(){
	$("#platform-kjzf").show();
}
 
//清理form数据
function clearForm(){
	  $("#platform-kjzf #byerName").val('付款银行卡的开户姓名');
	  $("#platform-kjzf #byerName").css('color','#8B8378');
	  $("#platform-kjzf #byerIdCard").val('');
	  $("#platform-kjzf #byerCardNo").val('');
	  $("#platform-kjzf #byerMobileNo").val('在此银行预留的手机号');
	  $("#platform-kjzf #byerMobileNo").css('color','#8B8378');
	  $("#platform-kjzf #byerVerfyCode").val('');
	  clearError('#platform-kjzf #byerName');
	  clearError('#platform-kjzf #byerIdCard');
	  clearError('#platform-kjzf #byerCardNo');
	  clearError('#platform-kjzf #byerMobileNo');
	  clearError('#platform-kjzf #byerVerfyCode');
	  $("#platform-kjzf #nobind_errormsg").hide();
}

function selectBank_show(superiorId){
	$("#"+superiorId).find("#chooseBankDiv").slideDown(300,function(){
		$("#platform-kjzf .bank-lists").show();
	});
}
function selectBank_hide(superiorId){
	$("#platform-kjzf .bank-lists").hide();
	$("#"+superiorId).find("#chooseBankDiv").slideUp(300);
}
function appendError_input(errorMessage){
	errorMessage_yinlian = errorMessage;
}
function appendError_input2(errorMessage){
	$("#message_tips").show();
    $("#message_tips").removeClass('color_gray').addClass('heighlight');
    $("#message_tips").html(errorMessage);
}
