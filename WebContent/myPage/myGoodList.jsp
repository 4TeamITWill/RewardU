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
	<div id="myGoodList_main">	
		<div class="myGoodList_content">		
			
			<div style="display : flex; justify-content : space-between; align-items : center; margin-bottom : 0.5rem; padding : 0 2rem;">
				<div class="good_subject">좋아요</div>	
				<input style="width : 80px; height : 30px;"type="button" value="삭제하기" onclick="delGood();"/>
			</div>
				
				<c:if test="${count > 0 }">
					<form method="get" name="fr">
					<div class="myGoodList_content_">					
						<c:forEach var="good" items="${goodlist }">
																										
						<div class="good_content">	
							<input type="checkbox"  name ="delcheck" value="${good.pd_no }" style="width : 15px; height : 15px;"/>											
							
							<div class="content_0"><img src="이미지넣기"></div>
							<div class="good_content_box">
								<div class="content content_1">${good.user_id }</div>					
								<div class="content content_2">${good.pd_subject }</div>
								<div class="content content_3">${good.pd_category }</div>
								<div class="content content_4">
									<div>${good.pd_rate } / 5 </div><div style="font-weight : bold; color : #f34;"> ~${good.pd_endf }</div>
								</div>
																							
								<a class="mybtn" onclick="location.href='./Content.ad?pd_no=${good.pd_no}'" style="cursor : pointer;">투자하기</a>	
								
							</div>	
						</div>	
												
						</c:forEach>										
					</div>	
					</form>	
				</c:if>	
			
			
			<c:if test="${count <= 0 }">
				<div style="width : 100%; text-align :center; height : 100%;">좋아요한 게시글이 없습니다.</div>
			</c:if>					
			
			<!-- 페이징 부분 -->
				<div class="my_board_page">
					<c:if test="${startPage > pageBlock }">
						<a href="myPageGood.my?currentPage1=${startPage-pageBlock }">이전</a>
					</c:if>				
					<c:forEach var="i" begin="${startPage }" end="${endPage }">					
					<c:if test="${currentPage == i }">
						<a href="myPageGood.my?currentPage1=${i}" style="display:block; width:15px; height : 15px; line-height : 15px; border-bottom : 1px solid #2f68ff">${i }</a>
					</c:if>
					<c:if test="${currentPage != i }">
						<a href="myPageGood.my?currentPage1=${i}" style="display:block; width:15px; height : 15px; line-height : 15px;">${i }</a>
					</c:if>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						<a href="myPageGood.my?currentPage1=${startPage+5 }">다음</a>
					</c:if>
				</div>		
		</div>	
	</div>
	
<script>

function reward(pd_no){
	
	location.href="goReward.my?pd_no="+pd_no;
	
}

function delGood(){
	
	document.fr.action = "myGoodDel.my";
	document.fr.submit();	
	
}

</script>	
	
	
</body>
</html>