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
		<input type="text" name="user_id" id="user_id">
		<input type="button" value="검색" onclick="member();">
		<c:if test="${msg == 1 }">
			<c:forEach var="mlist" items="${memberList }">
				<div>${mlist.user_id }</div>
				<div>${mlist.user_phone }</div>
				<div>${mlist.user_birth }</div>
				<div>${mlist.user_name }</div>
				<div>${mlist.user_status }</div>
				<div>${mlist.user_regDate }</div>
				<div><a href="member_ban.ad?user_id=${mlist.user_id }">정지</a></div>
			</c:forEach>
		</c:if>
		
		<c:if test="${msg == 0 }">
			<div>검색결과가 없습니다.</div>	
		</c:if>
		
		
	
</body>
</html>