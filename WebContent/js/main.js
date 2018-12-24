$(document).ready(function(){
	
	//메뉴 클릭시 메뉴창 떳다 사라지는
	$(".top_menu").click(function(){		
		$(".slidedown_menu").slideToggle();
	});
	
	
	/*퀵 메뉴*/
	//요약 :기본 문서 상단에서 퀵 메뉴가 이동한 거릿값을 구한다.
	var defaultTop=parseInt($("#quick_menu").css("top"));
	//브라우저(window)에 스크롤바가 이동 될때마다
	$(window).on("scroll",function(){
		//스크롤바가 이동될때 마다 스크롤바의 이동 높잇값을 반환하여 scv변수에 저장 
		var scv=$(window).scrollTop();
		 
		$("#quick_menu").stop().animate({top:scv+defaultTop+"px"},700); //서서히 움직여서 화면을 따라오는 애니메이션
		//$("#quick_menu").css("top", scv+defaultTop+"px"); //화면 위치에 고정
	});
	
	//메시지 모양 버튼을 클릭하면 메시지 입력할 수 있는 창이 나타남
	$(".quick_img").click(function() {
		$(".quick_msg").slideToggle();
		$(".quick_img").slideToggle();
	});
	//'x'모양 버튼을 클릭하면 메시지 입력창이 사라지고 다시 메시지 모양 버튼생김
	$(".quit_btn").click(function() {
		$(".quick_msg").slideToggle();
		$(".quick_img").slideToggle();
	});
	
});//$(document).ready 끝


