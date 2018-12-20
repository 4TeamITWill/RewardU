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
	<div class="ad_board_top">
		<div>작성자</div>
		<div>카테고리</div>
		<div>제목</div>
		<div>시작일</div>
	</div>
	<div class="ad_board_mid">
	<c:forEach var="list" items="${boardList}">
		<div class="ad_board_list">
			<div>${list.user_id }</div>
			<div>${list.pd_category }</div>
			<div><a href="getBoard.ad?pd_no=${list.pd_no }">${list.pd_subject }</a></div>
			<div>
				<fmt:formatDate value="${list.pd_start }" pattern="yyyy-MM-dd"/>
			</div>
		</div>	
	</c:forEach>
	</div>
	<div class="ad_board_page">
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<a onclick="selltable(${i})">${i }</a>
			</c:forEach>					
	</div>
					
</body>
</html>