<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
	.int_box {
		width : 100%; height : 100vh; position : relative;}
	.but_box {
		width : 25px; height : 150px; position : fixed; top : 50%; transform : translateY(-50%); left : 30px; background-color : #fff;
		border-radius : 20px; display : flex; flex-direction : column; justify-content : center; align-items : center;
		}			
	.but {
		width : 13px; height : 13px; background-color : black; margin : 5px 0; border-radius : 50%;}	
		
	#intro_main {
		width : 100%;}
	
	.int_box img{
		width : 100%; height : 100%;
		padding: 30px 0;
	}		

</style>
<script>

$(function(){
	//이 페이지내에선 탑메뉴와 모달창 다 fixed로 탑에 고정시켜준다.
	$("#top").css({"position":"fixed", "top":"0", "z-index":"500", "width" : "100%"});
	$(".slidedown_menu").css({"position":"fixed","top":"83px","z-index":"500","width":"100%"});
	$(".hr").css({"position":"fixed","top":"78px","z-index":"500","width":"100%"})	;
	$(".modal_my").css("position","fixed");
	$("html").css("overflow","hidden");
	
	//페이지 로딩시 제일 위로 초기화
	Move(0);
	
	//휠 이벤트 시 스크롤 이동하게
	$(".int_box").each(function(){
		//개별적으로 Wheel 이벤트 적용
		$(this).on("mousewheel DOMMouseScroll", function(e){			
		
			var event11 = false;
			
			e.preventDefault();
			var delta = 0;
			if(!event) event=window.event;
			if(event.wheelDelta){
				delta = event.wheelDelta / 120;
				if(window.opera) delta = -delta;
			}else if(event.detail) delta = -event.detail / 3;
			
			var moveTop = null;
	
			//마우스 휠을 위에서 아래로
			if(delta<0 && event11 == false){				
				event11 = true;
				if($(this).next() != undefined){					
					moveTop = $(this).next().offset().top;		
									
				}
				
			//마우스 휠을 아래에서 위로
			}else if(delta > 0 && event11 == false){
				event11 = true;
				if($(this).prev() != undefined){					
					moveTop = $(this).prev().offset().top;						
				}
				
			}
			//애니메이트(이동) 중에는 스크롤 안먹음
			if($("html,body").is(":animated")){
				return;
			}
			
			//화면 이동 0.8초(800)
			$("html,body").stop().animate({				
				scrollTop : moveTop + "px"
			},{duration : 800, complete : function(){event11 = false;}
				
			});
						
			//스크롤 이동시 탭에 점 크기 변동주기
			var height = $(".int_box").height();
			var now = moveTop/height;
			
			$(".but").eq(now).css("transform","scale(1.2)");
			$(".but").not(":eq("+now+")").css("transform","");
					
		});	
	});
});	

	//버튼 클릭시 스크롤 이동 후 버튼크기 변화
	function Move(eq){
		var boxtop = $(".int_box").eq(eq).offset().top;
		
		$("html,body").animate({scrollTop : boxtop + "px"},800);
		
		$(".but").eq(eq).css("transform", "scale(1.2)");
		$(".but").not(":eq("+eq+")").css("transform","");		
	}
	
	

</script>

</head>
<body>
	<div id ="intro_main">
		<div class="box_box" style="height : 100%;">
			<!-- div 한개당 페이지 한개 안에 내용 넣기 -->
			<div style="height:0;"></div>
			<div class="introBoxStyle">
				<div id="intro01" class="int_box" ><img src="intropng/intro01.png"></div>
				<div id="intro02" class="int_box" ><img src="intropng/intro02.png"></div>
				<div id="intro03" class="int_box" ><img src="intropng/intro03.png"></div>
				<div id="intro04" class="int_box" ><img src="intropng/intro04.png"></div>
				<div id="intro05" class="int_box" ><img src="intropng/intro05.png"></div>
			</div>
			<div style="height:0;"></div>
		</div>
		<!-- 왼쪽 버튼 박스 -->
		<div class="but_box">
			<div class="but" onclick="Move(0);"></div>
			<div class="but" onclick="Move(1);"></div>
			<div class="but" onclick="Move(2);"></div>
			<div class="but" onclick="Move(3);"></div>
			<div class="but" onclick="Move(4);"></div>
		</div>
	
	</div>
		
</body>
</html>