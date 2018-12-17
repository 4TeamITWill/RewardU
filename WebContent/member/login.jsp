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
}
.wrap{background-color: #aaa;}

</style>
</head>
<body>
<jsp:include page="../top.jsp"/>

<div class="wrap">


<div class="container" align="center">
<h2>리듀 로그인</h2>
	<div id="loginForm">
	<div class="margin2"></div>
	<form action="./MemberLoginAction.me" method="post">
	
		<fieldset>
	
		<input type="text" name="user_id" placeholder="이메일 아이디" class="inp-field"><br>
		<input type="password" name="user_pw" placeholder="비밀번호" class="inp-field"><br>
	
		<input type="submit" value="로그인" class="btn w354">
		</fieldset>
	
	</form>
	<br>
		<a href="MemberFind_ID_PW.me">아이디 찾기</a> | <a href="#">비밀번호 찾기</a>
	<div class="margin2"></div>
	</div><!-- loginForm -->

<div class="margin4"></div>
	아직 리듀 계정이 없나요? <a href="#">회원가입</a>
	<br><Br>

</div><!-- container -->


</div><!-- wrap -->


<jsp:include page="../footer.jsp"/>

</body>
</html>