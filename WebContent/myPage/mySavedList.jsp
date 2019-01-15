<%@page import="java.util.Vector"%>
<%@page import="reward.db.RewardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#myButton {
	background-color:#AA4CC2;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #AA4CC2;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bolder;
	padding:6px 5px;
	text-decoration:none;
	/* text-shadow:0px 1px 0px #9b14b3; */
	width: 80px;
}
#myButton:hover {
	background-color:#ffffff;
	color: #AA4CC2;
	
}
#myButton:active {
	position:relative;
	top:1px;
}



#myButton2 {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #f6f6f6));
	background:-moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0);
	background-color:#ffffff;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
#myButton2:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6), color-stop(1, #ffffff));
	background:-moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#ffffff',GradientType=0);
	background-color:#f6f6f6;
}
#myButton2:active {
	position:relative;
	top:1px;
} 

</style>
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
					<div style="flex : 1; text-align : center;"><button onclick="location.href='RewardingSaveGet.fu?pd_no=${saveBoard.pd_no}'" id="myButton">수정하기 </button></div><br/>
					<div style="flex : 1; text-align : center;"><button onclick="location.href='RewardingSaveDelete.fu?pd_no=${saveBoard.pd_no}'" id="myButton2"> 삭제 </button></div>
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