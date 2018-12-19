<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/main3.css" rel="stylesheet">
<link href="css/etc.css" rel="stylesheet">
<style type="text/css">

.margin{margin-top: 100px;}
.margin2{margin-top: 50px;}
.margin3{margin-top: 20px;}
.margin4{margin-bottom: 100px;}
    
#loginForm{width: 500px; hegiht:450px; 
		border: 1px solid red;
		margin: 0 auto;
		background-color: #fff;
		box-shadow: 20px #aaa;
}

#loginForm .formh2 {
	margin-left: 20px;
}

#login_content {
	border: 1px solid;
	width: 400px;
	font-size: 14px;
}


.wrap{background-color: #ddd;
	 padding: 150px 200px;
}


</style>
</head>
<body>

<div class="wrap">


<div class="container" align="center">

	<div id="loginForm">
		<div class="margin3"></div>
	<div id="login_content">
		<h2 class="formh2" align="left">리듀 로그인</h2>
		<form action="./MemberLoginAction.me" method="post">
		
			<fieldset>
		
			<input type="text" name="user_id" placeholder="이메일 아이디" class="inp-field"><br>
			<input type="password" name="user_pw" placeholder="비밀번호" class="inp-field"><br>
		
			<input type="submit" value="로그인" class="btn1 w354">
			</fieldset>
		
		</form>
		<br>
			<a href="MemberFind_ID_PW.me">아이디 찾기 | 비밀번호 찾기</a>
		</div><!-- login_content -->
	<div class="margin2"></div>
	</div><!-- loginForm -->


	<h6>아직 리듀 계정이 없나요? <a href="#">회원가입</a></h6>
	<br><Br>

</div><!-- container -->


</div><!-- wrap -->



</body>
</html>