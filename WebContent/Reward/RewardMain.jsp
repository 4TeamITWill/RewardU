<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		div select{
			border: solid;
			
		}
		th{
			border: solid;
		}
		td{
			border: solid;
		}
		.category{
			list-style:none;
		    margin:0;
		    padding:0;
		}
		.category li{
			margin: 0 0 0 0;
		    padding: 0 0 0 0;
		    border : 0;
		    float: left;
		}
	</style>
	<script type="text/javascript">
		
			var URL = location.pathname;
			console.log(URL);
		
			function change(){
				var result = document.getElementById("result").value;
				var order = document.getElementById("order").value;
				var category = document.getElementById("category").value; 
					if(result == "A"){
						window.open(URL+"?category="+category+"&order="+order,'_self');
					}else{
						window.open(URL+"?category="+category+"&result="+result+"&order="+order,'_self');	
					}
			};
			
		 	function loadmore(){
				var order = $('#order').val();
				var result = $('#result').val();
				var category = $('#category').val();
				var currentPage = $('#currentPage').val();
					currentPage++;
				var pageCount = $('#pageCount').val();
				console.log(order);
				console.log(result);
				console.log(currentPage);
				console.log(pageCount);
				$.ajax({
					url : "./PermitList.ad",
					type: "POST",
					data:({result:result, order:order, currentPage:currentPage, category:category}),
					success:function(data){
						 console.log(data);
					 	 if(currentPage < pageCount){
						 	$('#form').append(data);
						 	$('#currentPage').val(currentPage);
						 }else if(currentPage == pageCount){
							 $('#form').append(data);
							 $("#more").hide();
						 } 
					},	
					error:function(request,status,error){
			            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			           }
				});
			} 
			
	</script>
</head>
<body>
	<input type="hidden" id="category" value="${category }">
<%-- 	<c:choose>
		<c:when test="${category }">
			<h2>전체보기</h2>
		</c:when>
		<c:when test="${category eq 패션뷰티 }">
			<h2>패션·뷰티</h2>
		</c:when>
		<c:when test="${category eq 테크가전 }">
			<h2>테크·가전</h2>
		</c:when>
		<c:when test="${category eq 반려동물 }">
			<h2>반려동물</h2>
		</c:when>
		<c:when test="${category eq 푸드 }">
			<h2>푸드</h2>
		</c:when>
		<c:when test="${category eq 홈리빙디자인소품 }">
			<h2>홈리빙·디자인소품</h2>
		</c:when>
		<c:when test="${category eq 게임스포츠 }">
			<h2>게임·스포츠</h2>
		</c:when>
		<c:when test="${category eq 여행레저 }">
			<h2>여행·레저</h2>
		</c:when>
		<c:when test="${category eq 문화교양 }">
			<h2>문화·교양</h2>
		</c:when>
		<c:when test="${category eq 소셜캠페인 }">
			<h2>소셜캠페인</h2>
		</c:when>
		<c:when test="${category eq 교육키즈 }">
			<h2>교육·키즈</h2>
		</c:when>
	</c:choose> --%>
	<div align="center">
		<form>
			<ul class="category">
				<li><a href="./PermitList.ad?category=N"><img src="./img/category/Tech.jpg" width="80" border="0"></a></li>
				<li><a href="./PermitList.ad?category=패션뷰티"><img  src="./img/category/Tech.jpg" width="80" border="0"></a></li>
				<li><a href="./PermitList.ad?category=테크가전"><img src="./img/category/Tech.jpg" width="80" border="0"></a></li>
				<li><a href="./PermitList.ad?category=반려동물"><img  src="./img/category/Tech.jpg" width="80" border="0"></a></li>
				<li><a href="./PermitList.ad?category=푸드"><img src="./img/category/Tech.jpg" width="80" border="0"></a></li>
				<li><a href="./PermitList.ad?category=홈리빙디자인소품"><img src="./img/category/Tech.jpg" width="80" border="0"></a></li>
				<li><a href="./PermitList.ad?category=게임스포츠"><img src="./img/category/Tech.jpg" width="80" border="0"></a></li>
				<li><a href="./PermitList.ad?category=여행레저"><img src="./img/category/Tech.jpg" width="80" border="0"></a></li>
				<li><a href="./PermitList.ad?category=문화교양"><img src="./img/category/Tech.jpg" width="80" border="0"></a></li>
				<li><a href="./PermitList.ad?category=소셜캠페인"><img src="./img/category/Tech.jpg" width="80" border="0"></a></li>
				<li><a href="./PermitList.ad?category=교육키즈"><img src="./img/category/Tech.jpg" width="80" border="0"></a></li>
			</ul>
		</form>
	</div>
	<hr>
	<c:set var="center" value="${Reward_center }"/>
	<div align="right">		
		<span>
			<c:set var="result"  value="${param.result }"/>
			<select id="result" onchange="change()">
				<option value="A" <c:if test="${result eq 'A'}">selected</c:if>>전체</option>
				<option value="0" <c:if test="${result eq '0'}">selected</c:if>>펀딩중</option>
				<option value="1" <c:if test="${result eq '1'}">selected</c:if>>성공된</option>
				<option value="2" <c:if test="${result eq '2'}">selected</c:if>>실패된</option>
			</select>
		</span>
		<span>
			<c:set var="order"  value="${param.order }"/>
			<select id="order" onchange="change()">
				<option value="7"<c:if test="${order eq '7'}">selected</c:if>>추천수</option>
				<option value="8"<c:if test="${order eq '8'}">selected</c:if>>조회수</option>
				<option value="11"<c:if test="${order eq '11'}">selected</c:if>>펀딩액순</option>
				<option value="5"<c:if test="${order eq '5'}">selected</c:if>>최신순</option>
				<option value="12"<c:if test="${order eq '12'}">selected</c:if>>참여자순</option>
			</select>
		</span>
	</div>
	<hr>
	<div class="center">
		<form id="form">	
			<jsp:include page="${center }"/>
		</form>
	</div>
<%--		<c:if test="${numPageGroup > 1 }">
				<a href="./PermitList.ad?pageNum=${(numPageGroup-2)*pageGroupSize+1}">[이전]</a>
			</c:if>
			<c:forEach var ="i" begin="${startPage }" end="${endPage }">
				<a href = "./PermitList.ad?pageNum=${i }">[
				<font color = "#000000">
				<c:if test="${currentPage == i }">
				<font color = "#bbbbbb"/>
				</c:if>
				${i }
				</font>]
				</a>
			</c:forEach>
			<c:if test="${numPageGroup < pageGroupCount }">
				<a href="./PermitList.ad?pageNum=${ numPageGroup*pageGroupSize+1}">[다음]</a>
			</c:if>  
--%>
	<div class="center">
		<tr id="loadmore">
			<td colspn="5">
			<c:if test="${currentPage < pageCount }">
				<div id="more" class="btns">
					<input type="hidden" id="order" value="${order }">
					<input type="hidden" id="result" value="${result }">
					<input type="hidden" id="currentPage" value="${currentPage }">
					<input type="hidden" id="pageCount" value="${pageCount }">
					<input type="button" onclick="loadmore()" value="더보기">
				</div>
			</c:if>
			</td>
		</tr>
	</div>

</body>
</html>