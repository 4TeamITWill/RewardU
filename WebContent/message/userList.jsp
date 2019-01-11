<%@page import="member.db.MemberBean"%>
<%@page import="java.util.ArrayList"%>
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
	ArrayList<MemberBean> list = (ArrayList<MemberBean>)request.getAttribute("user_list");

%>
	<div id="members_div">
<%
	for(int i=0; i<list.size(); i++){
%>
		<%=list.get(i).getUser_id()%> 
		<button id="select_id<%=i%>" value="<%=list.get(i).getUser_id()%>" onclick="selectID(<%=i%>);">
		선택
		</button>
		<br/>
<%
	}
%>
	</div>
</body>
</html>