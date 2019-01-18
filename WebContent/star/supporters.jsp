<%@page import="java.util.ArrayList"%>
<%@page import="admin_db.ParticipateDAO"%>
<%@page import="admin_db.ParticipateBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.supporters_sec{
	position: relative;
	height: 600px; text-align: center;
}
.supporters_div{
	width: 630px; height: auto; text-align: center;
	left: 20%; top: 15%;
}
.support{border-bottom: 1px groove #acacac; 
	padding-bottom: 3%; margin-bottom: 5%;
	width: 620px; text-align: left;
	font-size: 18px; color: gray;
}
.support_paging{position: absolute;
	width: 200px; left: 36%;
}
.support_paging a{text-decoration: none; color: black;}
</style>
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
	ParticipateBean pbean = new ParticipateBean();
	ParticipateDAO pdao = new ParticipateDAO();
	int pd_no = Integer.parseInt(request.getParameter("pd_no"));
	ArrayList<ParticipateBean> list = new ArrayList<ParticipateBean>();
	list = pdao.getParticipateList(pd_no, startRow, pageSize);
	int count = pdao.getCountSupporters(pd_no);
%>
<section class="supporters_sec">


<table style="margin-left: auto; margin-right: auto; margin-top: 10%;">
	
	<tr>
	<c:choose>
		<c:when test="<%=list.size()==0%>">
		<td>
			<div class="supporters_div">
				<font style="font-family: sans-serif;"><b>참여자가 없습니다.</b></font>
			</div>
		</td>
		</c:when>
		<c:otherwise>
		<td>
			<div class="supporters_div">
				<c:forEach var="list" items="<%=list%>">
					<div class="support">
						<font color="black"><b>${list.user_id}</b></font>님이<font color="black">
						<b>${list.par_money}원</b></font>으로 참여 하셨습니다.
					</div>
				</c:forEach>
			</div>
		</td>
		</c:otherwise>
	</c:choose>
	</tr>

</table>
<!-- 페이징 처리 -->
<div class="support_paging">
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
			<a href="./supporters.ad?pd_no=<%=pd_no %>&pageNum=<%=startPage-pageBlock%>">이전</a>
<%			
		}
		if(count > pageSize){
		// [1][2][3]...[10]
		for(int i=startPage; i<=endPage; i++){
%>
			<a href="./supporters.ad?pd_no=<%=pd_no %>&pageNum=<%=i%>"><%=i%></a> 
<%
		}
		}
		
		//[다음] 끝페이지번호가 전체페이수보다 작을 때...
		if(endPage < pageCount){
%>
			<a href="./supporters.ad?pd_no=<%=pd_no %>&pageNum=<%=startPage+pageBlock%>">다음</a>
<%
		}	
	}
%>
</div><!-- class="page_control" -->

</section>
</body>
</html>