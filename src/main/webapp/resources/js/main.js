/*price range*/

 $('#sl2').slider();

	var RGBChange = function() {
	  $('#RGB').css('background', 'rgb('+r.getValue()+','+g.getValue()+','+b.getValue()+')')
	};	
		
/*scroll to top*/

$(document).ready(function(){
	$(function () {
		$.scrollUp({
	        scrollName: 'scrollUp', // Element ID
	        scrollDistance: 300, // Distance from top/bottom before showing element (px)
	        scrollFrom: 'top', // 'top' or 'bottom'
	        scrollSpeed: 300, // Speed back to top (ms)
	        easingType: 'linear', // Scroll to top easing (see http://easings.net/)
	        animation: 'fade', // Fade, slide, none
	        animationSpeed: 200, // Animation in speed (ms)
	        scrollTrigger: false, // Set a custom triggering element. Can be an HTML string or jQuery object
					//scrollTarget: false, // Set a custom target element for scrolling to the top
	        scrollText: '<i class="fa fa-angle-up"></i>', // Text for element, can contain HTML
	        scrollTitle: false, // Set a custom <a> title if required.
	        scrollImg: false, // Set true to use image
	        activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
	        zIndex: 2147483647 // Z-Index for the overlay
		});
	});
	
});


function btnclick_home(e) {

	BootstrapDialog.show({
		title : function(){
			var $message = $("<h4>"+ e.title+ "</h4>");
            return $message;
		},
		message :function(){
			var $message = $("<div align='center'> <img  src='"+ e.photo+ "'/><br></div>");
            var pageToLoad ="설명 : "+ e.content+"<br>";
            var kkk = "주재료 : " + e.meterial;
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
				$form.append('<input type="hidden" value="' + e.srl
						+ '" name="select">');
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
						select : e.srl
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
function btnclick_shop(e) {
	BootstrapDialog.show({
		title : function(){
			var $message = $("<h4>"+ e.title+ "</h4>");
            return $message;
		},
		message :function(){
			var $message = $("<div align='center'> <img  src='"+ e.photo+ "'/><br></div>");
            var pageToLoad ="설명 : "+ e.content+"<br>";
            var kkk = "주재료 : " + e.meterial;
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
				$form.attr('action', '/cream/customer/insertcart_shop');
				$form.attr('method', 'get');
				$form.appendTo('body');
				$form.append('<input type="hidden" value="' + e.srl
						+ '" name="select">');
				$form.append('<input type="hidden" value="shop" name="site">');
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
						select : e.srl
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


function btn_not_login_click(){
	swal({
		title: "구매하고 싶으십니까?",
		text: "그럼 로그인을 하셔야지",
		type: "warning",
		showCancelButton: true,
		confirmButtonColor: "#DD6B55",
		confirmButtonText: "로그인 하기",
		cancelButtonText: "로그인 안함",
		closeOnConfirm: false,
		closeOnCancel: false
	}, function (isConfirm) {
		if(isConfirm){
			swal({
				title : "로그인 페이지로 이동합니다",
				showConfirmButton: false
			});
			var $form = $('<form></form>');
			$form.attr('action', '/cream/customer/login');
			$form.attr('method', 'get');
			$form.appendTo('body');
			$form.submit();
		} else {
			swal("그래 그럼","로그인 안하면 구경밖에 못해","error")
		}
	});
}


function cartdeletebtn(e) {
	location.href = "alterCart?itemSrl=" + e;
}


