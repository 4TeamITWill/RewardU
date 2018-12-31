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
			
			<div class="myRewardList_content_">
				<div style="width : 100%; display : grid; grid-template-columns : 140px 1fr; border : 1px solid; height : 140px;
									align-items : center; padding-left : 1rem;">
					<div class="reward_img_container">
						<img src="img/cat.jpg">
					</div>
					<div class="reward_content_container">
						
					</div>
					
					
					
				</div>
					<c:forEach var="invest" items="${invelist }">
					<div class="reward_content">
						<div class="reward_content_1" onclick ="location.href='./myPageReward.my'">
							<div class="reward_imgcontainer">
								<img src="./img/cat.jpg">
							</div>
							<div class="reward_contentcontainer">
								<div>${invest.pd_subject }</div>
								<div>${invest.pd_content }</div>
							</div>	
						</div>
						<div class="reward_content_2">${invest.inv_price }</div>
						<div class="reward_content_3">${invest.inv_percent }%</div>
						<div class="reward_content_4">
							<input type="button" value="취소" class=""/>
						</div>
					</div>				
				</c:forEach>									
			</div>
			<c:if test="${count <= 0 }">
				<div>리워드한 게시글이 없습니다.</div>
			</c:if>
			<!-- 페이징 부분 -->
				<div class="myGood_board_page">
					<c:if test="${startPage > pageBlock }">
						<a href="myPageReward.my?currentPage1=${startPage-pageBlock }">이전</a>
					</c:if>				
					<c:forEach var="i" begin="${startPage }" end="${endPage }">					
					<c:if test="${currentPage == i }">
						<a href="myPageReward.my?currentPage1=${i}" style="display:block; width:30px; height : 30px; line-height : 30px; background-color : #ccc; color : #000;">${i }</a>
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