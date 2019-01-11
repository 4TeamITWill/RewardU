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
				<h2 style="font-size : 1.3rem">${name } 회원님께서 제작 하신 프로젝트 목록입니다.</h2>	
			</div>			
		</div>		
		<div class="savedList_bottom">
			<div style="display : flex; width : 1000px; margin : 0 auto; font-weight : bold; padding-bottom : 1rem; border-bottom : 1px solid rgba(130,130,130,0.8);">
				<div style="flex : 5;">프로젝트</div>
				<div style="flex : 2; text-align : center;">마감날짜</div>
				<div style="flex : 1; text-align : center;">참여자수</div>
				<div style="flex : 1; text-align : center;">평점</div>
				<div style="flex : 1; text-align : center;">승인 여부</div>
			</div>
		
			<c:forEach var="board" items="${board1list }">
				<div class="savedList_bottom_content" >	
					
					<div style="display : flex; align-items : center;">
					
						<div style="width : 130px; height :130px; overflow : hidden;"><img src="./upload/${board.pd_realfile }"/></div>
						<div style="padding : 10px 10px;">
							<a href="./Content.ad?pd_no=${board.pd_no}" style="color:#000;">
							<font style="font-size : 18px;">${board.pd_subject }</font><br/>
							분류 : ${board.pd_category }<br/>
							${board.pd_curmoney }원 / ${board.pd_goalmoney }원<br/>
							</a>							
						</div>
					</div>
					<div>~${board.pd_endf }</div>
					<div>${board.pd_participant }명 참여</div>
					<div>${board.pd_rate }</div>
					
					<c:if test="${board.pd_permit == 1 }">
						<div>게시 중</div>
					</c:if>
					<c:if test="${board.pd_permit == 0 }">
						<div>승인대기</div>
					</c:if>
					<c:if test="${board.pd_permit == 2 }">
						<div>승인거절</div>
					</c:if>
					
					
				</div>
			</c:forEach>
			<!-- 페이징 부분 -->
				<div class="my_board_page">
					<c:if test="${startPage > pageBlock }">
						<a onclick="pageajax(${startPage-pageBlock });" style="cursor : pointer;">이전</a>
					</c:if>				
					<c:forEach var="i" begin="${startPage }" end="${endPage }">					
					<c:if test="${currentPage == i }">
						<a onclick = "pageajax(${i});" style="display:block; width:15px; height : 15px; line-height : 15px; border-bottom : 1px solid  #2f68ff; cursor : pointer;">${i }</a>
					</c:if>
					<c:if test="${currentPage != i }">
						<a onclick = "pageajax(${i});" style="display:block; width:15px; height : 15px; line-height : 15px; cursor : pointer;" >${i }</a>
					</c:if>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						<a onclick ="pageajax(${startPage+5 });" style="cursor : pointer;">다음</a>
					</c:if>
				</div>		
		</div>	
		
		
<!-- 		<div class="savedList_bottom"> -->
<%-- 			<c:forEach var="board" items="${board0list }"> --%>
<!-- 				<div class="savedList_bottom_content" >		 -->
<!-- 					<div style="display : flex; align-items : center;"> -->
<!-- 						<div style="width : 150px; height :150px; background-color : #000;"><img/></div> -->
<!-- 						<div style="padding : 10px 10px;"> -->
<%-- 							<font style="font-size : 18px;">${board.pd_subject }</font><br/> --%>
<%-- 							분류 : ${board.pd_category }<br/> --%>
<%-- 							${board.pd_curmoney }원 / ${board.pd_goalmoney }원<br/>							 --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 					<div>~${board.pd_endf }</div> --%>
<%-- 					<div>${board.pd_participant }명 참여</div> --%>
<%-- 					<div>${board.pd_rate }</div> --%>
<!-- 				</div> -->
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
		
		
		
	</div>
</body>
</html>