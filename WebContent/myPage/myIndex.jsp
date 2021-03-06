<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id = "myindex_main">
		<div id="myindex_top">
			<div class="myindex_subject">마이 페이지</div>
			<div class="myindex_tab">
				<a href="myPageReward.my" class="link link1" id="link1">투자현황</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="myPageGood.my" class="link link2">나의 관심사</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="mySellPro.my" class="link link3">개설프로젝트</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="MemberMypageAction.me" class="link link4">개인정보 설정</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</div>	
		</div>
	
		
		<c:set var="myPage_center" value="${myPage_center }"/>
		
		<div id="myIndex_bottom">
			<jsp:include page="${myPage_center }"></jsp:include>
		</div>
	</div>
	

<%
	//처음 페이지값이 null이면 투자현황페이지를 클릭한상태로 실행
	if(request.getAttribute("myPage_center") == null){
%>		
		<script>
			document.getElementById("link1").click();
			//$(".link1").trigger("click");
		</script>
<%		
	}
%>


<%
	//myPage_center 값으로 어디서 온 응답인지 판별 후 탭에 밑줄 그어주기 
	if(request.getAttribute("myPage_center") == "myRewardList.jsp"){
%>
		<script>
			$(".link1").css("border-bottom","4px solid #b44af7");
		</script>
<%			
	}else if(request.getAttribute("myPage_center") == "myGoodList.jsp"){
%>
		<script>
			$(".link2").css("border-bottom", "4px solid #b44af7")
		</script>
<%		
	}else if(request.getAttribute("myPage_center") == "mySellIndex.jsp"){
%>
		<script>
			$(".link3").css("border-bottom", "4px solid #b44af7");
		</script>
<%
	}else if(request.getAttribute("myPage_center") == "../member/mypage.jsp"){
%>
		<script>
			$(".link4").css("border-bottom", "4px solid #b44af7");
		</script>
<%		
	}
%>	



</body>
</html>