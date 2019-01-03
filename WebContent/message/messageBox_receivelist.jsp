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
<title>받은 메시지</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">

function deleteMsg() { //삭제버튼 눌렀을 때 submit하는 함수
	document.message_form.action = './DeleteMessageCheckbox.message?divide=receive';
	document.message_form.submit();
}
function storeMsg() { //보관버튼 눌렀을 때 submit하는 함수
	document.message_form.action = './StoreMessageCheckbox.message?divide=receive';
	document.message_form.submit();
}

$(function(){
	$('.allCheck').click(function() {
		//checkbox중에서 name이 deleteCheck인것들 중 checked되지 않은 것들은 checked 해주고
		//반대로 checked된것들은 checked를 해제한다.
		if($(":checkbox[name=messageCheck]").prop("checked")){
			$(":checkbox[name=messageCheck]").prop("checked", false);
		} else {
			$(":checkbox[name=messageCheck]").prop("checked", true);
		}
	});
});
</script>

</head>
<body>
	
<%
/* 페이징에 쓰이는 변수 */
	//하나의 화면마다 보여줄 글개수
	int pageSize = 7;
	//현재 보여질(선택한) 페이지번호 가져오기
	String pageNum = request.getParameter("pageNum");
	//만약 현재선택한 페이지 번호가 없으면 1페이지로 처리
	if(pageNum == null){
		pageNum = "1";}
	/*현재 보여질(선택한) 페이지 번호 */
	int currentPage = Integer.parseInt(pageNum);
	//각페이지 마다 맨위에 첫번째로 보여질 시작 글번호 구하기
	//			(현재 보여질 페이지번호 - 1) * 한페이지당 보여줄 글개수 15
	int startRow = (currentPage - 1) * pageSize;
%>
<%
	String id=(String)session.getAttribute("id"); //세션유지 및 접속자 ID받기
	MessageDAO mdao = new MessageDAO();
	int count = mdao.getCountMessage(id,"receive"); //해당 id가 받은 메시지가 몇 개인지 반환
	ArrayList list = mdao.getMessageList(id,startRow,pageSize,"receive"); //해당 id가 받은 메시지 목록을 list로 반환
	String Content = null; //Content의 띄어쓰기를 한 정보를 담을 변수
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일"); //날짜포맷 객체 생성
	String kind = "checkbox";
%>

<section class="messageBox_sec"><!-- TOP과 FOOTER 사이를 차지하는 공간. -->
<div class="messageBox_div"><!-- 실제로 메시지함을 담는 공간 -->

<font color="red" style="font-weight: bold; float: left;">메시지는 실시간 채팅이 아닙니다. 주기적으로 페이지를 새로고침하세요.</font> <br/>

<!-- 보낸메시지, 받은 메시지, 메시기 보관함을 감싸고 있는 div -->
<div class="distinc_div">
	<a href="./MemberMessage_ReceiveList.message"><span class="msglist_span msglist_active">받은 메시지</span></a>
	<a href="./MemberMessage_SendList.message"><span class="msglist_span">보낸 메시지</span></a>
	<a href="./MemberMessage_StoreList.message"><span class="msglist_span">메시지 보관함</span></a>
</div>

<br/>

