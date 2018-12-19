<%@page import="message.db.MessageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- 세션id값 전달받기  -->
	<% String id=(String)session.getAttribute("id"); %>

<!-- 메시지 작성을 마치고 Send버튼을 눌렀을 시 실제 메시지 작업을하는  SendMessageAction.java로 -->
<form action="./SendMessageAction.message" method="post">
<fieldset>
	<label>보내는 사람 ID : </label> 
	<!-- 보내는사람은 접속한 사용자ID로 고정 -->
	<input type="text" name="toID" value="<%=id%>" readonly>
	<label>받는사람 ID : </label>
	<input type="text" name="fromID">
	<label>제목 : </label>
	<input type="text" name="subject">
	<br/>
	<label>내용</label><br/>
	<textarea rows="10" cols="100" name="content"></textarea>
</fieldset>

<fieldset>
	<input type="submit" value="Send" class="submit">
	<input type="reset" value="Cancel" class="cancel">
</fieldset>	
</form>

</body>
</html>