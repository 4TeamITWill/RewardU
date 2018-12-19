<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리듀 | 회원탈퇴</title>
<link href="css/main3.css" rel="stylesheet">
<link href="css/etc.css" rel="stylesheet">
<style type="text/css">

.margin{margin-top: 100px;}
.margin2{margin-top: 50px;}
.margin3{margin-top: 20px;}
.margin4{margin-bottom: 100px;}


</style>
</head>
<body>

<jsp:include page="../top.jsp"/>

<div class="wrap">
	<div class="container" align="center">
		<h2>회원탈퇴</h2>
		<form action="./MemberDeleteAction.me">
		<!-- id -->	
			<input type="text" name="user_id" value="${id }" class="inp-field" readonly><br>
		<!-- pw -->
			<input type="password" name="user_pw" placeholder="비밀번호를 입력해 주세요" class="inp-field"><br>
			<div class="margin3"></div>
			
			<input type="submit" value="탈퇴하기" class="btn w175">
			<input type="button" value="메인으로" class="btn1 w175" onclick="location.href='./Main.me'">
		</form>
	</div><!-- container -->
</div><!-- wrap -->
</body>
</html>