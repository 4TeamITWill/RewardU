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
<style type="text/css">
/* 퀵메뉴 */
#quick_menu {
	width: 95px;
	text-align: center;
	position: absolute;
	bottom: 0px;
	right: 0.5%;
}
.quick_msg{border: 1px solid red;
	position: absolute;
	bottom: 0px;
	right: 5%;
	width: 300px; height: 300px;
	display: none; 
}
.quit_btn{width: 30px; height: 15px;}
</style>

<script type="text/javascript">
	$(document).ready(function() { //문의넣기의 전송버튼 눌렀을 시
		$("#send").on("click", function() {
			
				$.ajax(
					{
						type : 'POST',
						url : "./sendToAdmin",
						//요청할 데이타
						data : { toID : $("#toID").val(), fromID : $("#fromID").val(), subject : $("#subject").val(), content : $("#content").val()},
						
						//요청에 성공 했을떄...응답데이터 받기 
						success : function(result){
							//성공적으로 메시지를 보냈다면
							if(result == 1){
								//메시지 작성란을 공백으로 초기화
								$("#subject").val("");
								$("#content").val("");
								alert("문의사항이 성공적으로 전송되었습니다.");
							}else{
								alert("전송 실패")
							}
						}
		
					} //중괄호의 닫는 부분 
				); //ajax닫는부분
		});// $.ajax메소드의 닫는 부분
	});//ready함수 닫는 부분 	
</script>

</head>
<body>
<!-- id세션 받기 -->
<%String id = (String)session.getAttribute("id"); %>
<div id="quick_menu">
	<!-- 
	<h3>
		<img src="img/quick_title.png" alt="퀵 메뉴" />
	</h3> -->
	<ul>
		
		<li>
			<a> <!-- 메시지모양 버튼 -->
				<img src="img/messageIcon.png" width="50px" height="50px" class="quick_img" alt="메시지 보내기" />
			</a>
		</li>
		<li>
			<div class="quick_msg">
				<!-- 닫기 버튼 이미지 -->
				<img src="img/quit.png" class="quit_btn"><br/>
				<!-- 보내는 사람 : 사용자, 받는 사람 : 관리자 로 고정 -->
				<input type="hidden" name="toID" id="toID" value="<%=id%>">
				<input type="hidden" name="fromID" id="fromID" value="rewardu4@gmail.com">
				<input type="text" name="subject" id="subject" placeholder="제목">
				<textarea name="content" id="content" placeholder="문의사항"></textarea>
				<input type="button" value="전송" id="send">
		
			</div>
		</li>
		<!-- <li>
			<a href="#">
				<img src="img/quick_top_btn.png" alt="상단으로 이동" />
			</a>
		</li> -->
	</ul>
</div>
</body>
</html>