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
		td{.3 
			border: solid;
		}
	</style>
	<script type="text/javascript">
		
			function change(){
				var select = document.getElementById("select").value;
				window.open("./PermitList.ad?center="+select,'_self');
			};
			
			function loadmore(){
				var center = $('#opt').val();
				var pageNum = $('#pageNum').val();
				var totalPage = $('#totalPage').val();
				pageNum++;
				console.log(pageNum);
				console.log(totalPage);
				$.ajax({
					url : "./PermitMore.ad",
					type: "POST",
					data:({pageNum:pageNum , center:center}),
					success:function(data){
						//table 영역 내 맨뒤로 붙임
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
	<c:set var="opt"  value="${param.opt }"/>
<%-- 	<jsp:include page="./Top.jsp"/> --%>
	<div align="right">
		<select id="select" onchange="change()" >
			<option value="pd_start"<c:if test="${opt eq 'pd_start'}">selected</c:if>>등록일</option>
			<option value="pd_end"<c:if test="${opt eq 'pd_end'}">selected</c:if>>마감일</option>
			<option value="pd_curMoney"<c:if test="${opt eq 'pd_curMoney'}">selected</c:if>>현재금액</option>
			<option value="pd_category"<c:if test="${opt eq 'pd_category'}">selected</c:if>>분류</option>
			<option value="pd_goalMoney"<c:if test="${opt eq 'pd_goalMoney'}">selected</c:if>>목표금액</option>
		</select>
	</div>
	<hr>
	<div class="center">
		<form>	
			<jsp:include page="RewardMore.jsp"/>
		</form>
			
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
	</div>
	
</body>
</html>