<!-- 메시지 삭제에 쓰일 form태그 -->
<form method="post" name="message_form"> 
<input type=hidden name="id" value="<%=id%>">
<!-- 메시지 목록을 보여줄 테이블 -->
<table class="message_table">
<%
if(count > 0){ //메시지가 존재 한다면
%>
<tr class="table_header">
	<th>No.</th> <th>보낸사람</th> <th>제목</th> <th>날짜</th> 
	<th><input type="button" class="allCheck" value="v"></th><!-- 누르면 모든 checkbox가 활성상태면 비활성으로, 비활성이면 활성으로 -->
</tr>
<%
	for(int i=0; i<list.size(); i++){
		MessageDTO mdto = (MessageDTO)list.get(i);
		//글 내용이 존재 한다면 내용 엔터처리해서 얻기
		if(mdto.getContent() != null){
			Content = mdto.getContent().replace("\r\n", "<br/>");}
		//만약 사용자에게 메시지를 보낸사람이 관리자이면 보낸사람이 관리자로 표시되게
		String toID = mdto.getToID();
		if(toID.equals("rewardu4@gmail.com")){
			toID = "관리자";}
		
		//읽지 않은 메시지와 읽은 메시지는 구분. 읽은메시지는 class="readMessage" 와 "subject_a" 를 주어 가시적으로 구분
		if(mdto.getRead_status()==0){
%>
		<tr align="center">
			<td width="80px"><%=mdto.getNo()%></td>
			<td width="230px"><%=toID%></td>
			<td width="500px">
			<a class="subject_a" href="./ContentMessageAction.message?no=<%=mdto.getNo()%>&divide=receive&id=<%=id%>"><%=mdto.getSubject()%></a>
			</td>
			<td width="170px"><%=sdf.format(mdto.getReg_date()) %></td>
			<td width="100px"><input type="checkbox" name="messageCheck" value="<%=mdto.getNo()%>"></td>
		</tr>
<%
		} else {
%>
		<tr align="center">
			<td class="readMessage" width="5%"><%=mdto.getNo()%></td>
			<td class="readMessage" width="8%"><%=mdto.getToID()%></td>
			<td class="readMessage" width="23%">
			<a class="subject_a" href="./ContentMessageAction.message?no=<%=mdto.getNo()%>&divide=receive&id=<%=id%>"><%=mdto.getSubject()%></a>
			</td>
			<td class="readMessage" width="15%"><%=sdf.format(mdto.getReg_date()) %></td>
			<td width="5%"><input type="checkbox" name="messageCheck" value="<%=mdto.getNo()%>"></td>
		</tr>
<%
		}
	}//for()끝
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
<br/>
<div class="messageBtn_div">
	<!-- 클릭하면 sendMessage.jsp로 이동한다. -->
	<input type="button" value="메시지 보내기" class="sendMessage_btn" onclick="location.href='./SendMessage.message'">
	<!-- <a href="./SendMessage.message" ><img alt="메시지보내기" src="img/message_img/send_msg.PNG" class="sendMessage_img"> </a> -->
	
	<!-- 클릭하면 체크된 메시지들이 삭제된다.-->
	<input type="button" value="삭제하기" onclick="deleteMsg();">
	<!-- 클릭하면 체크된 메시지들이 보관함으로 간다 -->
	<input type="button" value="보관하기" onclick="storeMsg();">
</div>

</form>

<br/><br/>
<!-- 페이징 처리 -->
<div class="page_control">
<%
	if(count > 0 ) {//게시판에 글이 있다면
		//전체 페이지수 구하기 예) 글 20개 -> 한페이지당 보여줄 글 수 10개 -> 2페이지
		//				  예) 글 25개 -> 한페이지당 보여줄 글 수 10개 -> 3페이지

		//전체 페이지수 = 전체글 / 한페이지당 보여줄 글수 + (전체글수를 한페이지에 보여줄 글 수로 나눈 나머지 값)
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		//한 화면(한 블럭)에 보여줄 페이지 수 설정
		int pageBlock = 2;
		
		//시작 페이지 번호 구하기
		//( (현재 보여질(선택한)페이지번호 / 한화면(한블럭)에 보여줄 페이지수) - (현재보여질(선택한)페이지번호를 한화면에 보여줄 페이지수로 나눈 나머지 값) ) 
		// * 한화면(한블럭)에 보여줄 페이지수 + 1
		int startPage = ((currentPage / pageBlock) - (currentPage%pageBlock==0?1:0)) * pageBlock + 1;
		
		//끝페이지 번호 구하기
		//1~10 -> 10  11~20 -> 20  21~30 -> 30
		//시작페이지번호 + 현재블럭에 보여줄 페이지 수 - 1
		int endPage = startPage + pageBlock -1;
		
		//끝페이지번호가 전체페이지수보다 클 때..
		if(endPage > pageCount){
			//끝페이지번호를 전체페이지수로 저장
			endPage = pageCount;
		}
		//[이전] 시작페이지 번호가 한 화면에 보여줄 페이지수보다 클 때..
		if(startPage > pageBlock){
%>
			<a href="./MemberMessage_ReceiveList.message?pageNum=<%=startPage-pageBlock%>">이전</a>
<%			
		}
		// [1][2][3]...[10]
		for(int i=startPage; i<=endPage; i++){
%>
			<a href="./MemberMessage_ReceiveList.message?pageNum=<%=i%>"><%=i%></a> 
<%
		}
		
		//[다음] 끝페이지번호가 전체페이수보다 작을 때...
		if(endPage < pageCount){
%>
			<a href="./MemberMessage_ReceiveList.message?pageNum=<%=startPage+pageBlock%>">다음</a>
<%
		}	
	}
%>
</div><!-- class="page_control" -->
</div><!-- class="messageBox_div" -->
</section>
</body>
</html>