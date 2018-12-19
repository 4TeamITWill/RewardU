<%@page import="member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리듀 | 아이디 찾기</title>


</head>
<body>
<h2>너의 아이디는 ${requestScope.mbean.user_id }란다</h2>

<input type="button" value="메인으로" onclick="location.href='./Main.me'"/>

</body>
</html>