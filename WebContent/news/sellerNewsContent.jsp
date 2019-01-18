<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리듀 RewardU | News</title>
<style type="text/css">

.news_header{
	width: 100%;
	height: 180px;
	background-image: url("img/radioNews.jpg"); 
	background-size: 100% 100%;
	background-attachment: scroll;
	background-repeat: no-repeat;
}



</style>

</head>
<body>
<div class="wrap">
	<div class="container" align="center">
		<div class="news_header">
			<br>
			<span class="news_header_font" style=" ">News</span>
		</div>
		
	<div id="reNewsRead_content2">
		<div class="margin3"></div>
<!-- JSTL tag - button only shows up if admin's in session -->		
	<c:if test="${sessionScope.id eq 'rewardu4@gmail.com' }">
		<div align="right">
		착한 사람눈에만 보이는 버튼->	<input type="button" value="글삭제" onclick="location.href='./SellNewsDeleteAction.news?no=${nbean.no}'">
		</div>
	</c:if>
		<div class="reNewsRead_container">
			<font style="color : rgba(255,0,130,0.9); font-weight : bold; font-size : 17px;">no${nbean.no}</font>
			<h3>${nbean.sell_subject }</h3>
			<div class="sellNewsSub" style="margin-left: 42px; margin-top: 10px; color: #999999; text-align: right;" >
									<font> ${nbean.pd_subject}(회사이름)</font>
			</div>
			<div align="right"><span class="reNews_editor">${nbean.user_id }</span>&nbsp;&nbsp;<span class="reNews_date">${nbean.date }</span></div>
			<%-- <span class="reNews_date">&nbsp;&nbsp;조회수 ${nbean.}</span> --%>
			<hr>
			<div class="reNewsRead_content">
				<div class="margin2"></div>
				${nbean.sell_content }
				<div class="margin2"></div>
			</div>
			<hr>
			<%-- <div>첨부파일 &nbsp;&nbsp;
				<a href="./AttachmentDownloadAction.news?path=upload&name=${nbean.reNews_file }">${nbean.reNews_file }</a></div> --%>
		</div><!-- reNewsRead_contaioner -->
	 		<div class="margin2"></div>
		<div align="center"><input type="button" class="btn2" value="목록으로" onclick="history.back()"></div><!-- location.href='./SellerNewsAction.news' -->
			<div class="margin2"></div>
	</div><!-- reNewsRead_content -->
	
	
	</div><!-- container -->
	
</div><!-- wrap -->


</body>
</html>