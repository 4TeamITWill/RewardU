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
			<div style="display : flex; border-bottom : 1px solid #ccc; margin-top : 2rem;">
				<div style="flex : 3; font-weight : bold;">아이디</div>
				<div style="flex : 2; font-weight : bold;">폰번호</div>
				<div style="flex : 1; font-weight : bold;">생년월일</div>
				<div style="flex : 1.5; font-weight : bold;">이름</div>
				<div style="flex : 1; font-weight : bold;">상태</div>
				<div style="flex : 2.5; font-weight : bold;">가입날짜</div>
				<div style="flex : 1; font-weight : bold;">정지</div>
			</div>
			<c:forEach var="mlist" items="${memberList }">
			<div style="display : flex; border-bottom : 1px solid #ccc; padding : 0.5rem 0;">
				<div style="flex:3;">${mlist.user_id }</div>
				<div style="flex:2;">${mlist.user_phone }</div>
				<div style="flex:1;">${mlist.user_birth }</div>
				<div style="flex:1.5;">${mlist.user_name }</div>
				<div style="flex:1;">${mlist.user_status }</div>
				<div style="flex:2.5;">${mlist.user_regDate }</div>
				<div style="flex:1;"><a href="member_ban.ad?user_id=${mlist.user_id }">정지</a></div>
			</div>
			</c:forEach>
		</c:if>
		
		<c:if test="${msg == 0 }">
			<div>검색결과가 없습니다.</div>	
		</c:if>
		
		
	
</body>
</html>