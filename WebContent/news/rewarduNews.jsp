<%@page import="java.util.Vector"%>
<%@page import="news.db.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리듀 RewardU | News</title>
<link href="css/main3.css" rel="stylesheet">
<link href="css/etc.css" rel="stylesheet">
<style type="text/css">

.wrap{ border: 1px solid blue;}

.news_header{
	width: 100%;
	height: 150px;
	border: 1px solid green;
}

#reNews_category > ul{
 padding-inline-start:0px;
 margin-inline-start: 0px;
 margin-block-end: 0px;
 
}

#reNews_category > ul > li{
 padding: 2px;
 border: 1px solid pink;
 box-sizing: content-box;
 display: inline;
}

#header, #reNews_category {
	text-align: left;
}

#reNews_board {width: 800px;
	text-align: left;
	border: 1px solid red;
}

.reNews_board_content{
 border: 1px solid pink;
 box-sizing: border-box;
 display: inline-block;
 width: 520px;
 height: 160px;
}

.reNews_board_thumnail {
	float: right;
	border: 1px solid teal;
	width: 270px; height: 160px;
}

</style>
</head>
<body>

<div class="wrap">
	<div class="container" align="center">
		<div class="news_header">
				News
		</div>
		<div id="reNews_board">
			
		<div id="reNews_content" >
			<div id="header" >
				<h2>리듀 뉴스 ${count } </h2>
				<h6>${currentPage }/${pageCount }</h6>
			</div>
			<div id="reNews_category">
				<ul>
					<li>전체</li>
					<li>새소식</li>
					<li>리듀 이야기</li>
				</ul>
			</div><!-- reNews_category -->
			<div align="right">
			<form action="./NewsAction.news" method="post">
				<select name="sortNews" onchange="this.form.submit();">
					<option>글조회선택</option>
					<option value="1" >최신순</option>
					<option value="2" >조회순</option>
				</select>
			</form>
				<br>관리자만 보일예정-><input type="button" onclick="location.href='./NewsWrite.news'" value="글쓰기"></div>
		
			<div class="reNews_board_content">
				<span class="reNews_category_board">새소식</span>
				<a href="#"><p class="reNews_board_title">team4에서 RewardU로 새롭게 시작합니다!</p>
					<p class="reNews_board_summary">RewardU 리듀는 당신에게 돌려드린다는 의미입니다.</p></a>
				<p class="content_info">
					<span class="reNews_editor">정만득</span>
					<span class="reNews_date">19.01.02</span>
				</p>
				
			</div>
			<div class="reNews_board_thumnail">난나라날난 사진 들어감니당 ㅎㅎㅎ 헤헷호호호호호</div>
			<hr>
	<c:set var="j" value="0"/>
	<%-- <c:set var="skip" value="${startRow }"/> --%>
		<c:forEach var="v" items="${requestScope.v }" begin="0" end="${pageSize }">
	 	<%-- <c:if test="${0==skip }">  --%> 
				<div class="reNews_board_content">
	 <%-- 	</c:if>  --%> 
				${v.reNews_no }<span class="reNews_category_board">${v.reNews_category }</span>
				<a href="./NewsReadContentAction.news?no=${v.reNews_no }"><p class="reNews_board_title">${v.reNews_title }</p>
					<p class="reNews_board_summary">${v.reNews_summary }</p></a>
				<p class="content_info">
					<span class="reNews_editor">${v.user_name }</span>
					<span class="reNews_date">${v.reNews_date }</span>
					<span class="reNews_date">&nbsp;&nbsp;조회수${v.reNews_views }</span>
				</p>
				
				</div>
				<div class="reNews_board_thumnail">난나라날난 사진 들어감니당 ㅎㅎㅎ 헤헷호호호호호</div>
				
<%-- 	 	<c:set var="j" value="${j+1}" />  --%>
				<hr>
		</c:forEach>
		
		</div><!-- reNews_board -->					
				
		</div><!-- reNews_content -->
		
		<!-- paging section -->
		<div class="reNews_paging">
			<c:if test="${startPage > pageBlock }">
				<a href="./NewsAction.news?newsCurrentP=${firstPage-pageBlock }">이전</a>
			</c:if>
			<c:forEach var="i" begin="${firstPage }" end="${lastPage}">
			<c:if test="${currentPage == i }">
				<a href="./NewsAction.news?newsCurrentP=${i }">${i }</a>
			</c:if>
			<c:if test="${currentPage != i }">
				<a href="./NewsAction.news?newsCurrentP=${i }">${i }</a>
			</c:if>
			</c:forEach>
			<c:if test="${firstPage < pageCount }">
				<a href="./NewsAction.news?newsCurrentP=${firstPage+5 }">다음</a>
			</c:if>
		</div><!-- reNews_paging -->
		
	</div><!-- container -->
	
</div><!-- wrap -->



</body>
</html>