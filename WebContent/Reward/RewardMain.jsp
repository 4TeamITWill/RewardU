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
				window.open("./PermitList.ad?center="+select,'_self');
			}
		
	</script>
</head>
<body>
	
	<c:set var="center" value="${param.List }"/> 
	<c:out value="${center }"/>
	<c:set var="opt" value="${param.opt }"/>  
	<c:out value="${opt }"/>
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
		목록개수:&nbsp; ${requestScope.listCount }
		${center }
		<form>
			<table width="1000" border="0" align="center">
				<c:forEach var="list" items="${requestScope.list}" varStatus="status">
				${status.index }
				<c:if test="${status.index mod 3 eq 0 }">
				<tr>
				</c:if>
					<td align="center" width="333">
						<a href="#">
							<img src="./img/1.jpg" width="280" border="0">
						</a>
						<a href="#">
							<p>
				        		<strong>${list.pd_subject }</strong>
				        	</p>
						</a>
						<div align="left" >
							<a href="#">
				       			<span>${list.pd_category }</span>
				        	</a>
				        	<a>
				        		"point"
				        	</a>
			        	</div>
					</td>
				</c:forEach>					
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>