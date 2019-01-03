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
	</style>
	<script type="text/javascript">
		
		
	
			function change(){
				
				var select = document.getElementById("select").value;
				var order = document.getElementById("order").value;
				if(select == "all"){
					window.open("./PermitListcategory.ad?&category=뷰티&order="+order,'_self');
				}else{
					window.open("./PermitListcategory.ad?&category=뷰티&select="+select+"&order="+order,'_self');	
				}
				
			};
			
			function loadmore(){
				var order = $('#opt').val();
				var pageNum = $('#pageNum').val();
				var totalPage = $('#totalPage').val();
				pageNum++;
				console.log(pageNum);
				console.log(totalPage);
				$.ajax({
					url : "./PermitMore.ad",
					type: "POST",
					data:({pageNum:pageNum , order:order}),
					success:function(data){
						//form 영역 내 맨뒤로 붙임
						if(pageNum < totalPage){
							$('form').append(data);
							//페이지 넘버 최신화
							$('#pageNum').val(pageNum);
						}else if(pageNum = totalPage){
							$('form').append(data);
							$('#more').hide();
						}
						
					},	
					error:function(xhr,status,error){
						alert(error);
					}
				});
			}
			
	</script>
</head>
<body>
	<div align="center">
		<a href="./PermitList.ad?"><img src="./img/category/Tech.jpg" width="80" border="0"></a>
		<a href="./PermitListcategory.ad?category=전자"><img src="./img/category/Tech.jpg" width="80" border="0"></a>
		<a href="./PermitListcategory.ad?category=패션"><img src="./img/category/Fashion.jpg" width="80" border="0"></a>
		<a href="./PermitListcategory.ad?category=뷰티"><img src="./img/category/Cosmetics.jpg" width="80" border="0"></a>
		<a href="./PermitListcategory.ad?category=스포츠"><img src="./img/category/GYM.jpg" width="80" border="0"></a>
		<a href="./PermitListcategory.ad?category=공연"><img src="./img/category/Concert.jpg" width="80" border="0"></a>
		<a href="./PermitListcategory.ad?category=책"><img src="./img/category/Book.jpg" width="80" border="0"></a>
		<a href="./PermitListcategory.ad?category=취미"><img src="./img/cat\egory/Game.jpg" width="80" border="0"></a>
	</div>
	<hr>
	<h2>뷰티</h2>
	<div align="right">
		<span>
			<form id="keword">
				<label>
					<input id="search_text" type="search" placeholder="검색" value><button id="search" type="button" onclick="change()">검색</button>
				</label>
			</form>
		</span>
		<span>
			<c:set var="select"  value="${param.select }"/>
			<select id="select" onchange="change()">
					<option value="all" <c:if test="${select eq 'all'}">selected</c:if>>전체</option>
				<option value="0" <c:if test="${select eq '0'}">selected</c:if>>펀딩중</option>
				<option value="1" <c:if test="${select eq '1'}">selected</c:if>>성공된</option>
				<option value="-1" <c:if test="${select eq '-1'}">selected</c:if>>실패된</option>
			</select>
		</span>
		<span>
			<c:set var="opt"  value="${param.opt }"/>
			<select id="order" onchange="change()" >
				<option value="pd_good"<c:if test="${opt eq 'pd_good'}">selected</c:if>>추천수</option>
				<option value="pd_count"<c:if test="${opt eq 'pd_count'}">selected</c:if>>조회수</option>
				<option value="pd_goalmoney"<c:if test="${opt eq 'pd_goalmoney'}">selected</c:if>>펀딩액순</option>
				<option value="pd_start"<c:if test="${opt eq 'pd_start'}">selected</c:if>>최신순</option>
				<option value="pd_participant"<c:if test="${opt eq 'pd_participant'}">selected</c:if>>참여자순</option>
			</select>
		</span>
	</div>
	<hr>
	<div class="center">
		<form>	
			<jsp:include page="RewardMore.jsp"/>
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
	
		<tr id="loadmore">
			<td colspn="5">
				<div id="more" class="btns">
					<input type="hidden" name="opt" id="opt" value="${param.opt }"/>
					<input type="hidden" name="pageNum" id="pageNum" value="${currentPage }"/>
					<input type="hidden" name="totalPage" id="totalPage" value="${totalPage }"/>
					<input type="hidden" name="endPage" id="endPage" value="${endPage }"/>
					<a href="javascript:loadmore();">더보기</a>
				</div>
			</td>
		</tr>
</body>
</html>