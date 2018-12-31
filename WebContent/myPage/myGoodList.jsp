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
	<div id="myGoodList_main">	
		<div class="myGoodList_content">
			<div class="good_subject">좋아요</div>
			<div class="myGoodList_content_">
				<c:forEach var="good" items="${goodlist }">
					<div class="good_content">
						<div class="content_0"><img src=""></div>
						<div class="content_1">&nbsp;${good.pd_subject }</div>					
						<div class="content_2">&nbsp;${good.user_id }</div>
						<div class="content_3">${good.pd_rate }&nbsp;&nbsp;</div>
					</div>				
				</c:forEach>
				<c:if test="${count <= 0 }">
					<div>좋아요한 게시글이 없습니다.</div>
				</c:if>					
			</div>
			<!-- 페이징 부분 -->
				<div class="myGood_board_page">
					<c:if test="${startPage > pageBlock }">
						<a href="myPageGood.my?currentPage1=${startPage-pageBlock }">이전</a>
					</c:if>				
					<c:forEach var="i" begin="${startPage }" end="${endPage }">					
					<c:if test="${currentPage == i }">
						<a href="myPageGood.my?currentPage1=${i}" style="display:block; width:30px; height : 30px; line-height : 30px; background-color : #ccc; color : #000;">${i }</a>
					</c:if>
					<c:if test="${currentPage != i }">
						<a href="myPageGood.my?currentPage1=${i}">${i }</a>
					</c:if>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						<a hef="myPageGood.my?currentPage1=${startPage+5 }">다음</a>
					</c:if>
				</div>		
		</div>	
	</div>
</body>
</html>