<%@page import="java.util.Vector"%>
<%@page import="reward.db.RewardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Save List</title>
</head>
<body>

<div id="savedList_main">
		<div class="savedList_top">
			<div class="savedList_desc">
				<h2 style="font-size : 1.3rem">임시저장된 글 목록입니다. 수정하기를 클릭하여 이어서 작성할 수 있습니다.</h2>	
			</div>			
		</div>		
		<div class="savedList_bottom">
			<div style="font-weight : bold; padding-bottom : 1rem; border-bottom : 1px solid rgba(130,130,130,0.8);">
				<div>프로젝트</div>
			</div>
			
		<c:if test="${count > 0 }">	
			<c:forEach var="saveBoard" items="${requestScope.v}">
				<div class="savedList_bottom_content" >		
					<div style="display : flex; align-items : center;">
						<div style="width : 130px; height :130px; overflow : hidden;">
						<!--이미지 null이면 기본이미지뜨게 추가!!!-->
							<c:choose>
								<c:when test="${saveBoard.pd_realFile eq '' or saveBoard.pd_realFile==null}">
									<img src="./img/no_img.jpg" width="130px" height="130px">
								</c:when>
								<c:otherwise>
									 <img src="./upload/${saveBoard.pd_realFile}" width="130px" height="130px">
								</c:otherwise>
							</c:choose> 
						</div>
						<div style="padding : 10px 10px;">
							<div style="color:#000;">
								<font style="font-size : 18px;">
									<c:choose>
										<c:when test="${saveBoard.pd_subject eq '' or saveBoard.pd_subject==null}">
											제목없음
										</c:when>
										<c:otherwise>
											 ${saveBoard.pd_subject}
										</c:otherwise>
									</c:choose>
								</font>
							</div>								
						</div>
					</div>
					<div style="flex : 1; text-align : center;"><button onclick="location.href='RewardingSaveGet.fu?pd_no=${saveBoard.pd_no}'" class="ingBtn">수정하기 </button></div><br/>
					<div style="flex : 1; text-align : center;"><button onclick="location.href='RewardingSaveDelete.fu?pd_no=${saveBoard.pd_no}'" class="ingBtn"> 삭제 </button></div>
				</div>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${count <= 0  }"	>
			<div style="width : 100%; text-align :center; height : 100%;">작성중인 프로젝트가 없습니다.</div>
		</c:if>
		
			<!-- 페이징 부분 -->
				<div class="my_board_page">
					<c:if test="${startPage > pageBlock }">
						<a onclick="pageImsi(${startPage-pageBlock });" style="cursor : pointer;">이전</a>
					</c:if>				
					<c:forEach var="i" begin="${startPage }" end="${endPage }">					
					<c:if test="${currentPage == i }">
						<a onclick = "pageImsi(${i});" style="display:block; width:15px; height : 15px; line-height : 15px; border-bottom : 1px solid  #2f68ff; cursor : pointer;">${i }</a>
					</c:if>
					<c:if test="${currentPage != i }">
						<a onclick = "pageImsi(${i});" style="display:block; width:15px; height : 15px; line-height : 15px; cursor : pointer;" >${i }</a>
					</c:if>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						<a onclick ="pageImsi(${startPage+5 });" style="cursor : pointer;">다음</a>
					</c:if>
				</div>		
			<!-- 페이징 끝 -->
			
		</div>	
</body>
</html>