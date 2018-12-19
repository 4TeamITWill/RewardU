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
<% 
	String id=(String)session.getAttribute("id"); 
	//답변하는 입장에서는 자신에게 메시지를 보낸사람아이디(toID)가 곧 자신이 쓸 메시지의 받는사람아이디(fromID)가 되므로
	//실제로 request.getParameter("fromID")==메시지를 보낸 사람 ID(getToID)
	String fromID = request.getParameter("fromID");
%>


<form action="./SendMessageAction.message" method="post">

<fieldset>
	<label>보내는 사람 ID : </label> 
	<input type="text" name="toID" value="<%=id%>" readonly>
	<label>받는사람 ID : </label>
	<input type="text" name="fromID" value="<%=fromID%>" readonly>
	<label>제목 : </label>
	<input type="text" name="subject">
	<br/>
	<label>내용 : </label>
	<textarea rows="10" cols="40" name="content"></textarea>
</fieldset>

<fieldset>
	<input type="submit" value="Send" class="submit">
	<input type="reset" value="Cancel" class="cancel">
</fieldset>	
</form>


</body>
</html>