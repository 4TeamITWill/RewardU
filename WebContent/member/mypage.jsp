<%@page import="member.db.MemberDAO"%>
<%@page import="member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리듀 | Mypage</title>
<link href="css/main3.css" rel="stylesheet">



<%
 	MemberBean mbean = new MemberBean();
	MemberDAO mdao = new MemberDAO();
	mbean = (MemberBean)session.getAttribute("mbean");
	String id = (String)session.getAttribute("id");
%>

<style type="text/css">
.container{ align: center;
}
</style>


</head>
<body>
<jsp:include page="../top.jsp"/>

<div class="wrap">

<div class="container">
	
	<div id="mypage_content" align="center">
	<h2>마이페이지</h2>
	<form action="./MemberModifyAction.me">
		<fieldset >
		
				id<input type="text" name="user_id" value="${sessionScope.id }" readonly><br>
				Name<input type="text" name="user_name" value="<%=mbean.getUser_name()%> "><br>
				DOB<input type="text" name="birthyyyy" value="${mbean.birthyyyy }">|
				<input type="text" name="birthmm" value="${mbean.birthmm }">|
				<input type="text" name="birthdd" value="${mbean.birthdd }"><br>
				phone<input type="text" name="user_phone" value="${mbean.user_phone }">
			
			</fieldset>
			<fieldset>
				<input type="submit" value="정보수정">
				<input type="button" value="메인으로" onclick="location.href='./Main.me'">
				<input type="button" value="회원탈퇴" onclick="location.href='./MemberDelete.me'">
			</fieldset>
	</form>
	</div><!-- mypage_content -->

</div><!-- container -->

</div><!-- wrap -->


<jsp:include page="../footer.jsp"/>
</body>
</html>