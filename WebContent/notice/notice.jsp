<%@page import="java.text.SimpleDateFormat"%>
<%@page import="notice.db.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="notice.db.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>

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
	//			(현재 보여질 페이지번호 - 1) * 한페이지당 보여줄 글개수 
	int startRow = (currentPage - 1) * pageSize;
%>
<%
	String id = (String)session.getAttribute("id");
	NoticeDAO ndao = new NoticeDAO();
	ArrayList<NoticeDTO> list = ndao.getNoticeList(startRow, pageSize); //공지사항 테이블에 저장되있는 데이터를 리스트로 담아서 가져오기
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); //날짜포맷 객체 생성
	int count = ndao.getCountNotice(); 
%>


<section class="notice_sec"><!-- TOP과 FOOTER 사이를 차지하는 공간. -->
<div class="notice_head"><font size="7" style="font-weight: bold">공지사항 </font></div>
<div class="notice_div"><!-- 실제로 공지사항을 담는 공간 -->
	<table>
<%
if(count > 0){ //공지사항 글이 있다면
	for(int i=0; i<list.size(); i++){
%>
	<br/>
	<tr>
		<div class="notices">
			<font color="#b44af7" size="2" style="font-weight: bold">공지</font><br/>
			<a href="./ContentNotice.no?no=<%=list.get(i).getNo()%>"><font size="5" style="font-weight: bold"><%=list.get(i).getSubject() %> </font></a><br/>
			<font color="#aaaaaa" size="2" style="font-weight: bold"><%=sdf.format(list.get(i).getReg_date())%></font>
		</div>
	</tr>
	<br/>
<%
	}
%>
	</table>
<%
} else {//공지글이 없다면
%>
	공지사항 없음
<%	
}
%>
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
			<a href="./Notice.no?pageNum=<%=startPage-pageBlock%>">이전</a>
<%			
		}
		// [1][2][3]...[10]
		for(int i=startPage; i<=endPage; i++){
%>
			<a href="./Notice.no?pageNum=<%=i%>"><%=i%></a> 
<%
		}
		
		//[다음] 끝페이지번호가 전체페이수보다 작을 때...
		if(endPage < pageCount){
%>
			<a href="./Notice.no?pageNum=<%=startPage+pageBlock%>">다음</a>
<%
		}	
	}
%>
</div><!-- class="page_control" -->

</div><!-- class="notice_div -->
<%
	if(id != null && id.equals("rewardu4@gmail.com")){
%>
	<div class="admin_div">
		<input type="button" value="공지 등록" onclick="location.href='./WriteNotice.no'"/>
	</div>
<%
	} else{}
%>
</section>

</body>
</html>