<%@page import="message.db.MessageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메시지 전송</title>
<script type="text/javascript">
$(document).ready(function() { 
$('.search_member').on("keyup keypress",function(){
	$.ajax({
		url : "./SearchMember.message",
		data :  {"search" : $(".search_member").val()},
		success : function(data){
			document.getElementById("members_div").innerHTML = data;
		}
	});	
});	
});

//userList.jsp에서 검색된 아이디 선택버튼 클릭 시 이곳에서의 selectID()가 실행
//userList.jsp에서의 각각 id값을 구분하여 value값을 가져온다.  (이 페이지에서 userList.jsp를  innerHTML로 넣어주기 때문에)
function selectID(i) { //onclick="selectID(번호); 는 userList.jsp에 있다."
	var user_id = document.getElementById("select_id"+i).value; //각각의 검색된 아이디는 id값으로 끝에 고유 번호 i를 가진다.(userList.jsp에서)
	document.getElementById("fromID").value = user_id;
} 

</script>

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

<fieldset class="send_FS" name="send_FS"> 
	<label>받는사람 ID : </label>
	<input type="text" name="fromID" id="fromID">
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
</div><!-- class="send_div" -->

<div class="search_memberDiv">
	아이디 검색 : <input type="text" name="search_member" class="search_member">
	<div id="members_div"></div>
</div>
</section>

</body>
</html>