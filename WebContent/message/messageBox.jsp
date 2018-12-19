<%@page import="message.db.MessageDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="message.db.MessageDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="message.db.MessageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">

$(function(){
	$('.allCheck').click(function() {
		//checkbox중에서 name이 deleteCheck인것들 중 checked되지 않은 것들은 checked 해주고
		//반대로 checked된것들은 checked를 해제한다.
		if($(":checkbox[name=deleteCheck]").prop("checked")){
			$(":checkbox[name=deleteCheck]").prop("checked", false);
		} else {
			$(":checkbox[name=deleteCheck]").prop("checked", true);
		}
	});
});
</script>

<style type="text/css">
	.sendMessage_btn{
		text-decoration: none;
		font-weight: bold;
		font-size: 15pt;
		color: green; float: right;
		background-color: #aabbcc;
	}
	.message_content{
		border-bottom: 1px solid black;
		border-top: 1px solid black;
	}
	.subject_a{
		text-decoration: none;
		color: black;
	}
	.readMessage{
		color: aabbcc;
		opacity: 0.6;
	}
</style>


</head>
<body>
	
<%
	String id=(String)session.getAttribute("id"); //세션유지 및 접속자 ID받기
	MessageDAO mdao = new MessageDAO();
	int count = mdao.getCountMessage(id); //해당 id가 받은 메시지가 몇 개인지 반환
	ArrayList list = mdao.getMessageList(id); //해당 id가 받은 메시지 목록을 list로 반환
	String Content = null; //Content의 띄어쓰기를 한 정보를 담을 변수
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일"); //날짜포맷 객체 생성
	String kind = "checkbox";
%>

<font color="red" style="font-weight: bold;">메시지는 실시간 채팅이 아닙니다. 주기적으로 페이지를 새로고침하세요.</font> <br/><br/>

<form action="./DeleteMessageCheckbox.message?id=<%=id%>" method="post">

<!-- 메시지 목록을 보여줄 테이블 -->
<table width="1000" align="center">
<%
if(count > 0){ //메시지가 존재 한다면
%>
<tr>
	<th>No.</th> <th>보낸사람</th> <th>제목</th> <!-- <th>내용</th> --> <th>날짜</th> 
	<th><input type="button" class="allCheck" value="전체선택">  <input type="submit" value="삭제"></th>
</tr>
<%
	for(int i=0; i<list.size(); i++){
		MessageDTO mdto = (MessageDTO)list.get(i);
		//글 내용이 존재 한다면 내용 엔터처리해서 얻기
		if(mdto.getContent() != null){
			Content = mdto.getContent().replace("\r\n", "<br/>");}
		if(mdto.getRead_status()==0){
%>
		<tr align="center">
			<td width="5%"><%=mdto.getNo()%></td>
			<td width="8%"><%=mdto.getToID()%></td>
			<td width="23%"><a class="subject_a" href="./ContentMessageAction.message?no=<%=mdto.getNo()%>"><%=mdto.getSubject()%></a></td>
			<%-- <td width="auto" class="message_content"><%=Content%></td> --%>
			<td width="15%"><%=sdf.format(mdto.getReg_date()) %></td>
			<td width="5%"><input type="checkbox" name="deleteCheck" value="<%=mdto.getNo()%>"></td>
			<!-- 답변을 작성하는 사용자기준에서는 메시지를 받을 사람(fromID)이 곧 자신에게 메시지를 보낸 사람(toID)이므로  fromID변수값에 getToID값을 넣어서 전달하여준다. -->
			<td width="5%"><input type="button" value="답변하기" onclick="location.href='./AnswerMessage.message?fromID=<%=mdto.getToID()%>'"></td>
		</tr>
<%
		} else {
%>
		<tr align="center">
			<td class="readMessage" width="5%"><%=mdto.getNo()%></td>
			<td class="readMessage" width="8%"><%=mdto.getToID()%></td>
			<td class="readMessage" width="23%"><a class="subject_a" href="./ContentMessageAction.message?no=<%=mdto.getNo()%>"><%=mdto.getSubject()%></a></td>
			<%-- <td width="auto" class="message_content"><%=Content%></td> --%>
			<td class="readMessage" width="15%"><%=sdf.format(mdto.getReg_date()) %></td>
			<td width="5%"><input type="checkbox" name="deleteCheck" value="<%=mdto.getNo()%>"></td>
			<!-- 답변을 작성하는 사용자기준에서는 메시지를 받을 사람(fromID)이 곧 자신에게 메시지를 보낸 사람(toID)이므로  fromID변수값에 getToID값을 넣어서 전달하여준다. -->
			<td width="5%"><input type="button" value="답변하기" onclick="location.href='./AnswerMessage.message?fromID=<%=mdto.getToID()%>'"></td>
		</tr>
<%
		}
	}//for()
%>
		
<%
} else {//if() 메시지가 없을 경우 count==0
%>
	<tr>
		<td>메시지 없음</td>
	</tr>
<%
}//else
%>

</table>
</form>
<!-- 클릭하면 sendMessage.jsp로 이동한다. -->
<input type="button" value="메시지 보내기" class="sendMessage_btn" onclick="location.href='./SendMessage.message'">
<!-- <a class="sendMessage_a" href="./SendMessage.me">메시지 보내기</a> -->


</body>
</html>