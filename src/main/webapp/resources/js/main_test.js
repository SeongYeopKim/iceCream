
function btnclick_home1() {
	BootstrapDialog.show({
		title : function(){
			var $message = $("<h4>핑크&미</h4>");
            return $message;
		},
		message :function(){
			var $message = $("<div align='center'> <img  src='/cream/resources/images/icecream/5.png'/><br></div>");
            var pageToLoad ="설명 :깜찍한 핑크&미니가 달콤 상큼 아이스크림 속으로 쏘옥<br>";
            var kkk = "주재료 : 딸기";
            console.log(pageToLoad);
            $message.append(pageToLoad);
            $message.append(kkk);
    
            return $message;
		},
		onshow : function(dialog) {
		},
		buttons : [ {
			label : '장바구니로 이동',
			hotkey : 65, // Keycode of keyup event of key 'A' is 65.
			action : function() {

				var $form = $('<form></form>');
				$form.attr('action', '/cream/customer/insertcart_home');
				$form.attr('method', 'get');
				$form.appendTo('body');
				$form.append('<input type="hidden" value="5" name="select">');
				$form.append('<input type="hidden" value="home" name="site">');
				$form.submit();
			
			}
		}, {
			label : '더 고르기',
			hotkey : 66,
			action : function(dialogItself) {
				$.ajax({
					type : "post",
					url : "/cream/customer/insertcart_noreturn",
					data : {
						select : "5"
					}
				});
				  dialogItself.close()
				alert('상품을 장바구니에 담았습니다!');
			}
		}, {
			label : '취소',
			hotkey : 67,
			action: function(dialogItself){
                dialogItself.close();
            }
		} ]
		
	});
}

function btnclick_home2() {
	BootstrapDialog.show({
		title : function(){
			var $message = $("<h4>초콜</h4>");
            return $message;
		},
		message :function(){
			var $message = $("<div align='center'> <img  src='/cream/resources/images/icecream/33.png'/><br></div>");
            var pageToLoad ="설명 :진하고 부드러운 정통 초콜릿 아이스크림<br>";
            var kkk = "주재료 : 초콜릿";
            console.log(pageToLoad);
            $message.append(pageToLoad);
            $message.append(kkk);
    
            return $message;
		},
		onshow : function(dialog) {
		},
		buttons : [ {
			label : '장바구니로 이동',
			hotkey : 65, // Keycode of keyup event of key 'A' is 65.
			action : function() {

				var $form = $('<form></form>');
				$form.attr('action', '/cream/customer/insertcart_home');
				$form.attr('method', 'get');
				$form.appendTo('body');
				$form.append('<input type="hidden" value="33" name="select">');
				$form.append('<input type="hidden" value="home" name="site">');
				$form.submit();
			
			}
		}, {
			label : '더 고르기',
			hotkey : 66,
			action : function(dialogItself) {
				$.ajax({
					type : "post",
					url : "/cream/customer/insertcart_noreturn",
					data : {
						select : "33"
					}
				});
				  dialogItself.close()
				alert('상품을 장바구니에 담았습니다!');
			}
		}, {
			label : '취소',
			hotkey : 67,
			action: function(dialogItself){
                dialogItself.close();
            }
		} ]
		
	});
}




function btnclick_home3() {
	BootstrapDialog.show({
		title : function(){
			var $message = $("<h4>베리베리 스트로베리</h4>");
            return $message;
		},
		message :function(){
			var $message = $("<div align='center'> <img  src='/cream/resources/images/icecream/32.png'/><br></div>");
            var pageToLoad ="설명 :새콤상큼 딸기 과육이 듬뿍!<br>";
            var kkk = "주재료 : 딸기";
            console.log(pageToLoad);
            $message.append(pageToLoad);
            $message.append(kkk);
    
            return $message;
		},
		onshow : function(dialog) {
		},
		buttons : [ {
			label : '장바구니로 이동',
			hotkey : 65, // Keycode of keyup event of key 'A' is 65.
			action : function() {

				var $form = $('<form></form>');
				$form.attr('action', '/cream/customer/insertcart_home');
				$form.attr('method', 'get');
				$form.appendTo('body');
				$form.append('<input type="hidden" value="32" name="select">');
				$form.append('<input type="hidden" value="home" name="site">');
				$form.submit();
			
			}
		}, {
			label : '더 고르기',
			hotkey : 66,
			action : function(dialogItself) {
				$.ajax({
					type : "post",
					url : "/cream/customer/insertcart_noreturn",
					data : {
						select : "32"
					}
				});
				  dialogItself.close()
				alert('상품을 장바구니에 담았습니다!');
			}
		}, {
			label : '취소',
			hotkey : 67,
			action: function(dialogItself){
                dialogItself.close();
            }
		} ]
		
	});
}



