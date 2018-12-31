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
<h2>저장리스트</h2>

	<table border="1">
		<tr>
			<td>아이디</td>
			<td>번호</td>
			<td>대표이미지</td>
			<td>프로젝트제목</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		
		<c:forEach var="saveBoard" items="${requestScope.v}">
			<tr>
				<td>${saveBoard.user_id}</td>
				<td>${saveBoard.pd_no}</td>
				<td><img src="./upload/sm_${saveBoard.pd_realFile}"></td>
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
</body>
</html>