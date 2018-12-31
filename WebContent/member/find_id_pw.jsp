<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리듀 | 회원아이디, 비밀번호 찾기</title>
<link href="css/etc.css" rel="stylesheet">
<style type="text/css">

.margin{margin-top: 100px;}
.margin2{margin-top: 50px;}
.margin3{margin-top: 20px;}
.margin4{margin-bottom: 100px;}

.container {
	margin: 70px 200px;
	border: 1px solid red;
}

#find_id_form #form_font_left {
 text-align: left;

}
</style>

</head>
<body>


<div class="wrap">

<div class="container">
	<div id="find_id_form">
		<h2>아이디 찾기</h2>
		<form action="./MemberFindIdAction.me" id="find_id" method="post">
	<!-- phone -->
		<div id="form_font_left" align="left">연락처</div>
		<input type="text" name="user_phone" placeholder="가입시 기입했던 연락처를 '-'없이 입력해 주세요 " class="inp-field"><br>
	<!-- date of Birth -->
		<div id="form_font_left" align="left">생년월일</div>
		<input type="text" name="birthyyyy" maxlength="4" placeholder="YYYY" class="inp-field w120">
		<input type="text" name="birthmm" maxlength="2" placeholder="MM" class="inp-field w108">
		<input type="text" name="birthdd" maxlength="2" placeholder="DD" class="inp-field w108"><br>
		
		<input type="submit" value="아이디 찾기" class="btn1">
		</form>
	</div><!-- find_id_form -->
	
	<div class="margin2"></div>
	
	<div id="find_pw_form">
		<h2>비밀번호 찾기</h2>
		<form action="./MemberFindPwAction.me" id="find_pw" method="post">
	<!-- id -->
		<div id="form_font_left" align="left">아이디</div>
		<input type="text" name="user_id" placeholder="ex) example@rewardu.com" class="inp-field"><br>
	<!-- phone -->
		<div id="form_font_left" align="left">연락처</div>
		<input type="text" name="user_phone" placeholder="가입시 기입했던 연락처를 '-'없이 입력해 주세요 " class="inp-field"><br>
	<!-- date of Birth -->
			<div id="form_font_left" align="left">생년월일</div>
			<input type="text" name="birthyyyy" maxlength="4" placeholder="YYYY" class="inp-field w120">
			<input type="text" name="birthmm" maxlength="2" placeholder="MM" class="inp-field w108">
			<input type="text" name="birthdd" maxlength="2" placeholder="DD" class="inp-field w108"><br>
		
		<input type="submit" value="비밀번호 찾기" class="btn1">
		</form>	
	</div><!-- find_pw_form -->
	
</div><!-- container -->
</div><!-- wrap -->

</body>
</html>