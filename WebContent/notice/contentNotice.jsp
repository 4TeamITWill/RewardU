<%@page import="java.text.SimpleDateFormat"%>
<%@page import="notice.db.NoticeDTO"%>
<%@page import="notice.db.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 내용</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	NoticeDAO ndao = new NoticeDAO();
	NoticeDTO ndto = new NoticeDTO();
	int no = Integer.parseInt(request.getParameter("no"));
	ndao.upReadCount(no); //조회수 올리기
	ndto = ndao.getNotice(no); //내용 가져오기
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd"); //날짜포맷 객체 생성
	
	String content = null;
	if(ndto.getContent() != null){
		content = ndto.getContent().replace("\r\n", "<br/>");}
%>
	<section class="contentNotice_sec"><!-- TOP과 FOOTER 사이를 차지하는 공간. -->
	<div class="contentNotice_div"><!-- 실제로 공지사항을 담는 공간 -->
	
		<table align="center" class="contentNotice_table" width="1000">
			<tr>
				<td><font size="5" style="font-weight: bold"><%=ndto.getSubject()%> </font></td>
			</tr>
			<tr>
				<td><%=sdf.format(ndto.getReg_date())%>&nbsp;&nbsp;조회수 <%=ndto.getRead_count()%> </td>
			</tr>
			<tr>
				<td style="text-align: left"><%=content%></td>
			</tr>
		</table>
		<div class="contentNotice_btnDiv">
			<input type="button" value="돌아가기" onclick="location.href='./Notice.no'">
<%
			if(id.equals("rewardu4@gmail.com")){
%>
			<input type="button" value="삭제" onclick="location.href='./DeleteNoticeAction.no?no=<%=ndto.getNo()%>'">
<%
			} 
%>
		</div>
	</div>
	
</section>
</body>
</html>