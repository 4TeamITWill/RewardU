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
	<div id="savedList_main">
		<div class="savedList_top">
			<div class="savedList_desc">
				<h2 style="font-size : 1.3rem">&nbsp;&nbsp;회원님께서 개설 중인 프로젝트 목록입니다.</h2>	
			</div>			
		</div>
		
		<div class="savedList_bottom">
			<c:forEach var="board" items="${board1list }">
				<div class="savedList_bottom_content" >		
					<div style="display : flex; align-items : center;">
						<div style="width : 150px; height :150px; background-color : #000;"><img/></div>
						<div style="padding : 10px 10px;">
							<font style="font-size : 18px;">${board.pd_subject }</font><br/>
							분류 : ${board.pd_category }<br/>
							${board.pd_curmoney }원 / ${board.pd_goalmoney }원<br/>							
						</div>
					</div>
					<div>~${board.pd_endf }</div>
					<div>${board.pd_participant }명 참여</div>
					<div>${board.pd_rate }</div>
				</div>
			</c:forEach>
			<!-- 페이징 부분 -->
				<div class="my_board_page">
					<c:if test="${startPage > pageBlock }">
						<a onclick="pageajax(${startPage-pageBlock });">이전</a>
					</c:if>				
					<c:forEach var="i" begin="${startPage }" end="${endPage }">					
					<c:if test="${currentPage == i }">
						<a onclick = "pageajax(${i});" style="display:block; width:30px; height : 30px; line-height : 30px; background-color : #ccc; color : #000;">${i }</a>
					</c:if>
					<c:if test="${currentPage != i }">
						<a onclick = "pageajax(${i});" style="display:block; width:30px; height : 30px; line-height : 30px;">${i }</a>
					</c:if>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						<a onclick ="pageajax(${startPage+5 });">다음</a>
					</c:if>
				</div>		
		</div>	
		
		
		<div class="savedList_bottom">
			<c:forEach var="board" items="${board0list }">
				<div class="savedList_bottom_content" >		
					<div style="display : flex; align-items : center;">
						<div style="width : 150px; height :150px; background-color : #000;"><img/></div>
						<div style="padding : 10px 10px;">
							<font style="font-size : 18px;">${board.pd_subject }</font><br/>
							분류 : ${board.pd_category }<br/>
							${board.pd_curmoney }원 / ${board.pd_goalmoney }원<br/>							
						</div>
					</div>
					<div>~${board.pd_endf }</div>
					<div>${board.pd_participant }명 참여</div>
					<div>${board.pd_rate }</div>
				</div>
			</c:forEach>
		</div>
		
		
		
	</div>
</body>
</html>