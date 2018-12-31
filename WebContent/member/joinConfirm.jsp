<%@page import="member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join us / 리듀</title>
<link href="css/main3.css" rel="stylesheet">
<link href="css/etc.css" rel="stylesheet">


</head>
<body>
<jsp:include page="../top.jsp"/>
<div class="wrap">
<div id="header" align="center">

	<h2>${requestScope.mbean.user_name }님 가입을 축하합니다.</h2>
</div>
<div class="container">
	<div id="join_content" align="center" >
		<form action="./Main.me" id="join" method="post">
		
		<fieldset >
		<!-- id -->
			<input type="text" name="user_id" placeholder="이메일 주소 입력" value="${requestScope.mbean.user_id }" class="inp-field"><br>
		<!-- name -->	
			<input type="text" name="user_name" value="${mbean.user_name }" class="inp-field"><br>
			<!-- <input type="password" name="user_pw" class="inp-field"><br>
			<input type="password" name="user_pw2" class="inp-field"><br> -->
		<!-- date of Birth -->	
		  &nbsp;<input type="text" name="birthyyyy" maxlength="4" placeholder="YYYY" value="${mbean.birthyyyy }" class="inp-field w120">
				<input type="text" name="birthmm" maxlength="2" placeholder="MM" value="${mbean.birthmm }" class="inp-field w108">
				<input type="text" name="birthdd" maxlength="2" placeholder="DD" value="${mbean.birthdd }" class="inp-field w108">
			<br>
		<!-- phone -->
			<input type="text" name="user_phone" value="${mbean.user_phone }" class="inp-field">
			
		</fieldset>
		<fieldset>
			<input type="submit" value="메인으로" class="btn1 w354">
			
		</fieldset>
		
		</form>
	</div><!-- join_content -->


</div><!-- container -->

</div><!-- wrap -->

</body>
</html>