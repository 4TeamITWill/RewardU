<%@page import="admin_db.BoardBean"%>
<%@page import="admin_db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//게시글 번호 받기
	int pd_no = Integer.parseInt(request.getParameter("pd_no"));
	//아이디 받기
	String user_id = request.getParameter("user_id");
	
	int result; // result는 Good메소드로 리턴받는 값을 저장하기 위한 변수
					//Good메소드가 1을 리턴하면 좋아요를 한것, 0을 리턴하면 좋아요를 취소한것
	
	BoardDAO gdao = new BoardDAO();
	result = gdao.Good(user_id, pd_no); //good테이블에 좋아요(1), 좋아요 취소(0) 상황에 따라 DB작업 (INSERT 또는 DELETE)
	
	BoardDAO bdao = new BoardDAO();
	if(result==1){//좋아요
		bdao.upGood(pd_no);//pd_no에 해당하는 게시글의 좋아요 수(pd_no)값을 올려주는 메소드
	}
	else if(result==0){//좋아요 취소
		bdao.downGood(pd_no);//pd_no에 해당하는 게시글의 좋아요 수(pd_no)값을 내려주는 메소드
	}
	BoardBean bdto = new BoardBean();
	bdto = bdao.getBoard(pd_no);//좋아요 수가 변경되었기 때문에 새로 board테이블 객체를 얻어오고
	int good_qty = bdto.getPd_good(); //좋아요 수를 따로 저장한다. 그리고 아래 json방식 응답으로 좋아요개수를 넘겨준다.
	
%>

{
	"good_qty" : <%=good_qty%> ,
	"result" : <%=result%>
}