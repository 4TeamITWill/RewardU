<%@page import="message.db.MessageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메시지 전송</title>
<script type="text/javascript">
/* 
$(document).ready(function() { 
	$('search_user').keyup(function() {
		$.ajax(
				{
					type : 'get',
					url : "message/search_user.jsp",
					//요청할 데이타 (사용자 아이디와 게시글 번호를 넘겨준다.)
					data : { },
					//응답데이터의 타입 지정   -> json :  json은 javascript의 객체 형태로 받는다.
					dataType : "json",
					//요청에 성공 했을떄...응답데이터 받기 
					success : function(responseData, status, jqxhr){
						//좋아요를 했다면
						if(responseData.result == 1){
							$('.good_qty').html(responseData.good_qty); 
						}
						//좋아요 취소했다면
						else if(responseData.result == 0){
							$('.good_qty').html(responseData.good_qty);
						}
					},
					//요청에 실패 하면..
					err : function(jqxhr, status, error){
						//에러 정보를 웹브라우저의 콘솔 탭에 출력
						console.log(error);
					}
	
				} //중괄호의 닫는 부분 
			); //ajax닫는부분
	});
});
 */
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
</div><!-- class="send_div" -->

<div class="search_user">
아이디 검색 : <input type="text" name="search_user" class="search_user">
</div>
</section>
</body>
</html>