function btnclick_home4() {
	BootstrapDialog.show({
		title : function(){
			var $message = $("<h4>월넛</h4>");
            return $message;
		},
		message :function(){
			var $message = $("<div align='center'> <img  src='/cream/resources/images/icecream/31.png'/><br></div>");
            var pageToLoad ="설명 :고소하고 향긋한 호두 아이스크림에 호두가 듬뿍 들어있는 제품<br>";
            var kkk = "주재료 : 넛트";
            console.log(pageToLoad);
            $message.append(pageToLoad);
            $message.append(kkk);
    
            return $message;
		},
		onshow : function(dialog) {
		},
		buttons : [ {
			label : '장바구니로 이동',
			hotkey : 65, // Keycode of keyup event of key 'A' is 65.
			action : function() {

				var $form = $('<form></form>');
				$form.attr('action', '/cream/customer/insertcart_home');
				$form.attr('method', 'get');
				$form.appendTo('body');
				$form.append('<input type="hidden" value="31" name="select">');
				$form.append('<input type="hidden" value="home" name="site">');
				$form.submit();
			
			}
		}, {
			label : '더 고르기',
			hotkey : 66,
			action : function(dialogItself) {
				$.ajax({
					type : "post",
					url : "/cream/customer/insertcart_noreturn",
					data : {
						select : "31"
					}
				});
				  dialogItself.close()
				alert('상품을 장바구니에 담았습니다!');
			}
		}, {
			label : '취소',
			hotkey : 67,
			action: function(dialogItself){
                dialogItself.close();
            }
		} ]
		
	});
}

