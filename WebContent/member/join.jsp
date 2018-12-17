<%@page import="member.db.MemberDAO"%>
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

<jsp:useBean id="mbean" class="member.db.MemberBean"></jsp:useBean>

<%
	MemberDAO mdao = new MemberDAO();
	
%>

</head>
<body>
<jsp:include page="../top.jsp"/>
<div class="wrap">
<div id="header" align="center">

	<h2>리듀 회원가입</h2>
</div>
<div class="container">
	<div id="join_content" align="center" >
		<form action="./MemberJoinAction.me" id="join" method="post">
		
		<fieldset>
			<!-- id -->
				<input type="email" name="user_id" placeholder="이메일 주소 입력" class="inp-field w235"><input type="button" value="이메일 본인인증" class="btn"><br>
			<!-- name -->
				<input type="text" name="user_name" placeholder="사용자 이름을 입력해 주세요" class="inp-field"><br>
			<!-- password -->
				<input type="password" name="user_pw" placeholder="계정 비밀번호 입력" class="inp-field"><br>
			<!-- password confirm -->
				<input type="password" name="user_pw2" placeholder="비밀번호 재입력" class="inp-field"><br>
			<!-- date of Birth -->
					생년월일 <br>
				<input type="text" name="birthyyyy" maxlength="4" placeholder="YYYY" class="inp-field w120">
				<input type="text" name="birthmm" maxlength="2" placeholder="MM" class="inp-field w110">
				<input type="text" name="birthdd" maxlength="2" placeholder="DD" class="inp-field w110">
			<br>
			<!-- phone --><input type="text" name="user_phone" placeholder="연락처를 입력해 주세요 " class="inp-field">
		
		</fieldset>
		<fieldset>
			<input type="submit" value="작성완료" class="btn">
			<input type="reset" value="가입취소" class="btn">
		</fieldset>
		
		</form>
	</div>


</div>

</div><!-- wrap -->

</body>
</html>