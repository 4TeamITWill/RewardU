<%@page import="reward.db.RewardDAO"%>
<%@page import="java.util.Vector"%>
<%@page import="reward.db.RewardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String keyWord = request.getParameter("keyWord");
	RewardDAO dao = new RewardDAO();
	int count = dao.getSearchCount(keyWord);
			
%>

<h3 align="center"><%=keyWord%>로 검색한 결과 입니다.</h3>

<%
	 Vector<RewardBean> v = dao.getSearchList(keyWord);

	//만약에 게시판의 글이 있다면 
	if(count > 0){
		
%>

<h4 align="center"><%=count%>개의 결과를 찾았습니다.</h4>
	
	<table border="1">
	

		<c:forEach var="Board" items="${requestScope.v}">
			<tr>
				<td>
					${Board.user_id}<br/>
					${Board.pd_no}<br/>
					<a href="#.fu?pd_no=${Board.pd_no}">
						<img src="./upload/sm_${Board.pd_realFile}">
					</a><br/>
					${Board.pd_subject}<br/>
					${Board.company}<br/>
					${Board.pd_category}<br/>
					${Board.pd_curMoney}<br/>
					${Board.pd_start}
				</td>
			</tr>
			</a>
		</c:forEach>
<%
	
	}else{//게시판에 글이 없다면 
%>
			<tr>
				<td align="center"><h4>검색 결과 없음</h4></td>
			</tr>
<%	
	 }
%>		
		
	</table>
</body>
</html>