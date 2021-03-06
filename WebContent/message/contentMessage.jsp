<%@page import="java.text.SimpleDateFormat"%>
<%@page import="message.db.MessageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메시지 내용</title>

</head>
<body>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	//ID받기
	String id = (String)session.getAttribute("id");
	//mdto세션값 받기
	MessageDTO mdto = new MessageDTO();
	/* 
	mdto = (MessageDTO)session.getAttribute("mdto");
	//구분값 얻기
	String divide=(String)session.getAttribute("divide");
	 */
	 
	mdto = (MessageDTO)request.getAttribute("mdto");
	String divide = (String)request.getAttribute("divide");
	
	//엔터처리한 값을 받기 위한 Content
	String Content = null;
	//글 내용이 존재 한다면 내용 엔터처리해서 얻기
	if(mdto.getContent() != null){
		Content = mdto.getContent().replace("\r\n", "<br/>");}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd [HH:mm]");
%>
<section class="messageContent_sec"><!-- TOP과 FOOTER 사이를 차지하는 공간. -->
<div class="content_div">
<!-- 메시지 내용을 보여줄 테이블 -->
<div class="msg_top">
	보낸사람  <%=mdto.getToID() %> <br/>
	받은시간  <%=sdf.format(mdto.getReg_date())%>
</div>
<br/>
<div class="msg_bottom">
	<%=Content%>
</div>
<br/>
	
	<div class="content_btn">
		<!-- 번호와 아이디를 넘겨주어 해당 메시지를 삭제 할 수 있도록함 -->
		<input type="button" value="삭제" class="msg_btn"
		onclick="location.href='./DeleteMessageButton.message?id=<%=id%>&no=<%=mdto.getNo()%>&divide=<%=divide%>'">
<%
		//보관함 -> 메시지내용  이 아닌 경우에만 보관버튼을 활성화
		if(!divide.equals("store")){
%>
		<input type="button" value="보관" class="msg_btn"
		onclick="location.href='./StoreMessageButton.message?id=<%=id%>&no=<%=mdto.getNo()%>&divide=<%=divide%>'">
<%
		}
%>
		<!-- 답변을 작성하는 사용자기준에서는 메시지를 받을 사람(fromID)이 곧 자신에게 메시지를 보낸 사람(toID)이므로  fromID변수값에 getToID값을 넣어서 전달하여준다. -->
<%		//그리고 받은 메시지에서 눌렀을 시에만 답변하기가 보이도록 한다. 보낸메시지와 보관메시지를 눌러서 내용으로 들어온 경우 답변 불가
		if(divide.equals("receive")){
%>
		<input type="button" value="답변하기" class="msg_btn"
		onclick="location.href='./AnswerMessage.message?fromID=<%=mdto.getToID()%>'">	
<%
		}

		//어느 페이지(보낸, 받은 ,보관)에서 왔는지에 따라 돌아갈 때도 원래 있던곳으로
		if(divide.equals("receive")){
%>
		<input type="button" value="돌아가기" class="msg_btn"
		onclick="location.href='./MemberMessage_ReceiveList.message'">
<%
		} else if(divide.equals("send")){
%>
		<input type="button" value="돌아가기" class="msg_btn"
		onclick="location.href='./MemberMessage_SendList.message'">
<%
		} else if(divide.equals("store")){
%>
		<input type="button" value="돌아가기" class="msg_btn"
		onclick="location.href='./MemberMessage_StoreList.message'">
<%
		}
%>
	</div>
	
</div><!-- class="content_div" -->
</section>
</body>
</html>