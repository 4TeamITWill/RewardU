<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="myPage_main">
		<div class="myPage_top">
			<div class="subject">내 정보</div>
			<div class="myPage_top_container">
				<div class="myPage_top_1">
					<div class="info_container">
						<div class="my_key">이메일</div>	
						<div class="my_value">${memberBean.user_id }</div><br/>
					</div>
					<div class="info_container">	
						<div class="my_key">이름</div>
						<div class="my_value">${memberBean.user_name }</div><br/>
					</div>	
					<div class="info_container">
						<div class="my_key">전화번호</div>
						<div class="my_value">${memberBean.user_phone }</div><br/>
					</div>	
					<div class="info_container">
						<div class="my_key">소개글</div>
						<div class="my_value">${memberBean.user_content }</div><br/>
					</div>											
				</div>			
				<div class="myPage_top_2">
					<div class="my_profile_key">프로필 사진</div>
					<div class="my_profile_value">
						<div class="photo_container">
							<div class="overblack"></div>
<%-- 						<img src="<%=request.getContextPath() %>/+이미지업로드경로+${memberBean.user_photo}"> --%>
							<img src="./img/lena256.jpg">							
						</div>					
					</div>						
				</div>
			</div>
			<div class="btn_line">
				<!-- 링크 href 지정해주기 나중에 연결 -->
				<a class="ybtn" href="./MemberMypageAction.me">정보 수정</a>&nbsp;&nbsp;
			</div>
		</div>
		
		<div class="myPage_mid">
			<div class="subject"><a href="myPageGood.my">나의 관심사</a></div>
			<div class="myPage_mid_content">
				<c:forEach var="good" items="${goodlist }" begin="0" end="2">
					<div class="myPage_goodlist">
						<div class="goodlist_imgContainer">
							<img src="./img/cat.jpg">
							<div class="back">	
								<div class="good_subject">${good.pd_subject }</div>
								<div class="good_id">${good.user_id }</div>					
								<div class="good_price">
								(현재)<fmt:formatNumber value="${good.pd_curmoney }" type="number"/> /
								(목표)<fmt:formatNumber value="${good.pd_goalmoney }" type="number"/>
								</div>	
							</div>
						</div>
					</div>
					
				</c:forEach>
			</div>
		</div>
		<div class="myPage_bot">
			<div class="subject"><a href="myPageReward.my">투자 목록</a></div>
			<div class="myPage_bot_content">
				<div class="myPage_invelist">
					<div style="display : flex; font-size : 1.1rem; font-weight : bold; height : 40px; line-height : 40px;">
						<div style="flex : 3.3; text-align : center;">프로젝트명</div><div style="flex : 3.3; text-align : center;">모금율</div><div style="flex : 3.3; text-align : center;">진행여부</div>
					</div>
					<c:forEach var="invest" items="${invelist }" begin="0" end="2">
						<div style="display : flex; margin-top : 0.5rem; background-color : rgba(230,70,130,0.6); font-size : 1.1rem; height : 50px; line-height : 50px;">
							<div style="flex : 3.3; text-align : center;">${invest.inv_name }</div>
							<div style="flex : 3.3; text-align : center;">${invest.inv_percent }%</div>
							<!-- 진행여부값은 숫자로 가져올거기 때문에 여기서 걸러주기 -->
							<c:if test="${invest.pd_result == 2 }">
								<div style="flex : 3.3; text-align : center;">진행중</div>
							</c:if>
							<c:if test="${invest.pd_result == 0 }">
								<div style="flex : 3.3; text-align : center;">완료</div>
							</c:if>
						</div>					
					</c:forEach>
				</div>	
			</div>
		</div>
	</div>	
	
	
<script>



</script>	
</body>
</html>