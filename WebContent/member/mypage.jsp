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
<link href="css/etc.css" rel="stylesheet">



<%
 	MemberBean mbean = new MemberBean();
	MemberDAO mdao = new MemberDAO();
	mbean = (MemberBean)session.getAttribute("mbean");
	String id = (String)session.getAttribute("id");
%>

<style type="text/css">
.container{ align: center;
}

.margin{margin-top: 100px;}
.margin2{margin-top: 50px;}
.margin3{margin-top: 20px;}
.margin4{margin-bottom: 100px;}

</style>


</head>
<body>

<div class="wrap">

<div class="container">
	
	<div id="mypage_content" align="center">
	<h2>마이페이지</h2>
	<form action="./MemberModifyAction.me" method="post">
		
		<!-- profile photo -->
				<img src="img/usernull.png" width="200" height="200"><br>
				<input type="button" value="프로필 사진 수정"><br>
				<div class="margin3"></div>
		<fieldset>
		<!-- id -->
				<input type="text" name="user_id" value="${sessionScope.id }" class="inp-field" readonly><br>
		<!-- name -->
				<input type="text" name="user_name" value="<%=mbean.getUser_name()%> " class="inp-field"><br>
		<!-- date of Birth -->
				<input type="text" name="birthyyyy" value="${mbean.birthyyyy }" class="inp-field w120">
				<input type="text" name="birthmm" value="${mbean.birthmm }" class="inp-field w108">
				<input type="text" name="birthdd" value="${mbean.birthdd }" class="inp-field w108"><br>
		<!-- phone -->
				<input type="text" name="user_phone" value="${mbean.user_phone }" class="inp-field"><br>
		<!-- content --> 자기소개 및 하고싶은 말<br>
				<textarea rows="6" cols="47" name="user_content">
					${mbean.user_content }
				</textarea>
			
			</fieldset>
			<fieldset>
				<input type="submit" value="정보수정" class="btn1 w175">

				<!-- <input type="button" value="비밀번호 수정" class="btn w175" onclick="location.href='./Main.me'"> -->

				<input type="button" value="메인으로" class="btn w175" onclick="location.href='./Main.me'">
			</fieldset>
					
	</form>

		<h5><a href="./MemberModifyPw.me">비밀번호 수정하기</a> &nbsp;| &nbsp;<a href="./MemberDelete.me">리듀 회원탈퇴</a></h5>

		
	</div><!-- mypage_content -->

</div><!-- container -->

</div><!-- wrap -->


</body>
</html>