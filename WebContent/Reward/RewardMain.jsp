<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	
	<style type="text/css">
	body{
			width: auto;
		}
		.category{
			width: 0 auto;
			width: 700px;
			border:1px solid black;
			overflow: hidden;
		}
		.category div{
			border:1px solid black;
		}
		.category img{
			border-radius: 50%;
			height: 80px;
		}
		.category ul li{
			display: inline-block;
		}
		.category ul li b{
			display: block;
		}
		.select{
			width: 950px;
			margin : 0 auto;
		}
		select{
			height: 30px;
			border: none;
			color: #9966FF;
		}
		.select div{
			width: auto;
		}
		#sc{
			margin-top:20px;
			float:left;
			width: 300px;
		}
		#sr{
			margin-top:50px;
			float:right;
			width: 300px;
		}
		.center{
			clear:both;
			width: auto;
		}
		#more{
			padding-bottom:20px;
			padding-top:20px; 
		}
		
		#morebtn{
			font-size:large;
			font-weight: bold;
			color:#9966FF;
			background-color: #F6F6F6;
			border: none;
			height: auto;
			width: 950px;
		}
	</style>
	<script type="text/javascript">
		var URL = location.pathname;
		console.log(URL);
		
		
		$(document).ready(function(){
			var imgs;
			var img_count;
			var img_position = 1;
			
			imgs = $(".category ul");
			img_count = imgs.childrean().length;
			
			$('#back').click(function(){
				back();
			});
			$('#next').click(function(){
				next();
			});
			
		})
		
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
			setTimeout(function(){
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
			}, 600);
		}  
	</script>
</head>
<body>
	<input type="hidden" id="category" value="${category }">
	<div class="category" align="center">
			<img src="">
			<ul>
				<li><a href="./PermitList.ad?category=N"><img src="./img/category/Tech.jpg" width="80" border="0"></a><b>전체 보기</b></li>
				<li><a href="./PermitList.ad?category=패션뷰티"><img  src="./img/category/Tech.jpg" width="80" border="0"></a><b>패션·뷰티</b></li>
				<li><a href="./PermitList.ad?category=테크가전"><img src="./img/category/Tech.jpg" width="80" border="0"></a><b>테크·가전</b></li>
				<li><a href="./PermitList.ad?category=반려동물"><img  src="./img/category/Tech.jpg" width="80" border="0"></a><b>반려동물</b></li>
				<li><a href="./PermitList.ad?category=푸드"><img src="./img/category/Tech.jpg" width="80" border="0"></a><b>푸드</b></li>
				<li><a href="./PermitList.ad?category=홈리빙디자인소품"><img src="./img/category/Tech.jpg" width="80" border="0"></a><b>홈리빙·디자인</b></li>
				<li><a href="./PermitList.ad?category=게임스포츠"><img src="./img/category/Tech.jpg" width="80" border="0"></a><b>게임·스포츠</b></li>
				<li><a href="./PermitList.ad?category=여행레저"><img src="./img/category/Tech.jpg" width="80" border="0"></a><b>여행·레저</b></li>
				<li><a href="./PermitList.ad?category=문화교양"><img src="./img/category/Tech.jpg" width="80" border="0"></a><b>문화·교양</b></li>
				<li><a href="./PermitList.ad?category=소셜캠페인"><img src="./img/category/Tech.jpg" width="80" border="0"></a><b>소셜·캠페인</b></li>
				<li><a href="./PermitList.ad?category=교육키즈"><img src="./img/category/Tech.jpg" width="80" border="0"></a><b>교육·키즈</b></li>
			</ul>
			<img src="">
	</div>
	<c:set var="center" value="${Reward_center }"/>
	<div class="select">
		<div id="sc" align="left">	
				<h2>
				<c:choose>
					<c:when test="${category eq 'N' }">
					전체보기
					</c:when>
					<c:when test="${category eq '패션뷰티' }">
					패션·뷰티
					</c:when>
					<c:when test="${category eq '테크가전' }">
					테크·가전
					</c:when>
					<c:when test="${category eq '반려동물' }">
					반려동물
					</c:when>
					<c:when test="${category eq '푸드' }">
					푸드
					</c:when>
					<c:when test="${category eq '홈리빙디자인소품' }">
					홈리빙·디자인소품
					</c:when>
					<c:when test="${category eq '게임스포츠' }">
					게임·스포츠
					</c:when>
					<c:when test="${category eq '여행레저' }">
					여행·레저
					</c:when>
					<c:when test="${category eq '문화교양' }">
					문화·교양
					</c:when>
					<c:when test="${category eq '소셜캠페인' }">
					소셜·캠페인
					</c:when>
					<c:when test="${category eq '교육키즈' }">
					교육·키즈
					</c:when>
				</c:choose>
				</h2>
		</div>
		<div id="sr" align="right">
				<c:set var="result"  value="${param.result }"/>
				<select id="result" onchange="change()">
					<option value="A" <c:if test="${result eq 'A'}">selected</c:if>>전체</option>
					<option value="0" <c:if test="${result eq '0'}">selected</c:if>>펀딩중</option>
					<option value="1" <c:if test="${result eq '1'}">selected</c:if>>성공된</option>
					<option value="2" <c:if test="${result eq '2'}">selected</c:if>>실패된</option>
				</select>
			
				<c:set var="order"  value="${param.order }"/>
				<select id="order" onchange="change()">
					<option value="7"<c:if test="${order eq '7'}">selected</c:if>>추천수</option>
					<option value="8"<c:if test="${order eq '8'}">selected</c:if>>조회수</option>
					<option value="5"<c:if test="${order eq '5'}">selected</c:if>>최신순</option>
					<option value="12"<c:if test="${order eq '12'}">selected</c:if>>참여자순</option>
				</select>
		</div>
	</div>
	<hr style="clear: both;">
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
			<td colspan="3" align=>
			<c:if test="${currentPage < pageCount }">
				<div id="more" class="btns" align="center">
					<input type="hidden" id="order" value="${order }">
					<input type="hidden" id="result" value="${result }">
					<input type="hidden" id="currentPage" value="${currentPage }">
					<input type="hidden" id="pageCount" value="${pageCount }">
					<input id="morebtn" type="button" onclick="loadmore()" value="더보기">
				</div>
				<div class="loading"></div>
			</c:if>
			</td>
		</tr>
	</div>

</body>
</html>