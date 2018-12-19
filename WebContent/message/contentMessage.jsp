<%@page import="message.db.MessageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.content_div{position: relative;}
	.content_func{width: 15%;}
	. class="content_result"{width: auto;}
	.content_table td{
		border: 1px solid black;
		text-align: center;
	}
	.content_btn{
		position: absolute;
		text-align: center;
		left: 555px;
	}

</style>

</head>
<body>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	MessageDTO mdto = new MessageDTO();
	mdto = (MessageDTO)session.getAttribute("mdto");
	String kind = "button";
	String Content = null;
	//글 내용이 존재 한다면 내용 엔터처리해서 얻기
	if(mdto.getContent() != null){
		Content = mdto.getContent().replace("\r\n", "<br/>");}
%>
<!-- 메시지 내용을 보여줄 테이블 -->
<div class="content_div">
	<table width="500" align="center" class="content_table">
		<tr>
			<td class="content_func">보낸사람</td>
			<td class="content_result"><%=mdto.getToID() %></td>
		</tr>
		<tr>
			<td class="content_func">제목</td>
			<td class="content_result"><%=mdto.getSubject() %></td>
		</tr>
		<tr>
			<td class="content_func">내용</td>
			<td class="content_result"><%=Content %></td>
		</tr>
	</table>
	
	<div class="content_btn">
		<!-- 번호와 아이디를 넘겨주어 해당 메시지를 삭제 할 수 있도록함 -->
		<input type="button" value="삭제" onclick="location.href='./DeleteMessageButton.message?id=<%=id%>&no=<%=mdto.getNo()%>'">
		<!-- 답변을 작성하는 사용자기준에서는 메시지를 받을 사람(fromID)이 곧 자신에게 메시지를 보낸 사람(toID)이므로  fromID변수값에 getToID값을 넣어서 전달하여준다. -->
		<input type="button" value="답변하기" onclick="location.href='./AnswerMessage.message?fromID=<%=mdto.getToID()%>'">
		<!-- 메시지함으로  -->
		<input type="button" value="돌아가기" onclick="location.href='./MemberMessage.message'">
	</div>
</div>
</body>
</html>