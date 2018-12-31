<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--  <link href="css/reset.css" rel="stylesheet">-->
<link href="css/main3.css" rel="stylesheet">
<link href="css/message.css" rel="stylesheet"/>
<link href="css/etc.css" rel="stylesheet"/>
<link href="css/notice.css" rel="stylesheet"/>
<link href="css/fontello-embedded.css" rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/main.js"></script>
<script src="js/carousel.js"></script>
<title>리듀 RewardU | 메인화면</title>
</head>
<body>

<!-- 변수 center에 받아온 값이 있으면 변수에 저장하고 null이면 기본(main.js00p)값 넣어줌-->
<c:set var="center" value="${param.center }"/>
<c:if test="${center == null }">
	<c:set var="center" value="main.jsp"/>
</c:if>
 
<jsp:include page="top.jsp"/>

<jsp:include page="${center }"/>

		<!-- Modal 부분 -->
		<div class="modal_back" id="modal_back">
			<div class="modal_back_1200" style="width : 1200px; display : flex; margin : 0 auto;">
			<div style="flex : 1; height : 0;" ></div>
			<div style="flex : 1; height : 0;"></div>
			<div style="flex : 1; height : 0;">
				<div class="modal" id="modal">
					<div class="modal_img_container"  onclick="location.href='myIndex.my'">
						<div class="modal_img"></div>
						<div style="color : #fff; position : absolute; left : 41%; top : 50%; transform : translateY(-50%);">
							${sessionScope.id }
						</div>										
					</div>
					<div class="modal_content"><a href="myPageReward.my">투자 현황</a></div>
					<div class="modal_content"><a href="myPageGood.my">나의 관심사</a></div>
					<div class="modal_content"><a href="myPageGood.my">개설 프로젝트</a></div>
					<div class="modal_content"><a href="MemberMypageAction.me">개인정보 설정</a></div>
					<div class="modal_content"><a href="MemberLogout.me">로그아웃</a></div>
				</div>	
			</div>
			</div>	
		</div>	

<jsp:include page="footer.jsp"/>

<jsp:include page="quick_menu.jsp"/>

<script>
	//모달 창 부분 자바스크립트 제이쿼리
	$("#goMypage").click(function(){	
		$(".modal_back").css("display","block");
		$(".modal").animate({"top" : "65px"},150);	
	});
	
	var modal_back = document.getElementById("modal_back");
	var modal = document.getElementById("modal");
	
	//모달 창 닫기 배경부분 클릭시 닫기
	window.onclick = function(e){
		if(e.target == modal_back){
			modal_back.style.display = "";
			modal.style.top ="";
		}
	}
	
</script>	
</body>
</html>