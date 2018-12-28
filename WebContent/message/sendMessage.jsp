<%@page import="message.db.MessageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메시지 전송</title>

</head>
<body>
<!-- 세션id값 전달받기  -->
<% String id=(String)session.getAttribute("id"); %>

<section class="messageSend_sec"><!-- TOP과 FOOTER 사이를 차지하는 공간. -->

<div class="send_div">
<!-- 메시지 작성을 마치고 Send버튼을 눌렀을 시 실제 메시지 작업을하는  SendMessageAction.java로 -->
<form action="./SendMessageAction.message" method="post">
<!-- 보내는 사람은 사용자 본인 고정 -->
<input type="hidden" name="toID" value="<%=id%>"> 

<fieldset class="send_FS"> 
	<label>받는사람 ID : </label>
	<input type="text" name="fromID">
	<label>제목 : </label>
	<input type="text" name="subject">
	<br/>
	<!-- 내용 -->
	<textarea name="content" class="send_TA"></textarea>
	<br/>
	<input type="submit" value="Send" class="submit">
	<input type="reset" value="Cancel" class="cancel">
</fieldset>

</form>
</div><!-- class="content_div" -->
</section>
</body>
</html>