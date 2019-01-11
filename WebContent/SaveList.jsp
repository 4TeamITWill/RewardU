<%@page import="reward.db.SaveBoard"%>
<%@page import="java.util.Vector"%>
<%@page import="reward.db.RewardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Save List</title>
</head>
<body>

<div class="saveList_content" style="width : 800px; margin : 0 auto;">
<h3>임시저장된 글 목록입니다. <br/><font style="font-size : 15px;">수정을 클릭하여 이어서 작성할 수 있습니다.</font></h3>

	<table width="100%" style="margin-top :4rem;">
		<tr>
			<td><font style="font-weight : bold;">아이디</font></td>
			<td><font style="font-weight : bold;">번호</font></td>
			<td><font style="font-weight : bold;">대표이미지</font></td>
			<td><font style="font-weight : bold;">프로젝트제목</font></td>
			<td><font style="font-weight : bold;">수정</font></td>
			<td><font style="font-weight : bold;">삭제</font></td>
		</tr>
		
	
			<c:forEach var="saveBoard" items="${requestScope.v}" varStatus="a">	
			<tr>
				<td>${saveBoard.user_id}</td>
				<td>${saveBoard.pd_no}</td>
				<td>
				
		          <!--이미지 null이면 기본이미지뜨게 추가!!!-->
					<c:choose>
						<c:when test="${saveBoard.pd_realFile eq ''}">
							<img src="./upload/sm_no_img.jpg">
						</c:when>
						<c:otherwise>
							 <img src="./upload/sm_${saveBoard.pd_realFile}">
						</c:otherwise>
					</c:choose> 
			
				
				</td>
				<td>${saveBoard.pd_subject}</td>
				<td>
					<button onclick="location.href='RewardingSaveGet.fu?user_id=${saveBoard.user_id}&pd_no=${saveBoard.pd_no}'">
					수정 
					</button>	
				</td>
				<td>
					<button onclick="location.href='RewardingSaveDelete.fu?user_id=${saveBoard.user_id}&pd_no=${saveBoard.pd_no}'">
					삭제
					</button>
				</td>
			</tr>
			</c:forEach>
		
			

	</table>
</div>	
</body>
</html>