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
<link href="css/aboutReward.css" rel="stylesheet"/>
<link href="css/fontello-embedded.css" rel="stylesheet" />
<link href="css/pay.css" rel="stylesheet" />
<link href="css/content.css" rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/main.js"></script>
<script src="js/resultCheck.js"></script>
<script src="js/carousel.js"></script>
<script src="js/pay.js"></script>
<script src="js/star.js"></script>
<title>리듀 RewardU | 메인화면</title>

</head>
<body>
<!-- 변수 center에 받아온 값이 있으면 변수에 저장하고 null이면 기본(main.js00p)값 넣어줌-->
<c:set var="center" value="${param.center }"/>
<c:if test="${center == null }">
	<c:set var="center" value="main.jsp"/>
</c:if>
 
<jsp:include page="top.jsp"/>
<a href="sellernews.my">sdfsdf</a>
<jsp:include page="${center }"/>

		<!-- Modal 부분 -->
		
			<div class="modal_back_1200" style="width : 1200px; display : flex; margin : 0 auto;">
			<div style="flex : 1; height : 0;" ></div>
			<div style="flex : 1; height : 0;"></div>
			<div style="flex : 1; height : 0;">
				<div class="modal_my" id="modal_my">
					<div class="modal_img_container"  onclick="location.href='myIndex.my'">
						<div class="modal_img">
					<!-- 프로필 사진 설정이 안되어 있을 때(null)는 기본사진 출력 -->	
						<c:set var="photo" value="${sessionScope.user_photo }"></c:set>	
							<c:choose>
								<c:when test="${empty photo }">
									<img src="./img/usernull.png">
								</c:when>
								<c:when test="${photo ne null }">
									<img src="./upload/${sessionScope.user_photo }">
								</c:when>
							</c:choose>
						</div>
						<div style="color : #aaa; position : absolute; left : 42%; top : 50%; 
										transform : translateY(-50%); font-size : 14px;">
							${sessionScope.name }<br/>
							${sessionScope.id }
						</div>										
					</div>
					<div class="modal_content_my" style="padding-top :5px;"><a href="myPageReward.my">투자 현황</a></div>
					<div class="modal_content_my"><a href="myPageGood.my">나의 관심사</a></div>
					<div class="modal_content_my"><a href="mySellPro.my">개설 프로젝트</a></div>
					<div class="modal_content_my"><a href="MemberMypageAction.me">개인정보 설정</a></div>
					<div class="modal_content_my"><a href="MemberLogout.me">로그아웃</a></div>
				</div>	
			</div>
			</div>	
		

<jsp:include page="footer.jsp"/>

<jsp:include page="quick_menu.jsp"/>

<script>

	//모달 창 부분 자바스크립트 제이쿼리
	$("#goMypage").click(function(){			
		$(".modal_my").css("display", "block");
		$(".modal_my").animate({"top" : "80px"},150);	
	});
	
	var modal = document.getElementById("modal_my");
	//모달 창 닫기 배경부분 클릭시 닫기
	$("body").click(function(e){		
		if(e.target.id != "goMypage" && e.target != modal){
			modal.style.display = "none";
			modal.style.top = "55px";
		}
	});
			
</script>	
</body>
</html>