<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String id = (String)session.getAttribute("id");
%>

</head>
<body>
	<form>
	
		<!-- 세션 아이디와 글쓴 아이디가 같을때 버튼 보이게 -->
		<input type="button" value="글쓰기"/>
	</form>
</body>
</html>