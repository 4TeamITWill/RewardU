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
<style type="text/css">

.confirm_wrap {background-color: #ddd; 
	padding: 100px 200px;
	background-image: url("img/leaves.jpg"); 
	background-size: 100% 1500px;
	background-attachment: scroll;
	background-repeat: no-repeat;}

#joinConfirm_header{
	font-size: 25px;
	font-weight: none;
	text-indent: 10px;
	margin: 27px 0 20px 30px;
	text-align: left;
}

</style>

</head>
<body>
<jsp:include page="../top.jsp"/>
<div class="confirm_wrap">

<div class="container" align="center">
	<div id="join_content" >
		<div id="joinConfirm_header" >
		${requestScope.mbean.user_name }님 가입을 축하합니다.
	</div>
		<form action="./Main.me" id="join" method="post">
		
		<fieldset >
		<!-- id -->
			<input type="text" name="user_id" placeholder="이메일 주소 입력" value="${requestScope.mbean.user_id }" class="inp-field" readonly><br>
		<!-- name -->	
			<input type="text" name="user_name" value="${mbean.user_name }" class="inp-field" readonly><br>
			<!-- <input type="password" name="user_pw" class="inp-field"><br>
			<input type="password" name="user_pw2" class="inp-field"><br> -->
		<!-- date of Birth -->	
		  &nbsp;<input type="text" name="birthyyyy" maxlength="4" placeholder="YYYY" value="${mbean.birthyyyy }" class="inp-field w120" readonly>
				<input type="text" name="birthmm" maxlength="2" placeholder="MM" value="${mbean.birthmm }" class="inp-field w108" readonly>
				<input type="text" name="birthdd" maxlength="2" placeholder="DD" value="${mbean.birthdd }" class="inp-field w108" readonly>
			<br>
		<!-- phone -->
			<input type="text" name="user_phone" value="${mbean.user_phone }" class="inp-field" readonly>
			
		</fieldset>
		
			<h5>마이페이지에서 자기소개 및 하고싶은 말을 설정해 보세요!</h5>
		
		<fieldset>
			<input type="submit" value="메인으로" class="btn1 w354">
			
		</fieldset>
		
		</form>
	</div><!-- join_content -->


</div><!-- container -->

</div><!-- wrap -->
<jsp:include page="../footer.jsp"/>
</body>
</html>