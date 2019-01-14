<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메시지 답변</title>
</head>
<body>

<!-- 세션id값 전달받기  -->
<% 
	String id=(String)session.getAttribute("id"); 
	//답변하는 입장에서는 자신에게 메시지를 보낸사람아이디(toID)가 곧 자신이 쓸 메시지의 받는사람아이디(fromID)가 되므로
	//실제로 request.getParameter("fromID")==메시지를 보낸 사람 ID(getToID)
	String fromID = request.getParameter("fromID");
%>

<section class="messageAnswer_sec"><!-- TOP과 FOOTER 사이를 차지하는 공간. -->
<div class="answer_div">

<form action="./SendMessageAction.message" method="post">
<!-- 보내는 사람은 사용자 본인 고정 -->
<input type="hidden" name="toID" value="<%=id%>"> 

<fieldset class="answer_FS">
	<!-- 사용자가 답변을 보내는 것이기에 받는사람의 ID는 readonly -->
	<label><b>받는사람</b> </label>
	<input type="text" name="fromID" id="fromID" value="<%=fromID%>" readonly>
	<input type="text" name="subject" class="msg_subject" placeholder="제목을 입력하세요.">
	<br/>
	<!-- 내용 -->
	<textarea name="content" class="answer_TA" placeholder="내용을 입력하세요."></textarea>
	<br/>
	<input type="submit" value="보내기" class="msg_btn">
	<input type="reset" value="취소" class="msg_btn">
</fieldset>

</form>
</div><!-- class="answer_div" -->
</section>
</body>
</html>