function btnclick_home5() {
	BootstrapDialog.show({
		title : function(){
			var $message = $("<h4>초콜릿무스</h4>");
            return $message;
		},
		message :function(){
			var $message = $("<div align='center'> <img  src='/cream/resources/images/icecream/19.png'/><br></div>");
            var pageToLoad ="설명 :초콜릿 칩이 들어있는 진한 초콜릿 아이스크림<br>";
            var kkk = "주재료 : 초콜릿";
            console.log(pageToLoad);
            $message.append(pageToLoad);
            $message.append(kkk);
    
            return $message;
		},
		onshow : function(dialog) {
		},
		buttons : [ {
			label : '장바구니로 이동',
			hotkey : 65, // Keycode of keyup event of key 'A' is 65.
			action : function() {

				var $form = $('<form></form>');
				$form.attr('action', '/cream/customer/insertcart_home');
				$form.attr('method', 'get');
				$form.appendTo('body');
				$form.append('<input type="hidden" value="19" name="select">');
				$form.append('<input type="hidden" value="home" name="site">');
				$form.submit();
			
			}
		}, {
			label : '더 고르기',
			hotkey : 66,
			action : function(dialogItself) {
				$.ajax({
					type : "post",
					url : "/cream/customer/insertcart_noreturn",
					data : {
						select : "19"
					}
				});
				  dialogItself.close()
				alert('상품을 장바구니에 담았습니다!');
			}
		}, {
			label : '취소',
			hotkey : 67,
			action: function(dialogItself){
                dialogItself.close();
            }
		} ]
		
	});
}
function btnclick_home6() {
	BootstrapDialog.show({
		title : function(){
			var $message = $("<h4>엄마는 외계인</h4>");
            return $message;
		},
		message :function(){
			var $message = $("<div align='center'> <img  src='/cream/resources/images/icecream/7.png'/><br></div>");
            var pageToLoad ="설명 :밀크, 다크, 화이트 세가지 맛 초콜릿에 달콤 바삭 초코볼<br>";
            var kkk = "주재료 : 초콜릿";
            console.log(pageToLoad);
            $message.append(pageToLoad);
            $message.append(kkk);
    
            return $message;
		},
		onshow : function(dialog) {
		},
		buttons : [ {
			label : '장바구니로 이동',
			hotkey : 65, // Keycode of keyup event of key 'A' is 65.
			action : function() {

				var $form = $('<form></form>');
				$form.attr('action', '/cream/customer/insertcart_home');
				$form.attr('method', 'get');
				$form.appendTo('body');
				$form.append('<input type="hidden" value="7" name="select">');
				$form.append('<input type="hidden" value="home" name="site">');
				$form.submit();
			
			}
		}, {
			label : '더 고르기',
			hotkey : 66,
			action : function(dialogItself) {
				$.ajax({
					type : "post",
					url : "/cream/customer/insertcart_noreturn",
					data : {
						select : "7"
					}
				});
				  dialogItself.close()
				alert('상품을 장바구니에 담았습니다!');
			}
		}, {
			label : '취소',
			hotkey : 67,
			action: function(dialogItself){
                dialogItself.close();
            }
		} ]
		
	});
}
function btnclick_home7() {
	BootstrapDialog.show({
		title : function(){
			var $message = $("<h4>자모카 아몬드 훠지</h4>");
            return $message;
		},
		message :function(){
			var $message = $("<div align='center'> <img  src='/cream/resources/images/icecream/28.png'/><br></div>");
            var pageToLoad ="설명 :깊고 풍부한 자모카 아이스크림에 고소한 아몬드와 초콜릿 훠지 시럽이 들어가 있는 제품<br>";
            var kkk = "주재료 : 아몬드";
            console.log(pageToLoad);
            $message.append(pageToLoad);
            $message.append(kkk);
    
            return $message;
		},
		onshow : function(dialog) {
		},
		buttons : [ {
			label : '장바구니로 이동',
			hotkey : 65, // Keycode of keyup event of key 'A' is 65.
			action : function() {

				var $form = $('<form></form>');
				$form.attr('action', '/cream/customer/insertcart_home');
				$form.attr('method', 'get');
				$form.appendTo('body');
				$form.append('<input type="hidden" value="28" name="select">');
				$form.append('<input type="hidden" value="home" name="site">');
				$form.submit();
			
			}
		}, {
			label : '더 고르기',
			hotkey : 66,
			action : function(dialogItself) {
				$.ajax({
					type : "post",
					url : "/cream/customer/insertcart_noreturn",
					data : {
						select : "28"
					}
				});
				  dialogItself.close()
				alert('상품을 장바구니에 담았습니다!');
			}
		}, {
			label : '취소',
			hotkey : 67,
			action: function(dialogItself){
                dialogItself.close();
            }
		} ]
		
	});
}
function btnclick_home8() {
	BootstrapDialog.show({
		title : function(){
			var $message = $("<h4>쿠키 앤 크림</h4>");
            return $message;
		},
		message :function(){
			var $message = $("<div align='center'> <img  src='/cream/resources/images/icecream/17.png'/><br></div>");
            var pageToLoad ="설명 :바닐라향 아이스크림에 바삭한 초콜릿 쿠키가 듬뿍 들어있는 제품<br>";
            var kkk = "주재료 : 쿠키";
            console.log(pageToLoad);
            $message.append(pageToLoad);
            $message.append(kkk);
    
            return $message;
		},
		onshow : function(dialog) {
		},
		buttons : [ {
			label : '장바구니로 이동',
			hotkey : 65, // Keycode of keyup event of key 'A' is 65.
			action : function() {

				var $form = $('<form></form>');
				$form.attr('action', '/cream/customer/insertcart_home');
				$form.attr('method', 'get');
				$form.appendTo('body');
				$form.append('<input type="hidden" value="17" name="select">');
				$form.append('<input type="hidden" value="home" name="site">');
				$form.submit();
			
			}
		}, {
			label : '더 고르기',
			hotkey : 66,
			action : function(dialogItself) {
				$.ajax({
					type : "post",
					url : "/cream/customer/insertcart_noreturn",
					data : {
						select : "17"
					}
				});
				  dialogItself.close()
				alert('상품을 장바구니에 담았습니다!');
			}
		}, {
			label : '취소',
			hotkey : 67,
			action: function(dialogItself){
                dialogItself.close();
            }
		} ]
		
	});
}



