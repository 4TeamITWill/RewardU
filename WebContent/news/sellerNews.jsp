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

.news_header{
	width: 100%;
	height: 180px;
	background-image: url("img/radioNews.jpg"); 
	background-size: 100% 100%;
	background-attachment: scroll;
	background-repeat: no-repeat;
}

#header #header_header{
	font-size: 25px;
	font-weight: 700;
	margin: 10px 0;
}

#header #header_count {
	font-size: 12px;
	font-weight: none;
}

.boardSection_sub{
    border: 1px solid #fff;
 /*  clear: both;  */
	float: right; 
    width: 310px;
    padding : 50px 0; 

    margin: 0;
}

.boardSection_sub .section_container{
	border-left: 1px solid #e4e4e4;
	padding: 15px 25px;
}

.boardSection_sub .section_container hr{

}

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
			<span class="news_header_font" style=" ">News</span>
		</div>
			<div class="margin2"></div>
		<div class="reNews_section_container">
			<div id="reNews_board">
				
				<div id="reNews_content" >
					<div id="header" >
						<div id="header_header">리워드 소식<span id="header_count">&nbsp;&nbsp;&nbsp;총 게시글 ${count}</span> </div>
						<h6>전체 프로젝트의 리워드소식을 한번에 확인할 수 있는 공간입니다.</h6>
					</div>
					<hr>
				
					<c:if test="${count==0}">
						<div class="margin2"><br/></div>
						<div style="color: #999999;" align="center">리워드 소식이 없습니다.</div>
						<div class="margin2"><br/></div>
					</c:if>
					
					<c:if test="${count>0}">
						<c:forEach var="v" items="${requestScope.v }" >
						<div class="reNews_board_content2">
							<span><font style="color : rgba(255,0,130,0.9); font-weight : bold; font-size : 17px;">no : ${v.no} / pd_no : ${v.pd_no}</font></span> 
							<span><font style="color: #999999; font-size: 2;">${v.user_id}</font></span>
							<a href="./SellerNewsReadContentAction.news?no=${v.no}">
								<p><font style="font-size : 18px; font-weight : bold; color: black;" >
									${v.sell_subject} 
								</font></p>
								<p class="content_info2" align="right">
									<span class="reNews_editor" align="right">${v.date}</span>
								</p>
							</a>
						</div>
						<hr>
						</c:forEach>
					</c:if>	
				
						<div class="margin2"></div>	
				</div><!-- reNews_content -->					
			
				<%-- <h6>${currentPage }/${pageCount }</h6> --%>
				
			
				<!-- paging section -->
					<div class="reNews_paging">
						<c:if test="${firstPage > pageBlock }">
							<a href="./sellerNewsAction.news?currentPageP=${firstPage-pageBlock }">이전</a>
						</c:if>
						<c:forEach var="i" begin="${firstPage }" end="${lastPage}">
							<c:if test="${currentPage == i }">
								<a href="./sellerNewsAction.news?currentPageP=${i }">${i }</a>
							</c:if>
							<c:if test="${currentPage != i }">
								<a href="./sellerNewsAction.news?currentPageP=${i }">${i }</a>
							</c:if>
						</c:forEach>
						<c:if test="${endPage < pageCount }">
							<a href="./sellerNewsAction.news?currentPageP=${firstPage+5 }">다음</a>
						</c:if>
						<div class="margin2"></div>
					</div><!-- reNews_paging -->
				
			
			</div><!-- reNews_board -->	
			
			<div class="boardSection_sub">
				<div class="section_container">
					<form action="./sellerNewsAction.news" method="post">
						<div></div>
				 		<input type="text" name="newsKeyword" placeholder="키워드를  입력해주세요" class="inp-field2"><input type="button" class="btn_search" value="검색" onclick="this.form.submit();"><br>
				 	</form>
				 	<hr>
				 	<div align="left">
					 	<h4>리워드U</h4>
					 	<span>화목한 커뮤니티, 리듀의 새소식을 전합니다.</span>
					 	<hr>
					 	<%-- <h4>리듀 뉴스 Best 조회수</h4>
					 	<a href="./NewsReadContentAction.news?no=${bestNews.reNews_no }"><span>${bestNews.reNews_title }</span></a> --%>
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