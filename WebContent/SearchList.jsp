<%@page import="reward.db.RewardDAO"%>
<%@page import="java.util.Vector"%>
<%@page import="reward.db.RewardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String keyWord = request.getParameter("keyWord");	
%>

<h3 align="center">&nbsp;&nbsp;<font size="5"><%=keyWord%></font>&nbsp;&nbsp;의 검색 결과 입니다.</h3>

	<c:if test="${count>0}">
			<h4 align="center">${count}개의 결과를 찾았습니다.</h4>
			<div id="myGoodList_main">	
			<div class="myGoodList_content">
						<div class="myGoodList_content_">
							<c:forEach var="Board" items="${requestScope.v}">
								<div class="good_content">
									<input type="hidden" name="pd_no" value="${Board.pd_no}">
									<div class="content_0"><img src="./upload/${Board.pd_realFile}"></div>
									<div class="content content_1">${Board.company}</div><!-- 안나옴 -->			
									<div class="content content_2">
										<a href="Content.ad?pd_no=${Board.pd_no}">${Board.pd_subject}</a>
									</div>
									<div class="content content_3">${Board.pd_category}</div>
									<div class="content content_4">${Board.pd_curMoney}</div>
									<div class="content content_5">${Board.pd_start}</div>

								</div>
								
							</c:forEach>
						</div>
	</c:if>
	
				<!-- 페이징 부분 -->
					<div class="my_board_page">
						<c:if test="${startPage > pageBlock }">
							<a href="getSearchListAction.fu?currentPage1=${startPage-pageBlock }">이전</a>
						</c:if>				
						<c:forEach var="i" begin="${startPage }" end="${endPage }">					
						<c:if test="${currentPage == i }">
							<a href="getSearchListAction.fu?currentPage1=${i}" style="display:block; width:30px; height : 30px; line-height : 30px; background-color : #ccc; color : #000;">${i }</a>
						</c:if>
						<c:if test="${currentPage != i }">
							<a href="getSearchListAction.fu?currentPage1=${i}">${i }</a>
						</c:if>
						</c:forEach>
						<c:if test="${endPage < pageCount}">
							<a hef="myPageGood.my?currentPage1=${startPage+5 }">다음</a>
						</c:if>
					</div>		
			</div>	
		</div>

	<c:if test="${count==0}">
		<div style="height: 500px;">
			<h4 align="center">검색 결과 없음</h4>
		</div>
	</c:if>

</body>
</html>