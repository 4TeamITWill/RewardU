<%@page import="java.sql.Timestamp"%>
<%@page import="message.db.MessageDAO"%>
<%@page import="message.db.MessageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<title>Insert title here</title>

<script type="text/javascript">
	$(document).ready(function() { 
		//문의넣기의 전송버튼 눌렀을 시
		$("#send").on("click", function() {
			
				$.ajax(
					{
						type : 'POST',
						url : "./sendToAdmin",
						//요청할 데이타
						data : { toID : $("#toID").val(), fromID : $("#fromID").val(), subject_inquiry : $("#subject_inquiry").val(), content_inquiry : $("#content_inquiry").val()},
						
						//요청에 성공 했을떄...응답데이터 받기 
						success : function(result){
							//성공적으로 메시지를 보냈다면
							if(result == 1){
								//메시지 작성란을 공백으로 초기화
								$("#subject_inquiry").val("");
								$("#content_inquiry").val("");
								alert("문의사항이 성공적으로 전송되었습니다.");
							}else{
								alert("전송 실패")
							}
						}
		
					} //중괄호의 닫는 부분 
				); //ajax닫는부분
		});// $.ajax메소드의 닫는 부분
		
		//다시쓰기버튼 눌렀을 시
		$("#rewrite").on("click", function name() {
			$("#subject_inquiry").val("");
			$("#content_inquiry").val("");
		});
	});//ready함수 닫는 부분 	
</script>

</head>
<body>
<!-- id세션 받기 -->
<%
	String id = (String)session.getAttribute("id"); 
	
if(id != null){//사용자가 로그인한 상태일 때만 문의하기 메시지가 생성됨!
%>
<div id="quick_menu">
	<!-- 
	<h3>
		<img src="img/quick_title.png" alt="퀵 메뉴" />
	</h3> -->
	<ul>
		
		<li class="msg_box">
			<label class="quick_label"></label>
			<a> <!-- 메시지모양 버튼 -->
				<img src="img/messageIcon.png" class="msg_img" alt="메시지 보내기" />
			</a>
		</li>
		<li>
			<div class="quick_msg">
				<!-- 닫기 버튼 이미지 -->
				<span class="quit_btn">&times;</span><br/>
				<!-- 보내는 사람 : 사용자, 받는 사람 : 관리자(rewardu4@gmail.com 로 고정 -->
				<input type="hidden" name="toID" id="toID" value="<%=id%>">
				<input type="hidden" name="fromID" id="fromID" value="rewardu4@gmail.com">
				<input type="text" name="subject" id="subject_inquiry" placeholder="제목을 입력하세요.">
				<textarea name="content" id="content_inquiry" placeholder="문의사항을 입력하세요."></textarea><br/>
				<input type="button" value="전송" id="send">
				<input type="button" value="다시쓰기" id="rewrite">
			</div>
		</li>
		<!-- <li>
			<a href="#">
				<img src="img/quick_top_btn.png" alt="상단으로 이동" />
			</a>
		</li> -->
	</ul>
</div>
<%
}//if(id != null) 끝
%>
</body>
</html>