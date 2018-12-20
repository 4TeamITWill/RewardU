<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리듀 | 회원 비밀번호 수정</title>
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

<div class="wrap">
	<div class="container" align="center">
		<h2>회원 비밀번호 수정</h2>
		<form action="./MemberModifyPwAction.me">
		<!-- id -->	
			<input type="text" name="user_id" value="${id }" class="inp-field" readonly><br>
		<!-- pw -->
			<input type="password" name="user_pw" placeholder="기존 비밀번호를 입력해 주세요" class="inp-field"><br><br>
			<input type="password" name="user_pw3" placeholder="새 비밀번호를 입력해 주세요" class="inp-field"><br>
			<input type="password" name="user_pw4" placeholder="새 비밀번호를 재입력해 주세요" class="inp-field"><br>
			<div class="margin2"></div>
			
			<input type="submit" value="수정하기" class="btn1 w354"><br>
			<input type="button" value="취소" class="btn w354" onclick="location.href='./Main.me'">
		</form>
		<div class="margin4"></div>
	</div><!-- container -->
</div><!-- wrap -->

</body>
</html>