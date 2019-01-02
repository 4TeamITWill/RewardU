<%@page import="java.text.SimpleDateFormat"%>
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

	<div id="myRewardList_main">	
		<div class="myRewardList_content">
			<div class="reward_subject">투자현황</div>
			
			<c:forEach var="invest" items="${invelist }">
				<div class="myRewardList_content_">
				
					<div style="width : 100%; display : grid; grid-template-columns : 140px 1fr; 
									border : 1px solid rgba(150,150,150,0.5); height : 100px;align-items : center; padding-left : 0.7rem;">
						<div class="reward_img_container">
							<img src="img/cat.jpg">
						</div>
						
						<div class="reward_content_container">						
							<c:if test="${invest.pd_result == 1 }">
								<div><font style="color : #e61d00; font-weight : 550">진행 중</font></div>
							</c:if>	
							<c:if test="${invest.pd_result == 0 }">
								<div><font style="color : #ff0000;font-weight : 550">완료</font></div>
							</c:if>	
							
							<div style="margin-bottom : 8px;">
								<font style="font-size : 1.3rem; font-weight : bold">${invest.pd_subject }</font>
							</div>
							
							<div style="font-size : 0.9rem;">
								<font style="color : #34f;">${invest.inv_percent }%</font>
								<font style="color : rgba(150,150,150,0.5);">|</font>
								<font>${invest.inv_datef } 펀딩참여일</font>
							</div>
						</div>							
					</div>
					
					<div class="reward_desc_container">
						<div class="reward_desc">
							<div>선택한 리워드</div><div>${invest.inv_name }</div>
						</div>
						<div class="reward_desc">
							<div>리워드 옵션</div><div>선택한 옵션 들어가야되는데 컬럼이 없네?</div>
						</div>
						<div class="reward_desc">
							<div>구매 가격 / 수량</div><div>${invest.inv_price}원 / ${invest.inv_qty }개</div>
						</div>
						<div class="reward_desc">
							<div>받는분 / 연락처</div><div>${invest.inv_username } / ${invest.inv_phone }</div>
						</div>
						<div class="reward_desc">
							<div>배송지</div><div>${invest.inv_addr}</div>
						</div>
						<div class="reward_desc">
							<div>결제수단</div><div>응 없어~</div>
						</div>
						<div class="reward_desc">
							<div>총 결제 금액</div><div>총결제금액? 배송비????</div>
						</div>						
					</div>				
				</div>	
			</c:forEach>	
				
			<c:if test="${count <= 0 }">
				<div>리워드한 게시글이 없습니다.</div>
			</c:if>
			<!-- 페이징 부분 -->
				<div class="my_board_page">
					<c:if test="${startPage > pageBlock }">
						<a href="myPageReward.my?currentPage1=${startPage-pageBlock }">이전</a>
					</c:if>				
					<c:forEach var="i" begin="${startPage }" end="${endPage }">					
					<c:if test="${currentPage == i }">
						<a href="myPageReward.my?currentPage1=${i}" style="display:block; width:30px; background-color : #ccc; color : #000;">${i }</a>
					</c:if>
					<c:if test="${currentPage != i }">
						<a href="myPageReward.my?currentPage1=${i}">${i }</a>
					</c:if>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						<a href="myPageReward.my?currentPage1=${startPage+5 }">다음</a>
					</c:if>
				</div>		
			</div>	
		
	</div>	
</body>
</html>