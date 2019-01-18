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

.wrap{ /* clear: both; */ }


</style>
<script type="text/javascript">

	function newsReload(){
		
		document.newsReload.action = "./NewsReadContentAction.news";
		document.newsReload.submit();
	}

</script>
</head>
<body>

<div class="wrap">
	<div class="container" align="center">
		<div class="news_header">
			<br>
			<span class="news_header_font" style="">News</span>
		</div>
			<div class="margin2"></div>
		<div class="reNews_section_container">
			<div id="reNews_board">
				
			<div id="reNews_content" >
				<div id="header" >
					<div id="header_header">리듀 뉴스<span id="header_count">&nbsp;&nbsp;&nbsp;총 게시글 ${count }</span> </div>
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
					<select id="news_content_sortNews" name="sortNews" onchange="this.form.submit();">
						<option>글조회선택</option>
						<option value="1" >최신순</option>
						<option value="2" >조회순</option>
					</select>
				</form>
				<c:if test="${sessionScope.id eq 'rewardu4@gmail.com' }">
	
					<br>착한 관리자만 보이는 버튼-><input type="button" onclick="location.href='./NewsWrite.news'" value="글쓰기">
				</c:if>
				</div>
				<hr>
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
	
	
			<c:forEach var="v" items="${requestScope.v }">
	
					<div class="reNews_board_content">
			<!-- 착한 관리자 눈에만 글번호가 보임 -->		
			<c:if test="${sessionScope.id eq 'rewardu4@gmail.com' }">
					${v.reNews_no }
			</c:if>
					<span class="reNews_category_board">${v.reNews_category }</span>
					<a href="./NewsReadContentAction.news?no=${v.reNews_no }"><p class="reNews_board_title">${v.reNews_title }</p>
						<p class="reNews_board_summary">${v.reNews_summary }</p></a>
					<p class="content_info">
						<span class="reNews_editor">${v.user_name }</span>
						<span class="reNews_date">${v.reNews_date }</span>
						<span class="reNews_date">&nbsp;&nbsp; 조회수 ${v.reNews_views }</span>
					</p>
					
					</div>
					<div class="reNews_board_thumnail"><img src="./upload/${v.reNews_img }"></div>
					
	
					<hr>
			</c:forEach>
					<div class="margin2"></div>	
			</div><!-- reNews_content -->					
			
			<!-- paging section -->
				<div class="reNews_paging">
					<c:if test="${firstPage > pageBlock }">
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
					<c:if test="${firstPage > pageCount }">
						<a href="./NewsAction.news?newsCurrentP=${firstPage+5 }">다음</a>
					</c:if>
					<div class="margin2"></div>
				</div><!-- reNews_paging -->
			
			</div><!-- reNews_board -->	
			
			<div class="boardSection_sub">
				<div class="section_container">
					<form action="./NewsAction.news" method="post">
				 		<input type="text" name="newsKeyword" placeholder="뉴스 키워드를  입력해주세요" class="inp-field2"><input type="button" class="btn_search" value="검색" onclick="this.form.submit();"><br>
				 	</form>
				 	<hr>
				 	<div align="left">
					 	<h4>리듀 뉴스 소개</h4>
					 	<span>화목한 커뮤니티, 리듀의 소식을 소개합니다.</span>
					 	<hr>
					 	<h4>리듀 뉴스 Best 조회수</h4>
					 	<a href="./NewsReadContentAction.news?no=${bestNews.reNews_no }"><span>${bestNews.reNews_title }</span></a>
				 	</div>
				 	
				 	<form name="newsReload" method="post">
						<input type="hidden" name="reload" value="true">
					</form>
				 	
				</div>
			</div><!-- boardSection_sub -->
		
		</div><!-- reNews_section_container -->			
	</div><!-- container -->
	
</div><!-- wrap -->



</body>
</html>